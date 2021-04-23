Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEF5368FF4
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 12:00:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94AD33C6A0D
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 12:00:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 18B123C63BC
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 11:59:52 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CB9F6140138F
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 11:59:50 +0200 (CEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FRV8Y5L2kzlZJ5
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 17:57:49 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Fri, 23 Apr 2021 17:59:41 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 23 Apr 2021 17:59:43 +0800
Message-ID: <20210423095944.118255-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423095944.118255-1-xieziyao@huawei.com>
References: <20210423095944.118255-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/sendfile: Convert sendfile04 to the new
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
Reply-To: 20210420133839.145408-1-xieziyao@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

1. Convert sendfile04 to the new API;
2. Remove the socket code of server/client and use SAFE_SOCKETPAIR()
instead, which can simplify the code logic.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../kernel/syscalls/sendfile/sendfile04.c     | 308 ++++--------------
 1 file changed, 61 insertions(+), 247 deletions(-)

diff --git a/testcases/kernel/syscalls/sendfile/sendfile04.c b/testcases/kernel/syscalls/sendfile/sendfile04.c
index 0f315abb0..42600a8ac 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile04.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile04.c
@@ -1,51 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *   Copyright (c) Red Hat Inc., 2007
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
+ * Copyright (c) Red Hat Inc., 2007
+ * 11/2007 Copied from sendfile02.c by Masatake YAMATO
  */

-/*
- * NAME
- *	sendfile04.c
- *
- * DESCRIPTION
- *	Testcase to test that sendfile(2) system call returns EFAULT
- *	when passing wrong buffer.
- *
- * ALGORITHM
- *     Given wrong address or protected buffer as OFFSET argument to sendfile.
- *     A wrong address is created by munmap a buffer allocated by mmap.
- *     A protected buffer is created by mmap with specifying protection.
+/*\
+ * [Description]
  *
- * USAGE:  <for command-line>
- *  sendfile04 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+ * Testcase to test that sendfile(2) system call returns EFAULT when passing
+ * wrong buffer.
  *
- * HISTORY
- *	11/2007 Copyed from sendfile02.c by Masatake YAMATO
+ * [Algorithm]
  *
- * RESTRICTIONS
- *	NONE
+ * Given wrong address or protected buffer as OFFSET argument to sendfile:
+ * - a wrong address is created by munmap a buffer allocated by mmap
+ * - a protected buffer is created by mmap with specifying protection
  */
+
 #include <stdio.h>
 #include <errno.h>
 #include <fcntl.h>
@@ -56,232 +28,74 @@
 #include <sys/mman.h>
 #include <netinet/in.h>
 #include <arpa/inet.h>
-#include "test.h"
-#include "safe_macros.h"
+
+#include "tst_test.h"

 #ifndef OFF_T
 #define OFF_T off_t
-#endif /* Not def: OFF_T */
+#endif

-TCID_DEFINE(sendfile04);
+#define IN_FILE "sendfile04_infile"

-char in_file[100];
-char out_file[100];
+int in_fd;
 int out_fd;
-pid_t child_pid;
-static int sockfd, s;
-static struct sockaddr_in sin1;	/* shared between do_child and create_server */
-
-void cleanup(void);
-void do_child(void);
-void setup(void);
-int create_server(void);
-
-#define PASS_MAPPED_BUFFER 0
-#define PASS_UNMAPPED_BUFFER 1
+int out[2];
+static char buf[] = "abcdefghijklmnopqrstuvwxyz";

 struct test_case_t {
 	int protection;
 	int pass_unmapped_buffer;
-} testcases[] = {
-	{
-	PROT_NONE, PASS_MAPPED_BUFFER}, {
-	PROT_READ, PASS_MAPPED_BUFFER}, {
-	PROT_EXEC, PASS_MAPPED_BUFFER}, {
-	PROT_EXEC | PROT_READ, PASS_MAPPED_BUFFER}, {
-PROT_READ | PROT_WRITE, PASS_UNMAPPED_BUFFER},};
-
-int TST_TOTAL = sizeof(testcases) / sizeof(testcases[0]);
-
-#ifdef UCLINUX
-static char *argv0;
-#endif
-
-void do_sendfile(int prot, int pass_unmapped_buffer)
-{
-	OFF_T *protected_buffer;
-	int in_fd;
-	struct stat sb;
-
-	protected_buffer = mmap(NULL,
-				sizeof(*protected_buffer),
-				prot, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
-	if (protected_buffer == MAP_FAILED) {
-		tst_brkm(TBROK, cleanup, "mmap failed: %d", errno);
-	}
-
-	out_fd = create_server();
-
-	if ((in_fd = open(in_file, O_RDONLY)) < 0) {
-		tst_brkm(TBROK, cleanup, "open failed: %d", errno);
-	}
-	SAFE_STAT(cleanup, in_file, &sb);
-
-	if (pass_unmapped_buffer) {
-		SAFE_MUNMAP(cleanup, protected_buffer,
-			    sizeof(*protected_buffer));
-	}
-
-	TEST(sendfile(out_fd, in_fd, protected_buffer, sb.st_size));
-
-	if (TEST_RETURN != -1) {
-		tst_resm(TFAIL, "call succeeded unexpectedly");
-	} else {
-		if (TEST_ERRNO != EFAULT) {
-			tst_resm(TFAIL, "sendfile returned unexpected "
-				 "errno, expected: %d, got: %d",
-				 EFAULT, TEST_ERRNO);
-		} else {
-			tst_resm(TPASS, "sendfile() returned %d : %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-		}
-	}
-
-	shutdown(sockfd, SHUT_RDWR);
-	shutdown(s, SHUT_RDWR);
-	kill(child_pid, SIGKILL);
-	close(in_fd);
-
-	if (!pass_unmapped_buffer) {
-		/* Not unmapped yet. So do it now. */
-		munmap(protected_buffer, sizeof(*protected_buffer));
-	}
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
+	const char *desc;
+} tc[] = {
+	{PROT_NONE, 0, "pass_mapped_buffer"},
+	{PROT_READ, 0, "pass_mapped_buffer"},
+	{PROT_EXEC, 0, "pass_mapped_buffer"},
+	{PROT_EXEC | PROT_READ, 0, "pass_mapped_buffer"},
+	{PROT_READ | PROT_WRITE, 1, "pass_unmapped_buffer"}
+};
+
+static void setup(void)
 {
-	int fd;
-	char buf[100];
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	in_fd = SAFE_CREAT(IN_FILE, 00700);
+	SAFE_WRITE(1, in_fd, buf, strlen(buf));
+	SAFE_CLOSE(in_fd);

-	/* make a temporary directory and cd to it */
-	tst_tmpdir();
-	sprintf(in_file, "in.%d", getpid());
-	if ((fd = creat(in_file, 00700)) < 0) {
-		tst_brkm(TBROK, cleanup, "creat failed in setup, errno: %d",
-			 errno);
-	}
-	sprintf(buf, "abcdefghijklmnopqrstuvwxyz");
-	if (write(fd, buf, strlen(buf)) < 0) {
-		tst_brkm(TBROK, cleanup, "write failed, errno: %d", errno);
-	}
-	close(fd);
-	sprintf(out_file, "out.%d", getpid());
+	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, out);
+	out_fd = out[0];
 }

-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-
-	close(out_fd);
-	/* delete the test directory created in setup() */
-	tst_rmdir();
-
+	SAFE_CLOSE(out[0]);
+	SAFE_CLOSE(out[1]);
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
+	OFF_T *protected_buffer;
+	protected_buffer = SAFE_MMAP(NULL, sizeof(*protected_buffer),
+			             tc[i].protection,
+				     MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	if (tc[i].pass_unmapped_buffer)
+		SAFE_MUNMAP(protected_buffer, sizeof(*protected_buffer));

-		}
-#else
-		do_child();
-#endif
-	}
+	struct stat sb;
+	SAFE_STAT(IN_FILE, &sb);
+	in_fd = SAFE_OPEN(IN_FILE, O_RDONLY);

-	s = socket(PF_INET, SOCK_DGRAM, 0);
-	inet_aton("127.0.0.1", &sin1.sin_addr);
-	if (s < 0) {
-		tst_brkm(TBROK, cleanup, "call to socket() failed: %s",
-			 strerror(errno));
-		return -1;
-	}
-	SAFE_CONNECT(cleanup, s, (struct sockaddr *)&sin1, sizeof(sin1));
-	return s;
+	TST_EXP_FAIL(sendfile(out_fd, in_fd, protected_buffer, sb.st_size),
+		     EFAULT, "sendfile(..) with %s, protection=%d",
+		     tc[i].desc, tc[i].protection);

+	if (!tc[i].pass_unmapped_buffer)
+		SAFE_MUNMAP(protected_buffer, sizeof(*protected_buffer));
+	SAFE_CLOSE(in_fd);
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
-			do_sendfile(testcases[i].protection,
-				    testcases[i].pass_unmapped_buffer);
-		}
-	}
-	cleanup();
-
-	tst_exit();
-}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.needs_tmpdir = 1,
+	.cleanup = cleanup,
+	.setup = setup,
+	.test = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
