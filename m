Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E901181E4
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:15:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E32943C243C
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:15:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3865C3C243F
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:15:00 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 21E3914052DF
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:14:56 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,299,1571673600"; d="scan'208";a="79931884"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Dec 2019 16:14:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E8BCC4CE1A05
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 16:06:17 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.31) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 10 Dec 2019 16:14:50 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 10 Dec 2019 16:14:18 -0500
Message-ID: <1576012458-31108-3-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576012458-31108-1-git-send-email-zhufy.jy@cn.fujitsu.com>
References: <1576012458-31108-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.31]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E8BCC4CE1A05.AD77E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=2.9 required=7.0 tests=DATE_IN_FUTURE_12_24,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] syscalls/llseek02: convert to new library and add
 SEEK_SET test
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

---
 testcases/kernel/syscalls/llseek/llseek03.c | 161 +++++++++++++---------------
 1 file changed, 73 insertions(+), 88 deletions(-)

diff --git a/testcases/kernel/syscalls/llseek/llseek03.c b/testcases/kernel/syscalls/llseek/llseek03.c
index 4c08a8e..4c60fe4 100644
--- a/testcases/kernel/syscalls/llseek/llseek03.c
+++ b/testcases/kernel/syscalls/llseek/llseek03.c
@@ -1,104 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2014 Fujitsu Ltd.
  * Author: Xiaoguang Wang <wangxg.fnst@cn.fujitsu.com>
- *
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
  */
-
 /*
  * Description:
  * Verify that,
- *    1. llseek() succeeds to set the file pointer position to the current
+ *    1. llseek() succeeds to set the file pointer position to the first of
+ *  the file when 'whence' value is set to SEEK_SET and the data read form
+ *  the SEEK_SET should match the expexted data.
+ *    2. llseek() succeeds to set the file pointer position to the current
  *  specified location, when 'whence' value is set to SEEK_CUR and the data
  *  read from the specified location should match the expected data.
- *    2. llseek() succeeds to set the file pointer position to the end of
+ *    3. llseek() succeeds to set the file pointer position to the end of
  *  the file when 'whence' value set to SEEK_END and any attempts to read
  *  from that position should return 0.
- *
  */
-
 #define _GNU_SOURCE
 
-#include <unistd.h>
-#include <errno.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <utime.h>
-#include <string.h>
-#include <signal.h>
-#include <sys/resource.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 #include <inttypes.h>
+#include <stdio.h>
 
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 
 #define TEST_FILE "testfile"
+#define STR "abcdefgh"
 
-static void setup(void);
-static void cleanup(void);
-
+static void testfunc_seekset(void);
 static void testfunc_seekcur(void);
 static void testfunc_seekend(void);
 
-static void (*testfunc[])(void) = { testfunc_seekcur, testfunc_seekend };
-
-char *TCID = "llseek03";
-int TST_TOTAL = 2;
+static void (*testfunc[])(void) = {testfunc_seekset, testfunc_seekcur, testfunc_seekend};
 
 static size_t file_size;
 
-int main(int ac, char **av)
+static void verify_llseek(unsigned int n)
 {
-	int i, lc;
+	(*testfunc[n])();
+}
 
-	tst_parse_opts(ac, av, NULL, NULL);
+static void setup(void)
+{
+	int fd;
+	struct stat stat_buf;
 
-	setup();
+	fd = SAFE_CREAT(TEST_FILE, 0644);
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
+	SAFE_WRITE(1, fd, STR, sizeof(STR) - 1);
 
-		for (i = 0; i < TST_TOTAL; i++)
-			(*testfunc[i])();
-	}
+	SAFE_FSTAT(fd, &stat_buf);
+
+	SAFE_CLOSE(fd);
 
-	cleanup();
-	tst_exit();
+	file_size = stat_buf.st_size;
 }
 
-static void setup(void)
+static void testfunc_seekset(void)
 {
 	int fd;
-	struct stat stat_buf;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_tmpdir();
+	static char read_buf[BUFSIZ];
 
-	TEST_PAUSE;
+	fd = SAFE_OPEN(TEST_FILE,O_RDONLY);
 
-	fd = SAFE_CREAT(cleanup, TEST_FILE, 0644);
+	SAFE_READ(1, fd, read_buf, 4);
+	
+	TEST(lseek64(fd, 1, SEEK_SET));
+	
+	if (TST_RET == -1) {
+                tst_res(TFAIL | TTERRNO, "llseek failed on %s ", TEST_FILE);
+                goto cleanup_seekcur;
+        }
 
-	#define STR "abcdefgh"
-	SAFE_WRITE(cleanup, 1, fd, STR, sizeof(STR) - 1);
+        if (TST_RET != 1) {
+                tst_res(TFAIL, "llseek return a incorrect file offset");
+                goto cleanup_seekcur;
+        }
+        memset(read_buf, 0, sizeof(read_buf));
 
-	SAFE_FSTAT(cleanup, fd, &stat_buf);
+        SAFE_READ(0, fd, read_buf, 3);
 
-	SAFE_CLOSE(cleanup, fd);
+        if (strcmp(read_buf, "bcd"))
+                tst_res(TFAIL, "Read wrong bytes after llseek");
+        else
+                tst_res(TPASS, "test SEEK_SET for llseek success");
 
-	file_size = stat_buf.st_size;
+cleanup_seekcur:
+        SAFE_CLOSE(fd);
 }
 
 static void testfunc_seekcur(void)
@@ -106,73 +93,71 @@ static void testfunc_seekcur(void)
 	int fd;
 	static char read_buf[BUFSIZ];
 
-	/* reopen TEST_FILE and file offset will be 0 */
-	fd = SAFE_OPEN(cleanup, TEST_FILE, O_RDONLY);
+	fd = SAFE_OPEN(TEST_FILE, O_RDONLY);
 
-	/* after read, file offset will be 4 */
-	SAFE_READ(cleanup, 1, fd, read_buf, 4);
+	SAFE_READ(1, fd, read_buf, 4);
 
 	TEST(lseek64(fd, (loff_t) 1, SEEK_CUR));
 
-	if (TEST_RETURN == (loff_t) -1) {
-		tst_resm(TFAIL | TTERRNO, "llseek failed on %s ", TEST_FILE);
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "llseek failed on %s ", TEST_FILE);
 		goto cleanup_seekcur;
 	}
 
-	if (TEST_RETURN != 5) {
-		tst_resm(TFAIL, "llseek return a incorrect file offset");
+	if (TST_RET != 5) {
+		tst_res(TFAIL, "llseek return a incorrect file offset");
 		goto cleanup_seekcur;
 	}
 
 	memset(read_buf, 0, sizeof(read_buf));
 
-	/* the expected characters are "fgh" */
-	SAFE_READ(cleanup, 1, fd, read_buf, 3);
+	SAFE_READ(1, fd, read_buf, 3);
 
 	if (strcmp(read_buf, "fgh"))
-		tst_resm(TFAIL, "Read wrong bytes after llseek");
+		tst_res(TFAIL, "Read wrong bytes after llseek");
 	else
-		tst_resm(TPASS, "test SEEK_SET for llseek success");
+		tst_res(TPASS, "test SEEK_CUR for llseek success");
 
 cleanup_seekcur:
-	SAFE_CLOSE(cleanup, fd);
+	SAFE_CLOSE(fd);
 }
 
-
 static void testfunc_seekend(void)
 {
 	int fd;
 	ssize_t nread;
 	static char read_buf[BUFSIZ];
 
-	/* reopen TEST_FILE and file offset will be 0 */
-	fd = SAFE_OPEN(cleanup, TEST_FILE, O_RDONLY);
+	fd = SAFE_OPEN(TEST_FILE, O_RDONLY);
 
 	TEST(lseek64(fd, (loff_t) 0, SEEK_END));
 
-	if (TEST_RETURN == (loff_t) -1) {
-		tst_resm(TFAIL | TTERRNO, "llseek failed on %s ", TEST_FILE);
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "llseek failed on %s ", TEST_FILE);
 		goto cleanup_seekend;
 	}
 
-	if (TEST_RETURN != (long)file_size) {
-		tst_resm(TFAIL, "llseek return a incorrect file offset");
+	if (TST_RET != (long)file_size) {
+		tst_res(TFAIL, "llseek return a incorrect file offset");
 		goto cleanup_seekend;
 	}
 
 	memset(read_buf, 0, sizeof(read_buf));
 
-	nread = SAFE_READ(cleanup, 0, fd, read_buf, file_size);
+	nread = SAFE_READ(0, fd, read_buf, file_size);
 	if (nread > 0)
-		tst_resm(TFAIL, "Read bytes after llseek to end of file");
+		tst_res(TFAIL, "Read bytes after llseek to end of file");
 	else
-		tst_resm(TPASS, "test SEEK_END for llseek success");
+		tst_res(TPASS, "test SEEK_END for llseek success");
 
 cleanup_seekend:
-	SAFE_CLOSE(cleanup, fd);
+	SAFE_CLOSE(fd);
 }
 
-static void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.test = verify_llseek,
+	.tcnt = ARRAY_SIZE(testfunc),
+};
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
