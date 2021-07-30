Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C8B3DB2F6
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 07:48:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CA803C620C
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 07:48:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A536D3C5884
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 07:48:34 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 817C91000451
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 07:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1627624107; i=@fujitsu.com;
 bh=gFMgSiaX880HuYI3nhTY5ACXQX7vKG9dCMf+zWZQjiE=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=YQZ2afTsBjN8A9NzerOjk7+l+0Pm437rgt1l/ohs4t2Sow53IgAAvYfzm/ZKoisqE
 K0JZT2U3ZPIs3Rwbk8WzLp/TVHtR74jbIZu07tSRDmRlEK1uYdsEZbdE7WxW4c6/A3
 vcBd5TwSQDyHp+IkeUvY35GFUx2Su50RX4wS3M5ubSeYTOR4SyrU/A39HZ3/xdSD/9
 iH5Ji1BarCV+qGh/RaKwiDJGZgI9OXAW1Rj3gQgjubVeJUwy2JLYsVMY6vWPA5fGnG
 yj7KC9faedHGkgvBCeorLaHMB+XeBl5sj4SMsawhjdLLOxXK2XUT5VN/OYntNlGr5Q
 Gfaa1pXMkQkqg==
Received: from [100.112.198.115] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 0E/95-07336-BA293016;
 Fri, 30 Jul 2021 05:48:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRortqEnO
 iwdKzJhYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8bs9jPMBbeiK/68uc/UwHjQo4uRi0NIoIVJ
 4vjqp8wQzn5GiU1rX7B0MXJysAloSFx73M4MYosISEh0NLxlB7GZBdQkdl89xgZiCwuESizbv
 gWshkVAVWLygVWMIDavgJvE91s3weISAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+gahQl9u/dyA
 hhV0jMmLGNbQIj7ywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2hgoGtoaKRraGmha2RoqpdYpZu
 kl1qqW55aXKJrqJdYXqxXXJmbnJOil5dasokRGGApBceu72C8+vqD3iFGSQ4mJVHe833MiUJ8
 SfkplRmJxRnxRaU5qcWHGGU4OJQkeNkmAOUEi1LTUyvSMnOAwQ6TluDgURLhvdELlOYtLkjML
 c5Mh0idYlSUEuc9AdInAJLIKM2Da4NF2CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwBE4
 Gm8GTmlcBNfwW0mAlocW0JI8jikkSElFQDU9BD2/OyzRXzdeYwMG7wudc9945DUugP7qSu3Uu
 b+2b92NG/5NySD78mXuK0ebnsQMC9sxsWzzr25Z2Sst8UuWrzzmnfXp1c7lvvJcDRKGusGP/d
 VLzsQMqOuR826snHStkuz1KcfO5/98Hjbwsys6o5D2otDeks02GuKuE1/jBdbVtl7e7rRX85j
 tRvn6us5fZGdseby59EDvZZ3H4m6fN9zdooDfHNT4ymKFSlia6c0SbcdX9xwPOb72vvqvB/eG
 r3vqI+r9vLuKCVv5417b/ajE+bw7azWv09tfn/vwoJlTeH1HmYVE/uaWj7NWvR4uulvTPT9/6
 rjwhc8m7j/1NiaY2aO6o2fgmX7TnQOFWJpTgj0VCLuag4EQDmTwSuKwMAAA==
X-Env-Sender: daisl.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-291.messagelabs.com!1627624104!1396!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9799 invoked from network); 30 Jul 2021 05:48:26 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-17.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jul 2021 05:48:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16U5mJvW023598
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 06:48:24 +0100
Received: from rhel79.g08.fujitsu.local (10.167.225.51) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 30 Jul 2021 06:48:16 +0100
From: Dai Shili <daisl.fnst@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 30 Jul 2021 01:48:05 -0400
Message-ID: <1627624085-16182-1-git-send-email-daisl.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.51]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/readv02: Convert to new API and merge
 readv03 into readv02.
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

1) merge readv03 into readv02
2) use tst_get_bad_addr() API
3) use TST_EXP_FAIL2 macro

Signed-off-by: Dai Shili <daisl.fnst@fujitsu.com>
---
 runtest/syscalls                           |   1 -
 testcases/kernel/syscalls/readv/.gitignore |   1 -
 testcases/kernel/syscalls/readv/readv02.c  | 331 ++++++++++-------------------
 testcases/kernel/syscalls/readv/readv03.c  |  53 -----
 4 files changed, 108 insertions(+), 278 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/readv/readv03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index b379b2d..9c3b510 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1085,7 +1085,6 @@ readlinkat02 readlinkat02
 
 readv01 readv01
 readv02 readv02
-readv03 readv03
 
 realpath01 realpath01
 
diff --git a/testcases/kernel/syscalls/readv/.gitignore b/testcases/kernel/syscalls/readv/.gitignore
index c4aa61e..a532741 100644
--- a/testcases/kernel/syscalls/readv/.gitignore
+++ b/testcases/kernel/syscalls/readv/.gitignore
@@ -1,3 +1,2 @@
 /readv01
 /readv02
-/readv03
diff --git a/testcases/kernel/syscalls/readv/readv02.c b/testcases/kernel/syscalls/readv/readv02.c
index aa40e2c..aaadae0 100644
--- a/testcases/kernel/syscalls/readv/readv02.c
+++ b/testcases/kernel/syscalls/readv/readv02.c
@@ -1,198 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
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
+ * Copyright (C) Bull S.A. 2001
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 07/2001 Ported by Wayne Boyer
+ * 05/2002 Ported by Jacky Malcles
  */
 
-/*
- * NAME
- * 	readv02.c
- *
+/*\
  * DESCRIPTION
- *	Testcase to check the error conditions of the readv(2) system call.
+ *  test 1:
+ *  The sum of the iov_len values overflows an ssize_t value, expect an EINVAL.
  *
- * CALLS
- * 	readv()
+ *  test 2:
+ *  Buf is outside the accessible address space, expect an EFAULT.
  *
- * ALGORITHM
- *	Create a IO vector, and attempt to readv() various components of it.
+ *  test 3:
+ *  The vector count iovcnt is less than zero, expect an EINVAL.
  *
- * USAGE
- *	readv02
+ *  test 4:
+ *  The parameter passed to read is a directory, check if the errno is
+ *  set to EISDIR.
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- * 	None
+ *  test 5:
+ *  Read with an invalid file descriptor, and expect an EBADF.
  */
-#include <sys/types.h>
+
 #include <sys/uio.h>
 #include <fcntl.h>
-#include <sys/mman.h>
 #include <memory.h>
-#include <errno.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-#define	K_1	1024
-#define	M_1	K_1 * K_1
-#define	G_1	M_1 * K_1
-
-#define	NBUFS		4
-#define	CHUNK		64
-#define	MAX_IOVEC	16
-#define DATA_FILE	"readv_data_file"
-
-char buf1[K_1], buf2[K_1], buf3[K_1];
-
-struct iovec rd_iovec[MAX_IOVEC] = {
-	/* iov_base *//* iov_len */
+#include "tst_test.h"
+
+#define K_1     1024
+#define M_1     (K_1 * K_1)
+#define G_1     (M_1 * K_1)
+#define MODES   0700
+
+#define NBUFS           4
+#define CHUNK           64
+#define MAX_IOVEC       16
+
+static int badfd = -1;
+static int fd[4] = {-1, -1, -1, -1};
+static char buf1[K_1], buf2[K_1], buf3[K_1];
+const char *TEST_DIR = "test_dir";
+const char *TEST_FILE[3] = {"file1", "file2", "file3"};
+char *buf_list[NBUFS];
 
-	/* Test case #1 */
+static struct iovec rd_iovec[MAX_IOVEC] = {
 	{buf2, -1},
 	{(buf2 + CHUNK), CHUNK},
 	{(buf2 + CHUNK * 2), CHUNK},
-
-	/* Test case #2 */
 	{(buf2 + CHUNK * 3), G_1},
 	{(buf2 + CHUNK * 4), G_1},
 	{(buf2 + CHUNK * 5), G_1},
-
-	/* Test case #3 */
 	{(caddr_t) - 1, CHUNK},
 	{(buf2 + CHUNK * 6), CHUNK},
 	{(buf2 + CHUNK * 8), CHUNK},
-
-	/* Test case #4 */
-	{(buf2 + CHUNK * 9), CHUNK}
+	{(buf2 + CHUNK * 9), CHUNK},
+	{buf1, K_1}
 };
 
-char f_name[K_1];
-
-int fd[4];
-char *buf_list[NBUFS];
-
-char *TCID = "readv02";
-int TST_TOTAL = 1;
-
-char *bad_addr = 0;
+static struct tcase {
+	int *fd;
+	void *buf;
+	int count;
+	int exp_error;
+} tcases[] = {
+	{&fd[0], rd_iovec, 1, EINVAL},
+	{&fd[1], rd_iovec + 6, 3, EFAULT},
+	{&fd[2], rd_iovec + 10, -1, EINVAL},
+	{&fd[3], rd_iovec + 10, 1, EISDIR},
+	{&badfd, rd_iovec + 9, 3, EBADF},
+};
 
-int init_buffs(char **);
-int fill_mem(char *, int, int);
-long l_seek(int, long, int);
-char *getenv();
-void setup();
-void cleanup();
 
-int main(int ac, char **av)
+void fill_mem(char *c_ptr, int c1, int c2)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	int count;
 
-	/* The following loop checks looping state if -i option given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	for (count = 1; count <= K_1 / CHUNK; count++) {
+		if (count & 0x01) /* if odd */
+			memset(c_ptr, c1, CHUNK);
+		else /* if even */
+			memset(c_ptr, c2, CHUNK);
+	}
+	return;
+}
 
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
+void init_buffs(char *pbufs[])
+{
+	int i;
 
-//test1:
-		if (readv(fd[0], rd_iovec, 1) < 0) {
-			if (errno != EINVAL) {
-				tst_resm(TFAIL, "readv() set an illegal errno:"
-					 " expected: EINVAL, got %d", errno);
-			} else {
-				tst_resm(TPASS, "got EINVAL");
-			}
-		} else {
-			tst_resm(TFAIL, "Error: readv returned a positive "
-				 "value");
+	for (i = 0; pbufs[i] != NULL; i++) {
+		switch (i) {
+		case 0:
+		case 1:
+			fill_mem(pbufs[i], 0, 1);
+			break;
+		case 2:
+			fill_mem(pbufs[i], 1, 0);
+			break;
+		default:
+			tst_brk(TBROK, "Error in init_buffs function");
 		}
+	}
+	return;
+}
 
-//test2:
-		l_seek(fd[0], CHUNK * 6, 0);
-		if (readv(fd[0], (rd_iovec + 6), 3) < 0) {
-			if (errno != EFAULT) {
-				tst_resm(TFAIL, "expected errno = EFAULT, "
-					 "got %d", errno);
-			} else {
-				tst_resm(TPASS, "got EFAULT");
-			}
-			if (memcmp((buf_list[0] + CHUNK * 6),
-				   (buf_list[1] + CHUNK * 6), CHUNK * 3) != 0) {
-				tst_resm(TFAIL, "Error: readv() partially "
-					 "overlaid buf[2]");
-			}
-		} else {
-			tst_resm(TFAIL, "Error: readv returned a positive "
-				 "value");
-		}
+static void verify_readv(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
 
-//test3:
-		if (readv(fd[1], (rd_iovec + 9), 1) < 0) {
-			if (errno != EBADF) {
-				tst_resm(TFAIL, "expected errno = EBADF, "
-					 "got %d", errno);
-			} else {
-				tst_resm(TPASS, "got EBADF");
-			}
-		} else {
-			tst_resm(TFAIL, "Error: readv returned a positive "
-				 "value");
-		}
+	TST_EXP_FAIL2(readv(*tc->fd, tc->buf, tc->count), tc->exp_error,
+		"readv(%d, %p, %d)", *tc->fd, tc->buf, tc->count);
 
-//test4:
-		l_seek(fd[0], CHUNK * 10, 0);
-		if (readv(fd[0], (rd_iovec + 10), -1) < 0) {
-			if (errno != EINVAL) {
-				tst_resm(TFAIL, "expected errno = EINVAL, "
-					 "got %d", errno);
-			} else {
-				tst_resm(TPASS, "got EINVAL");
-			}
-		} else {
-			tst_resm(TFAIL, "Error: readv returned a positive "
-				 "value");
+	if (tc->exp_error == EFAULT) {
+		if (memcmp((buf_list[0] + CHUNK * 6),
+			(buf_list[1] + CHUNK * 6), CHUNK * 3)) {
+		    tst_res(TFAIL, "Error: readv() partially overlaid buf[2]");
 		}
-
 	}
-	close(fd[0]);
-	close(fd[1]);
-	cleanup();
-	tst_exit();
-
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
 void setup(void)
 {
-	int nbytes;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/* make a temporary directory and cd to it */
-	tst_tmpdir();
+	int i;
 
 	buf_list[0] = buf1;
 	buf_list[1] = buf2;
@@ -201,84 +133,37 @@ void setup(void)
 
 	init_buffs(buf_list);
 
-	sprintf(f_name, "%s.%d", DATA_FILE, getpid());
+	for (i = 0; i < 3; i++) {
+		fd[i] = SAFE_OPEN(TEST_FILE[i], O_WRONLY | O_CREAT, 0666);
+		SAFE_WRITE(1, fd[i], buf_list[2], K_1);
 
-	if ((fd[0] = open(f_name, O_WRONLY | O_CREAT, 0666)) < 0) {
-		tst_brkm(TBROK, cleanup, "open failed: fname = %s, "
-			 "errno = %d", f_name, errno);
-	} else {
-		if ((nbytes = write(fd[0], buf_list[2], K_1)) != K_1) {
-			tst_brkm(TBROK, cleanup, "write failed: nbytes "
-				 "= %d " "errno = %d", nbytes, errno);
-		}
-	}
+		SAFE_CLOSE(fd[i]);
 
-	SAFE_CLOSE(cleanup, fd[0]);
-
-	if ((fd[0] = open(f_name, O_RDONLY, 0666)) < 0) {
-		tst_brkm(TBROK, cleanup, "open failed: fname = %s, "
-			 "errno = %d", f_name, errno);
+		fd[i] = SAFE_OPEN(TEST_FILE[i], O_RDONLY, 0666);
 	}
+	SAFE_LSEEK(fd[1], CHUNK * 6, 0);
+	SAFE_LSEEK(fd[2], CHUNK * 10, 0);
 
-	fd[1] = -1;		/* Invalid file descriptor */
+	rd_iovec[6].iov_base = tst_get_bad_addr(NULL);
 
-	bad_addr = mmap(0, 1, PROT_NONE,
-			MAP_PRIVATE_EXCEPT_UCLINUX | MAP_ANONYMOUS, 0, 0);
-	if (bad_addr == MAP_FAILED) {
-		tst_brkm(TBROK, cleanup, "mmap failed");
-	}
-	rd_iovec[6].iov_base = bad_addr;
+	SAFE_MKDIR(TEST_DIR, MODES);
+	fd[3] = SAFE_OPEN(TEST_DIR, O_RDONLY);
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
-{
-	SAFE_UNLINK(NULL, f_name);
-	tst_rmdir();
-
-}
-
-int init_buffs(char *pbufs[])
+static void cleanup(void)
 {
 	int i;
 
-	for (i = 0; pbufs[i] != NULL; i++) {
-		switch (i) {
-		case 0:
-		 /*FALLTHROUGH*/ case 1:
-			fill_mem(pbufs[i], 0, 1);
-			break;
-
-		case 2:
-			fill_mem(pbufs[i], 1, 0);
-			break;
-
-		default:
-			tst_brkm(TBROK, cleanup, "Error in init_buffs()");
-		}
-	}
-	return 0;
-}
-
-int fill_mem(char *c_ptr, int c1, int c2)
-{
-	int count;
-
-	for (count = 1; count <= K_1 / CHUNK; count++) {
-		if (count & 0x01) {	/* if odd */
-			memset(c_ptr, c1, CHUNK);
-		} else {	/* if even */
-			memset(c_ptr, c2, CHUNK);
-		}
+	for (i = 0; i < 4; i++) {
+		if (fd[i] > 0)
+			SAFE_CLOSE(fd[i]);
 	}
-	return 0;
 }
 
-long l_seek(int fdesc, long offset, int whence)
-{
-	SAFE_LSEEK(cleanup, fdesc, offset, whence);
-	return 0;
-}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_readv,
+};
diff --git a/testcases/kernel/syscalls/readv/readv03.c b/testcases/kernel/syscalls/readv/readv03.c
deleted file mode 100644
index 8f5cddf..0000000
--- a/testcases/kernel/syscalls/readv/readv03.c
+++ /dev/null
@@ -1,53 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) Bull S.A. 2001
- * Copyright (c) International Business Machines  Corp., 2001
- * 05/2002 Ported by Jacky Malcles
- */
-
-/*\
- * [Description]
- *
- * Testcase to check EISDIR error when fd refers to a directory.
- */
-
-#include <sys/uio.h>
-#include <fcntl.h>
-#include "tst_test.h"
-
-#define K_1     1024
-#define MODES   S_IRWXU
-
-static char buf1[K_1];
-
-static struct iovec rd_iovec[1] = {
-        {buf1, K_1}
-};
-
-const char *TEST_DIR = "alpha";
-static int fd;
-
-static void verify_readv(void)
-{
-        TST_EXP_FAIL2(readv(fd, rd_iovec, 1), EISDIR,
-                     "readv() got EISDIR");
-}
-
-void setup(void)
-{
-        SAFE_MKDIR(TEST_DIR, MODES);
-        fd = SAFE_OPEN(TEST_DIR, O_RDONLY);
-}
-
-static void cleanup(void)
-{
-        if (fd > 0)
-                SAFE_CLOSE(fd);
-}
-
-static struct tst_test test = {
-        .needs_tmpdir = 1,
-        .setup = setup,
-        .cleanup = cleanup,
-        .test_all = verify_readv,
-};
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
