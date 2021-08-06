Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F2C3E2244
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:00:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 039A33C7F55
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:00:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 553373C1ABA
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:00:06 +0200 (CEST)
Received: from smtpbg516.qq.com (smtpbg516.qq.com [203.205.250.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 62BE010009DE
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:00:03 +0200 (CEST)
X-QQ-mid: bizesmtp54t1628222397tyvss53s
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 06 Aug 2021 11:59:54 +0800 (CST)
X-QQ-SSF: 0140000000200030B000000C0000000
X-QQ-FEAT: Vl5gSgb8RJbrI3OIU+megVgNz2srWDr5Z0cuuPdgVwAnE7utmqCgwqF2FrugF
 tlb83oUGgEhKQHt7x3Th5Fzlvvpf8ZwIAw0flikn/acX45WX4uGekcTJubJ4zTxeJol5oNr
 VE7DZ3es6IbLFCTq2SmHKJ9fMB1r1CpTYXlye2QvOR/ZSi5elgMWcGA1dvDYn+4HQ65Czb3
 oZv9hAd/7qHgQK1kql8szer2+32PYj8MCk2vYtGkbXi88IptENUONP1SrB7Tlnb9xQrvRf0
 oNqHpLqS1hyxvchPsk+9YWGqNZmNue+fhZd3bSsblNsquI7gRgIbHxrv9s9pkoKV+JotQvf
 qNJV4/1
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 11:59:52 +0800
Message-Id: <20210806035952.18150-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] [v2,1/4] syscalls/chroot01: Convert to new API
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
index a1db5e157..bddbf0db5 100644
--- a/testcases/kernel/syscalls/chroot/chroot01.c
+++ b/testcases/kernel/syscalls/chroot/chroot01.c
@@ -1,116 +1,46 @@
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
- *
- * ALGORITHM
- *	As a non-root user attempt to perform chroot() to a directory. The
- *	chroot() call should fail with EPERM
+/*\
+ * [DESCRIPTION]
  *
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
+#include "tst_test.h"

-char *TCID = "chroot01";
-int TST_TOTAL = 1;
-int fail;
-
-char *path;
-
-char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
+static char *path;
+static char nobody_uid[] = "nobody";
+static struct passwd *ltpuser;

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
-
+	TST_EXP_FAIL(chroot(path), EPERM, "chroot set errno to EPERM.");
 }

-void setup(void)
+static void setup(void)
 {
-	tst_require_root();
-
-	tst_tmpdir();
 	path = tst_get_tmpdir();
-
-	if ((ltpuser = getpwnam(nobody_uid)) == NULL)
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "getpwnam(\"nobody\") failed");
-
-	SAFE_SETEUID(cleanup, ltpuser->pw_uid);
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	ltpuser = SAFE_GETPWNAM(nobody_uid);
+	SAFE_SETEUID(ltpuser->pw_uid);
 }

-void cleanup(void)
+static void cleanup(void)
 {
-	SAFE_SETEUID(NULL, 0);
-
 	free(path);
-	tst_rmdir();
 }
+
+static struct tst_test test = {
+	.cleanup = cleanup,
+	.setup = setup,
+	.test_all = verify_chroot,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+};
+
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
