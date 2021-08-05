Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1F13E0F46
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 09:34:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 264E83C7E16
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 09:34:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 619693C5F37
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 09:33:56 +0200 (CEST)
Received: from smtpbg516.qq.com (smtpbg516.qq.com [203.205.250.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 585B8600F04
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 09:33:52 +0200 (CEST)
X-QQ-mid: bizesmtp46t1628148826tbbjkyb2
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 05 Aug 2021 15:33:41 +0800 (CST)
X-QQ-SSF: 0140000000200020B000000A0000000
X-QQ-FEAT: gDbwoeOnDAGaus3YuyqEk1q0cNGA6N9eBGxb+D0jcUUFT8eruuz4/mveWxYV3
 uBzasp+wwu1AdbgcpxCD08r0/D+4+i1FfPQds7Who7ewJCo4zzzwkGWprs210T9KFOGM3ob
 7y5kS0KgSr+BY7PJX8JAh3lY8fSTEWC1SdY7f4kmvtJPvbaBUGiz/kRyAEMH11FLR5cKBhi
 u1vnADJva5Dgx6HFTldSyDlSKy55vZA7VyUrcf2I28dGFRsR6TUdtAx0DWku3mbHfswGQrO
 TMQX9jCyC5PbUNmJpgxDoF+d3dRPY1ASpzpb0ZQ6EQpE8GhK4zwBx36//7fO4JX0u+ZuIjn
 NGki8q97/kd+sJQdV1CtU/9wrgqiw==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Thu,  5 Aug 2021 15:33:39 +0800
Message-Id: <20210805073339.15027-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] [1/4] syscalls/chroot01: Convert to new API
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

diff --git a/testcases/kernel/syscalls/chroot/chroot01.c b/testcases/kernel/syscalls/chroot/chroot01.c
index a1db5e157..37c73c756 100644
--- a/testcases/kernel/syscalls/chroot/chroot01.c
+++ b/testcases/kernel/syscalls/chroot/chroot01.c
@@ -1,116 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
  *   Copyright (c) International Business Machines  Corp., 2001
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
  */

-/*
- * NAME
- * 	chroot01.c
- *
- * DESCRIPTION
- *	Testcase to check the whether chroot sets errno to EPERM.
+/*\
+ * [DESCRIPTION]
  *
- * ALGORITHM
- *	As a non-root user attempt to perform chroot() to a directory. The
- *	chroot() call should fail with EPERM
- *
- * USAGE:  <for command-line>
- *  chroot01 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- * 	Must be run as non-root user.
+ * Testcase to check the whether chroot sets errno to EPERM.
+ * As a non-root user attempt to perform chroot() to a directory. The
+ * chroot() call should fail with EPERM
  */

-#include <stdio.h>
-#include <errno.h>
-#include "test.h"
-#include "safe_macros.h"
+#include <stdlib.h>
 #include <pwd.h>
-
-char *TCID = "chroot01";
-int TST_TOTAL = 1;
-int fail;
+#include "tst_test.h"

 char *path;
-
 char nobody_uid[] = "nobody";
 struct passwd *ltpuser;

-void setup(void);
-void cleanup(void);
-
-int main(int ac, char **av)
+static void verify_chroot(void)
 {
-	int lc;
+	TEST(chroot(path));

-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		TEST(chroot(path));
-
-		if (TEST_RETURN != -1)
-			tst_resm(TFAIL, "call succeeded unexpectedly");
-		else if (errno != EPERM)
-			tst_resm(TFAIL | TTERRNO, "chroot failed unexpectedly");
-		else
-			tst_resm(TPASS, "chroot set errno to EPERM.");
-	}
-	cleanup();
-
-	tst_exit();
+	if (TST_RET != -1)
+		tst_res(TFAIL, "call succeeded unexpectedly");
+	else if (errno != EPERM)
+		tst_res(TFAIL | TTERRNO, "chroot failed unexpectedly");
+	else
+		tst_res(TPASS, "chroot set errno to EPERM.");

 }

-void setup(void)
+static void setup(void)
 {
-	tst_require_root();
-
-	tst_tmpdir();
 	path = tst_get_tmpdir();
+	if (path == NULL)
+		tst_brk(TBROK | TERRNO, "tst_get_tmpdir failed");

-	if ((ltpuser = getpwnam(nobody_uid)) == NULL)
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "getpwnam(\"nobody\") failed");
-
-	SAFE_SETEUID(cleanup, ltpuser->pw_uid);
+	if ((ltpuser = SAFE_GETPWNAM(nobody_uid)) == NULL)
+		tst_brk(TBROK | TERRNO, "getpwnam(\"nobody\") failed");

-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	SAFE_SETEUID(ltpuser->pw_uid);
 }

-void cleanup(void)
+static void cleanup(void)
 {
-	SAFE_SETEUID(NULL, 0);
+	SAFE_SETEUID(0);

-	free(path);
-	tst_rmdir();
+	if (path) {
+		free(path);
+		path = NULL;
+	}
 }
+
+static struct tst_test test = {
+	.cleanup = cleanup,
+	.setup = setup,
+	.test_all = verify_chroot,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
