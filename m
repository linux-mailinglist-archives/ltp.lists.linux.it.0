Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BE63998A1
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 05:36:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3489A3C5590
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 05:36:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 29F203C7FFD
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 05:35:45 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BF215600621
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 05:35:44 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FwWgX3ZlxzZcGk
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 11:32:56 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 11:35:33 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 11:35:33 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 3 Jun 2021 11:36:10 +0800
Message-ID: <20210603033611.15619-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210603033611.15619-1-xieziyao@huawei.com>
References: <20210603033611.15619-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] syscalls/sendfile: Convert sendfile06 to the new
 API
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

1. Convert sendfile06 to the new API with file descriptors instead
of socket descriptors.
2. Remove the support for UCLINUX.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../kernel/syscalls/sendfile/sendfile06.c     | 247 ++++--------------
 1 file changed, 45 insertions(+), 202 deletions(-)

diff --git a/testcases/kernel/syscalls/sendfile/sendfile06.c b/testcases/kernel/syscalls/sendfile/sendfile06.c
index abb67604f..964a71eae 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile06.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile06.c
@@ -1,228 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2001
  * Copyright (c) Red Hat Inc., 2007
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
- * along with this program;  if not, write to the Free Software Foundation,
- * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * 11/2007 Copyed from sendfile02.c by Masatake YAMATO
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

-/*
- * DESCRIPTION
- *	Testcase to test that sendfile(2) system call updates file
- *	position of in_fd correctly when passing NULL as offset.
+/*\
+ * [Description]
  *
- * HISTORY
- *	11/2007 Copyed from sendfile02.c by Masatake YAMATO
+ * Test that sendfile() system call updates file position of in_fd correctly
+ * when passing NULL as offset.
  */

-#include <inttypes.h>
 #include <stdio.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <sys/stat.h>
+#include <inttypes.h>
 #include <sys/sendfile.h>
-#include <sys/types.h>
-#include <sys/wait.h>
-#include <sys/socket.h>
-#include <sys/mman.h>
-#include <netinet/in.h>
-#include <arpa/inet.h>
-#include <string.h>
-#include "test.h"
-#include "safe_macros.h"

-TCID_DEFINE(sendfile06);
+#include "tst_test.h"

-#define IN_FILE		"infile"
-#define OUT_FILE	"outfile"
+#define IN_FILE "in_file"
+#define OUT_FILE "out_file"

-static pid_t child_pid;
-static int sockfd;
-static struct sockaddr_in sin1;
 static struct stat sb;

-static void cleanup(void);
-static void do_child(void);
-static void setup(void);
-static int create_server(void);
-
-int TST_TOTAL = 1;
-
-#ifdef UCLINUX
-static char *argv0;
-#endif
-
-static void do_sendfile(void)
-{
-	int in_fd, out_fd;
-	off_t after_pos;
-	int wait_stat;
-
-	out_fd = create_server();
-
-	in_fd = SAFE_OPEN(cleanup, IN_FILE, O_RDONLY);
-
-	TEST(sendfile(out_fd, in_fd, NULL, sb.st_size));
-	if ((after_pos = lseek(in_fd, 0, SEEK_CUR)) < 0) {
-		tst_brkm(TBROK, cleanup,
-			 "lseek after invoking sendfile failed: %d", errno);
-	}
-
-	/* Close the sockets */
-	shutdown(sockfd, SHUT_RDWR);
-	shutdown(out_fd, SHUT_RDWR);
-	if (TEST_RETURN != sb.st_size) {
-		tst_resm(TFAIL, "sendfile(2) failed to return "
-			 "expected value, expected: %" PRId64 ", "
-			 "got: %ld", (int64_t) sb.st_size, TEST_RETURN);
-		SAFE_KILL(cleanup, child_pid, SIGKILL);
-	} else if (after_pos != sb.st_size) {
-		tst_resm(TFAIL, "sendfile(2) failed to update "
-			 " the file position of in_fd, "
-			 "expected file position: %" PRId64 ", "
-			 "actual file position %" PRId64,
-			 (int64_t) sb.st_size, (int64_t) after_pos);
-		SAFE_KILL(cleanup, child_pid, SIGKILL);
-	} else {
-		tst_resm(TPASS, "functionality of sendfile() is "
-			 "correct");
-		waitpid(-1, &wait_stat, 0);
-	}
-
-	SAFE_CLOSE(cleanup, in_fd);
-	SAFE_CLOSE(cleanup, out_fd);
-	SAFE_CLOSE(cleanup, sockfd);
-}
-
-static void do_child(void)
-{
-	socklen_t length = sizeof(sin1);
-	char rbuf[4096];
-	ssize_t ret, bytes_total_received = 0;
-
-	while (bytes_total_received < sb.st_size) {
-		ret = recvfrom(sockfd, rbuf, 4096, 0, (struct sockaddr *)&sin1,
-			       &length);
-		if (ret < 0) {
-			fprintf(stderr, "child process recvfrom failed: %s\n",
-				strerror(errno));
-			exit(1);
-		}
-		bytes_total_received += ret;
-	}
-
-	exit(0);
-}
-
 static void setup(void)
 {
 	int fd;
+	char buf[27];

-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	fd = SAFE_CREAT(IN_FILE, 00700);
+	sprintf(buf, "abcdefghijklmnopqrstuvwxyz");
+	SAFE_WRITE(1, fd, buf, strlen(buf));
+	SAFE_FSTAT(fd, &sb);
+	SAFE_CLOSE(fd);

-	tst_tmpdir();
-
-	fd = SAFE_CREAT(cleanup, IN_FILE, 0600);
-
-	SAFE_WRITE(cleanup, 1, fd, "abcdefghijklmnopqrstuvwxyz", 26);
-
-	SAFE_FSTAT(cleanup, fd, &sb);
-
-	SAFE_CLOSE(cleanup, fd);
-}
-
-static void cleanup(void)
-{
-	tst_rmdir();
+	fd = SAFE_CREAT(OUT_FILE, 00700);
+	SAFE_CLOSE(fd);
 }

-static int create_server(void)
+static void run(void)
 {
-	int s;
-	socklen_t slen = sizeof(sin1);
-
-	sockfd = socket(PF_INET, SOCK_DGRAM, 0);
-	if (sockfd < 0) {
-		tst_brkm(TBROK, cleanup, "call to socket() failed: %s",
-			 strerror(errno));
-		return -1;
-	}
-	sin1.sin_family = AF_INET;
-	sin1.sin_port = 0; /* pick random free port */
-	sin1.sin_addr.s_addr = INADDR_ANY;
-
-	if (bind(sockfd, (struct sockaddr *)&sin1, sizeof(sin1)) < 0) {
-		tst_brkm(TBROK, cleanup, "call to bind() failed: %s",
-			 strerror(errno));
-		return -1;
-	}
-	SAFE_GETSOCKNAME(cleanup, sockfd, (struct sockaddr *)&sin1, &slen);
-
-	child_pid = FORK_OR_VFORK();
-	if (child_pid < 0) {
-		tst_brkm(TBROK, cleanup, "client/server fork failed: %s",
-			 strerror(errno));
-		return -1;
-	}
-
-	if (!child_pid) {
-#ifdef UCLINUX
-		if (self_exec(argv0, "") < 0) {
-			tst_brkm(TBROK, cleanup, "self_exec failed");
-			return -1;
-
-		}
-#else
-		do_child();
-#endif
-	}
-
-	s = socket(PF_INET, SOCK_DGRAM, 0);
-	inet_aton("127.0.0.1", &sin1.sin_addr);
-
-	if (s < 0) {
-		tst_brkm(TBROK, cleanup, "call to socket() failed: %s",
-			 strerror(errno));
-		return -1;
-	}
-
-	SAFE_CONNECT(cleanup, s, (struct sockaddr *)&sin1, sizeof(sin1));
+	off_t after_pos;
+	int in_fd = SAFE_OPEN(IN_FILE, O_RDONLY);
+	int out_fd = SAFE_OPEN(OUT_FILE, O_WRONLY);

-	return s;
+	TEST(sendfile(out_fd, in_fd, NULL, sb.st_size));
+	after_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
+
+	if (TST_RET != sb.st_size)
+		tst_res(TFAIL, "sendfile() failed to return expected value, "
+			       "expected: %" PRId64 ", got: %ld",
+			sb.st_size, TST_RET);
+	else if (after_pos != sb.st_size)
+		tst_res(TFAIL, "sendfile() updated the file position of in_fd "
+			       "unexpectedly, expected file position: %" PRId64
+			       ", actual file position %" PRId64,
+			(int64_t)(sb.st_size), (int64_t)(after_pos));
+	else
+		tst_res(TPASS, "sendfile() with offset=NULL");
+
+	SAFE_CLOSE(in_fd);
+	SAFE_CLOSE(out_fd);
 }

-int main(int ac, char **av)
-{
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-#ifdef UCLINUX
-	argv0 = av[0];
-	maybe_run_child(&do_child, "");
-#endif
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		do_sendfile();
-	}
-
-	cleanup();
-	tst_exit();
-}
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.test_all = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
