Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7048443FC9
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 11:04:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D8A73C7190
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 11:04:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 891DA3C0956
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 11:04:07 +0100 (CET)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9D24F140142F
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 11:04:04 +0100 (CET)
X-QQ-mid: bizesmtp39t1635933839tvma5mgc
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 03 Nov 2021 18:03:54 +0800 (CST)
X-QQ-SSF: 0140000000200040C000000A0000000
X-QQ-FEAT: XC3LR/CoacvsjNP9D8GnXSAArCDOasgvGTXfyfycdNPfYmoZxI9cVQ1yDTAZ3
 WBwN/3MmXWLvNqLVpZ4amD5/yEHBehSz2AHKnFXC7WTPNravHTvnpd947iDTRZGLRpXKFPn
 Q2BJ9mghcSCv1dWU7PHaaFtVle6qoGGQ+p8lNnJHLeFtioWGqT3oDAVw+JZeq2qOVE3Dr4r
 FPeC0GbZh470vdZ0cbO4iQnb2TVezrv4uMPN9/wBcPwAyEwTm2KRoZSAZcEP4atm/MNP0BU
 Jmt1+U+53od7kfcTg/aYfYn7UHiQ6Lz85zTCGFj3EylxuY/lcu9M5Q8Vgk4INZeRbmV+vOp
 hV4oAZCVW4Ci8U9u6eqQgUPaidFz/Zzb8xlXvsA
X-QQ-GoodBg: 2
From: tangmeng <tangmeng@uniontech.com>
To: ltp@lists.linux.it
Date: Wed,  3 Nov 2021 18:03:50 +0800
Message-Id: <20211103100351.15851-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] syscalls/link: Convert to new API and merge
 link06 and link07 into link04
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
 runtest/syscalls                        |   2 -
 testcases/kernel/syscalls/link/link04.c | 208 +++++++++++-------------
 testcases/kernel/syscalls/link/link06.c | 113 -------------
 testcases/kernel/syscalls/link/link07.c | 118 --------------
 4 files changed, 93 insertions(+), 348 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/link/link06.c
 delete mode 100644 testcases/kernel/syscalls/link/link07.c

diff --git a/runtest/syscalls b/runtest/syscalls
index b19316805..1e6d46744 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -673,8 +673,6 @@ link02 link02
 link03 link03
 link04 link04
 link05 link05
-link06 link06
-link07 link07
 link08 link08

 #linkat test cases
diff --git a/testcases/kernel/syscalls/link/link04.c b/testcases/kernel/syscalls/link/link04.c
index d9408845e..9a1c32859 100644
--- a/testcases/kernel/syscalls/link/link04.c
+++ b/testcases/kernel/syscalls/link/link04.c
@@ -1,65 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
  *  AUTHOR		: Richard Logan
  *  CO-PILOT		: William Roske
  * Copyright (c) 2014 Cyril Hrubis <chrubis@suse.cz>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
- * Mountain View, CA  94043, or:
- *
- * http://www.sgi.com
- *
- * For further information regarding this notice, see:
- *
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
- *
  */

-/*
+/*\
+ * [Description]
+ *
  * Negative test cases for link(2).
  *
  * This test program should contain test cases where link will fail regardless
  * of who executed it (i.e. joe-user or root)
  */
-#include <sys/types.h>
-#include <fcntl.h>
-#include <sys/stat.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
+#include <pwd.h>
 #include <sys/param.h>
 #include <sys/mman.h>
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
+
+#define NOBODY_USER     99
+#define MODE_TO1 S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IXGRP|S_IXOTH|S_IROTH
+#define MODE_TO2 S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IWGRP|S_IXGRP|S_IXOTH|S_IROTH|S_IWOTH
+#define MODE_TE S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH
+#define MODE_RWX        S_IRWXU | S_IRWXG | S_IRWXO
+#define DIR_TEMP        "dir2/testdir_1"

 static char longpath[PATH_MAX + 2];

-struct test_case_t {
+static struct tcase {
 	char *file1;
 	char *desc1;
 	char *file2;
 	char *desc2;
 	int exp_errno;
-} test_cases[] = {
+} tcases[] = {
 	/* first path is invalid */
 	{"nonexistfile", "non-existent file", "nefile", "nefile", ENOENT},
 	{"", "path is empty string", "nefile", "nefile", ENOENT},
@@ -79,92 +54,95 @@ struct test_case_t {
 	{"regfile", "regfile", NULL, "invalid address", EFAULT},
 	/* two existing files */
 	{"regfile", "regfile", "regfile2", "regfile2", EEXIST},
+	{"dir1/oldpath", "Write access diretory", "dir1/newpath", "newpath", EACCES},
+	{"dir2/testdir_1/tfile_2", "Search access diretory", "dir2/testdir_1/new_tfile_2",
+	"dir2/testdir_1/new_tfile_2", EACCES},
 };

-char *TCID = "link04";
-int TST_TOTAL = ARRAY_SIZE(test_cases);
-
-static void setup(void);
-static void cleanup(void);
-
-int main(int ac, char **av)
+static void verify_link(unsigned int i)
 {
-	int lc;
-	char *fname1, *fname2;
-	char *desc1, *desc2;
-	int i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			fname1 = test_cases[i].file1;
-			desc1 = test_cases[i].desc1;
-			fname2 = test_cases[i].file2;
-			desc2 = test_cases[i].desc2;
-
-			TEST(link(fname1, fname2));
-
-			if (TEST_RETURN == -1) {
-				if (TEST_ERRNO == test_cases[i].exp_errno) {
-					tst_resm(TPASS | TTERRNO,
-						 "link(<%s>, <%s>)",
-						 desc1, desc2);
-				} else {
-					tst_resm(TFAIL | TTERRNO,
-						 "link(<%s>, <%s>) Failed "
-					         "expected errno: %d",
-						 desc1, desc2,
-						 test_cases[i].exp_errno);
-				}
-			} else {
-				tst_resm(TFAIL,
-					 "link(<%s>, <%s>) returned %ld, "
-				         "expected -1, errno:%d",
-					 desc1, desc2, TEST_RETURN,
-					 test_cases[i].exp_errno);
-			}
+	struct tcase *tc = &tcases[i];
+
+	TEST(link(tc->file1, tc->file2));
+
+	if (TST_RET == -1) {
+		if (TST_ERR == tc->exp_errno) {
+			tst_res(TPASS | TTERRNO,
+			"link(<%s>, <%s>)",
+			tc->desc1, tc->desc2);
+	} else {
+		tst_res(TFAIL | TTERRNO,
+			"link(<%s>, <%s>) Failed "
+			"expected errno: %d",
+			tc->desc1, tc->desc2,
+			tc->exp_errno);
 		}
-
+	} else {
+		tst_res(TFAIL,
+			 "link(<%s>, <%s>) returned %ld, "
+			"expected -1, errno:%d",
+			tc->desc1, tc->desc2, TST_RET,
+			tc->exp_errno);
 	}
-
-	cleanup();
-	tst_exit();
 }

 static void setup(void)
 {
-	int n;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
 	memset(longpath, 'a', PATH_MAX+1);
-	SAFE_TOUCH(cleanup, "regfile", 0777, NULL);
-	SAFE_TOUCH(cleanup, "regfile2", 0777, NULL);
-	SAFE_MKDIR(cleanup, "dir", 0777);
-
-	void *bad_addr = tst_get_bad_addr(cleanup);

-	for (n = 0; n < TST_TOTAL; n++) {
-		if (!test_cases[n].file1)
-			test_cases[n].file1 = bad_addr;
-
-		if (!test_cases[n].file2)
-			test_cases[n].file2 = bad_addr;
+	SAFE_TOUCH("regfile", 0777, NULL);
+	SAFE_TOUCH("regfile2", 0777, NULL);
+	SAFE_MKDIR("dir", 0777);
+
+	unsigned int i;
+	struct passwd *nobody_pwd;
+
+	for (i = 0; i < ARRAY_SIZE(tcases); i++) {
+		struct tcase *tc = &tcases[i];
+
+		switch (tc->exp_errno) {
+		case EACCES:
+			if (tc->desc1 == "Write access diretory") {
+				SAFE_SETEUID(0);
+				SAFE_MKDIR("dir1", MODE_RWX);
+				/* Modify mode permissions on test directory */
+				SAFE_CHMOD("dir1", MODE_TO1);
+				SAFE_TOUCH(tc->file1, 0777, NULL);
+				nobody_pwd = SAFE_GETPWNAM("nobody");
+				SAFE_SETEUID(nobody_pwd->pw_uid);
+			} else if (tc->desc1 == "Search access diretory") {
+				SAFE_SETEUID(0);
+				SAFE_MKDIR("dir2", MODE_RWX);
+				/* Modify mode permissions on test directory */
+				SAFE_CHMOD("dir2", MODE_TO2);
+				SAFE_MKDIR(DIR_TEMP, MODE_RWX);
+				SAFE_TOUCH(tc->file1, 0666, NULL);
+
+				/* Modify mode permissions on test directory - test conditions */
+				SAFE_CHMOD(DIR_TEMP, MODE_TE);
+				nobody_pwd = SAFE_GETPWNAM("nobody");
+				SAFE_SETEUID(nobody_pwd->pw_uid);
+			}
+			break;
+		case ENOENT:
+		case ENOTDIR:
+		case ENAMETOOLONG:
+		case EFAULT:
+		case EEXIST:
+			if (!tc->file1)
+				tc->file1 = tst_get_bad_addr(NULL);
+
+			if (!tc->file2)
+				tc->file2 = tst_get_bad_addr(NULL);
+			break;
+		}
 	}
 }

-static void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+        .test = verify_link,
+        .setup = setup,
+        .needs_tmpdir = 1,
+	.needs_root = 1,
+};
diff --git a/testcases/kernel/syscalls/link/link06.c b/testcases/kernel/syscalls/link/link06.c
deleted file mode 100644
index 17b38ad43..000000000
--- a/testcases/kernel/syscalls/link/link06.c
+++ /dev/null
@@ -1,113 +0,0 @@
-/*
- * Copyright (C) Bull S.A. 2001
- * Copyright (c) International Business Machines  Corp., 2001
- * 06/2002 Ported by Jacky Malcles
- * Copyright (c) 2014 Cyril Hrubis <chrubis@suse.cz>
- *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * Verify that, link() fails with -1 and sets errno to EACCES when Write access
- * to the directory containing newpath is not allowed for the process's
- * effective uid.
- */
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <pwd.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-#define NOBODY_USER	99
-#define MODE_TO S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IXGRP|S_IXOTH|S_IROTH
-
-static void setup(void);
-static void cleanup(void);
-
-char *TCID = "link06";
-int TST_TOTAL = 1;
-
-#define OLDPATH "oldpath"
-#define NEWPATH "newpath"
-
-int main(int ac, char **av)
-{
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		TEST(link(OLDPATH, NEWPATH));
-
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL, "link() returned %ld, "
-				 "expected -1, errno=%d", TEST_RETURN,
-				 EACCES);
-		} else {
-			if (TEST_ERRNO == EACCES) {
-				tst_resm(TPASS, "link() fails with expected "
-					 "error EACCES errno:%d", TEST_ERRNO);
-			} else {
-				tst_resm(TFAIL, "link() fails with "
-					 "errno=%d, expected errno=%d",
-					 TEST_ERRNO, EACCES);
-			}
-		}
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-static void setup(void)
-{
-	struct passwd *nobody_pwd;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	/* Modify mode permissions on test directory */
-	SAFE_CHMOD(cleanup, ".", MODE_TO);
-
-	SAFE_TOUCH(cleanup, OLDPATH, 0777, NULL);
-	nobody_pwd = SAFE_GETPWNAM(cleanup, "nobody");
-	SAFE_SETEUID(cleanup, nobody_pwd->pw_uid);
-}
-
-static void cleanup(void)
-{
-	if (seteuid(0))
-		tst_resm(TWARN | TERRNO, "seteuid(0) failed");
-
-	tst_rmdir();
-}
diff --git a/testcases/kernel/syscalls/link/link07.c b/testcases/kernel/syscalls/link/link07.c
deleted file mode 100644
index 09743b59c..000000000
--- a/testcases/kernel/syscalls/link/link07.c
+++ /dev/null
@@ -1,118 +0,0 @@
-/*
- * Copyright (C) Bull S.A. 2001
- * Copyright (c) International Business Machines  Corp., 2001
- *  06/2002 Ported by Jacky Malcles
- * Copyright (c) 2014 Cyril Hrubis <chrubis@suse.cz>
- *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * Verify that, link() fails with -1 and sets errno to EACCES when one of the
- * directories in oldpath or newpath did not allow search (execute) permission.
- */
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <pwd.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-#define MODE_TO S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IWGRP|S_IXGRP|S_IXOTH|S_IROTH|S_IWOTH
-#define MODE_TE S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH
-#define MODE_RWX        S_IRWXU | S_IRWXG | S_IRWXO
-#define DIR_TEMP        "testdir_1"
-#define TEST_FILE2      "testdir_1/tfile_2"
-#define NEW_TEST_FILE2  "testdir_1/new_tfile_2"
-
-static void setup(void);
-static void cleanup(void);
-
-char *TCID = "link07";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
-{
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		TEST(link(TEST_FILE2, NEW_TEST_FILE2));
-
-		/* Check return code from link(2) */
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL | TTERRNO, "link() returned %ld, "
-				 "expected -1, errno=%d", TEST_RETURN, EACCES);
-		} else {
-			if (TEST_ERRNO == EACCES) {
-				tst_resm(TPASS | TTERRNO,
-				         "link() fails with expected error");
-			} else {
-				tst_resm(TFAIL | TTERRNO, "link() failed"
-				         ", expected errno=%d (EACCES)",
-				         EACCES);
-			}
-		}
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-static void setup(void)
-{
-	struct passwd *nobody_pwd;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	/* Modify mode permissions on test directory */
-	SAFE_CHMOD(cleanup, ".", MODE_TO);
-
-	SAFE_MKDIR(cleanup, DIR_TEMP, MODE_RWX);
-	SAFE_TOUCH(cleanup, TEST_FILE2, 0666, NULL);
-
-	/* Modify mode permissions on test directory - test conditions */
-	SAFE_CHMOD(cleanup, DIR_TEMP, MODE_TE);
-
-	nobody_pwd = SAFE_GETPWNAM(cleanup, "nobody");
-	SAFE_SETEUID(cleanup, nobody_pwd->pw_uid);
-}
-
-static void cleanup(void)
-{
-	if (seteuid(0))
-		tst_resm(TWARN | TERRNO, "seteuid(o) failed");
-
-	tst_rmdir();
-}
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
