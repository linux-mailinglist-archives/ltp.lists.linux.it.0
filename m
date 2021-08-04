Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DEE3DFB51
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 08:08:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33A953C8003
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 08:08:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 872033C5F73
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 08:08:01 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 65AE71000611
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 08:07:58 +0200 (CEST)
X-QQ-mid: bizesmtp52t1628057273tvvbmhoj
Received: from localhost.localdomain (unknown [112.2.230.222])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 04 Aug 2021 14:07:46 +0800 (CST)
X-QQ-SSF: 01400000002000109000B00K0000000
X-QQ-FEAT: 3o86aNGTRSEgljleEwrK0S1TgGPXDZ1JekuC+I9H5oqZAEHGlsarHCFmcqKGL
 nSW2atOu37N5DjeW0BXZEi4XihLQffU4MdNL9hCBNaYFS3sNz3W/nQbbb+fT08LB6NumC3n
 SEWHb3phF1IBiFTHbOkVhbCvGuJhzCpAMW4UIRqX+T0xNtcALPGrFEJvUzYhuBSG7eaz+Rl
 A6I4oqHDFqOWchOGisgPt9+bYaUkwTi/CYC9zQ/U3TT1XgO+2LaOVwdtZuEFlyTG0QsX9ZF
 0/G0LVOLHjwswocgbtt5embUWBlF3tAKzKQPOtbc9SxGBoamBVDrhpPjiDxdXhlkAxnyNhE
 I56GFNM
X-QQ-GoodBg: 2
From: sujiaxun <sujiaxun@uniontech.com>
To: ltp@lists.linux.it
Date: Wed,  4 Aug 2021 14:07:36 +0800
Message-Id: <20210804060736.10234-1-sujiaxun@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] [1/6] syscalls/sysfs: Convert sysfs01 to the new API
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
Cc: sujiaxun <sujiaxun@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: sujiaxun <sujiaxun@uniontech.com>
---
 testcases/kernel/syscalls/sysfs/sysfs01.c | 124 +++-------------------
 1 file changed, 16 insertions(+), 108 deletions(-)

diff --git a/testcases/kernel/syscalls/sysfs/sysfs01.c b/testcases/kernel/syscalls/sysfs/sysfs01.c
index 85052dc2b..086d4a048 100644
--- a/testcases/kernel/syscalls/sysfs/sysfs01.c
+++ b/testcases/kernel/syscalls/sysfs/sysfs01.c
@@ -1,129 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
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
  */
-/**************************************************************************
- *
- *    TEST IDENTIFIER	: sysfs01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for sysfs(2)
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: Aniruddha Marathe <aniruddha.marathe@wipro.com>
- *
- *    SIGNALS
- *	Uses SIGUSR1 to pause before test if option set.
- *	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *    This is a Phase I test for the sysfs(2) system call.
- *    This test is carried out for option 1 for sysfs(2).
- *    It is intended to provide a limited exposure of the system call.
- *
- *
- *	Setup:
- *	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- *	Test:
- *	 Loop if the proper options are given.
- *	  Execute system call
- *	  Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- *	Cleanup:
- *	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- * sysfs01 [-c n]  [-e] [-i n] [-I x] [-p x] [-t] [-h] [-f] [-p]
- *  where:
- *	-c n : run n copies simultaneously.
- *	-e   : Turn on errno logging.
- *	-i n : Execute test n times.
- *	-I x : Execute test for x seconds.
- *	-p   : Pause for SIGUSR1 before starting
- *	-P x : Pause for x seconds between iterations.
- *	-t   : Turn on syscall timing.
+
+/*\
+ * [DESCRIPTION]
  *
- *RESTRICTIONS:
- *There is no glibc or libc support
- *Kernel should be compiled with proc filesystem support
- ******************************************************************************/
+ *This testcase tests sysfs(2) for option 1
+ */

 #include <errno.h>
 #include <unistd.h>
 #include <sys/syscall.h>
-#include "test.h"
+#include "tst_test.h"
 #include "lapi/syscalls.h"

-static void setup();
-static void cleanup();

-char *TCID = "sysfs01";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
+static void verify_sysfs01(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;

 		/* option 1, buf holds fs name */
-		TEST(ltp_syscall(__NR_sysfs, 1, "proc"));
+		TEST(tst_syscall(__NR_sysfs, 1, "proc"));

 		/* check return code */
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "sysfs(2) Failed for "
-				 "option 1 and set errno to %d", TEST_ERRNO);
+		if (TST_RET == -1) {
+			tst_res(TFAIL, "sysfs(2) Failed for "
+				 "option 1 and set errno to %d", TST_ERR);
 		} else {
-			tst_resm(TPASS, "sysfs(2) Passed for " "option 1");
+			tst_res(TPASS, "sysfs(2) Passed for " "option 1");
 		}
-	}			/*End of TEST_LOOPING */
-
-	/*Clean up and exit */
-	cleanup();
-	tst_exit();
-
-}
-
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;

 }

-/*
- * cleanup() - Performs one time cleanup for this test at
- * completion or premature exit
- */
-
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.test_all = verify_sysfs01,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
