Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE16B64D547
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Dec 2022 03:19:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92B473CBD77
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Dec 2022 03:19:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 810593C8B38
 for <ltp@lists.linux.it>; Thu, 15 Dec 2022 03:19:10 +0100 (CET)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 332B01A0098D
 for <ltp@lists.linux.it>; Thu, 15 Dec 2022 03:19:09 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id t17so8942859pjo.3
 for <ltp@lists.linux.it>; Wed, 14 Dec 2022 18:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6/zCHbBL/Os05jAEAo2iiCnhIx8T+Tdt/krKzFxjoJU=;
 b=Xb3gq0WhszBxZtyM8qVyZZYfYPDm7thBFj9kfWyxDcNZ1V3yyn5JPhVUv/1iJOOi6/
 fpIf/mTo3c7qU3zFfRM7ryd1UcoLX/XPEMsvhhat1NfbdA1D6h3t8FMTve4VeWmqj2vr
 1JE4NEJ9El64/aQtADuiaXxtbEAp8wiMat4l3C+YIF4lc+9WJhWSF/O3I+nISoZQz53C
 SxDtc4LWyny8D/uXh+cgX+k/F/NztsolWriKnf/BlO+JEXEmxXyVp7/inYyFT+NuuQ5P
 GikIaPmjar9rU6pNvYwq2GN9aad8KUdq9O02BqZ/zjoWfODHhZc/6vQegrZfc+WfiRGi
 VZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6/zCHbBL/Os05jAEAo2iiCnhIx8T+Tdt/krKzFxjoJU=;
 b=zANfptototAikw5OxwClX2+1UIr+2GqStvI/I2A2mfYca1kOr39qGXnHjxBLs4Llul
 yaF35eA9vrSTPiCPQCk2kug9OmCCkGd02UTzSx742WKERKMeGZPtTc1NpemsQ4y0QwrC
 6KicL46b5QinbWWhFjHTkIStFv2oLByD1w2qwETCXsWds3OLo7x64HkITCRSEYrQ6CGx
 QzS8p8e4tZY77qNIcjipVM5MQ5P141CDROiOxuxNnjVHMa695e6seiIWPfhQSelmwT/I
 pUxMDWWCkQjo01idQNfB3J48Gog7Jf4Xq4iWukno4DUr/rDqIG98OwwjAzgQhAT5TfYV
 6D8g==
X-Gm-Message-State: ANoB5pkSIJ2hOs7h2AfPhuxwC6/Bow0gtI3S8/Cy7MajtoyH6t0rwVUl
 Bsu0Xpu0jgX5jCjJPWEajkU/Zc0BJBc=
X-Google-Smtp-Source: AA0mqf56sPbnYetiOFC/c9XSS051kFhdYxeZMj08hUwe3sQHtvBGHWoM7cxkWwX1BSN6hos5aQp9Dw==
X-Received: by 2002:a17:902:7001:b0:189:a208:d130 with SMTP id
 y1-20020a170902700100b00189a208d130mr27002234plk.31.1671070747104; 
 Wed, 14 Dec 2022 18:19:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a170903120700b0017f73dc1549sm2479084plh.263.2022.12.14.18.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 18:19:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 14 Dec 2022 18:19:03 -0800
Message-Id: <20221215021903.2230206-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] testcases: Fix largefile support
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
Cc: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Use standard functions ( not 64-bit equivalents ) which operate on off_t
and pass -D_FILE_OFFSET_BITS=64 to enable LFS always so off_t is 64bit
for these tests.

This helps making it portable across musl which has removed the 64bit
transition functions from _GNU_SOURCE namespace.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 testcases/kernel/io/direct_io/Makefile             |  2 +-
 testcases/kernel/io/direct_io/diotest2.c           |  4 ++--
 testcases/kernel/io/direct_io/diotest5.c           | 10 +++++-----
 testcases/kernel/io/direct_io/diotest6.c           |  4 ++--
 testcases/kernel/syscalls/fcntl/fcntl18.c          |  6 +++---
 testcases/kernel/syscalls/fcntl/fcntl34.c          |  2 +-
 testcases/kernel/syscalls/fcntl/fcntl36.c          |  4 ++--
 testcases/kernel/syscalls/llseek/Makefile          |  2 ++
 testcases/kernel/syscalls/llseek/llseek01.c        | 14 +++++++-------
 testcases/kernel/syscalls/llseek/llseek02.c        | 12 ++++++------
 testcases/kernel/syscalls/llseek/llseek03.c        |  6 +++---
 testcases/kernel/syscalls/open/Makefile            |  2 ++
 testcases/kernel/syscalls/open/open12.c            |  6 +++---
 testcases/kernel/syscalls/openat/Makefile          |  2 ++
 testcases/kernel/syscalls/openat/openat02.c        |  6 +++---
 testcases/kernel/syscalls/sync_file_range/Makefile |  2 ++
 .../syscalls/sync_file_range/sync_file_range01.c   |  4 ++--
 .../syscalls/sync_file_range/sync_file_range02.c   |  6 +++---
 18 files changed, 51 insertions(+), 43 deletions(-)

diff --git a/testcases/kernel/io/direct_io/Makefile b/testcases/kernel/io/direct_io/Makefile
index 777f7b166..7480d7b0d 100644
--- a/testcases/kernel/io/direct_io/Makefile
+++ b/testcases/kernel/io/direct_io/Makefile
@@ -5,7 +5,7 @@ top_srcdir			?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-CFLAGS				+= -DSHARED_OFILE -D_GNU_SOURCE
+CFLAGS				+= -DSHARED_OFILE -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
 
 LDLIBS				+= -lpthread
 
diff --git a/testcases/kernel/io/direct_io/diotest2.c b/testcases/kernel/io/direct_io/diotest2.c
index c407c46ae..db47ee8ef 100644
--- a/testcases/kernel/io/direct_io/diotest2.c
+++ b/testcases/kernel/io/direct_io/diotest2.c
@@ -78,7 +78,7 @@ int bufsize = BUFSIZE;
  *	For each iteration, write data starting at offse+iter*bufsize
  *	location in the file and read from there.
 */
-int runtest(int fd_r, int fd_w, int iter, off64_t offset, int action)
+int runtest(int fd_r, int fd_w, int iter, off_t offset, int action)
 {
 	char *buf1;
 	char *buf2;
@@ -136,7 +136,7 @@ static void cleanup(void);
 int main(int argc, char *argv[])
 {
 	int iter = 100;		/* Iterations. Default 100 */
-	off64_t offset = 0;	/* Offset. Default 0 */
+	off_t offset = 0;	/* Offset. Default 0 */
 	int i, action, fd_r, fd_w;
 	int fail_count = 0, total = 0, failed = 0;
 
diff --git a/testcases/kernel/io/direct_io/diotest5.c b/testcases/kernel/io/direct_io/diotest5.c
index 9bf917c64..ac66f2a04 100644
--- a/testcases/kernel/io/direct_io/diotest5.c
+++ b/testcases/kernel/io/direct_io/diotest5.c
@@ -75,14 +75,14 @@ int TST_TOTAL = 3;		/* Total number of test conditions */
 static int bufsize = BUFSIZE;	/* Buffer size. Default 4k */
 static int iter = 20;		/* Iterations. Default 20 */
 static int nvector = 20;	/* Vector array. Default 20 */
-static off64_t offset = 0;	/* Start offset. Default 0 */
+static off_t offset = 0;	/* Start offset. Default 0 */
 static char filename[LEN];	/* Test data file */
 static int fd1 = -1;
 /*
  * runtest: Write the data in vector array to the file. Read the data
  *	from the file into another vectory array and verify. Repeat the test.
 */
-int runtest(int fd_r, int fd_w, int iter, off64_t offset, int action)
+int runtest(int fd_r, int fd_w, int iter, off_t offset, int action)
 {
 	int i;
 	struct iovec *iov1, *iov2, *iovp;
@@ -218,7 +218,7 @@ int main(int argc, char *argv[])
 		tst_brkm(TBROK, cleanup, "fd_w open failed for %s: %s",
 			 filename, strerror(errno));
 	}
-	if ((fd_r = open64(filename, O_DIRECT | O_RDONLY | O_CREAT, 0666)) < 0) {
+	if ((fd_r = open(filename, O_DIRECT | O_RDONLY | O_CREAT, 0666)) < 0) {
 		tst_brkm(TBROK, cleanup, "fd_r open failed for %s: %s",
 			 filename, strerror(errno));
 	}
@@ -240,7 +240,7 @@ int main(int argc, char *argv[])
 		tst_brkm(TBROK, cleanup, "fd_w open failed for %s: %s",
 			 filename, strerror(errno));
 	}
-	if ((fd_r = open64(filename, O_RDONLY | O_CREAT, 0666)) < 0) {
+	if ((fd_r = open(filename, O_RDONLY | O_CREAT, 0666)) < 0) {
 		tst_brkm(TBROK, cleanup, "fd_r open failed for %s: %s",
 			 filename, strerror(errno));
 	}
@@ -261,7 +261,7 @@ int main(int argc, char *argv[])
 		tst_brkm(TBROK, cleanup, "fd_w open failed for %s: %s",
 			 filename, strerror(errno));
 	}
-	if ((fd_r = open64(filename, O_DIRECT | O_RDONLY | O_CREAT, 0666)) < 0) {
+	if ((fd_r = open(filename, O_DIRECT | O_RDONLY | O_CREAT, 0666)) < 0) {
 		tst_brkm(TBROK, cleanup, "fd_r open failed for %s: %s",
 			 filename, strerror(errno));
 	}
diff --git a/testcases/kernel/io/direct_io/diotest6.c b/testcases/kernel/io/direct_io/diotest6.c
index a06e6b82b..1905380f0 100644
--- a/testcases/kernel/io/direct_io/diotest6.c
+++ b/testcases/kernel/io/direct_io/diotest6.c
@@ -62,7 +62,7 @@ int TST_TOTAL = 3;
 
 static int iter = 100;
 static int bufsize = BUFSIZE;
-static off64_t offset = 0;
+static off_t offset = 0;
 static int nvector = 20;
 static char filename[LEN];
 static int fd1 = -1;
@@ -84,7 +84,7 @@ static void prg_usage(void)
 */
 int runtest(int fd_r, int fd_w, int childnum, int action)
 {
-	off64_t seekoff;
+	off_t seekoff;
 	int i, ret = -1;
 	ssize_t n = 0;
 	struct iovec *iov_r, *iov_w;
diff --git a/testcases/kernel/syscalls/fcntl/fcntl18.c b/testcases/kernel/syscalls/fcntl/fcntl18.c
index 5eefbd128..1105dd393 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl18.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl18.c
@@ -103,11 +103,11 @@ int main(int ac, char **av)
 	tst_resm(TINFO, "Enter block 2");
 	fail = 0;
 	/* Error condition if address is bad */
-	retval = fcntl(fd, F_GETLK64, (struct flock *)INVAL_FLAG);
+	retval = fcntl(fd, F_GETLK, (struct flock *)INVAL_FLAG);
 	if (errno == EFAULT) {
-		tst_resm(TPASS, "Test F_GETLK64: for errno EFAULT PASSED");
+		tst_resm(TPASS, "Test F_GETLK: for errno EFAULT PASSED");
 	} else {
-		tst_resm(TFAIL, "Test F_GETLK64: for errno EFAULT FAILED");
+		tst_resm(TFAIL, "Test F_GETLK: for errno EFAULT FAILED");
 		fail = 1;
 	}
 	if (fail) {
diff --git a/testcases/kernel/syscalls/fcntl/fcntl34.c b/testcases/kernel/syscalls/fcntl/fcntl34.c
index 3442114ff..536dead29 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl34.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl34.c
@@ -54,7 +54,7 @@ void *thread_fn_01(void *arg)
 
 	memset(buf, (intptr_t)arg, write_size);
 
-	struct flock64 lck = {
+	struct flock lck = {
 		.l_whence = SEEK_SET,
 		.l_start  = 0,
 		.l_len    = 1,
diff --git a/testcases/kernel/syscalls/fcntl/fcntl36.c b/testcases/kernel/syscalls/fcntl/fcntl36.c
index d6b07fc41..4e4d48afc 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl36.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl36.c
@@ -72,7 +72,7 @@ static void *fn_ofd_w(void *arg)
 	int fd = SAFE_OPEN(fname, O_RDWR);
 	long wt = pa->cnt;
 
-	struct flock64 lck = {
+	struct flock lck = {
 		.l_whence = SEEK_SET,
 		.l_start  = pa->offset,
 		.l_len    = pa->length,
@@ -151,7 +151,7 @@ static void *fn_ofd_r(void *arg)
 	int i;
 	int fd = SAFE_OPEN(fname, O_RDWR);
 
-	struct flock64 lck = {
+	struct flock lck = {
 		.l_whence = SEEK_SET,
 		.l_start  = pa->offset,
 		.l_len    = pa->length,
diff --git a/testcases/kernel/syscalls/llseek/Makefile b/testcases/kernel/syscalls/llseek/Makefile
index 044619fb8..8a916d0fa 100644
--- a/testcases/kernel/syscalls/llseek/Makefile
+++ b/testcases/kernel/syscalls/llseek/Makefile
@@ -6,3 +6,5 @@ top_srcdir		?= ../../../..
 include $(top_srcdir)/include/mk/testcases.mk
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+CFLAGS += -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
diff --git a/testcases/kernel/syscalls/llseek/llseek01.c b/testcases/kernel/syscalls/llseek/llseek01.c
index 50f35493d..efb444dc8 100644
--- a/testcases/kernel/syscalls/llseek/llseek01.c
+++ b/testcases/kernel/syscalls/llseek/llseek01.c
@@ -4,7 +4,7 @@
  *   07/2001 Ported by Wayne Boyer
  */
 /*
- * Verify that lseek64() call succeeds to set the file pointer position to an
+ * Verify that lseek() call succeeds to set the file pointer position to an
  * offset larger than file size limit (RLIMIT_FSIZE). Also, verify that any
  * attempt to write to this location fails.
  */
@@ -27,22 +27,22 @@ static int fildes;
 
 static void verify_llseek(void)
 {
-	TEST(lseek64(fildes, (loff_t) (80 * BUFSIZ), SEEK_SET));
+	TEST(lseek(fildes, (loff_t) (80 * BUFSIZ), SEEK_SET));
 	if (TST_RET == (80 * BUFSIZ))
-		tst_res(TPASS, "lseek64() can set file pointer position larger than file size limit");
+		tst_res(TPASS, "lseek() can set file pointer position larger than file size limit");
 	else
-		tst_res(TFAIL, "lseek64() returned wrong value %ld when write past file size", TST_RET);
+		tst_res(TFAIL, "lseek() returned wrong value %ld when write past file size", TST_RET);
 
 	if (write(fildes, write_buff, BUFSIZ) == -1)
 		tst_res(TPASS,"write failed after file size limit");
 	else
 		tst_brk(TFAIL, "write successful after file size limit");
 
-	TEST(lseek64(fildes, (loff_t) BUFSIZ, SEEK_SET));
+	TEST(lseek(fildes, (loff_t) BUFSIZ, SEEK_SET));
 	if (TST_RET == BUFSIZ)
-		tst_res(TPASS,"lseek64() can set file pointer position under filer size limit");
+		tst_res(TPASS,"lseek() can set file pointer position under filer size limit");
 	else
-		tst_brk(TFAIL,"lseek64() returns wrong value %ld when write under file size", TST_RET);
+		tst_brk(TFAIL,"lseek() returns wrong value %ld when write under file size", TST_RET);
 
 	if (write(fildes, write_buff, BUFSIZ) != -1)
 		tst_res(TPASS, "write succcessfully under file size limit");
diff --git a/testcases/kernel/syscalls/llseek/llseek02.c b/testcases/kernel/syscalls/llseek/llseek02.c
index 3d9c21fc9..5431969f9 100644
--- a/testcases/kernel/syscalls/llseek/llseek02.c
+++ b/testcases/kernel/syscalls/llseek/llseek02.c
@@ -5,8 +5,8 @@
  */
 /*
  * Description:
- * 1) lseek64(2) fails and sets errno to EINVAL when whence is invalid.
- * 2) lseek64(2) fails ans sets errno to EBADF when fd is not an open
+ * 1) lseek(2) fails and sets errno to EINVAL when whence is invalid.
+ * 2) lseek(2) fails ans sets errno to EBADF when fd is not an open
  * file descriptor.
  */
 
@@ -39,17 +39,17 @@ static void verify_llseek(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 
-	TEST(lseek64(*tc->fd, (loff_t) 1, tc->whence));
+	TEST(lseek(*tc->fd, (loff_t) 1, tc->whence));
 	if (TST_RET != (off_t) -1) {
-		tst_res(TFAIL, "lseek64(%d, 1, %d) succeeded unexpectedly (%ld)",
+		tst_res(TFAIL, "lseek(%d, 1, %d) succeeded unexpectedly (%ld)",
 			*tc->fd, tc->whence, TST_RET);
 		return;
 	}
 	if (TST_ERR == tc->exp_err) {
-		tst_res(TPASS | TTERRNO, "lseek64(%d, 1, %d) failed as expected",
+		tst_res(TPASS | TTERRNO, "lseek(%d, 1, %d) failed as expected",
 			*tc->fd, tc->whence);
 	} else {
-		tst_res(TFAIL | TTERRNO, "lseek64(%d, 1, %d) failed "
+		tst_res(TFAIL | TTERRNO, "lseek(%d, 1, %d) failed "
 		        "unexpectedly, expected %s", *tc->fd, tc->whence,
 		        tst_strerrno(tc->exp_err));
 	}
diff --git a/testcases/kernel/syscalls/llseek/llseek03.c b/testcases/kernel/syscalls/llseek/llseek03.c
index d780f2af6..6c34119e5 100644
--- a/testcases/kernel/syscalls/llseek/llseek03.c
+++ b/testcases/kernel/syscalls/llseek/llseek03.c
@@ -72,7 +72,7 @@ static const char *str_whence(int whence)
 	}
 }
 
-static void verify_lseek64(unsigned int n)
+static void verify_lseek(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 	char read_buf[128];
@@ -82,7 +82,7 @@ static void verify_lseek64(unsigned int n)
 
 	SAFE_READ(1, fd, read_buf, 4);
 
-	TEST(lseek64(fd, tc->off, tc->whence));
+	TEST(lseek(fd, tc->off, tc->whence));
 
 	if (TST_RET == -1) {
                 tst_res(TFAIL | TTERRNO, "llseek failed on %s ", TEST_FILE);
@@ -121,6 +121,6 @@ exit:
 static struct tst_test test = {
 	.needs_tmpdir = 1,
 	.setup = setup,
-	.test = verify_lseek64,
+	.test = verify_lseek,
 	.tcnt = ARRAY_SIZE(tcases),
 };
diff --git a/testcases/kernel/syscalls/open/Makefile b/testcases/kernel/syscalls/open/Makefile
index 044619fb8..8a916d0fa 100644
--- a/testcases/kernel/syscalls/open/Makefile
+++ b/testcases/kernel/syscalls/open/Makefile
@@ -6,3 +6,5 @@ top_srcdir		?= ../../../..
 include $(top_srcdir)/include/mk/testcases.mk
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+CFLAGS += -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
diff --git a/testcases/kernel/syscalls/open/open12.c b/testcases/kernel/syscalls/open/open12.c
index bdf29a9a8..c840de53d 100644
--- a/testcases/kernel/syscalls/open/open12.c
+++ b/testcases/kernel/syscalls/open/open12.c
@@ -233,14 +233,14 @@ static void test_cloexec(void)
 static void test_largefile(void)
 {
 	int fd;
-	off64_t offset;
+	off_t offset;
 
 	fd = SAFE_OPEN(cleanup, LARGE_FILE,
 				O_LARGEFILE | O_RDWR | O_CREAT, 0777);
 
-	offset = lseek64(fd, 4.1*1024*1024*1024, SEEK_SET);
+	offset = lseek(fd, 4.1*1024*1024*1024, SEEK_SET);
 	if (offset == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "lseek64 failed");
+		tst_brkm(TBROK | TERRNO, cleanup, "lseek failed");
 
 	SAFE_WRITE(cleanup, 1, fd, LARGE_FILE, sizeof(LARGE_FILE));
 
diff --git a/testcases/kernel/syscalls/openat/Makefile b/testcases/kernel/syscalls/openat/Makefile
index 044619fb8..8a916d0fa 100644
--- a/testcases/kernel/syscalls/openat/Makefile
+++ b/testcases/kernel/syscalls/openat/Makefile
@@ -6,3 +6,5 @@ top_srcdir		?= ../../../..
 include $(top_srcdir)/include/mk/testcases.mk
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+CFLAGS += -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
diff --git a/testcases/kernel/syscalls/openat/openat02.c b/testcases/kernel/syscalls/openat/openat02.c
index 2ce119033..f6113852a 100644
--- a/testcases/kernel/syscalls/openat/openat02.c
+++ b/testcases/kernel/syscalls/openat/openat02.c
@@ -22,7 +22,7 @@
  *   2)openat() succeeds to enable the close-on-exec flag for a
  *     file descriptor, when 'flags' is set to O_CLOEXEC.
  *   3)openat() succeeds to allow files whose sizes cannot be
- *     represented in an off_t but can be represented in an off64_t
+ *     represented in an off_t but can be represented in an off_t
  *     to be opened, when 'flags' is set to O_LARGEFILE.
  *   4)openat() succeeds to not update the file last access time
  *     (st_atime in the inode) when the file is read, when 'flags'
@@ -193,12 +193,12 @@ void testfunc_cloexec(void)
 void testfunc_largefile(void)
 {
 	int fd;
-	off64_t offset;
+	off_t offset;
 
 	fd = SAFE_OPEN(cleanup, LARGE_FILE,
 				O_LARGEFILE | O_RDWR | O_CREAT, 0777);
 
-	offset = lseek64(fd, 4.1*1024*1024*1024, SEEK_SET);
+	offset = lseek(fd, 4.1*1024*1024*1024, SEEK_SET);
 	if (offset == -1)
 		tst_brkm(TBROK | TERRNO, cleanup, "lseek64 failed");
 
diff --git a/testcases/kernel/syscalls/sync_file_range/Makefile b/testcases/kernel/syscalls/sync_file_range/Makefile
index 044619fb8..8a916d0fa 100644
--- a/testcases/kernel/syscalls/sync_file_range/Makefile
+++ b/testcases/kernel/syscalls/sync_file_range/Makefile
@@ -6,3 +6,5 @@ top_srcdir		?= ../../../..
 include $(top_srcdir)/include/mk/testcases.mk
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+CFLAGS += -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range01.c b/testcases/kernel/syscalls/sync_file_range/sync_file_range01.c
index 187ef6071..47188aa48 100644
--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range01.c
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range01.c
@@ -44,8 +44,8 @@ static int bfd = -1;
 
 struct test_case {
 	int *fd;
-	off64_t offset;
-	off64_t nbytes;
+	off_t offset;
+	off_t nbytes;
 	unsigned int flags;
 	int error;
 } tcases[] = {
diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
index 5da751c70..28a8156c8 100644
--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
@@ -31,10 +31,10 @@
 
 struct testcase {
 	char *fname;
-	off64_t sync_off;
-	off64_t sync_size;
+	off_t sync_off;
+	off_t sync_size;
 	size_t exp_sync_size;
-	off64_t write_off;
+	off_t write_off;
 	size_t write_size_mb;
 	const char *desc;
 };
-- 
2.39.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
