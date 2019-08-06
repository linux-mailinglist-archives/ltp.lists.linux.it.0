Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F62982EA4
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 11:24:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D203D3C1D1F
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 11:24:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BECDE3C1C81
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:23:56 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 1100560080B
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:23:53 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,353,1559491200"; d="scan'208";a="73066323"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Aug 2019 17:23:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id A440E4CDFAD4;
 Tue,  6 Aug 2019 17:23:47 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 6 Aug 2019 17:23:45 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <pvorel@suse.cz>
Date: Tue, 6 Aug 2019 17:23:37 +0800
Message-ID: <1565083417-2294-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: A440E4CDFAD4.AF65C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/setxattr03: Ported into new library
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/setxattr/setxattr03.c     | 111 ++++++------------
 1 file changed, 33 insertions(+), 78 deletions(-)

diff --git a/testcases/kernel/syscalls/setxattr/setxattr03.c b/testcases/kernel/syscalls/setxattr/setxattr03.c
index 4215a21f4..fa232ae65 100644
--- a/testcases/kernel/syscalls/setxattr/setxattr03.c
+++ b/testcases/kernel/syscalls/setxattr/setxattr03.c
@@ -1,25 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (C) 2012 Red Hat, Inc.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of version 2 of the GNU General Public
- * License as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it
- * is free of the rightful claim of any third person regarding
- * infringement or the like.  Any license provided herein, whether
- * implied or otherwise, applies only to this software file.  Patent
- * licenses, if any, provided herein do not apply to combinations of
- * this program with other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
- * 02110-1301, USA.
  */
 
 /*
@@ -49,10 +30,7 @@
 #endif
 #include "lapi/fs.h"
 
-#include "test.h"
-#include "safe_macros.h"
-
-char *TCID = "setxattr03";
+#include "tst_test.h"
 
 #if defined HAVE_SYS_XATTR_H
 #define XATTR_TEST_KEY "user.testkey"
@@ -97,42 +75,20 @@ static struct test_case tc[] = {
 	 },
 };
 
-static void setup(void);
-static void cleanup(void);
-
 static int immu_fd;
 static int append_fd;
 
-int TST_TOTAL = sizeof(tc) / sizeof(tc[0]);
-
-int main(int argc, char *argv[])
+static void verify_setxattr(unsigned int i)
 {
-	int lc;
-	int i;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
+	TEST(setxattr(tc[i].fname, tc[i].key, tc[i].value, tc[i].size,
+			tc[i].flags));
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-			TEST(setxattr(tc[i].fname, tc[i].key, tc[i].value,
-				      tc[i].size, tc[i].flags));
-
-			if (TEST_ERRNO == tc[i].exp_err) {
-				tst_resm(TPASS | TTERRNO, "%s", tc[i].desc);
-			} else {
-				tst_resm(TFAIL | TTERRNO, "%s - expected errno"
+	if (TST_ERR == tc[i].exp_err)
+		tst_res(TPASS | TTERRNO, "%s", tc[i].desc);
+	else
+		tst_res(TFAIL | TTERRNO, "%s - expected errno"
 					 " %d - Got", tc[i].desc,
 					 tc[i].exp_err);
-			}
-		}
-	}
-
-	cleanup();
-	tst_exit();
 }
 
 static int fsetflag(int fd, int on, int immutable)
@@ -163,49 +119,48 @@ static void setup(void)
 {
 	int fd;
 
-	tst_require_root();
-
-	tst_tmpdir();
-
 	/* Test for xattr support */
-	fd = SAFE_CREAT(cleanup, "testfile", 0644);
-	close(fd);
+	fd = SAFE_CREAT("testfile", 0644);
+	SAFE_CLOSE(fd);
 	if (setxattr("testfile", "user.test", "test", 4, XATTR_CREATE) == -1)
 		if (errno == ENOTSUP)
-			tst_brkm(TCONF, cleanup, "No xattr support in fs or "
+			tst_brk(TCONF, "No xattr support in fs or "
 				 "fs mounted without user_xattr option");
-	unlink("testfile");
+	SAFE_UNLINK("testfile");
 
 	/* Create test files and set file immutable or append-only */
-	immu_fd = SAFE_CREAT(cleanup, IMMU_FILE, 0644);
+	immu_fd = SAFE_CREAT(IMMU_FILE, 0644);
 	if (set_immutable_on(immu_fd))
-		tst_brkm(TBROK | TERRNO, cleanup, "Set %s immutable failed",
+		tst_brk(TBROK | TERRNO, "Set %s immutable failed",
 			 IMMU_FILE);
 
-	append_fd = SAFE_CREAT(cleanup, APPEND_FILE, 0644);
+	append_fd = SAFE_CREAT(APPEND_FILE, 0644);
 	if (set_append_on(append_fd))
-		tst_brkm(TBROK | TERRNO, cleanup, "Set %s append-only failed",
-			 APPEND_FILE);
-
-	TEST_PAUSE;
+		tst_brk(TBROK | TERRNO, "Set %s append-only failed",
+			APPEND_FILE);
 }
 
 static void cleanup(void)
 {
 	if ((immu_fd > 0) && set_immutable_off(immu_fd))
-		tst_resm(TWARN | TERRNO, "Unset %s immutable failed",
+		tst_res(TWARN | TERRNO, "Unset %s immutable failed",
 			 IMMU_FILE);
 	if ((append_fd > 0) && set_append_off(append_fd))
-		tst_resm(TWARN | TERRNO, "Unset %s append-only failed",
+		tst_res(TWARN | TERRNO, "Unset %s append-only failed",
 			 APPEND_FILE);
-	close(immu_fd);
-	close(append_fd);
-
-	tst_rmdir();
+	SAFE_CLOSE(immu_fd);
+	SAFE_CLOSE(append_fd);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_setxattr,
+	.tcnt = ARRAY_SIZE(tc),
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+};
+
 #else
-int main(void)
-{
-	tst_brkm(TCONF, NULL, "<sys/xattr.h> not present");
-}
+TST_TEST_TCONF("<sys/xattr.h> does not exist");
 #endif /* defined HAVE_SYS_XATTR_H */
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
