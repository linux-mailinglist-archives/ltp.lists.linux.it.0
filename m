Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2F23E2337
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 08:25:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09C893C6A99
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 08:25:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F24E3C0080
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 08:25:32 +0200 (CEST)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B019814011AF
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 08:25:30 +0200 (CEST)
X-QQ-mid: bizesmtp37t1628231124trs2u06e
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 06 Aug 2021 14:25:17 +0800 (CST)
X-QQ-SSF: 01400000002000209000000C0000000
X-QQ-FEAT: 6YaWKVf+Rx7FNYljMwq5PboqfegiwKNm3YHZ+Ce1f04T330cLHQ/sz3tZV/EX
 Lf+U/7RbgSyob5EI+5I2ANbTOLgIP/VDCmLkZQrFe3Q16QVLLgCA4c/Beg6IiRWPNFvmpyb
 NWvHmWcrOjdVnLJLjsyrpuQSV5uQwXVrA3md/s22PXuGDKVMbWkL50TPr0UVjTTBu0BOLwY
 awzZ24TvTyXA5GG9SbKvcrkzlRs0zw/XQRIYkbOqssujmXFZahI1/9YUk0C9bGoknU3RUyX
 6PiN7PXRmT8JO4gZ1SdcdAw/bpbuW0CTGsy3ZEmqkxFTAQlpdAjRk8LyuPmtyxhu7BR5h4Z
 aLsUGL6
X-QQ-GoodBg: 2
From: sujiaxun <sujiaxun@uniontech.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 14:25:15 +0800
Message-Id: <20210806062515.11784-1-sujiaxun@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] [v2,
 2/6] syscalls/sysfs: Convert sysfs02 to the new API
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
 testcases/kernel/syscalls/sysfs/sysfs02.c | 132 +++-------------------
 1 file changed, 18 insertions(+), 114 deletions(-)

diff --git a/testcases/kernel/syscalls/sysfs/sysfs02.c b/testcases/kernel/syscalls/sysfs/sysfs02.c
index e9065dda7..31794d9c0 100644
--- a/testcases/kernel/syscalls/sysfs/sysfs02.c
+++ b/testcases/kernel/syscalls/sysfs/sysfs02.c
@@ -1,127 +1,31 @@
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
- *    TEST IDENTIFIER	: sysfs02
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
- *    It is intended to provide a limited exposure of the system call.
- *    This test is run for option 2 for sysfs(2)
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
- * sysfs02  [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-t] [-p] [-f]
- * where:
- *	-c n : run n copies simultaneously
- *	-e   : Turn on errno logging.
- *	-i n : Execute test n times.
- *	-I x : Execute test for x seconds.
- *	-p   : Pause for SIGUSR1 before starting
- *	-P x : Pause for x seconds between iterations.
- *	-t   : Turn on syscall timing.
- *
- *RESTRICTIONS:
- *There is no glibc or libc support
- *****************************************************************************/

+/*
+ * [DESCRIPTION]
+ * This test is run for option 2 for sysfs(2).
+ * Translate the filesystem type index fs_index into a null-terminated filesystem
+ * identifier string. This string will be written to the buffer pointed to by buf.
+ * Make sure that buf has enough space to accept the string.
+*/
+
 #include <errno.h>
 #include <unistd.h>
 #include <sys/syscall.h>
-#include "test.h"
+#include "tst_test.h"
 #include "lapi/syscalls.h"

-static void setup();
-static void cleanup();
-
-char *TCID = "sysfs02";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
-{
-	int lc;
-	char buf[40];		/* 40 bytes suffice to store fs name */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*option 2 buf holds fs name */
-		TEST(ltp_syscall(__NR_sysfs, 2, 0, buf));
-
-		/* check return code */
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "sysfs(2) Failed for "
-				 "option 2 and returned"
-				 " %d as error number", TEST_ERRNO);
-		} else {
-			tst_resm(TPASS, "sysfs(2) Passed for option 2");
-		}
-	}			/*End of TEST_LOOPING */
-
-	/*Clean up and exit */
-	cleanup();
-
-	tst_exit();
-}
-
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+static void verify_sysfs02(void)
 {
+    char buf[40];       /* 40 bytes suffice to store fs name */

-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+    /*option 2 buf holds fs name */
+    TST_EXP_PASS(tst_syscall(__NR_sysfs, 2, 0, buf),
+                "sysfs(2,0,buf)");
 }

-/*
- * cleanup() - Performs one time cleanup for this test at
- * completion or premature exit
- */
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+    .test_all = verify_sysfs02,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
