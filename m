Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4C1358488
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 15:22:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD6483C7383
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 15:22:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 943B33C04B0
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 15:22:49 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8B9D0100041D
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 15:22:47 +0200 (CEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGMLf6c3FzPnv6
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 21:19:54 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 21:22:32 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 8 Apr 2021 21:22:30 +0800
Message-ID: <20210408132230.16216-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/memmap: Update to new api and move to
 syscalls/mmap
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

1)move the only one mmap testcase from syscalls/memmap/mem03.c to
syscalls/mmap/mmap19.c
2)update to new api.
3)add mmap19 to runtest/syscall.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 runtest/syscalls                            |   1 +
 testcases/kernel/syscalls/memmap/.gitignore |   1 -
 testcases/kernel/syscalls/memmap/Makefile   |   8 -
 testcases/kernel/syscalls/memmap/mem03.c    | 173 --------------------
 testcases/kernel/syscalls/mmap/.gitignore   |   1 +
 testcases/kernel/syscalls/mmap/mmap19.c     | 102 ++++++++++++
 6 files changed, 104 insertions(+), 182 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/memmap/.gitignore
 delete mode 100644 testcases/kernel/syscalls/memmap/Makefile
 delete mode 100644 testcases/kernel/syscalls/memmap/mem03.c
 create mode 100644 testcases/kernel/syscalls/mmap/mmap19.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 2d1e7b648..546a988c2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -765,6 +765,7 @@ mmap15 mmap15
 mmap16 mmap16
 mmap17 mmap17
 mmap18 mmap18
+mmap19 mmap19

 modify_ldt01 modify_ldt01
 modify_ldt02 modify_ldt02
diff --git a/testcases/kernel/syscalls/memmap/.gitignore b/testcases/kernel/syscalls/memmap/.gitignore
deleted file mode 100644
index c4c684456..000000000
--- a/testcases/kernel/syscalls/memmap/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-/mem03
diff --git a/testcases/kernel/syscalls/memmap/Makefile b/testcases/kernel/syscalls/memmap/Makefile
deleted file mode 100644
index 044619fb8..000000000
--- a/testcases/kernel/syscalls/memmap/Makefile
+++ /dev/null
@@ -1,8 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) International Business Machines  Corp., 2001
-
-top_srcdir		?= ../../../..
-
-include $(top_srcdir)/include/mk/testcases.mk
-
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/memmap/mem03.c b/testcases/kernel/syscalls/memmap/mem03.c
deleted file mode 100644
index a2dd02847..000000000
--- a/testcases/kernel/syscalls/memmap/mem03.c
+++ /dev/null
@@ -1,173 +0,0 @@
-/*
- *
- *   Copyright (c) National ICT Australia, 2006
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
- */
-
-/* NICTA */
-/* 13/02/2006	Implemented	carl.vanschaik at nicta.com.au */
-
-/* mem03.c */
-/*
- * NAME
- * 	mem03.c
- *
- * DESCRIPTION
- *      - create two files, write known data to the files.
- *      - mmap the files, verify data
- *      - unmap files
- *      - remmap files, swap virtual addresses ie: file1 at file2's address, etc
- *
- * REASONING
- *      - If the kernel fails to correctly flush the TLB entry, the second mmap
- *        will not show the correct data.
- *
- *
- * RESTRICTIONS
- * 	None
- */
-
-#include <stdio.h>
-#include <signal.h>
-#include <stdlib.h>
-#include "test.h"
-#include <unistd.h>
-#include <errno.h>
-#include <time.h>
-#include <string.h>
-#include <sys/types.h>
-#include <sys/stat.h>		/* definitions for open()                               */
-#include <sys/mman.h>		/* definitions for mmap()                               */
-#include <fcntl.h>		/* definition of open()                                 */
-#include <sys/user.h>
-
-#define FAILED       (-1)	/* return status for all funcs indicating failure   */
-#define SUCCESS      0		/* return status for all routines indicating success */
-
-static void setup();
-static void cleanup();
-
-char *TCID = "mem03";
-int TST_TOTAL = 1;
-
-int f1 = -1, f2 = -1;
-char *mm1 = NULL, *mm2 = NULL;
-
-/*--------------------------------------------------------------------*/
-int main(void)
-{
-	char tmp1[] = "./tmp.file.1";
-	char tmp2[] = "./tmp.file.2";
-
-	char str1[] = "testing 123";
-	char str2[] = "my test mem";
-
-	setup();
-
-	if ((f1 = open(tmp1, O_RDWR | O_CREAT, S_IREAD | S_IWRITE)) == -1)
-		tst_brkm(TFAIL, cleanup, "failed to open/create file %s", tmp1);
-
-	if ((f2 = open(tmp2, O_RDWR | O_CREAT, S_IREAD | S_IWRITE)) == -1)
-		tst_brkm(TFAIL, cleanup, "failed to open/create file %s", tmp2);
-
-	write(f1, str1, strlen(str1));
-	write(f2, str2, strlen(str2));
-
-	{
-		char *save_mm1, *save_mm2;
-
-		mm1 = mmap(0, 64, PROT_READ, MAP_PRIVATE, f1, 0);
-		mm2 = mmap(0, 64, PROT_READ, MAP_PRIVATE, f2, 0);
-
-		if ((mm1 == (void *)-1) || (mm2 == (void *)-1))
-			tst_brkm(TFAIL, cleanup, "mmap failed");
-
-		save_mm1 = mm1;
-		save_mm2 = mm2;
-
-		if (strncmp(str1, mm1, strlen(str1)))
-			tst_brkm(TFAIL, cleanup, "failed on compare %s", tmp1);
-
-		if (strncmp(str2, mm2, strlen(str2)))
-			tst_brkm(TFAIL, cleanup, "failed on compare %s", tmp2);
-
-		munmap(mm1, 64);
-		munmap(mm2, 64);
-
-		mm1 = mmap(save_mm2, 64, PROT_READ, MAP_PRIVATE, f1, 0);
-		mm2 = mmap(save_mm1, 64, PROT_READ, MAP_PRIVATE, f2, 0);
-
-		if ((mm1 == (void *)-1) || (mm2 == (void *)-1))
-			tst_brkm(TFAIL, cleanup, "second mmap failed");
-
-		if (mm1 != save_mm2) {
-			printf("mmap not using same address\n");
-
-		}
-
-		if (mm2 != save_mm1) {
-			printf("mmap not using same address\n");
-
-		}
-
-		if (strncmp(str1, mm1, strlen(str1)))
-			tst_brkm(TFAIL, cleanup, "failed on compare %s", tmp1);
-
-		if (strncmp(str2, mm2, strlen(str2)))
-			tst_brkm(TFAIL, cleanup, "failed on compare %s", tmp2);
-
-		munmap(mm1, 64);
-		munmap(mm2, 64);
-	}
-
-	tst_resm(TPASS, "%s memory test succeeded", TCID);
-
-	/* clean up and exit */
-	cleanup();
-
-	tst_exit();
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test
- */
-void setup(void)
-{
-	/*
-	 * Create a temporary directory and cd into it.
-	 */
-	tst_tmpdir();
-}
-
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
-{
-	if (mm1)
-		munmap(mm1, 64);
-	if (mm2)
-		munmap(mm2, 64);
-
-	if (f1 != -1)
-		close(f1);
-	if (f2 != -1)
-		close(f2);
-
-	tst_rmdir();
-
-}
diff --git a/testcases/kernel/syscalls/mmap/.gitignore b/testcases/kernel/syscalls/mmap/.gitignore
index 4fd90ab5f..8811226be 100644
--- a/testcases/kernel/syscalls/mmap/.gitignore
+++ b/testcases/kernel/syscalls/mmap/.gitignore
@@ -17,3 +17,4 @@
 /mmap16
 /mmap17
 /mmap18
+/mmap19
diff --git a/testcases/kernel/syscalls/mmap/mmap19.c b/testcases/kernel/syscalls/mmap/mmap19.c
new file mode 100644
index 000000000..4af306299
--- /dev/null
+++ b/testcases/kernel/syscalls/mmap/mmap19.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) National ICT Australia, 2006
+ * Author: carl.vanschaik at nicta.com.au
+ */
+
+/*
+ * [Description]
+ * If the kernel fails to correctly flush the TLB entry, the second mmap
+ * will not show the correct data.
+ *
+ * [Algorithm]
+ * 1) create two files, write known data to the files
+ * 2) mmap the files, verify data
+ * 3) unmap files
+ * 4) remmap files, swap virtual addresses
+ * 5) check wheather if the memory content is correct
+ */
+
+#include <string.h>
+#include "tst_test.h"
+
+#define LEN 64
+
+static int f1 = -1, f2 = -1;
+static char *mm1 = NULL, *mm2 = NULL;
+
+static const char tmp1[] = "testfile1";
+static const char tmp2[] = "testfile2";
+
+static const char str1[] = "testing 123";
+static const char str2[] = "my test mem";
+
+static void run(void)
+{
+
+	char *save_mm1, *save_mm2;
+
+	mm1 = SAFE_MMAP(0, LEN, PROT_READ, MAP_PRIVATE, f1, 0);
+	mm2 = SAFE_MMAP(0, LEN, PROT_READ, MAP_PRIVATE, f2, 0);
+
+	save_mm1 = mm1;
+	save_mm2 = mm2;
+
+	if (strncmp(str1, mm1, strlen(str1)))
+		tst_brk(TFAIL, "failed on compare %s", tmp1);
+
+	if (strncmp(str2, mm2, strlen(str2)))
+		tst_brk(TFAIL, "failed on compare %s", tmp2);
+
+	SAFE_MUNMAP(mm1, LEN);
+	SAFE_MUNMAP(mm2, LEN);
+
+	mm1 = SAFE_MMAP(save_mm2, LEN, PROT_READ, MAP_PRIVATE, f1, 0);
+	mm2 = SAFE_MMAP(save_mm1, LEN, PROT_READ, MAP_PRIVATE, f2, 0);
+
+	if (mm1 != save_mm2 || mm2 != save_mm1) {
+		tst_res(TINFO, "mmap not using same address");
+	}
+
+	if (strncmp(str1, mm1, strlen(str1)))
+		tst_brk(TFAIL, "failed on compare %s", tmp1);
+
+	if (strncmp(str2, mm2, strlen(str2)))
+		tst_brk(TFAIL, "failed on compare %s", tmp2);
+
+	tst_res(TPASS, "memory test succeeded");
+}
+
+static void setup(void)
+{
+	f1 = SAFE_OPEN(tmp1, O_RDWR | O_CREAT, S_IREAD | S_IWRITE);
+	f2 = SAFE_OPEN(tmp2, O_RDWR | O_CREAT, S_IREAD | S_IWRITE);
+
+	SAFE_WRITE(1, f1, str1, strlen(str1));
+	SAFE_WRITE(1, f2, str2, strlen(str2));
+}
+
+static void cleanup(void)
+{
+	if (mm1) {
+		SAFE_MUNMAP(mm1, LEN);
+		mm1 = NULL;
+	}
+	if (mm2) {
+		SAFE_MUNMAP(mm2, LEN);
+		mm2 = NULL;
+	}
+
+	if (f1 != -1)
+		SAFE_CLOSE(f1);
+	if (f2 != -1)
+		SAFE_CLOSE(f2);
+}
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
