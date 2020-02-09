Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D494E156A0A
	for <lists+linux-ltp@lfdr.de>; Sun,  9 Feb 2020 12:58:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33C9F3C2621
	for <lists+linux-ltp@lfdr.de>; Sun,  9 Feb 2020 12:58:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9224F3C1CDB
 for <ltp@lists.linux.it>; Sun,  9 Feb 2020 12:58:50 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 48446200938
 for <ltp@lists.linux.it>; Sun,  9 Feb 2020 12:58:47 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,421,1574092800"; d="scan'208";a="83061727"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Feb 2020 19:58:39 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 437CB406AB15
 for <ltp@lists.linux.it>; Sun,  9 Feb 2020 19:49:07 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Sun, 9 Feb 2020 19:58:37 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Sun, 9 Feb 2020 19:58:36 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Sun, 9 Feb 2020 19:58:45 +0800
Message-ID: <1581249526-25295-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 437CB406AB15.AD05E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/2] syscalls/socketcall02: Cleanup && rewrite to
 new API
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

Also add EFAULT error test.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/socketcall/socketcall02.c | 173 ++++--------------
 1 file changed, 37 insertions(+), 136 deletions(-)

diff --git a/testcases/kernel/syscalls/socketcall/socketcall02.c b/testcases/kernel/syscalls/socketcall/socketcall02.c
index 7574782ff..6a9d51f4e 100644
--- a/testcases/kernel/syscalls/socketcall/socketcall02.c
+++ b/testcases/kernel/syscalls/socketcall/socketcall02.c
@@ -1,163 +1,64 @@
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
+ * This is a error test for the socketcall(2) system call.
  */
-/**************************************************************************
- *
- *    TEST IDENTIFIER	: socketcall02
- *
- *    EXECUTED BY	: All user
- *
- *    TEST TITLE	: Error test for socketcall(2)
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
- *	verify socketcall(2) returns -1 and sets errno
- *	appropriately if argument passed is invalid.
- *
- *
- *	Setup:
- *	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- *	Test:
- *	  Loop if the proper option is given.
- *	  Execute system call.
- *	  Check return code, If system call failed (return == -1) &&
- *				(errno set == expected errno)
- *	  Issue sys call pass with expected error
- *	  otherwise
- *	  Issue sys call fails with unexpected error
- *
- *	Cleanup:
- *	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- *  socketcall02 [-c n] [-e] [-i n] [-I x] [-p x] [-t]
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
+
 #include <unistd.h>
+#include <errno.h>
 #include <sys/types.h>
 #include <sys/socket.h>
 #include <linux/net.h>
 #include <sys/un.h>
 #include <netinet/in.h>
 
-#include "test.h"
-
-char *TCID = "socketcall02";
-
-#ifdef __NR_socketcall
+#include "tst_test.h"
+#include "lapi/syscalls.h"
 
-#define socketcall(call, args) syscall(__NR_socketcall, call, args)
-
-void setup();
-void cleanup();
-
-int TST_TOTAL = 1;
+static unsigned long args_valid[3] = {PF_INET, SOCK_STREAM, 0};
 
 struct test_case_t {
 	int call;
-	unsigned long args[3];
-	int retval;
-	int experrno;
+	unsigned long *args;
+	int exp_err;
 	char *desc;
-} TC = {
-	-1, {
-PF_INET, SOCK_STREAM, 0}, -1, EINVAL, "invalid call"};
+} TC[] = {
+	{0, args_valid, EINVAL, "invalid call(0)"},
+	{21, args_valid, EINVAL, "invalid call(21)"},
+	{SYS_SOCKET, NULL, EFAULT, "invalid args address"},
+};
 
-int main(int ac, char **av)
+static void verify_socketcall(unsigned int i)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/* check looping state */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	tst_res(TINFO, "%s", TC[i].desc);
 
-		tst_count = 0;
-
-		TEST(socketcall(TC.call, TC.args));
-
-		/* check return code */
-		if ((TEST_RETURN == -1)
-		    && (TEST_ERRNO == TC.experrno)) {
-			tst_resm(TPASS, "socketcall() failed"
-				 " as expected for %s", TC.desc);
-		} else {
-			tst_brkm(TFAIL, NULL, "socketcall()"
-				 " Failed with wrong experrno"
-				 " =%d got: errno=%d : %s",
-				 TC.experrno, TEST_ERRNO, strerror(TEST_ERRNO));
-		}
+	TEST(tst_syscall(__NR_socketcall, TC[i].call, TC[i].args));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "socketcall() succeeded unexpectedly");
+		return;
 	}
-
-	/* cleanup and exit */
-	cleanup();
-
-	tst_exit();
+	if (TST_ERR == TC[i].exp_err)
+		tst_res(TPASS | TTERRNO, "socketcall() failed as expected ");
+	else
+		tst_res(TFAIL | TTERRNO, "socketcall fail expected %s got", tst_strerrno(TC[i].exp_err));
 }
 
-/* setup() - performs all ONE TIME setup for this test. */
-void setup(void)
+static void setup(void)
 {
+	unsigned int i;
 
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
+	for (i = 0; i < ARRAY_SIZE(TC); i++) {
+		if (!TC[i].args)
+			TC[i].args = tst_get_bad_addr(NULL);
+	}
 }
 
-#else
-
-int TST_TOTAL = 0;
-
-int main(void)
-{
-	tst_resm(TCONF, "socket call test on this architecture disabled.");
-	tst_exit();
-}
+static struct tst_test test = {
+	.setup = setup,
+	.test = verify_socketcall,
+	.tcnt = ARRAY_SIZE(TC),
+};
 
-#endif
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
