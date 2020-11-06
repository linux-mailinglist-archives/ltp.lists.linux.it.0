Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 599512A9003
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 08:10:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6BF63C2FCA
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 08:10:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 6BF3C3C53E6
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 08:10:23 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A3E9D1A00A35
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 08:10:21 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,455,1596470400"; d="scan'208";a="101018401"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Nov 2020 15:10:16 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id DA3E44CE38D2
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 15:10:13 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 6 Nov 2020 15:10:11 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 6 Nov 2020 15:10:11 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 6 Nov 2020 14:50:13 +0800
Message-ID: <20201106065014.1118435-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: DA3E44CE38D2.ACB64
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/uname{01,
 03}: Convert to new API and cleanup
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

Also merge uname03 into uname01.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 runtest/syscalls                           |   1 -
 testcases/kernel/syscalls/uname/.gitignore |   1 -
 testcases/kernel/syscalls/uname/uname01.c  | 163 +++------------------
 testcases/kernel/syscalls/uname/uname03.c  | 132 -----------------
 4 files changed, 19 insertions(+), 278 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/uname/uname03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 0443f9f3d..3e9b0e024 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1574,7 +1574,6 @@ umask01 umask01
 
 uname01 uname01
 uname02 uname02
-uname03 uname03
 uname04 uname04
 
 unlink01 symlink01 -T unlink01
diff --git a/testcases/kernel/syscalls/uname/.gitignore b/testcases/kernel/syscalls/uname/.gitignore
index 4f153e79f..ca279ef53 100644
--- a/testcases/kernel/syscalls/uname/.gitignore
+++ b/testcases/kernel/syscalls/uname/.gitignore
@@ -1,4 +1,3 @@
 /uname01
 /uname02
-/uname03
 /uname04
diff --git a/testcases/kernel/syscalls/uname/uname01.c b/testcases/kernel/syscalls/uname/uname01.c
index 6b4e655e6..37722947f 100644
--- a/testcases/kernel/syscalls/uname/uname01.c
+++ b/testcases/kernel/syscalls/uname/uname01.c
@@ -1,162 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
- * Mountain View, CA  94043, or:
- *
- * http://www.sgi.com
- *
- * For further information regarding this notice, see:
- *
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
+ * Basic test for uname(2):
+ * Calling uname() succeeded and got correct sysname.
  *
  */
-/* $Id: uname01.c,v 1.6 2009/11/02 13:57:19 subrata_modak Exp $ */
-/**********************************************************
- *
- *    OS Test - Silicon Graphics, Inc.
- *
- *    TEST IDENTIFIER	: uname01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for uname(2)
- *
- *    PARENT DOCUMENT	: usctpl01
- *
- *    TEST CASE TOTAL	: 1
- *
- *    WALL CLOCK TIME	: 1
- *
- *    CPU TYPES		: ALL
- *
- *    AUTHOR		: William Roske
- *
- *    CO-PILOT		: Dave Fenner
- *
- *    DATE STARTED	: 03/30/92
- *
- *    INITIAL RELEASE	: UNICOS 7.0
- *
- *    TEST CASES
- *
- * 	1.) uname(2) returns...(See Description)
- *
- *    INPUT SPECIFICATIONS
- * 	The standard options for system call tests are accepted.
- *	(See the parse_opts(3) man page).
- *
- *    OUTPUT SPECIFICATIONS
- *$
- *    DURATION
- * 	Terminates - with frequency and infinite modes.
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    RESOURCES
- * 	None
- *
- *    ENVIRONMENTAL NEEDS
- *      No run-time environmental needs.
- *
- *    SPECIAL PROCEDURAL REQUIREMENTS
- * 	None
- *
- *    INTERCASE DEPENDENCIES
- * 	None
- *
- *    DETAILED DESCRIPTION
- *	This is a Phase I test for the uname(2) system call.  It is intended
- *	to provide a limited exposure of the system call, for now.  It
- *	should/will be extended when full functional tests are written for
- *	uname(2).
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- *
- *#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#**/
 
 #include <sys/utsname.h>
 #include <errno.h>
 #include <string.h>
-#include <signal.h>
-#include "test.h"
-
-void setup();
-void cleanup();
-
-char *TCID = "uname01";
-int TST_TOTAL = 1;
-
-struct utsname un;
+#include "tst_test.h"
 
-int main(int ac, char **av)
+static void verify_uname(void)
 {
-	int lc;
+	struct utsname un;
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		TEST(uname(&un));
-
-		if (TEST_RETURN == -1)
-			tst_resm(TFAIL | TTERRNO, "uname failed");
-		else
-			tst_resm(TPASS, "uname(&un) returned %ld", TEST_RETURN);
+	memset(&un, 0, sizeof(un));
 
+	TEST(uname(&un));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "uname() failed");
+		return;
 	}
 
-	cleanup();
-	tst_exit();
-}
-
-void setup(void)
-{
-	void trapper();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	if (strcmp(un.sysname, "Linux")) {
+		tst_res(TFAIL, "sysname is not Linux");
+		return;
+	}
 
-	TEST_PAUSE;
+	tst_res(TPASS, "uname() succeeded");
 }
 
-void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.test_all = verify_uname,
+};
diff --git a/testcases/kernel/syscalls/uname/uname03.c b/testcases/kernel/syscalls/uname/uname03.c
deleted file mode 100644
index 2f6292f0a..000000000
--- a/testcases/kernel/syscalls/uname/uname03.c
+++ /dev/null
@@ -1,132 +0,0 @@
-/*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
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
- */
-
-/*
- * NAME
- *	uname03.c
- *
- * DESCRIPTION
- *	uname03 - call uname() and make sure it succeeds
- *
- * ALGORITHM
- *	loop if that option was specified
- *	issue the system call
- *	check the errno value
- *	  issue a PASS message if we get zero
- *	otherwise, the tests fails
- *	  issue a FAIL message
- *	  break any remaining tests
- *	  call cleanup
- *
- * USAGE:  <for command-line>
- *  uname03 [-c n] [-f] [-i n] [-I x] [-p x] [-t]
- *	where,  -c n : Run n copies concurrently.
- *		-f   : Turn off functionality Testing.
- *		-i n : Execute test n times.
- *		-I x : Execute test for x seconds.
- *		-P x : Pause for x seconds between iterations.
- *		-t   : Turn on syscall timing.
- *
- * History
- *	07/2001 John George
- *		-Ported
- *
- * Restrictions
- *	none
- */
-
-#include "test.h"
-
-#include <errno.h>
-#include <sys/utsname.h>
-#include <string.h>
-
-void cleanup(void);
-void setup(void);
-
-char *TCID = "uname03";
-int TST_TOTAL = 1;
-
-#define LINUX	"Linux"
-
-int main(int ac, char **av)
-{
-	int lc;
-	struct utsname *buf;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
-	/* allocate some space for buf */
-
-	if ((buf = malloc((size_t)sizeof(struct utsname))) == NULL) {
-		tst_brkm(TBROK, cleanup, "malloc failed for buf");
-	}
-
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		/* Now make the system call with the TEST() macro */
-
-		TEST(uname(buf));
-
-		if (TEST_RETURN != 0) {
-			tst_resm(TFAIL, "%s failed - errno = %d - %s",
-				 TCID, TEST_ERRNO, strerror(TEST_ERRNO));
-		} else {
-			if ((strcmp(buf->sysname, LINUX)) == 0) {
-				tst_resm(TPASS, "%s functionality test "
-					 "succeeded", TCID);
-			} else {
-				tst_resm(TFAIL, "%s functionality test "
-					 "failed", TCID);
-			}
-		}
-	}
-
-	free(buf);
-	buf = NULL;
-
-	cleanup();
-	tst_exit();
-}
-
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
-{
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
-{
-
-}
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
