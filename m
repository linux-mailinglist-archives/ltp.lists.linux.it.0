Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5220CB4BCF
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 12:17:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D4A53C20FE
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 12:17:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9A4B93C2084
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 12:17:41 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7860F140174B
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 12:17:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B9B02AF4E;
 Tue, 17 Sep 2019 10:17:39 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 17 Sep 2019 12:17:06 +0200
Message-Id: <20190917101706.10013-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190917101706.10013-1-mdoucha@suse.cz>
References: <20190917101706.10013-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] Improve coverage in syscalls/fsync03
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
Cc: Martin Doucha <mdoucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Adds the following test cases where fsync is supposed to fail:
- Closed non-negative file descriptor (EBADF)
- FIFO (EINVAL)
- Socket (EINVAL)

Signed-off-by: Martin Doucha <mdoucha@suse.com>
---
 testcases/kernel/syscalls/fsync/fsync03.c | 83 ++++++++++++++++++-----
 1 file changed, 65 insertions(+), 18 deletions(-)

diff --git a/testcases/kernel/syscalls/fsync/fsync03.c b/testcases/kernel/syscalls/fsync/fsync03.c
index 82fd52070..d574b07d7 100644
--- a/testcases/kernel/syscalls/fsync/fsync03.c
+++ b/testcases/kernel/syscalls/fsync/fsync03.c
@@ -7,31 +7,75 @@
 /*
  * Test Description:
  *  Testcase to check that fsync(2) sets errno correctly.
- *  1. Call fsync() with an invalid fd, and test for EBADF.
- *  2. Call fsync() on a pipe(fd), and expect EINVAL.
+ *  1. Call fsync() on a pipe(fd), and expect EINVAL.
+ *  2. Call fsync() on a socket(fd), and expect EINVAL.
+ *  3. Call fsync() on a closed fd, and test for EBADF.
+ *  4. Call fsync() on an invalid fd, and test for EBADF.
+ *  5. Call fsync() on a fifo(fd), and expect EINVAL.
  */
 
 #include <unistd.h>
 #include <errno.h>
 #include "tst_test.h"
 
-static int pfd[2];		/* fd's for the pipe() call in setup()  */
-static int bfd = -1;		/* an invalid fd                        */
+#define FIFO_PATH "fifo"
+
+#define PIPE_CASE 0
+#define SOCKET_CASE 1
+#define CLOSED_CASE 2
+
+/* fd's for the pipe() call in setup()  */
+static int pfd[2];
+/* FIFO must be opened for reading first, otherwise open(fifo, O_WRONLY)
+   will block. */
+static int fifo_rfd;
 
 struct test_case {
-	int *fd;
+	int fd;
 	int error;
-} TC[] = {
-	/* EBADF - fd is invalid (-1) */
-	{&bfd, EBADF},
+	const char *path;
+} testcase_list[] = {
 	/* EINVAL - fsync() on pipe should not succeed. */
-	{pfd, EINVAL}
+	{-1, EINVAL, NULL},
+	/* EINVAL - fsync() on socket should not succeed. */
+	{-1, EINVAL, NULL},
+	/* EBADF - fd is closed */
+	{-1, EBADF, NULL},
+	/* EBADF - fd is invalid (-1) */
+	{-1, EBADF, NULL},
+	/* EINVAL - fsync() on fifo should not succeed. */
+	{-1, EINVAL, FIFO_PATH},
 };
 
+static void setup(void) {
+	SAFE_MKFIFO(FIFO_PATH, 0644);
+	SAFE_PIPE(pfd);
+
+	testcase_list[CLOSED_CASE].fd = pfd[0];
+	testcase_list[PIPE_CASE].fd = pfd[1];
+	fifo_rfd = SAFE_OPEN(FIFO_PATH, O_RDONLY | O_NONBLOCK);
+	testcase_list[SOCKET_CASE].fd = SAFE_SOCKET(AF_UNIX, SOCK_STREAM, 0);
+
+	// Do not open any file descriptors after this line unless you close
+	// them before the next test run.
+	SAFE_CLOSE(testcase_list[CLOSED_CASE].fd);
+}
+
 static void test_fsync(unsigned int n) {
-	struct test_case *tc = TC + n;
+	struct test_case *tc = testcase_list + n;
+	int fd = tc->fd, result;
 
-	if (!fsync(*tc->fd)) {
+	if (tc->path) {
+		fd = SAFE_OPEN(tc->path, O_WRONLY);
+	}
+
+	result = fsync(fd);
+
+	if (tc->path) {
+		close(fd);
+	}
+
+	if (!result) {
 		tst_res(TFAIL, "fsync() succeeded unexpectedly");
 	} else if (errno != tc->error) {
 		tst_res(TFAIL | TERRNO, "Unexpected error");
@@ -40,18 +84,21 @@ static void test_fsync(unsigned int n) {
 	}
 }
 
-static void setup(void) {
-	SAFE_PIPE(pfd);
-}
-
 static void cleanup(void) {
-	close(pfd[0]);
-	close(pfd[1]);
+	// close fifo_rfd instead of the already closed test FD
+	testcase_list[CLOSED_CASE].fd = fifo_rfd;
+
+	for (int i = 0; i < ARRAY_SIZE(testcase_list); i++) {
+		if (testcase_list[i].fd >= 0) {
+			close(testcase_list[i].fd);
+		}
+	}
 }
 
 static struct tst_test test = {
 	.test = test_fsync,
-	.tcnt = ARRAY_SIZE(TC),
+	.tcnt = ARRAY_SIZE(testcase_list),
+	.needs_tmpdir = 1,
 	.setup = setup,
 	.cleanup = cleanup
 };
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
