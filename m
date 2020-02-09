Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 360F8156A0B
	for <lists+linux-ltp@lfdr.de>; Sun,  9 Feb 2020 12:59:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B78953C263E
	for <lists+linux-ltp@lfdr.de>; Sun,  9 Feb 2020 12:59:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EE9C93C2608
 for <ltp@lists.linux.it>; Sun,  9 Feb 2020 12:58:54 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B081920096B
 for <ltp@lists.linux.it>; Sun,  9 Feb 2020 12:58:52 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,421,1574092800"; d="scan'208";a="83061729"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Feb 2020 19:58:51 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 1937050A9962
 for <ltp@lists.linux.it>; Sun,  9 Feb 2020 19:49:20 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Sun, 9 Feb 2020 19:58:51 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Sun, 9 Feb 2020 19:58:49 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Sun, 9 Feb 2020 19:58:46 +0800
Message-ID: <1581249526-25295-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581249526-25295-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1581249526-25295-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 1937050A9962.ACA74
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/2] syscalls/socketcall03,
 04: Cleanup && Convert to new API
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

Merge socketcall04 into socketcall03.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |   1 -
 .../kernel/syscalls/socketcall/.gitignore     |   1 -
 .../kernel/syscalls/socketcall/socketcall03.c | 185 +++---------------
 .../kernel/syscalls/socketcall/socketcall04.c | 174 ----------------
 4 files changed, 32 insertions(+), 329 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/socketcall/socketcall04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 0743cf4e3..a3da81e71 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1350,7 +1350,6 @@ socket02 socket02
 socketcall01 socketcall01
 socketcall02 socketcall02
 socketcall03 socketcall03
-socketcall04 socketcall04
 
 socketpair01 socketpair01
 socketpair02 socketpair02
diff --git a/testcases/kernel/syscalls/socketcall/.gitignore b/testcases/kernel/syscalls/socketcall/.gitignore
index 1c8439a57..33ee18123 100644
--- a/testcases/kernel/syscalls/socketcall/.gitignore
+++ b/testcases/kernel/syscalls/socketcall/.gitignore
@@ -1,4 +1,3 @@
 /socketcall01
 /socketcall02
 /socketcall03
-/socketcall04
diff --git a/testcases/kernel/syscalls/socketcall/socketcall03.c b/testcases/kernel/syscalls/socketcall/socketcall03.c
index d6c082c21..ad2a29944 100644
--- a/testcases/kernel/syscalls/socketcall/socketcall03.c
+++ b/testcases/kernel/syscalls/socketcall/socketcall03.c
@@ -1,181 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
+ * Copyright (c) 2020 Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ * Author: Sowmya Adiga <sowmya.adiga@wipro.com>
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
- *
+ * This is a basic test for the socketcall(2) for bind(2) and listen(2).
  */
-/**************************************************************************
- *
- *    TEST IDENTIFIER	: socketcall03
- *
- *    EXECUTED BY	: All user
- *
- *    TEST TITLE	: Basic test for socketcall(2) for bind(2)
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: sowmya adiga<sowmya.adiga@wipro.com>
- *
- *    SIGNALS
- *	Uses SIGUSR1 to pause before test if option set.
- *	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This is a phase I test for the socketcall(2) system call.
- *	It is intended to provide a limited exposure of the system call.
- *
- *	Setup:
- *	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- *	Test:
- *        Execute system call
- *	  Check return code, if system call failed (return=-1)
- *	  Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- *	Cleanup:
- *	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- *  socketcall03 [-c n] [-e] [-i n] [-I x] [-p x] [-t]
- *		where,		-c n : Run n copies concurrently
- *				-e   : Turn on errno logging.
- *				-h   : Show this help screen
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
- *
- * RESTRICTIONS
- * None
- *****************************************************************************/
-#include <stdio.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <sys/syscall.h>
 #include <unistd.h>
+#include <errno.h>
 #include <sys/types.h>
 #include <sys/socket.h>
 #include <linux/net.h>
 #include <sys/un.h>
 #include <netinet/in.h>
 
-#include "test.h"
-
-char *TCID = "socketcall03";
-
-#ifdef __NR_socketcall
+#include "tst_test.h"
+#include "lapi/syscalls.h"
 
-#define socketcall(call, args) syscall(__NR_socketcall, call, args)
-
-void setup();
-void cleanup();
-void setup1(void);
-
-int TST_TOTAL = 1;
-int s;
-unsigned long args[3];
 struct sockaddr_in si;
 
-struct test_case_t {
-	int domain;
-	int type;
-	int pro;
-	int call;
-	void (*setupfunc) (void);
-	char *desc;
-} TC = {
-AF_INET, SOCK_STREAM, 6, SYS_BIND, setup1, "bind call"};
-
-int main(int ac, char **av)
-{
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/* check looping state */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		TC.setupfunc();
-
-		TEST(socketcall(TC.call, args));
-
-		/* check return code */
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL | TERRNO, "socketcall() Failed "
-				 " with return=%ld", TEST_RETURN);
-		} else {
-			tst_resm(TPASS, "socketcall() passed "
-				 "for %s with return=%ld ",
-				 TC.desc, TEST_RETURN);
-
-			close(s);
-		}
-	}
-
-	/* cleanup and exit */
-	cleanup();
-
-	tst_exit();
-}
-
-/*setup1()*/
-void setup1(void)
+static void verify_socketcall(void)
 {
-	si.sin_family = AF_INET;
-	si.sin_addr.s_addr = htons(INADDR_ANY);
-	si.sin_port = 0;
+	unsigned long args[3];
+	int s = -1;
 
-	if ((s = socket(TC.domain, TC.type, TC.pro)) == -1) {
-		tst_brkm(TBROK, NULL, "socket creation failed");
-	}
+	s = SAFE_SOCKET(AF_INET, SOCK_STREAM, 6);
 	args[0] = s;
 	args[1] = (unsigned long)&si;
 	args[2] = sizeof(si);
-}
 
-/* setup() - performs all ONE TIME setup for this test. */
-void setup(void)
-{
+	TEST(tst_syscall(__NR_socketcall, SYS_BIND, args));
+	if (TST_RET < 0)
+		tst_res(TFAIL | TTERRNO, "socketcall() for bind call failed with %ld", TST_RET);
+	else
+		tst_res(TPASS, "socketcall() for bind call passed, returned %ld", TST_RET);
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	args[1] = 1;
+	args[2] = 0;
 
-	TEST_PAUSE;
-}
+	TEST(tst_syscall(__NR_socketcall, SYS_LISTEN, args));
+	if (TST_RET < 0)
+		tst_res(TFAIL | TTERRNO, "socketcall() for listen call failed with %ld", TST_RET);
+	else
+		tst_res(TPASS, "socketcall() for listen call passed, returned %ld", TST_RET);
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
+	SAFE_CLOSE(s);
 }
 
-#else
-
-int TST_TOTAL = 0;
-
-int main(void)
+static void setup(void)
 {
-	tst_resm(TCONF, "socket call test on this architecture disabled.");
-	tst_exit();
+	si.sin_family = AF_INET;
+	si.sin_addr.s_addr = htons(INADDR_ANY);
+	si.sin_port = 0;
 }
 
-#endif
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = verify_socketcall,
+};
diff --git a/testcases/kernel/syscalls/socketcall/socketcall04.c b/testcases/kernel/syscalls/socketcall/socketcall04.c
deleted file mode 100644
index c498b6e74..000000000
--- a/testcases/kernel/syscalls/socketcall/socketcall04.c
+++ /dev/null
@@ -1,174 +0,0 @@
-/*
- * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *
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
- *
- */
-/**************************************************************************
- *
- *    TEST IDENTIFIER	: socketcall04
- *
- *    EXECUTED BY	: All user
- *
- *    TEST TITLE	: Basic test for socketcall(2) for listen(2)
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: sowmya adiga<sowmya.adiga@wipro.com>
- *
- *    SIGNALS
- *	Uses SIGUSR1 to pause before test if option set.
- *	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This is a phase I test for the socketcall(2) system call.
- *	It is intended to provide a limited exposure of the system call.
- *
- *	Setup:
- *	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- *	Test:
- *        Execute system call
- *	  Check return code, if system call failed (return=-1)
- *	  Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- *	Cleanup:
- *	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- *  socketcall04 [-c n] [-e] [-i n] [-I x] [-p x] [-t]
- *		where,		-c n : Run n copies concurrently
- *				-e   : Turn on errno logging.
- *				-h   : Show this help screen
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				 t   : Turn on syscall timing.
- *
- * RESTRICTIONS
- * None
- *****************************************************************************/
-#include <stdio.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <sys/syscall.h>
-#include <unistd.h>
-#include <sys/types.h>
-#include <sys/socket.h>
-#include <linux/net.h>
-#include <sys/un.h>
-#include <netinet/in.h>
-
-#include "test.h"
-
-char *TCID = "socketcall04";
-
-#ifdef __NR_socketcall
-
-#define socketcall(call, args) syscall(__NR_socketcall, call, args)
-
-void setup();
-void cleanup();
-void setup1(void);
-
-int TST_TOTAL = 1;
-int i, s;
-unsigned long args[3];
-struct sockaddr_in si;
-
-struct test_case_t {
-	int domain;
-	int type;
-	int pro;
-	int call;
-	void (*setupfunc) (void);
-	char *desc;
-} TC = {
-AF_INET, SOCK_STREAM, 6, SYS_LISTEN, setup1, "listen call"};
-
-int main(int ac, char **av)
-{
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/* check looping state */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		TC.setupfunc();
-
-		TEST(socketcall(TC.call, args));
-
-		/* check return code */
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL | TTERRNO, "socketcall() Failed "
-				 " with return=%ld", TEST_RETURN);
-		} else {
-			tst_resm(TPASS, "socketcall() passed "
-				 "for %s with return=%ld ",
-				 TC.desc, TEST_RETURN);
-			close(s);
-		}
-	}
-
-	/* cleanup and exit */
-	cleanup();
-
-	tst_exit();
-}
-
-/*setup1()*/
-void setup1(void)
-{
-	if ((s = socket(TC.domain, TC.type, TC.pro)) == -1) {
-		tst_brkm(TBROK, NULL, "socket creation failed");
-	}
-	args[0] = s;
-	args[1] = 1;
-}
-
-/* setup() - performs all ONE TIME setup for this test. */
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
-}
-
-#else
-
-int TST_TOTAL = 0;
-
-int main(void)
-{
-	tst_resm(TCONF, "socket call test on this architecture disabled.");
-	tst_exit();
-}
-
-#endif
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
