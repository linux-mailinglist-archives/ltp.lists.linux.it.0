Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5DA39989D
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 05:35:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1360B3C8002
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 05:35:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5975B3C28F4
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 05:35:39 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 31DF410008F1
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 05:35:36 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FwWgM6yRBzZcCj
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 11:32:47 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 11:35:33 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 11:35:32 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 3 Jun 2021 11:36:09 +0800
Message-ID: <20210603033611.15619-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210603033611.15619-1-xieziyao@huawei.com>
References: <20210603033611.15619-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] syscalls/sendfile: Convert sendfile02 to the new
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

1. Convert sendfile02 to the new API with file descriptors instead
of socket descriptors.
2. Remove the support for UCLINUX.
3. Remove redundant testcases {4, 22, 26} and {6, 20, 26}.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../kernel/syscalls/sendfile/sendfile02.c     | 323 ++++--------------
 1 file changed, 63 insertions(+), 260 deletions(-)

diff --git a/testcases/kernel/syscalls/sendfile/sendfile02.c b/testcases/kernel/syscalls/sendfile/sendfile02.c
index 729a9e123..820063681 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile02.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile02.c
@@ -1,285 +1,88 @@
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
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 07/2001 Ported by Wayne Boyer
+ * 08/2002 Make it use a socket so it works with 2.5 kernel
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

-/*
- * NAME
- *	sendfile02.c
- *
- * DESCRIPTION
- *	Testcase to test the basic functionality of the sendfile(2) system call.
- *
- * ALGORITHM
- *	1. call sendfile(2) with offset = 0
- *	2. call sendfile(2) with offset in the middle of the file
+/*\
+ * [Description]
  *
- * USAGE:  <for command-line>
- *  sendfile02 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *	08/2002 Make it use a socket so it works with 2.5 kernel
- *
- * RESTRICTIONS
- *	NONE
+ * Test the basic functionality of the sendfile() system call,
+ * 1. Call sendfile() with offset = 0.
+ * 2. Call sendfile() with offset in the middle of the file.
  */
+
 #include <stdio.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <sys/stat.h>
-#include <sys/sendfile.h>
-#include <sys/types.h>
-#include <sys/wait.h>
-#include <sys/socket.h>
-#include <netinet/in.h>
-#include <arpa/inet.h>
-#include <unistd.h>
 #include <inttypes.h>
-#include "test.h"
-#include "safe_macros.h"
-
-TCID_DEFINE(sendfile02);
-int TST_TOTAL = 4;
+#include <sys/sendfile.h>

-char in_file[100];
-char out_file[100];
-int out_fd;
-pid_t child_pid;
-static int sockfd, s;
-static struct sockaddr_in sin1;	/* shared between do_child and create_server */
+#include "tst_test.h"

-void cleanup(void);
-void do_child(void);
-void setup(void);
-int create_server(void);
+#define IN_FILE "in_file"
+#define OUT_FILE "out_file"

 struct test_case_t {
 	char *desc;
-	int offset;
-	int exp_retval;
-	int exp_updated_offset;
-} testcases[] = {
-	{
-	"Test sendfile(2) with offset = 0", 0, 26, 26}, {
-	"Test sendfile(2) with offset in the middle of file", 2, 24, 26}, {
-	"Test sendfile(2) with offset in the middle of file", 4, 22, 26}, {
-	"Test sendfile(2) with offset in the middle of file", 6, 20, 26}
+	off_t offset;
+	int64_t count;
+	int64_t exp_retval;
+	int64_t exp_updated_offset;
+} tc[] = {
+	{ "with offset = 0", 0, 26, 26, 26 },
+	{ "with offset = 2", 2, 24, 24, 26 },
 };

-#ifdef UCLINUX
-static char *argv0;
-#endif
-
-void do_sendfile(off_t offset, int i)
-{
-	int in_fd;
-	struct stat sb;
-	int wait_status;
-	int wait_stat;
-	off_t before_pos, after_pos;
-
-	out_fd = create_server();
-
-	if ((in_fd = open(in_file, O_RDONLY)) < 0) {
-		tst_brkm(TBROK, cleanup, "open failed: %d", errno);
-	}
-	SAFE_STAT(cleanup, in_file, &sb);
-
-	if ((before_pos = lseek(in_fd, 0, SEEK_CUR)) < 0) {
-		tst_brkm(TBROK, cleanup,
-			 "lseek before invoking sendfile failed: %d", errno);
-	}
-
-	TEST(sendfile(out_fd, in_fd, &offset, sb.st_size - offset));
-
-	if ((after_pos = lseek(in_fd, 0, SEEK_CUR)) < 0) {
-		tst_brkm(TBROK, cleanup,
-			 "lseek after invoking sendfile failed: %d", errno);
-	}
-
-	/* Close the sockets */
-	shutdown(sockfd, SHUT_RDWR);
-	shutdown(s, SHUT_RDWR);
-	if (TEST_RETURN != testcases[i].exp_retval) {
-		tst_resm(TFAIL, "sendfile(2) failed to return "
-			 "expected value, expected: %d, "
-			 "got: %ld", testcases[i].exp_retval,
-			 TEST_RETURN);
-		kill(child_pid, SIGKILL);
-	} else if (offset != testcases[i].exp_updated_offset) {
-		tst_resm(TFAIL, "sendfile(2) failed to update "
-			 "OFFSET parameter to expected value, "
-			 "expected: %d, got: %" PRId64,
-			 testcases[i].exp_updated_offset,
-			 (int64_t) offset);
-	} else if (before_pos != after_pos) {
-		tst_resm(TFAIL, "sendfile(2) updated the file position "
-			 " of in_fd unexpectedly, expected file position: %"
-			 PRId64 ", " " actual file position %" PRId64,
-			 (int64_t) before_pos, (int64_t) after_pos);
-	} else {
-		tst_resm(TPASS, "functionality of sendfile() is "
-			 "correct");
-		wait_status = waitpid(-1, &wait_stat, 0);
-	}
-
-	close(in_fd);
-}
-
-/*
- * do_child
- */
-void do_child(void)
-{
-	int lc;
-	socklen_t length;
-	char rbuf[4096];
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		length = sizeof(sin1);
-		recvfrom(sockfd, rbuf, 4096, 0, (struct sockaddr *)&sin1,
-			 &length);
-	}
-	exit(0);
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
 	int fd;
-	char buf[100];
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
+	char buf[27];

-	TEST_PAUSE;
-
-	/* make a temporary directory and cd to it */
-	tst_tmpdir();
-	sprintf(in_file, "in.%d", getpid());
-	if ((fd = creat(in_file, 00700)) < 0) {
-		tst_brkm(TBROK, cleanup, "creat failed in setup, errno: %d",
-			 errno);
-	}
+	fd = SAFE_CREAT(IN_FILE, 00700);
 	sprintf(buf, "abcdefghijklmnopqrstuvwxyz");
-	if (write(fd, buf, strlen(buf)) < 0) {
-		tst_brkm(TBROK, cleanup, "write failed, errno: %d", errno);
-	}
-	close(fd);
-	sprintf(out_file, "out.%d", getpid());
-}
-
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
-{
-
-	close(out_fd);
-	/* delete the test directory created in setup() */
-	tst_rmdir();
+	SAFE_WRITE(1, fd, buf, strlen(buf));
+	SAFE_CLOSE(fd);

+	fd = SAFE_CREAT(OUT_FILE, 00700);
+	SAFE_CLOSE(fd);
 }

-int create_server(void)
+static void run(unsigned int i)
 {
-	static int count = 0;
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
-	count++;
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
-	if (!child_pid) {	/* child */
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
-	if (s < 0) {
-		tst_brkm(TBROK, cleanup, "call to socket() failed: %s",
-			 strerror(errno));
-		return -1;
-	}
-	SAFE_CONNECT(cleanup, s, (struct sockaddr *)&sin1, sizeof(sin1));
-	return s;
+	int in_fd = SAFE_OPEN(IN_FILE, O_RDONLY);
+	int out_fd = SAFE_OPEN(OUT_FILE, O_WRONLY);
+	off_t offset = tc[i].offset;
+	off_t before_pos, after_pos;

+	before_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
+
+	TEST(sendfile(out_fd, in_fd, &offset, tc[i].count));
+	after_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
+
+	if (TST_RET != tc[i].exp_retval)
+		tst_res(TFAIL, "sendfile() failed to return expected value, "
+			       "expected: %" PRId64 ", got: %ld",
+			tc[i].exp_retval, TST_RET);
+	else if (offset != tc[i].exp_updated_offset)
+		tst_res(TFAIL, "sendfile() failed to update OFFSET parameter to "
+			       "expected value, expected: %" PRId64 ", got: %" PRId64,
+			tc[i].exp_updated_offset, (int64_t)(offset));
+	else if (before_pos != after_pos)
+		tst_res(TFAIL, "sendfile() updated the file position of in_fd "
+			       "unexpectedly, expected file position: %" PRId64
+			       ", actual file position %" PRId64,
+			(int64_t)(before_pos), (int64_t)(after_pos));
+	else
+		tst_res(TPASS, "sendfile() with %s", tc[i].desc);
+
+	SAFE_CLOSE(in_fd);
+	SAFE_CLOSE(out_fd);
 }

-int main(int ac, char **av)
-{
-	int i;
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-#ifdef UCLINUX
-	argv0 = av[0];
-	maybe_run_child(&do_child, "");
-#endif
-
-	setup();
-
-	/*
-	 * The following loop checks looping state if -c option given
-	 */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; ++i) {
-			do_sendfile(testcases[i].offset, i);
-		}
-	}
-	cleanup();
-
-	tst_exit();
-}
+static struct tst_test test = {
+		.needs_tmpdir = 1,
+		.setup = setup,
+		.test = run,
+		.tcnt = ARRAY_SIZE(tc),
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
