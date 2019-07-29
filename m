Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF37895D
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 12:12:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E2A13C1D55
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 12:12:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 473003C1D4C
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 12:12:05 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 9C1CE1A008B0
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 12:12:03 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,322,1559491200"; d="scan'208";a="72435495"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Jul 2019 18:12:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 31E5D4CDD99E;
 Mon, 29 Jul 2019 18:12:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.215.28) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 29 Jul 2019 18:12:00 +0800
From: Jinhui huang <huangjh.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 29 Jul 2019 18:11:48 +0800
Message-ID: <1564395109-7165-2-git-send-email-huangjh.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1564395109-7165-1-git-send-email-huangjh.jy@cn.fujitsu.com>
References: <1564395109-7165-1-git-send-email-huangjh.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.28]
X-yoursite-MailScanner-ID: 31E5D4CDD99E.A059A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangjh.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] syscalls/ftruncate: Rewrite ftruncate03
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

Signed-off-by: Jinhui huang <huangjh.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/ftruncate/ftruncate03.c | 217 ++++++----------------
 1 file changed, 56 insertions(+), 161 deletions(-)

diff --git a/testcases/kernel/syscalls/ftruncate/ftruncate03.c b/testcases/kernel/syscalls/ftruncate/ftruncate03.c
index bb4dd1e..9b4e13d 100644
--- a/testcases/kernel/syscalls/ftruncate/ftruncate03.c
+++ b/testcases/kernel/syscalls/ftruncate/ftruncate03.c
@@ -1,188 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
  *
- *   Copyright (c) International Business Machines  Corp., 2002
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
+ * Jay Huie
+ * Robbie Williamson
  */
-
 /*
- * Test Name: ftruncate03
- *
  * Test Description:
  *  Verify that,
- *  1) ftruncate(2) returns -1 and sets errno to EINVAL if the specified
- *     socket is invalid.
- *  2) ftruncate(2) returns -1 and sets errno to EINVAL if the specified
- *     file descriptor has an attempt to write, when open for read only.
- *  3) ftruncate(2) returns -1 and sets errno to EBADF if the file descriptor
- *     of the specified file is not valid.
- *
- * Expected Result:
- *  ftruncate() should fail with return value -1 and set expected errno.
- *
- * HISTORY
- *      02/2002 Written by Jay Huie
- *	02/2002 Adapted for and included into the LTP by Robbie Williamson
- *
- * RESTRICTIONS:
- *  This test should be run by 'non-super-user' only.
- *
+ *  1)ftruncate() fails with EINVAL if the file is a socket.
+ *  2)ftruncate() fails with EINVAL if the file descriptor opens with O_RDONLY.
+ *  3)ftruncate() fails with EBADF if the file descriptor is invalid.
  */
 
-#include <stdio.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
 #include <unistd.h>
 #include <errno.h>
 #include <string.h>
-#include <inttypes.h>
-#include <sys/types.h>
 #include <sys/socket.h>
-#include <fcntl.h>
-
-#include "test.h"
-
-#define TESTFILE	"ftruncate03_tst_file"
-
-TCID_DEFINE(ftruncate03);
-int TST_TOTAL = 3;
 
-int main(void)
-{
-	int wjh_ret = -1, wjh_f = -1, count = 0;
-	//used for the 2nd test
-	//make str > trunc_size characters long
-	char str[] = "THIS IS JAYS TEST FILE DATA";
-	int trunc_size = 4;
-	int flag = O_RDONLY;
-
-#ifdef DEBUG
-	printf("Starting test, possible errnos are; EBADF(%d) EINVAL(%d)\n",
-	       EBADF, EINVAL);
-	printf("\t\tENOENT(%d) EACCES(%d) EPERM(%d)\n\n", ENOENT, EACCES,
-	       EPERM);
-#endif
+#include "tst_test.h"
 
-	tst_tmpdir();
+#define TESTFILE "testfile"
 
-//TEST1: ftruncate on a socket is not valid, should fail w/ EINVAL
+static int sock_fd, read_fd, bad_fd = -1;
 
-#ifdef DEBUG
-	printf("Starting test1\n");
-#endif
-	wjh_f = socket(PF_INET, SOCK_STREAM, 0);
-	wjh_ret = ftruncate(wjh_f, 1);
-#ifdef DEBUG
-	printf("DEBUG: fd: %d ret: %d errno(%d) %s\n",
-	       wjh_f, wjh_ret, errno, strerror(errno));
-#endif
-	if (wjh_ret == -1 && errno == EINVAL) {
-		tst_resm(TPASS, "Test Passed");
-	} else {
-		tst_resm(TFAIL,
-			 "ftruncate(socket)=%i (wanted -1), errno=%i (wanted EINVAL %i)",
-			 wjh_ret, errno, EINVAL);
-	}
-	close(wjh_f);
-	errno = 0;
-	wjh_ret = 0;
-	wjh_f = -1;
+static struct tcase {
+	int *fd;
+	int exp_errno;
+} tcases[] = {
+	{&sock_fd, EINVAL},
+	{&read_fd, EINVAL},
+	{&bad_fd, EBADF},
+};
 
-//TEST2: ftruncate on fd not open for writing should be EINVAL
+static void verify_ftruncate(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
 
-#ifdef DEBUG
-	printf("\nStarting test2\n");
-#endif
-	//create a file and fill it so we can truncate it in ReadOnly mode
-	//delete it first, ignore if it doesn't exist
-	unlink(TESTFILE);
-	errno = 0;
-	wjh_f = open(TESTFILE, O_RDWR | O_CREAT, 0644);
-	if (wjh_f == -1) {
-		tst_brkm(TFAIL | TERRNO, tst_rmdir, "open(%s) failed",
-			 TESTFILE);
-	}
-	while (count < strlen(str)) {
-		if ((count += write(wjh_f, str, strlen(str))) == -1) {
-			tst_resm(TFAIL | TERRNO, "write() failed");
-			close(wjh_f);
-			tst_rmdir();
-			tst_exit();
-		}
+	TEST(ftruncate(*tc->fd, 4));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "ftruncate() succeeded unexpectedly");
+		return;
 	}
-	close(wjh_f);
-	errno = 0;
 
-//Uncomment below if you want it to succeed, O_RDWR => success
-// flag = O_RDWR;
-#ifdef DEBUG
-	if (flag == O_RDWR) {
-		printf("\tLooks like it should succeed!\n");
+	if (TST_ERR == tc->exp_errno) {
+		tst_res(TPASS, "ftruncate() failed expectedly");
+	} else {
+		tst_res(TFAIL | TTERRNO,
+			"ftruncate() failed unexpectedly, got %s, expected",
+			tst_strerrno(tc->exp_errno));
 	}
-#endif
+}
 
-	wjh_f = open(TESTFILE, flag);
-	if (wjh_f == -1) {
-		tst_brkm(TFAIL | TERRNO, tst_rmdir, "open(%s) failed",
-			 TESTFILE);
-	}
-	wjh_ret = ftruncate(wjh_f, trunc_size);
-#ifdef DEBUG
-	printf("DEBUG: fd: %d ret: %d @ errno(%d) %s\n",
-	       wjh_f, wjh_ret, errno, strerror(errno));
-#endif
-	if ((flag == O_RDONLY) && (wjh_ret == -1) && (errno == EINVAL)) {
-		tst_resm(TPASS, "Test Passed");
-	} else if ((flag == O_RDWR)) {
-		if (wjh_ret == 0) {
-			tst_resm(TPASS, "Test Succeeded!");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-				 "ftruncate(%s) should have succeeded, but didn't! ret="
-				 "%d (wanted 0)", TESTFILE, wjh_ret);
-		}
-	} else			//flag was O_RDONLY but return codes wrong
-	{
-		tst_resm(TFAIL,
-			 "ftruncate(rd_only_fd)=%i (wanted -1), errno=%i (wanted %i EINVAL)",
-			 wjh_ret, errno, EINVAL);
-	}
-	close(wjh_f);
-	errno = 0;
-	wjh_ret = 0;
-	wjh_f = -1;
+static void setup(void)
+{
+	sock_fd = SAFE_SOCKET(PF_INET, SOCK_STREAM, 0);
 
-//TEST3: invalid socket descriptor should fail w/ EBADF
+	if (tst_fill_file(TESTFILE, 'a', 100, 1))
+		tst_brk(TBROK, "Failed to create test file");
 
-#ifdef DEBUG
-	printf("\nStarting test3\n");
-#endif
-	wjh_f = -999999;	//should be a bad file descriptor
-	wjh_ret = ftruncate(wjh_f, trunc_size);
-#ifdef DEBUG
-	printf("DEBUG: fd: %d ret: %d @ errno(%d) %s\n",
-	       wjh_f, wjh_ret, errno, strerror(errno));
-#endif
-	if (wjh_ret != -1 || errno != EBADF) {
-		tst_resm(TFAIL | TERRNO,
-			 "ftruncate(invalid_fd)=%d (wanted -1 and EBADF)",
-			 wjh_ret);
-	} else {
-		tst_resm(TPASS, "Test Passed");
-	}
+	read_fd = SAFE_OPEN(TESTFILE, O_RDONLY);
+}
 
-	tst_rmdir();
+static void cleanup(void)
+{
+	if (sock_fd > 0)
+		SAFE_CLOSE(sock_fd);
 
-//Done Testing
-	tst_exit();
+	if (read_fd > 0)
+		SAFE_CLOSE(read_fd);
 }
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_ftruncate,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+};
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
