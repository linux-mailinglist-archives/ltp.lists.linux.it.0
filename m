Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF4435662E
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 10:14:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACC623C1DF5
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 10:14:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3897A3C1DDA
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 10:14:28 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 54B8A20096C
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 10:14:27 +0200 (CEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFcZ444tRzyNcD
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 16:12:12 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 16:14:16 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 7 Apr 2021 16:14:15 +0800
Message-ID: <20210407081415.8353-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/getdtablesize: Update to the new api
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

1)use some safe macros
2)open a temporary file instead of /etc/hosts since it might be not exist
3)cleanup all of the opened fd

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 .../syscalls/getdtablesize/getdtablesize01.c  | 161 ++++++++----------
 1 file changed, 73 insertions(+), 88 deletions(-)

diff --git a/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c b/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
index d25cac261..f16c54a68 100644
--- a/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
+++ b/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
@@ -1,119 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2005
  * Copyright (c) Wipro Technologies Ltd, 2005.  All Rights Reserved.
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
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
+ * AUTHOR: Prashant P Yendigeri <prashant.yendigeri@wipro.com>
+ *	   Robbie Williamson <robbiew@us.ibm.com>
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER   : getdtablesize01
- *
- *    EXECUTED BY       : root / superuser
- *
- *    TEST TITLE        : Basic tests for getdtablesize01(2)
- *
- *    TEST CASE TOTAL   : 1
- *
- *    AUTHOR            : Prashant P Yendigeri
- *                        <prashant.yendigeri@wipro.com>
- *                        Robbie Williamson
- *                        <robbiew@us.ibm.com>
- *
- *    DESCRIPTION
- *      This is a Phase I test for the getdtablesize01(2) system call.
- *      It is intended to provide a limited exposure of the system call.
+
+/*\
+ * [Description]
+ * Test getdtablesize() returns the maximum number of files a process can
+ * have open, one more than the largest possible value for a file descriptor.
  *
- **********************************************************/
+ * [Algorithm]
+ * 1. Check the return value of getdtablesize() is equal to _SC_OPEN_MAX or
+ * the current limit on the number of open files per process.
+ * 2. Open the maximum allowed number of file descriptors and then check if
+ * it is equal to the return value of getdtablesize() - 1.
+ */

-#include <stdio.h>
-#include <errno.h>
-#include <sys/types.h>
+#include <stdlib.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <sys/time.h>
 #include <sys/resource.h>
 #include <unistd.h>
-#include "test.h"
+#include "tst_test.h"

-void setup();
-void cleanup();
+#define TESTFILE "getdtablesize01_testfile"
+#define FILE_OPEN_MAX SAFE_SYSCONF(_SC_OPEN_MAX)

-char *TCID = "getdtablesize01";
-int TST_TOTAL = 1;
+static int *fd, count;

-int main(void)
+static void run(void)
 {
-	int table_size, fd = 0, count = 0;
+	int temp_fd;
 	int max_val_opfiles;
 	struct rlimit rlp;

-	setup();
-	table_size = getdtablesize();
-	getrlimit(RLIMIT_NOFILE, &rlp);
-	max_val_opfiles = (rlim_t) rlp.rlim_cur;
-
-	tst_resm(TINFO,
-		 "Maximum number of files a process can have opened is %d",
-		 table_size);
-	tst_resm(TINFO,
-		 "Checking with the value returned by getrlimit...RLIMIT_NOFILE");
-
-	if (table_size == max_val_opfiles)
-		tst_resm(TPASS, "got correct dtablesize, value is %d",
-			 max_val_opfiles);
-	else {
-		tst_resm(TFAIL, "got incorrect table size, value is %d",
-			 max_val_opfiles);
-		cleanup();
-	}
+	TEST(getdtablesize());
+	tst_res(TINFO,
+		"Maximum number of files a process can have opened is %d",
+		TST_RET);

-	tst_resm(TINFO,
-		 "Checking Max num of files that can be opened by a process.Should be: RLIMIT_NOFILE - 1");
-	for (;;) {
-		fd = open("/etc/hosts", O_RDONLY);
+	tst_res(TINFO, "Checking with the value returned by getrlimit");

-		if (fd == -1)
-			break;
-		count = fd;
+	if (getrlimit(RLIMIT_NOFILE, &rlp))
+		max_val_opfiles = FILE_OPEN_MAX;
+	else
+		max_val_opfiles = (rlim_t)rlp.rlim_cur;

-#ifdef DEBUG
-		printf("Opened file num %d\n", fd);
-#endif
-	}
+	if (TST_RET == max_val_opfiles)
+		tst_res(TPASS, "got correct dtablesize, value is %d "
+			"max_val_opfiles value is %d",
+			TST_RET, max_val_opfiles);
+	else
+		tst_res(TFAIL, "got incorrect dtablesize, value is %d"
+			 "max_val_opfiles value is %d",
+			 TST_RET, max_val_opfiles);

-//Now the max files opened should be RLIMIT_NOFILE - 1 , why ? read getdtablesize man page
+	tst_res(TINFO,
+		"Checking Max num of files that can be opened by a process."
+		"Should be: RLIMIT_NOFILE - 1");

-	if (count > 0)
-		close(count);
-	if (count == (max_val_opfiles - 1))
-		tst_resm(TPASS, "%d = %d", count, (max_val_opfiles - 1));
-	else if (fd < 0 && errno == ENFILE)
-		tst_brkm(TCONF, cleanup, "Reached maximum number of open files for the system");
-	else
-		tst_resm(TFAIL, "%d != %d", count, (max_val_opfiles - 1));
+	while (1) {
+		temp_fd = open(TESTFILE, O_CREAT | O_RDONLY, 0755);
+		if (temp_fd == -1)
+			break;
+		fd[count++] = temp_fd;
+	}

-	cleanup();
-	tst_exit();
+	if (fd[count - 1] == (max_val_opfiles - 1))
+		tst_res(TPASS,
+			"max open file fd is correct, %d = %d",
+			fd[count - 1], (max_val_opfiles - 1));
+	else if (temp_fd < 0 && errno == ENFILE)
+		tst_brk(TCONF,
+			"Reached maximum number of open files for the system");
+	else
+		tst_res(TFAIL | TERRNO, "%d != %d", fd[count - 1], (max_val_opfiles - 1));
 }

-void setup(void)
+static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	fd = SAFE_MALLOC(FILE_OPEN_MAX * sizeof(int));
 }

-void cleanup(void)
+static void cleanup(void)
 {
+	int i;
+	for (i = 0; i < count; i++)
+		SAFE_CLOSE(fd[i]);
+
+	free(fd);
+	fd = NULL;
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+};
+
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
