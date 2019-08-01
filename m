Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FFE7D686
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 09:42:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57ABB3C1E0E
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 09:42:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 051F83C1DF4
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 09:42:48 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 3BBA360197F
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 09:42:47 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,333,1559491200"; d="scan'208";a="72654534"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 01 Aug 2019 15:42:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id A15C84CDD99E;
 Thu,  1 Aug 2019 15:42:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.215.28) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 1 Aug 2019 15:42:35 +0800
From: Jinhui huang <huangjh.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 1 Aug 2019 15:42:28 +0800
Message-ID: <1564645349-10859-2-git-send-email-huangjh.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1564645349-10859-1-git-send-email-huangjh.jy@cn.fujitsu.com>
References: <1564395109-7165-3-git-send-email-huangjh.jy@cn.fujitsu.com>
 <1564645349-10859-1-git-send-email-huangjh.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.28]
X-yoursite-MailScanner-ID: A15C84CDD99E.A1175
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangjh.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] syscalls/ftruncate: Rewrite ftruncate03 and
 add new error test
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

1) Cleanup and convert to new API.
2) Add EINVAL error test for ftruncate().

Signed-off-by: Jinhui huang <huangjh.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/ftruncate/ftruncate03.c | 235 +++++++---------------
 1 file changed, 71 insertions(+), 164 deletions(-)

diff --git a/testcases/kernel/syscalls/ftruncate/ftruncate03.c b/testcases/kernel/syscalls/ftruncate/ftruncate03.c
index bb4dd1e..b83e0c2 100644
--- a/testcases/kernel/syscalls/ftruncate/ftruncate03.c
+++ b/testcases/kernel/syscalls/ftruncate/ftruncate03.c
@@ -1,188 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) International Business Machines  Corp., 2002
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
+ *  3)ftruncate() fails with EINVAL if the length is negative.
+ *  4)ftruncate() fails with EBADF if the file descriptor is invalid.
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
 
-#include "test.h"
+#include "tst_test.h"
+
+#define TESTFILE1	"testfile1"
+#define TESTFILE2	"testfile2"
 
-#define TESTFILE	"ftruncate03_tst_file"
+static int sock_fd, read_fd, fd;
+static int bad_fd = -1;
 
-TCID_DEFINE(ftruncate03);
-int TST_TOTAL = 3;
+static struct tcase {
+	int *fd;
+	off_t length;
+	int exp_errno;
+} tcases[] = {
+	{&sock_fd, 4, EINVAL},
+	{&read_fd, 4, EINVAL},
+	{&fd, -1, EINVAL},
+	{&bad_fd, 4, EBADF},
+};
 
-int main(void)
+static void verify_ftruncate(unsigned int n)
 {
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
-
-	tst_tmpdir();
-
-//TEST1: ftruncate on a socket is not valid, should fail w/ EINVAL
-
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
-
-//TEST2: ftruncate on fd not open for writing should be EINVAL
-
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
-	}
-	close(wjh_f);
-	errno = 0;
-
-//Uncomment below if you want it to succeed, O_RDWR => success
-// flag = O_RDWR;
-#ifdef DEBUG
-	if (flag == O_RDWR) {
-		printf("\tLooks like it should succeed!\n");
-	}
-#endif
+	struct tcase *tc = &tcases[n];
 
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
+	TEST(ftruncate(*tc->fd, tc->length));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "ftruncate() succeeded unexpectedly and got %ld",
+			TST_RET);
+		return;
 	}
-	close(wjh_f);
-	errno = 0;
-	wjh_ret = 0;
-	wjh_f = -1;
-
-//TEST3: invalid socket descriptor should fail w/ EBADF
-
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
+
+	if (TST_ERR == tc->exp_errno) {
+		tst_res(TPASS | TTERRNO, "ftruncate() failed expectedly");
 	} else {
-		tst_resm(TPASS, "Test Passed");
+		tst_res(TFAIL | TTERRNO,
+			"ftruncate() failed unexpectedly, got %s, expected",
+			tst_strerrno(tc->exp_errno));
 	}
+}
+
+static void setup(void)
+{
+	sock_fd = SAFE_SOCKET(PF_INET, SOCK_STREAM, 0);
 
-	tst_rmdir();
+	read_fd = SAFE_OPEN(TESTFILE1, O_RDONLY | O_CREAT, 0644);
 
-//Done Testing
-	tst_exit();
+	if (tst_fill_file(TESTFILE2, 'a', 100, 1))
+		tst_brk(TBROK, "Failed to create test file");
+
+	fd = SAFE_OPEN(TESTFILE2, O_RDWR);
 }
+
+static void cleanup(void)
+{
+	if (sock_fd > 0)
+		SAFE_CLOSE(sock_fd);
+
+	if (read_fd > 0)
+		SAFE_CLOSE(read_fd);
+
+	if (fd > 0)
+		SAFE_CLOSE(fd);
+}
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
