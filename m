Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E572B3F8D
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 10:11:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAC133C4F45
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 10:11:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 868B03C2358
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 10:11:05 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 332C710009CC
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 10:11:03 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,482,1596470400"; d="scan'208";a="101415328"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Nov 2020 17:11:01 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id B18154CE4BCB
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 17:11:00 +0800 (CST)
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 16 Nov 2020 17:11:01 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Mon, 16 Nov 2020 17:11:01 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 16 Nov 2020 17:01:20 +0800
Message-ID: <20201116090120.31942-2-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201116090120.31942-1-yangx.jy@cn.fujitsu.com>
References: <20201116090120.31942-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: B18154CE4BCB.ABDBB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/truncate03: Convert to new API and
 cleanup
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

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/truncate/truncate03.c     | 170 +++++++-----------
 1 file changed, 63 insertions(+), 107 deletions(-)

diff --git a/testcases/kernel/syscalls/truncate/truncate03.c b/testcases/kernel/syscalls/truncate/truncate03.c
index 401c16a8e..67b30a318 100644
--- a/testcases/kernel/syscalls/truncate/truncate03.c
+++ b/testcases/kernel/syscalls/truncate/truncate03.c
@@ -1,42 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *   Copyright (c) International Business Machines  Corp., 2001
- *   07/2001 John George
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 07/2001 John George
  *
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
- *   along with this program;  if not, write to the Free Software Foundation,
- *   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
-/*
- *   Test Description:
- *     Verify that,
- *     1) truncate(2) returns -1 and sets errno to EACCES if search/write
- *        permission denied for the process on the component of the path prefix
- *        or named file.
- *     2) truncate(2) returns -1 and sets errno to ENOTDIR if the component of
- *        the path prefix is not a directory.
- *     3) truncate(2) returns -1 and sets errno to EFAULT if pathname points
- *        outside user's accessible address space.
- *     4) truncate(2) returns -1 and sets errno to ENAMETOOLONG if the component
- *        of a pathname exceeded 255 characters or entire pathname exceeds 1023
- *        characters.
- *     5) truncate(2) returns -1 and sets errno to ENOENT if the named file
- *        does not exist.
- *     6) truncate(2) returns -1 and sets errno to EISDIR if the named file
- *        is a directory.
- *     7) truncate(2) returns -1 and sets errno to EFBIG if the argument length
- *        is larger than the maximum file size.
- *     8) truncate(2) returns -1 and sets errno to ELOOP if too many symbolic
- *        links were encountered in translating the pathname.
+ * Verify that,
+ * 1) truncate(2) returns -1 and sets errno to EACCES if search/write
+ *    permission denied for the process on the component of the path prefix
+ *    or named file.
+ * 2) truncate(2) returns -1 and sets errno to ENOTDIR if the component of
+ *    the path prefix is not a directory.
+ * 3) truncate(2) returns -1 and sets errno to EFAULT if pathname points
+ *    outside user's accessible address space.
+ * 4) truncate(2) returns -1 and sets errno to ENAMETOOLONG if the component
+ *    of a pathname exceeded 255 characters or entire pathname exceeds 1023
+ *    characters.
+ * 5) truncate(2) returns -1 and sets errno to ENOENT if the named file
+ *    does not exist.
+ * 6) truncate(2) returns -1 and sets errno to EISDIR if the named file
+ *    is a directory.
+ * 7) truncate(2) returns -1 and sets errno to EFBIG if the argument length
+ *    is larger than the maximum file size.
+ * 8) truncate(2) returns -1 and sets errno to ELOOP if too many symbolic
+ *    links were encountered in translating the pathname.
  */
 
 #define _GNU_SOURCE
@@ -52,8 +37,7 @@
 #include <pwd.h>
 #include <sys/resource.h>
 
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 
 #define TEST_FILE1	"testfile"
 #define TEST_FILE2	"t_file/testfile"
@@ -84,102 +68,74 @@ static struct test_case_t {
 	{ TEST_SYM1, TRUNC_LEN, ELOOP }
 };
 
-static void setup(void);
-static void cleanup(void);
-static void truncate_verify(struct test_case_t *);
-
-char *TCID = "truncate03";
-int TST_TOTAL = ARRAY_SIZE(test_cases);
-
-int main(int ac, char **av)
-{
-	int i, lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++)
-			truncate_verify(&test_cases[i]);
-
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-void setup(void)
+static void setup(void)
 {
 	struct passwd *ltpuser;
-	struct rlimit rlim;
+	struct rlimit rlim = {
+		.rlim_cur = MAX_FSIZE,
+		.rlim_max = MAX_FSIZE,
+	};
 	sigset_t signalset;
-	int n;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	ltpuser = SAFE_GETPWNAM(cleanup, "nobody");
-	SAFE_SETEUID(cleanup, ltpuser->pw_uid);
-
-	TEST_PAUSE;
+	unsigned int n;
 
-	tst_tmpdir();
+	ltpuser = SAFE_GETPWNAM("nobody");
+	SAFE_SETEUID(ltpuser->pw_uid);
 
-	SAFE_TOUCH(cleanup, TEST_FILE1, NEW_MODE, NULL);
+	SAFE_TOUCH(TEST_FILE1, NEW_MODE, NULL);
 
-	SAFE_TOUCH(cleanup, "t_file", FILE_MODE, NULL);
+	SAFE_TOUCH("t_file", FILE_MODE, NULL);
 
 	memset(long_pathname, 'a', PATH_MAX + 1);
 
-	SAFE_MKDIR(cleanup, TEST_DIR1, DIR_MODE);
+	SAFE_MKDIR(TEST_DIR1, DIR_MODE);
 
-	SAFE_TOUCH(cleanup, TEST_FILE3, FILE_MODE, NULL);
+	SAFE_TOUCH(TEST_FILE3, FILE_MODE, NULL);
 
-	SAFE_SYMLINK(cleanup, TEST_SYM1, TEST_SYM2);
-	SAFE_SYMLINK(cleanup, TEST_SYM2, TEST_SYM1);
+	SAFE_SYMLINK(TEST_SYM1, TEST_SYM2);
+	SAFE_SYMLINK(TEST_SYM2, TEST_SYM1);
 
-	rlim.rlim_cur = MAX_FSIZE;
-	rlim.rlim_max = MAX_FSIZE;
-	SAFE_SETRLIMIT(cleanup, RLIMIT_FSIZE, &rlim);
+	SAFE_SETRLIMIT(RLIMIT_FSIZE, &rlim);
 
-	sigemptyset(&signalset);
-	sigaddset(&signalset, SIGXFSZ);
-	TEST(sigprocmask(SIG_BLOCK, &signalset, NULL));
-	if (TEST_RETURN != 0)
-		tst_brkm(TBROK | TTERRNO, cleanup, "sigprocmask");
+	SAFE_SIGEMPTYSET(&signalset);
+	SAFE_SIGADDSET(&signalset, SIGXFSZ);
+	SAFE_SIGPROCMASK(SIG_BLOCK, &signalset, NULL);
 
-	for (n = 0; n < TST_TOTAL; n++) {
+	for (n = 0; n < ARRAY_SIZE(test_cases); n++) {
 		if (!test_cases[n].pathname)
-			test_cases[n].pathname = tst_get_bad_addr(cleanup);
+			test_cases[n].pathname = tst_get_bad_addr(NULL);
 	}
 
 }
 
-void truncate_verify(struct test_case_t *tc)
+static void verify_truncate(unsigned int n)
 {
+	struct test_case_t *tc = &test_cases[n];
+
 	TEST(truncate(tc->pathname, tc->length));
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "truncate() succeeded when failure expected");
+		return;
+	}
 
-	if (TEST_RETURN != -1) {
-		tst_resm(TFAIL, "truncate() returned %ld, "
-			"expected -1, errno:%d", TEST_RETURN,
-			tc->exp_errno);
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "truncate() returned invalid value %ld",
+			TST_RET);
 		return;
 	}
 
-	if (TEST_ERRNO == tc->exp_errno) {
-		tst_resm(TPASS | TTERRNO, "truncate() failed as expected");
+	if (TST_ERR == tc->exp_errno) {
+		tst_res(TPASS | TERRNO, "truncate() failed as expected");
 	} else {
-		tst_resm(TFAIL | TTERRNO,
+		tst_res(TFAIL | TTERRNO,
 			"truncate() failed unexpectedly; expected: %d - %s",
 			tc->exp_errno, strerror(tc->exp_errno));
 	}
 }
 
-void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(test_cases),
+	.test = verify_truncate,
+};
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
