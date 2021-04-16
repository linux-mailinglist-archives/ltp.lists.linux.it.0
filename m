Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 753C1362611
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 18:54:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A1F23C59A7
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 18:54:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 655073C1AE3
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 18:54:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2231214052FF
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 18:54:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6328EB083;
 Fri, 16 Apr 2021 16:54:00 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 16 Apr 2021 18:53:54 +0200
Message-Id: <20210416165355.5160-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/2] splice02: Generate input in C
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
Cc: Martin Loviska <mloviska@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

instead relying on shell piping data into it.

Check resulted file size and content.
Also add metadata docs.

Problem found on SLES JeOS (https://progress.opensuse.org/issues/77260).

Reported-by: Martin Loviska <mloviska@suse.com>
Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
[ chrubis: while loop simplification ]
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v3->v4:
* write by 512 bytes (performance, suggested by Cyril)
* check also file content, for performance reason use mmap() in loop
* randomize input char
* change option to -s
* change variable names, help

 runtest/smoketest                           |   2 +-
 runtest/syscalls                            |   2 +-
 testcases/kernel/syscalls/splice/splice02.c | 137 ++++++++++++++++++--
 3 files changed, 128 insertions(+), 13 deletions(-)

diff --git a/runtest/smoketest b/runtest/smoketest
index 0c24fc1fa..2224d8f74 100644
--- a/runtest/smoketest
+++ b/runtest/smoketest
@@ -11,5 +11,5 @@ symlink01 symlink01
 stat04 symlink01 -T stat04
 utime01A symlink01 -T utime01
 rename01A symlink01 -T rename01
-splice02 seq 1 20 | splice02
+splice02 splice02 -s 20
 route4-change-dst route-change-dst.sh
diff --git a/runtest/syscalls b/runtest/syscalls
index 2d1e7b648..b89c545f0 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1451,7 +1451,7 @@ socketpair02 socketpair02
 sockioctl01 sockioctl01
 
 splice01 splice01
-splice02 seq 1 20000 | splice02
+splice02 splice02
 splice03 splice03
 splice04 splice04
 splice05 splice05
diff --git a/testcases/kernel/syscalls/splice/splice02.c b/testcases/kernel/syscalls/splice/splice02.c
index b579667b9..a29f8fbcf 100644
--- a/testcases/kernel/syscalls/splice/splice02.c
+++ b/testcases/kernel/syscalls/splice/splice02.c
@@ -1,40 +1,155 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Jens Axboe <axboe@kernel.dk>, 2009
+ * Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+ */
+
+/*\
+ * [DESCRIPTION]
+ * Original reproducer for kernel fix
+ * bf40d3435caf NFS: add support for splice writes
+ * from v2.6.31-rc1.
+ *
  * http://lkml.org/lkml/2009/4/2/55
+ *
+ * [ALGORITHM]
+ * - create pipe
+ * - fork(), child replace stdin with pipe
+ * - parent write to pipe
+ * - child slice from pipe
+ * - check resulted file size and content
  */
 
 #define _GNU_SOURCE
 
+#include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <sys/stat.h>
 #include <unistd.h>
-#include <fcntl.h>
 
 #include "tst_test.h"
+#include "lapi/mmap.h"
 #include "lapi/splice.h"
 
-#define SPLICE_SIZE (64*1024)
+#define BUFSIZE 512
+#define SPLICE_SIZE 1024
+
+#define TEST_FILENAME "splice02-temp"
+
+static char letter, *sarg;
+static int file_size;
+static int pipe_fd[2];
+
+static void setup(void)
+{
+	if (tst_parse_int(sarg, &file_size, 1, INT_MAX))
+		tst_brk(TBROK, "invalid number of writes '%s', use <1,%d>",
+				sarg, INT_MAX);
+
+	srand(time(NULL));
+	letter = 'a' + (rand() % ('z' - 'a' + 1));
+}
 
-static void splice_test(void)
+static void do_child(void)
 {
 	int fd;
+	size_t size, to_check, i, fail = 0;
+	struct stat st;
+	char *map;
+
+	SAFE_CLOSE(pipe_fd[1]);
+	SAFE_DUP2(pipe_fd[0], STDIN_FILENO);
+
+	fd = SAFE_OPEN(TEST_FILENAME, O_WRONLY | O_CREAT | O_TRUNC, 0644);
+
+	do {
+		TEST(splice(STDIN_FILENO, NULL, fd, NULL, SPLICE_SIZE, 0));
+		if (TST_RET < 0) {
+			tst_res(TFAIL | TTERRNO, "splice failed");
+			goto cleanup;
+		}
+	} while (TST_RET > 0);
+
+	stat(TEST_FILENAME, &st);
+	if (st.st_size != file_size) {
+		tst_res(TFAIL, "file size is different from expected: %ld (%d)",
+				st.st_size, file_size);
+		return;
+	}
+
+	SAFE_CLOSE(fd);
+	fd = SAFE_OPEN(TEST_FILENAME, O_RDONLY);
+	to_check = st.st_size;
 
-	fd = SAFE_OPEN("splice02-temp", O_WRONLY | O_CREAT | O_TRUNC, 0644);
+	tst_res(TINFO, "checking file content");
+	do {
+		i = 0;
+		size = to_check > SPLICE_SIZE ? SPLICE_SIZE : to_check;
+		map = SAFE_MMAP(NULL, size, PROT_READ, MAP_PRIVATE, fd, 0);
+		while (map[i] && i < size) {
+			if (map[i] != letter)
+				fail++;
+			i++;
+		}
+		SAFE_MUNMAP(map, size);
+		to_check -= size;
+	} while (to_check > 0);
 
-	TEST(splice(STDIN_FILENO, NULL, fd, NULL, SPLICE_SIZE, 0));
-	if (TST_RET < 0) {
-		tst_res(TFAIL, "splice failed - errno = %d : %s",
-			TST_ERR, strerror(TST_ERR));
-	} else {
-		tst_res(TPASS, "splice() system call Passed");
+	if (fail) {
+		tst_res(TFAIL, "%ld failed bytes found", fail);
+		return;
 	}
 
+	tst_res(TPASS, "splice() system call passed");
+
+cleanup:
 	SAFE_CLOSE(fd);
+	exit(0);
+}
+
+static void run(void)
+{
+	size_t size, written, max_pipe_size, to_write;
+	char buf[BUFSIZE];
+
+	SAFE_PIPE(pipe_fd);
+
+	memset(buf, letter, BUFSIZE);
+
+	if (!file_size) {
+		max_pipe_size = SAFE_FCNTL(pipe_fd[1], F_GETPIPE_SZ);
+		file_size = max_pipe_size << 4;
+	}
+
+	to_write = file_size;
+
+	if (!SAFE_FORK())
+		do_child();
+
+	tst_res(TINFO, "writting %d bytes", file_size);
+
+	while (to_write > 0) {
+		size = to_write > BUFSIZE ? BUFSIZE : to_write;
+		written = SAFE_WRITE(1, pipe_fd[1], &buf, size);
+		to_write -= written;
+	}
+
+	SAFE_CLOSE(pipe_fd[0]);
+	SAFE_CLOSE(pipe_fd[1]);
+
+	tst_reap_children();
 }
 
 static struct tst_test test = {
-	.test_all = splice_test,
+	.test_all = run,
+	.setup = setup,
+	.needs_checkpoints = 1,
 	.needs_tmpdir = 1,
+	.forks_child = 1,
 	.min_kver = "2.6.17",
+	.options = (struct tst_option[]) {
+		{"s:", &sarg, "-s x     Size of output file in bytes (default: 16x max pipe size, i.e. 1M on intel)"},
+		{}
+	},
 };
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
