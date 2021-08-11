Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A663E882B
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 04:48:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F73F3C70CB
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 04:48:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 73D233C70B7
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 04:48:15 +0200 (CEST)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 21C0120017A
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 04:48:13 +0200 (CEST)
X-QQ-mid: bizesmtp36t1628650086ta5q8e59
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 11 Aug 2021 10:48:01 +0800 (CST)
X-QQ-SSF: 0140000000200020B000B00A0000000
X-QQ-FEAT: VGEHthcaPSRVwuZHFyO8RVdeeFDZ6tFmmVwietpmfsfrRQ6w0LHrHS9iOcBfm
 Rk2qAxZXYCF6JYJ3JZzHXsNYsaNW4JTId4gdkotSfoZqfw+L0nChiuRM+53HiDH6jYWmb77
 5PSNqn65q6Zcimr6ilyHvUGbXmWvqJ25160g7NE3hDD3wOHa1APe6Jb1cxAeEgpz/1yYYHY
 YFFFdbZ9bGP3CQH93r+KbTfpxRy6A8lRgm+fbcUz40NFVoexpoXIYgJuu+UyP8JiMNBqHeb
 pLDta1b47zTi6MycsnpPbr8NoDrwyxd3387ThHRrxuy399taknqPM4VtaP10vPp2z7z1Jpx
 +rz4QYyrX6BOSEuaYK8gtAoRYlWSw==
X-QQ-GoodBg: 2
From: sujiaxun <sujiaxun@uniontech.com>
To: ltp@lists.linux.it
Date: Wed, 11 Aug 2021 10:47:59 +0800
Message-Id: <20210811024759.17858-1-sujiaxun@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] [v3,
 1/6] syscalls/sysfs: Convert sysfs01 to the new API
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
 testcases/kernel/syscalls/sysfs/sysfs01.c | 132 +++-------------------
 1 file changed, 16 insertions(+), 116 deletions(-)

diff --git a/testcases/kernel/syscalls/sysfs/sysfs01.c b/testcases/kernel/syscalls/sysfs/sysfs01.c
index 85052dc2b..a0c7e74f8 100644
--- a/testcases/kernel/syscalls/sysfs/sysfs01.c
+++ b/testcases/kernel/syscalls/sysfs/sysfs01.c
@@ -1,129 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
- *
- *RESTRICTIONS:
- *There is no glibc or libc support
- *Kernel should be compiled with proc filesystem support
- ******************************************************************************/
+
+/*\
+ * [Description]
+ * This test is run for option 1 for sysfs(2).
+ * Translate the filesystem identifier string fsname into a filesystem type index.
+ */

 #include <errno.h>
 #include <unistd.h>
 #include <sys/syscall.h>
-#include "test.h"
+#include "tst_test.h"
 #include "lapi/syscalls.h"

-static void setup();
-static void cleanup();
-
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
-
-		/* option 1, buf holds fs name */
-		TEST(ltp_syscall(__NR_sysfs, 1, "proc"));
-
-		/* check return code */
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "sysfs(2) Failed for "
-				 "option 1 and set errno to %d", TEST_ERRNO);
-		} else {
-			tst_resm(TPASS, "sysfs(2) Passed for " "option 1");
-		}
-	}			/*End of TEST_LOOPING */
-
-	/*Clean up and exit */
-	cleanup();
-	tst_exit();
+	/* option 1, buf holds fs name */
+	TST_EXP_POSITIVE(tst_syscall(__NR_sysfs, 1, "proc"), "sysfs(1,'proc')");

+	if (TST_PASS == 1)
+		tst_res(TPASS, "sysfs(2) Passed for option 1");
 }

-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-}
-
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
