Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ED22FB654
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 14:24:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C105F3C30A1
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 14:24:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 266DD3C2557
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 14:24:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7C54B200A16
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 14:24:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81F56B1A2;
 Tue, 19 Jan 2021 13:24:44 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 19 Jan 2021 14:24:27 +0100
Message-Id: <20210119132427.6342-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] mallopt01: Rewrite to new API
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Petr Vorel <petr.vorel@gmail.com>

Detect non-POSIX mallopt() support with autotools.

NOTE: mallopt() is supported in glibc and uClibc.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 configure.ac                                  |   1 +
 testcases/kernel/syscalls/mallopt/mallopt01.c | 158 ++++++------------
 2 files changed, 51 insertions(+), 108 deletions(-)

diff --git a/configure.ac b/configure.ac
index e44e25cc6..17ef76c1a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -94,6 +94,7 @@ AC_CHECK_FUNCS_ONCE([ \
     io_uring_register \
     io_uring_enter \
     kcmp \
+    mallopt \
     mkdirat \
     mknodat \
     modify_ldt \
diff --git a/testcases/kernel/syscalls/mallopt/mallopt01.c b/testcases/kernel/syscalls/mallopt/mallopt01.c
index 14e26dd81..f6999bd52 100644
--- a/testcases/kernel/syscalls/mallopt/mallopt01.c
+++ b/testcases/kernel/syscalls/mallopt/mallopt01.c
@@ -1,155 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2002
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Copyright (c) Linux Test Project, 2003-2021
+ * Copyright (c) International Business Machines  Corp., 2002
+ * 01/02/2003	Port to LTP	<avenkat@us.ibm.com>
+ * 06/30/2001	Port to Linux <nsharoff@us.ibm.com>
  */
 
-/* 01/02/2003	Port to LTP	avenkat@us.ibm.com*/
-/* 06/30/2001	Port to Linux	nsharoff@us.ibm.com */
-
-/*
- * NAME
- *	mallopt
- *
- * CALLS
- *	malloc(3x), mallopt(3x), mallinfo(3x).
- *
- * ALGORITHM
- *	Set options, malloc memory, and check resource ussage.
+/*\
+ * [DESCRIPTION]
  *
- * RESTRICTIONS
- */
+ * Basic mallinfo() and mallopt() testing (M_MXFAST, M_NLBLKS).
+\*/
 
-#ifdef CONFIG_COLDFIRE
-#define __MALLOC_STANDARD__
-#endif
-#include <errno.h>
-/*
- * NOTE: struct mallinfo is only exported via malloc.h (not stdlib.h), even
- * though it's an obsolete header for malloc(3).
- *
- * Inconsistencies rock.
- */
 #include <malloc.h>
-#include <stdio.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-#define FAILED 0
-#define PASSED 1
-#define MAX_FAST_SIZE	(80 * sizeof(size_t) / 4)
 
-int local_flag = PASSED;
+#include "tst_test.h"
+#include "tst_safe_macros.h"
 
-char *TCID = "mallopt01";
-int block_number;
-FILE *temp;
-int TST_TOTAL = 6;
-extern int tst_COUNT;		/* Test Case counter for tst_routines */
+#ifdef HAVE_MALLOPT
 
-void printinfo();
+#define MAX_FAST_SIZE	(80 * sizeof(size_t) / 4)
 
-#if defined(__GLIBC__)
 struct mallinfo info;
 
-int main(int argc, char *argv[])
+void print_mallinfo(void)
 {
-	char *buf;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	tst_tmpdir();
+	tst_res(TINFO, "mallinfo structure:");
+	tst_res(TINFO, "mallinfo.arena = %d", info.arena);
+	tst_res(TINFO, "mallinfo.ordblks = %d", info.ordblks);
+	tst_res(TINFO, "mallinfo.smblks = %d", info.smblks);
+	tst_res(TINFO, "mallinfo.hblkhd = %d", info.hblkhd);
+	tst_res(TINFO, "mallinfo.hblks = %d", info.hblks);
+	tst_res(TINFO, "mallinfo.usmblks = %d", info.usmblks);
+	tst_res(TINFO, "mallinfo.fsmblks = %d", info.fsmblks);
+	tst_res(TINFO, "mallinfo.uordblks = %d", info.uordblks);
+	tst_res(TINFO, "mallinfo.fordblks = %d", info.fordblks);
+	tst_res(TINFO, "mallinfo.keepcost = %d", info.keepcost);
+}
 
-	buf = SAFE_MALLOC(NULL, 20480);
+void test_mallopt(void)
+{
+	char *buf;
 
-	/*
-	 * Check space usage.
-	 */
+	buf = SAFE_MALLOC(20480);
 
 	info = mallinfo();
 	if (info.uordblks < 20480) {
-		printinfo();
-		tst_resm(TFAIL, "mallinfo failed: uordblks < 20K");
+		print_mallinfo();
+		tst_res(TFAIL, "mallinfo() failed: uordblks < 20K");
 	}
 	if (info.smblks != 0) {
-		printinfo();
-		tst_resm(TFAIL, "mallinfo failed: smblks != 0");
+		print_mallinfo();
+		tst_res(TFAIL, "mallinfo() failed: smblks != 0");
 	}
 	if (info.uordblks >= 20480 && info.smblks == 0)
-		tst_resm(TPASS, "mallinfo() succeeded");
-	free(buf);
+		tst_res(TPASS, "mallinfo() succeeded");
 
-	/*
-	 * Test mallopt's M_MXFAST and M_NLBLKS cmds.
-	 */
+	free(buf);
 
 	if (mallopt(M_MXFAST, MAX_FAST_SIZE) == 0)
-		tst_resm(TFAIL, "mallopt(M_MXFAST, %d) failed", (int)MAX_FAST_SIZE);
+		tst_res(TFAIL, "mallopt(M_MXFAST, %d) failed", (int)MAX_FAST_SIZE);
 	else
-		tst_resm(TPASS, "mallopt(M_MXFAST, %d) succeeded", (int)MAX_FAST_SIZE);
+		tst_res(TPASS, "mallopt(M_MXFAST, %d) succeeded", (int)MAX_FAST_SIZE);
 
 	if (mallopt(M_NLBLKS, 50) == 0)
-		tst_resm(TFAIL, "mallopt(M_NLBLKS, 50) failed");
+		tst_res(TFAIL, "mallopt(M_NLBLKS, 50) failed");
 	else
-		tst_resm(TPASS, "mallopt(M_NLBLKS, 50) succeeded");
+		tst_res(TPASS, "mallopt(M_NLBLKS, 50) succeeded");
 
 	if ((buf = malloc(1024)) == NULL) {
-		tst_resm(TFAIL, "malloc(1024) failed");
+		tst_res(TFAIL, "malloc(1024) failed");
 	} else {
-		tst_resm(TPASS, "malloc(1024) succeeded");
+		tst_res(TPASS, "malloc(1024) succeeded");
 		free(buf);
 	}
 
 	if (mallopt(M_MXFAST, 0) == 0)
-		tst_resm(TFAIL, "mallopt(M_MXFAST, 0) failed");
+		tst_res(TFAIL, "mallopt(M_MXFAST, 0) failed");
 	else
-		tst_resm(TPASS, "mallopt(M_MXFAST, 0) succeeded");
+		tst_res(TPASS, "mallopt(M_MXFAST, 0) succeeded");
 
 	if ((buf = malloc(1024)) == NULL) {
-		tst_resm(TFAIL, "malloc(1024) failed");
+		tst_res(TFAIL, "malloc(1024) failed");
 	} else {
-		tst_resm(TPASS, "malloc(1024) succeeded");
+		tst_res(TPASS, "malloc(1024) succeeded");
 		free(buf);
 	}
-
-	unlink("core");
-	tst_rmdir();
-	tst_exit();
 }
 
-void printinfo(void)
-{
-
-	fprintf(stderr, "mallinfo structure:\n");
-	fprintf(stderr, "mallinfo.arena = %d\n", info.arena);
-	fprintf(stderr, "mallinfo.ordblks = %d\n", info.ordblks);
-	fprintf(stderr, "mallinfo.smblks = %d\n", info.smblks);
-	fprintf(stderr, "mallinfo.hblkhd = %d\n", info.hblkhd);
-	fprintf(stderr, "mallinfo.hblks = %d\n", info.hblks);
-	fprintf(stderr, "mallinfo.usmblks = %d\n", info.usmblks);
-	fprintf(stderr, "mallinfo.fsmblks = %d\n", info.fsmblks);
-	fprintf(stderr, "mallinfo.uordblks = %d\n", info.uordblks);
-	fprintf(stderr, "mallinfo.fordblks = %d\n", info.fordblks);
-	fprintf(stderr, "mallinfo.keepcost = %d\n", info.keepcost);
-}
+static struct tst_test test = {
+	.test_all = test_mallopt,
+};
 
 #else
-int main(void)
-{
-	tst_brkm(TCONF, NULL, "mallopt defined only for glibc");
-}
+TST_TEST_TCONF("system doesn't implement non-POSIX mallopt()");
 #endif
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
