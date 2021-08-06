Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A69993E224D
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:01:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F26F3C1DCF
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:01:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BAD5D3C1882
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:00:57 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8218F10007F5
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:00:56 +0200 (CEST)
X-QQ-mid: bizesmtp31t1628222452tub0hlgf
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 06 Aug 2021 12:00:47 +0800 (CST)
X-QQ-SSF: 0140000000200030B000000C0000000
X-QQ-FEAT: AomiL+cBEBOFDfBy0SSrikg4/n0JPfarBA5i8zRjYX+51Srg+o6PD5WmuT17x
 OnUCbk67Hjv08h5bSAkfOKhoV3Q0a3jA7FOGa5wzH7qHgAk8vMLZDiRjTELONzsS/+6vGLF
 6tIREz0cNYslnkl4xvllhiNDNcXc7uzzSl/80dj2B2jL6ciaLtzt1ztIM+UfVaaesbgUYz+
 5E8MiNFlBSI0XwgC/7+RltjZ7G2BkSVhNCPPxKTH1JtzYxSqKddb1+bIqUucYq6EtNGbaMc
 XuXmtnGqkXQws5qP5K6TzOR03fIU4ITes7msvq+tOKFL5JDNV/vunFjGzqEgUz5pziaxel7
 oykyFnpgVn6lLAyDc4=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 12:00:46 +0800
Message-Id: <20210806040046.18836-1-zhanglianjie@uniontech.com>
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
Subject: [LTP] [PATCH] [4/4] syscalls/chroot04: Convert to new API
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

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/testcases/kernel/syscalls/chroot/chroot04.c b/testcases/kernel/syscalls/chroot/chroot04.c
index 69fd213c8..ebb1ba363 100644
--- a/testcases/kernel/syscalls/chroot/chroot04.c
+++ b/testcases/kernel/syscalls/chroot/chroot04.c
@@ -1,137 +1,43 @@
+ // SPDX-License-Identifier: GPL-2.0-or-later
  /*
   *   Copyright (C) Bull S.A. 2001
   *   Copyright (c) International Business Machines  Corp., 2001
-  *
-  *   This program is free software;  you can redistribute it and/or modify
-  *   it under the terms of the GNU General Public License as published by
-  *   the Free Software Foundation; either version 2 of the License, or
-  *   (at your option) any later version.
-  *
-  *   This program is distributed in the hope that it will be useful,
-  *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
-  *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
-  *   the GNU General Public License for more details.
-  *
-  *   You should have received a copy of the GNU General Public License
-  *   along with this program;  if not, write to the Free Software
-  *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  *
+  *   04/2002 Ported by Jacky Malcles
   */

-/*
- * NAME
- * 		 chroot04.c
+/*\
+ * [DESCRIPTION]
  *
- * DESCRIPTION
- *		 Testcase to check that chroot sets errno to EACCES.
- *
- * ALGORITHM
- *		 As a non-root user attempt to perform chroot() to a directory. The
- *		 chroot() call should fail with EACCES
- *
- * USAGE:  <for command-line>
- *  chroot04 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
- *		 04/2002 Ported by Jacky Malcles
- *
- * RESTRICTIONS
- * 		 Must be run as non-root user.
+ *	Testcase to check that chroot sets errno to EACCES.
  */

 #include <stdio.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include "test.h"
-#include "safe_macros.h"
 #include <pwd.h>
-
-char *TCID = "chroot04";
-int TST_TOTAL = 1;
+#include "tst_test.h"

 #define TEST_TMPDIR	"chroot04_tmpdir"
+static char nobody_uid[] = "nobody";
+static struct passwd *ltpuser;

-char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
-
-void setup(void);
-void cleanup(void);
-
-int main(int ac, char **av)
+static void verify_chroot(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/* Check for looping state if -i option is given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		TEST(chroot(TEST_TMPDIR));
-
-		if (TEST_RETURN != -1)
-			tst_resm(TFAIL, "call succeeded unexpectedly");
-		else if (TEST_ERRNO == EACCES)
-			tst_resm(TPASS, "got EACCESS as expected");
-		else
-			tst_resm(TFAIL | TTERRNO,
-				 "did not get EACCES as expected");
-
-	}
-	cleanup();
-
-	tst_exit();
-
+	TST_EXP_FAIL(chroot(TEST_TMPDIR), EACCES, "got EACCESS as expected");
 }

-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	TEST_PAUSE;
-
-	/* make a temporary directory and cd to it */
-	tst_tmpdir();
-
 	/*
 	 * create a temporary directory
 	 */
-	if (mkdir(TEST_TMPDIR, 0222) != 0) {
-		tst_resm(TBROK, "mkdir(%s) failed", TEST_TMPDIR);
-	}
-
-	ltpuser = getpwnam(nobody_uid);
-	SAFE_SETEUID(cleanup, ltpuser->pw_uid);
-
+	SAFE_MKDIR(TEST_TMPDIR, 0222);
+	ltpuser = SAFE_GETPWNAM(nobody_uid);
+	SAFE_SETEUID(ltpuser->pw_uid);
 }

-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *		        completion or premature exit.
- */
-void cleanup(void)
-{
-	/* reset the process ID to the saved ID (root) */
-	SAFE_SETUID(NULL, 0);
-	if (rmdir(TEST_TMPDIR) != 0) {
-		tst_brkm(TFAIL | TERRNO, NULL, "rmdir(%s) failed", TEST_TMPDIR);
-	}
-
-	/* delete the test directory created in setup() */
-	tst_rmdir();
-
-}
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = verify_chroot,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
