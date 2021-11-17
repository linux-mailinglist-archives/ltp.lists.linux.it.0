Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 45081453F11
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Nov 2021 04:40:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3DF23C87EE
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Nov 2021 04:40:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E41263C87CE
 for <ltp@lists.linux.it>; Wed, 17 Nov 2021 04:40:12 +0100 (CET)
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7A41E600D74
 for <ltp@lists.linux.it>; Wed, 17 Nov 2021 04:40:10 +0100 (CET)
X-QQ-mid: bizesmtp37t1637120403to0fwusu
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 17 Nov 2021 11:40:00 +0800 (CST)
X-QQ-SSF: 0140000000200050D000B00A0000000
X-QQ-FEAT: jfdGVjI73+Qgs2xf4I8D+EtBPljNr/MFnDrFkGMIiErEzKJcNbloSWoRZtmOt
 x0VeQuVLVWzQ3jAepOX9l85Y/H+33rayKjysbBkbmMQddLe/Ia05711yBPBZ4FHBscbDmWA
 k+EJ60aCuL2yaMHi8biuIrtTFVaBzMAeTVCEQBa0eeuD66DY+4i2KFRYKXacRJtPG++RNoU
 Wc2UPSsp3fRlv4ASCfK09hcSplFywZLpcu1Z9ENGcE4y0EsMtTlwBzp66zR57vmFiLmw/ez
 tFxO6XfE1QS+zj/IfaskcOUpMff5nPi+pYVXJsAqaaxaq+SPhARNWMTtRlyKsgeqDZFXLQV
 w6NGn2f6BKOPT1k12TRljjpaJmE2hWbcu5Alctp
X-QQ-GoodBg: 2
From: tangmeng <tangmeng@uniontech.com>
To: ltp@lists.linux.it
Date: Wed, 17 Nov 2021 11:39:51 +0800
Message-Id: <20211117033951.16352-2-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117033951.16352-1-tangmeng@uniontech.com>
References: <20211117033951.16352-1-tangmeng@uniontech.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] fchownat/fchownat02: Convert to new API
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
Cc: tangmeng <tangmeng@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: tangmeng <tangmeng@uniontech.com>
---
 .../kernel/syscalls/fchownat/fchownat02.c     | 121 +++++-------------
 1 file changed, 34 insertions(+), 87 deletions(-)

diff --git a/testcases/kernel/syscalls/fchownat/fchownat02.c b/testcases/kernel/syscalls/fchownat/fchownat02.c
index d19f3f3b8..116d4ca37 100644
--- a/testcases/kernel/syscalls/fchownat/fchownat02.c
+++ b/testcases/kernel/syscalls/fchownat/fchownat02.c
@@ -1,132 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2014 Fujitsu Ltd.
  * Author: Zeng Linggang <zenglg.jy@cn.fujitsu.com>
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
- * with this program.
  */
-/*
- * Test Description:
- *   Verify that,
- *   The flag of fchownat() is AT_SYMLINK_NOFOLLOW and the pathname would
- *   not be dereferenced if the pathname is a symbolic link.
+
+/*\
+ * [Description]
+ *
+ * Verify that,
+ * The flag of fchownat() is AT_SYMLINK_NOFOLLOW and the pathname would
+ * not be dereferenced if the pathname is a symbolic link.
  */

 #define _GNU_SOURCE

-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 #include "fchownat.h"
 #include "lapi/fcntl.h"

 #define TESTFILE	"testfile"
 #define TESTFILE_LINK	"testfile_link"

-char *TCID = "fchownat02";
-int TST_TOTAL = 1;
-
 static int dir_fd;
 static uid_t set_uid = 1000;
 static gid_t set_gid = 1000;
-static void setup(void);
-static void cleanup(void);
-static void test_verify(void);
-static void fchownat_verify(void);
-
-int main(int ac, char **av)
-{
-	int lc;
-	int i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		for (i = 0; i < TST_TOTAL; i++)
-			fchownat_verify();
-	}
-
-	cleanup();
-	tst_exit();
-}

 static void setup(void)
 {
 	struct stat c_buf, l_buf;

-	if ((tst_kvercmp(2, 6, 16)) < 0)
-		tst_brkm(TCONF, NULL, "This test needs kernel 2.6.16 or newer");
-
-	tst_require_root();
+	dir_fd = SAFE_OPEN("./", O_DIRECTORY);

-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	SAFE_TOUCH(TESTFILE, 0600, NULL);

-	TEST_PAUSE;
+	SAFE_SYMLINK(TESTFILE, TESTFILE_LINK);

-	tst_tmpdir();
+	SAFE_STAT(TESTFILE_LINK, &c_buf);

-	dir_fd = SAFE_OPEN(cleanup, "./", O_DIRECTORY);
-
-	SAFE_TOUCH(cleanup, TESTFILE, 0600, NULL);
-
-	SAFE_SYMLINK(cleanup, TESTFILE, TESTFILE_LINK);
-
-	SAFE_STAT(cleanup, TESTFILE_LINK, &c_buf);
-
-	SAFE_LSTAT(cleanup, TESTFILE_LINK, &l_buf);
+	SAFE_LSTAT(TESTFILE_LINK, &l_buf);

 	if (l_buf.st_uid == set_uid || l_buf.st_gid == set_gid) {
-		tst_brkm(TBROK | TERRNO, cleanup,
+		tst_brk(TBROK | TERRNO,
 			 "link_uid(%d) == set_uid(%d) or link_gid(%d) == "
 			 "set_gid(%d)", l_buf.st_uid, set_uid, l_buf.st_gid,
 			 set_gid);
 	}
 }

-static void fchownat_verify(void)
-{
-	TEST(fchownat(dir_fd, TESTFILE_LINK, set_uid, set_gid,
-		      AT_SYMLINK_NOFOLLOW));
-
-	if (TEST_RETURN != 0) {
-		tst_resm(TFAIL | TTERRNO, "fchownat() failed, errno=%d : %s",
-			 TEST_ERRNO, strerror(TEST_ERRNO));
-	} else {
-		test_verify();
-	}
-}
-
-static void test_verify(void)
+static void verify_fchownat(void)
 {
 	struct stat c_buf, l_buf;

-	SAFE_STAT(cleanup, TESTFILE_LINK, &c_buf);
+	TST_EXP_PASS_SILENT(fchownat(dir_fd, TESTFILE_LINK, set_uid, set_gid,
+		      AT_SYMLINK_NOFOLLOW));
+
+	SAFE_STAT(TESTFILE_LINK, &c_buf);

-	SAFE_LSTAT(cleanup, TESTFILE_LINK, &l_buf);
+	SAFE_LSTAT(TESTFILE_LINK, &l_buf);

 	if (c_buf.st_uid != set_uid && l_buf.st_uid == set_uid &&
 	    c_buf.st_gid != set_gid && l_buf.st_gid == set_gid) {
-		tst_resm(TPASS, "fchownat() test AT_SYMLINK_NOFOLLOW success");
+		tst_res(TPASS, "fchownat() test AT_SYMLINK_NOFOLLOW success");
 	} else {
-		tst_resm(TFAIL,
+		tst_res(TFAIL,
 			 "fchownat() test AT_SYMLINK_NOFOLLOW fail with uid=%d "
 			 "link_uid=%d set_uid=%d | gid=%d link_gid=%d "
 			 "set_gid=%d", c_buf.st_uid, l_buf.st_uid, set_uid,
@@ -136,5 +73,15 @@ static void test_verify(void)

 static void cleanup(void)
 {
-	tst_rmdir();
+       if (dir_fd > 0)
+               close(dir_fd);
 }
+
+static struct tst_test test = {
+        .min_kver = "2.6.16",
+        .test_all = verify_fchownat,
+        .setup = setup,
+        .cleanup = cleanup,
+        .needs_tmpdir = 1,
+	.needs_root = 1,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
