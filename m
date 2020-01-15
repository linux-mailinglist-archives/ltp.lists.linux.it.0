Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9AA13BC12
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 10:09:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEF583C2496
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 10:09:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F3BC33C183B
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 10:09:46 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 89D9D2014FC
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 10:09:43 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81887454"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:09:41 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id A95184CE1CB3
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 17:00:35 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:09:40 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:09:43 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 15 Jan 2020 17:09:53 +0800
Message-ID: <1579079394-18233-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: A95184CE1CB3.AEE29
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/fcntl30: clean up && add more range test
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

When I write pipe12 test case, I have a question
about F_SETPIPE_SZ can set the min and max value.
So cleanup this case and add min/max/gt_max value test.

ps: I run this code on i386 and x86_64 machine with 4kb pagesize.
But I don't test it on 8kb/16kb pagesize system because my machine
is x86_64 platform it does't support to change pgsize in kernel. If
someone can test them, I will be very grateful.
Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/lapi/capability.h                 |   4 +
 testcases/kernel/syscalls/fcntl/fcntl30.c | 196 ++++++++++++----------
 2 files changed, 111 insertions(+), 89 deletions(-)

diff --git a/include/lapi/capability.h b/include/lapi/capability.h
index 8833f0605..7ade78985 100644
--- a/include/lapi/capability.h
+++ b/include/lapi/capability.h
@@ -28,6 +28,10 @@
 # define CAP_SYS_ADMIN        21
 #endif
 
+#ifndef CAP_SYS_RESOURCE
+# define CAP_SYS_RESOURCE     24
+#endif
+
 #ifndef CAP_AUDIT_READ
 # define CAP_AUDIT_READ       37
 #endif
diff --git a/testcases/kernel/syscalls/fcntl/fcntl30.c b/testcases/kernel/syscalls/fcntl/fcntl30.c
index 4a409b868..2411dafb9 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl30.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl30.c
@@ -1,111 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2014 Fujitsu Ltd.
+ * Copyright (c) 2014-2020 FUJITSU LIMITED. All rights reserved.
  * Author: Xiaoguang Wang <wangxg.fnst@cn.fujitsu.com>
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- */
-
-/*
  * Description:
- * Verify that,
- *     Basic test for fcntl(2) using F_SETPIPE_SZ, F_GETPIPE_SZ argument.
+ * Basic test for fcntl(2) using F_SETPIPE_SZ, F_GETPIPE_SZ argument.
  */
 
-
-#include <stdio.h>
-#include <errno.h>
 #include <unistd.h>
 #include <fcntl.h>
-#include <string.h>
-#include <signal.h>
 #include <sys/types.h>
-#include <pwd.h>
-
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 #include "lapi/fcntl.h"
-
-char *TCID = "fcntl30";
-int TST_TOTAL = 1;
-
-static void setup(void);
-static void cleanup(void);
-
-int main(int ac, char **av)
+#include "lapi/abisize.h"
+#include "lapi/capability.h"
+
+static int fds[2];
+static unsigned int orig_value, struct_shift, max_shift;
+static int pg_size;
+
+static struct tcase {
+	unsigned int multi;
+	unsigned int exp_multi;
+	int hole;
+	int pass_flag;
+	char *message;
+} tcases[] = {
+	{1, 1, 1, 1, "set a value of blew page size"},
+	{2, 2, 0, 1, "set a normal value"},
+	{0, 0, 0, 1, "set a max value"},
+	{0, 0, -1, 0, "set a value beyond max"},
+};
+
+static void verify_fcntl(unsigned int n)
 {
-	int lc;
-	int pipe_fds[2], test_fd;
-	int orig_pipe_size, new_pipe_size;
-
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		SAFE_PIPE(cleanup, pipe_fds);
-		test_fd = pipe_fds[1];
-
-		TEST(fcntl(test_fd, F_GETPIPE_SZ));
-		if (TEST_RETURN < 0) {
-			tst_brkm(TFAIL | TTERRNO, cleanup,
-				 "fcntl get pipe size failed");
-		}
-
-		orig_pipe_size = TEST_RETURN;
-		new_pipe_size = orig_pipe_size * 2;
-		TEST(fcntl(test_fd, F_SETPIPE_SZ, new_pipe_size));
-		if (TEST_RETURN < 0) {
-			tst_brkm(TFAIL | TTERRNO, cleanup,
-				 "fcntl test F_SETPIPE_SZ failed");
-		}
-
-		TEST(fcntl(test_fd, F_GETPIPE_SZ));
-		if (TEST_RETURN < 0) {
-			tst_brkm(TFAIL | TTERRNO, cleanup,
-				 "fcntl test F_GETPIPE_SZ failed");
-		}
-		tst_resm(TINFO, "orig_pipe_size: %d new_pipe_size: %d",
-			 orig_pipe_size, new_pipe_size);
-		if (TEST_RETURN >= new_pipe_size) {
-			tst_resm(TPASS, "fcntl test F_GETPIPE_SZ"
-				 "and F_SETPIPE_SZ success");
-		} else {
-			tst_resm(TFAIL, "fcntl test F_GETPIPE_SZ"
-				 "and F_SETPIPE_SZ fail");
-		}
-		SAFE_CLOSE(cleanup, pipe_fds[0]);
-		SAFE_CLOSE(cleanup, pipe_fds[1]);
+	struct tcase *tc = &tcases[n];
+	unsigned int pipe_value, shift;
+
+	shift = max_shift - struct_shift;
+	if (!tc->multi)
+		tc->multi = pg_size << shift;
+	if (!tc->exp_multi)
+		tc->exp_multi = pg_size << shift;
+
+	tst_res(TINFO, "%s", tc->message);
+
+	pipe_value = tc->multi * pg_size - tc->hole;
+	TEST(fcntl(fds[1], F_SETPIPE_SZ, pipe_value));
+	if (tc->pass_flag && TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "F_SETPIPE_SZ failed");
+		return;
+	}
+	if (!tc->pass_flag) {
+		if (TST_RET == -1) {
+			if (TST_ERR == ENOMEM)
+				tst_res(TPASS | TTERRNO, "F_SETPIPE_SZ failed");
+			else
+				tst_res(TFAIL | TTERRNO,
+					"F_SETPIPE_SZ failed expected ENOMEM got");
+		} else
+			tst_res(TFAIL, "F_SETPIPE_SZ succeed unexpectedly");
 	}
 
-	cleanup();
-	tst_exit();
+	TEST(fcntl(fds[1], F_GETPIPE_SZ));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "F_GETPIPE_SZ failed");
+		return;
+	}
+	if (TST_RET == tc->exp_multi * pg_size)
+		tst_res(TPASS, "F_SETPIPE_SZ %u bytes F_GETPIPE_SZ %lu bytes",
+			pipe_value, TST_RET);
+	else
+		tst_res(TFAIL, "F_SETPIPE_SZ %u bytes but F_GETPIPE_SZ %lu bytes",
+			pipe_value, TST_RET);
 }
 
 static void setup(void)
 {
-	if ((tst_kvercmp(2, 6, 35)) < 0) {
-		tst_brkm(TCONF, NULL, "This test can only run on kernels"
-			 "that are 2.6.35 and higher");
-	}
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	SAFE_PIPE(fds);
+	TEST(fcntl(fds[1], F_GETPIPE_SZ));
+	if (TST_ERR == EINVAL)
+		tst_brk(TCONF, "kernel doesn't support F_GET/SETPIPE_SZ");
+	orig_value = TST_RET;
+	/*
+	 * See kernel fs/pipe.c, the size of struct pipe buffer is 40 bytes
+	 * (round up 2^6) on 64bit system and 24 bytes(round up 2^5). kcalloc
+	 * mallocs a memory space range stores struct pipe buffer. kcalloc can
+	 * malloc max space depend on KMALLOC_SHIFT_MAX macro.
+	 *  #define KMALLOC_SHIFT_MAX  (MAX_ORDER + PAGE_SHIFT - 1)
+	 * the MAX_ORDER is 11.
+	 * For example, if page size is 4k, on 64bit system. the max pipe size
+	 * as below:
+	 *  kcalloc space(4M): 1 << (11+12-1)= 2^22
+	 *  space can store struct pipi buffer: 2^22/2^6= 2^16
+	 *  max pipe size: 2^16* 2^12 = 2^28
+	 * it should be 256M. On 32bit system, this value is 512M.
+	 */
+#ifdef TST_ABI64
+	struct_shift = 6;
+#else
+	struct_shift = 5;
+#endif
+	max_shift = 10;
+
+	pg_size = getpagesize();
+	tst_res(TINFO, "page size is %d bytes", pg_size);
 }
 
 static void cleanup(void)
 {
+	SAFE_FCNTL(fds[1], F_SETPIPE_SZ, orig_value);
+	if (fds[0] > 0)
+		SAFE_CLOSE(fds[0]);
+	if (fds[1] > 0)
+		SAFE_CLOSE(fds[1]);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_fcntl,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_REQ, CAP_SYS_RESOURCE),
+		{}
+	},
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
