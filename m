Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D09413E8831
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 04:49:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75E8E3C70CD
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 04:49:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2EACC3C70B7
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 04:49:06 +0200 (CEST)
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8307F1000950
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 04:49:02 +0200 (CEST)
X-QQ-mid: bizesmtp40t1628650135th5iub1l
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 11 Aug 2021 10:48:50 +0800 (CST)
X-QQ-SSF: 0140000000200020B000B00A0000000
X-QQ-FEAT: Ry58bBY793sMzchiszt5eXHvlDRaHD9mNrG0U6zMSAFE483mdUe1zmqwNr0XO
 hUjnhp2hL/XLlWH9Y/Y3Lp3NI/yoCQ5Ix84xwEdBULbL5BpE054+pXbbg+nXJ+hvCVxMDMj
 zAU7BW+o717/JPhcVu9qmLzt5P+D7zhOhmqiAsVyXASELSpc4wC8zC726djvlDiA/8lhKdN
 9iZA4w2KB4DYwAGlXTSBjQxnaEmHN7FHy6qOoGUfivj5Ixlwk1G48jA1c+KnF4seTPwU4VS
 UxFyHhm8O6m60qOQZT+Yn79jTL6y8dUU0IISnXbg2+8oICWz3y08Da0EvMmrnFTt27VJWM0
 TuXKxe7DDAd/8+WZ00W5GzXsRrYBA==
X-QQ-GoodBg: 2
From: sujiaxun <sujiaxun@uniontech.com>
To: ltp@lists.linux.it
Date: Wed, 11 Aug 2021 10:48:48 +0800
Message-Id: <20210811024848.18265-1-sujiaxun@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_PASS, T_SPF_HELO_TEMPERROR
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] [v2,
 4/6] syscalls/sysfs: Convert sysfs04 to the new API
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
 testcases/kernel/syscalls/sysfs/sysfs04.c | 129 +++-------------------
 1 file changed, 15 insertions(+), 114 deletions(-)

diff --git a/testcases/kernel/syscalls/sysfs/sysfs04.c b/testcases/kernel/syscalls/sysfs/sysfs04.c
index 6356a89c8..f2ede1375 100644
--- a/testcases/kernel/syscalls/sysfs/sysfs04.c
+++ b/testcases/kernel/syscalls/sysfs/sysfs04.c
@@ -1,129 +1,30 @@
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
- *    TEST IDENTIFIER	: sysfs04
- *
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Test checking for basic error conditions
- *				 for sysfs(2)
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
- *	This test case checks whether sysfs(2) system call  returns
- *	appropriate error number for invalid
- *	option.
- *
- *	Setup:
- *	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- *	Test:
- *	  Loop if the proper options are given.
- *	  Execute system call with invaid  option parameter
- *
- *	  Check return code, if system call fails with errno == expected errno
- *		Issue syscall passed with expected errno
- *	  Otherwise,
- *	  Issue syscall failed to produce expected errno
- *
- *	Cleanup:
- *	  Do cleanup for the test.
- *
- * USAGE:  <for command-line>
- * sysfs04  [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
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
- *No libc or glibc support
- *****************************************************************************/
+
+/*\
+ * [Description]
+ * This test case checks whether sysfs(2) system call returns
+ * appropriate error number for invalid option.
+ */

 #include <errno.h>
-#include  <sys/syscall.h>
-#include "test.h"
+#include <sys/syscall.h>
+#include "tst_test.h"
 #include "lapi/syscalls.h"

 #define INVALID_OPTION 100
-static void setup();
-static void cleanup();

-char *TCID = "sysfs04";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
+static void verify_sysfs04(void)
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
-		TEST(ltp_syscall(__NR_sysfs, INVALID_OPTION));
-
-		/* check return code */
-		if ((TEST_RETURN == -1) && (TEST_ERRNO == EINVAL)) {
-			tst_resm(TPASS, "sysfs(2) expected failure;"
-				 " Got errno - EINVAL :" " Invalid option");
-		} else {
-			tst_resm(TFAIL, "sysfs(2) failed to produce"
-				 " expected error; %d, errno"
-				 " : EINVAL and got %d", EINVAL, TEST_ERRNO);
-		}
-	}

-	/*Clean up and exit */
-	cleanup();
-	tst_exit();
+	TST_EXP_FAIL(tst_syscall(__NR_sysfs, INVALID_OPTION),
+				EINVAL, "sysfs(INVALID_OPTION)");

-}				/*End of main */
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
-* cleanup() - Performs one time cleanup for this test at
-* completion or premature exit
-*/
-void cleanup(void)
-{
+static struct tst_test test = {
+	.test_all = verify_sysfs04,
+};

-}
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
