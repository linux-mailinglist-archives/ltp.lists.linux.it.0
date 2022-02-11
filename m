Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C59154B2817
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 15:39:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85D6A3C9F05
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 15:39:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 154423C0F5D
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 15:39:06 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9254F1A016E5
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 15:39:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A8FAC1F3A8;
 Fri, 11 Feb 2022 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644590344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nT9d/ONJZFHTSvOWgVsxhpZinr/x2c37DgNYSZoI9c4=;
 b=Pb9vQEKVzvHiljObnZUmpEJ/8Ra8kdjqktICwi49mMlD5cxvAxvpZs1wV4zFtdrOI4S8XJ
 yIH2LRz3hJTygGw9Y/HyuxLwD9GrsKGPV3o6drpHqlozgZHBhXlybCCWhULHDOYhW61caY
 QCQh5wKh5FrsEYc9lChWpInk+bD7g4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644590344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nT9d/ONJZFHTSvOWgVsxhpZinr/x2c37DgNYSZoI9c4=;
 b=dXIPwCXmOAvqsVcoliky17zj/1wlA7Msuc6a9PoEqTOyi2c77alOVSqb3orGjLzEfr/56m
 XSrSfdtnfz0Y1ZCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80D4A13C83;
 Fri, 11 Feb 2022 14:39:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8iR4HQh1BmK6NAAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Fri, 11 Feb 2022 14:39:04 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri, 11 Feb 2022 15:39:01 +0100
Message-Id: <20220211143901.31087-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] Rewrite process_vm_readv03.c test with new LTP API
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

Removed pipe and replaced it with shared memory.
Replaced TST_CHECKPOINT_INIT usage with .needs_checkpoints from the new
LTP API.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
v3 fixes useless recursive memory allocation and revert the way random buffer
sizes are initialized.

 .../kernel/syscalls/cma/process_vm_readv03.c  | 336 +++++++-----------
 1 file changed, 132 insertions(+), 204 deletions(-)

diff --git a/testcases/kernel/syscalls/cma/process_vm_readv03.c b/testcases/kernel/syscalls/cma/process_vm_readv03.c
index 2333f7fd6..d6945fb7d 100644
--- a/testcases/kernel/syscalls/cma/process_vm_readv03.c
+++ b/testcases/kernel/syscalls/cma/process_vm_readv03.c
@@ -1,274 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2012
  * Copyright (c) Linux Test Project, 2012
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
  *
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
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Fork two children, one child mallocs randomly sized trunks of memory
+ * and initializes them; the other child calls process_vm_readv with
+ * the remote iovecs initialized to the original process memory
+ * locations and the local iovecs initialized to randomly sized and
+ * allocated local memory locations. The second child then verifies
+ * that the data copied is correct.
  */
 
-#define _GNU_SOURCE
-#include <sys/types.h>
-#include <sys/uio.h>
-#include <sys/wait.h>
-#include <errno.h>
-#include <limits.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <string.h>
-#include <time.h>
-#include <unistd.h>
-#include <limits.h>
-
-#include "test.h"
-#include "safe_macros.h"
+#include <sys/types.h>
+#include <sys/wait.h>
+#include "tst_test.h"
 #include "lapi/syscalls.h"
 
-char *TCID = "process_vm_readv03";
-int TST_TOTAL = 1;
-
-#define NUM_LOCAL_VECS 4
-
-static int nflag, sflag;
-static char *nr_opt, *sz_opt;
-static option_t options[] = {
-	{"n:", &nflag, &nr_opt},
-	{"s:", &sflag, &sz_opt},
-	{NULL, NULL, NULL}
+static struct tcase {
+	int bufsize;
+	int remote_iovecs;
+	int local_iovecs;
+} testcases[] = {
+	{ .bufsize = 1024, .remote_iovecs = 1024, .local_iovecs = 8 },
+	{ .bufsize = 1024, .remote_iovecs = 512, .local_iovecs = 16 },
+	{ .bufsize = 1024, .remote_iovecs = 256, .local_iovecs = 32 },
+	{ .bufsize = 1024, .remote_iovecs = 128, .local_iovecs = 64 },
+	{ .bufsize = 1024, .remote_iovecs = 64, .local_iovecs = 128 },
+	{ .bufsize = 1024, .remote_iovecs = 32, .local_iovecs = 256 },
+	{ .bufsize = 1024, .remote_iovecs = 16, .local_iovecs = 512 },
+	{ .bufsize = 1024, .remote_iovecs = 8, .local_iovecs = 1024 },
+
+	{ .bufsize = 131072, .remote_iovecs = 1024, .local_iovecs = 8 },
+	{ .bufsize = 131072, .remote_iovecs = 512, .local_iovecs = 16 },
+	{ .bufsize = 131072, .remote_iovecs = 256, .local_iovecs = 32 },
+	{ .bufsize = 131072, .remote_iovecs = 128, .local_iovecs = 64 },
+	{ .bufsize = 131072, .remote_iovecs = 64, .local_iovecs = 128 },
+	{ .bufsize = 131072, .remote_iovecs = 32, .local_iovecs = 256 },
+	{ .bufsize = 131072, .remote_iovecs = 16, .local_iovecs = 512 },
+	{ .bufsize = 131072, .remote_iovecs = 8, .local_iovecs = 1024 },
 };
 
-static int nr_iovecs;
-static long bufsz;
-static int pipe_fd[2];
-static pid_t pids[2];
+static char **data_ptr;
+static long max_iovec;
 
-static void gen_random_arr(int *arr, int arr_sz);
-static void child_alloc(int *bufsz_arr);
-static void child_invoke(int *bufsz_arr);
-static long *fetch_remote_addrs(void);
-static void setup(void);
-static void cleanup(void);
-static void help(void);
-
-int main(int argc, char **argv)
-{
-	int lc, status;
-	int *bufsz_arr;
-
-	tst_parse_opts(argc, argv, options, &help);
-
-	setup();
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		SAFE_PIPE(cleanup, pipe_fd);
-
-		bufsz_arr = SAFE_MALLOC(cleanup, nr_iovecs * sizeof(int));
-		gen_random_arr(bufsz_arr, nr_iovecs);
-
-		/* the start of child_alloc and child_invoke is already
-		 * synchronized via pipe */
-		pids[0] = fork();
-		switch (pids[0]) {
-		case -1:
-			tst_brkm(TBROK | TERRNO, cleanup, "fork #0");
-		case 0:
-			child_alloc(bufsz_arr);
-			exit(0);
-		}
-
-		pids[1] = fork();
-		switch (pids[1]) {
-		case -1:
-			tst_brkm(TBROK | TERRNO, cleanup, "fork #1");
-		case 0:
-			child_invoke(bufsz_arr);
-			exit(0);
-		}
-
-		/* wait until child_invoke reads from child_alloc's VM */
-		SAFE_WAITPID(cleanup, pids[1], &status, 0);
-		if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
-			tst_resm(TFAIL, "child 1 returns %d", status);
-
-		/* child_alloc is free to exit now */
-		TST_SAFE_CHECKPOINT_WAKE(cleanup, 0);
-
-		SAFE_WAITPID(cleanup, pids[0], &status, 0);
-		if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
-			tst_resm(TFAIL, "child 0 returns %d", status);
-
-		free(bufsz_arr);
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-static void gen_random_arr(int *arr, int arr_sz)
+static void create_data_size(int *arr, int arr_sz, int buffsize)
 {
 	long bufsz_left, bufsz_single;
 	int i;
 
-	bufsz_left = bufsz;
+	bufsz_left = buffsize;
 	for (i = 0; i < arr_sz - 1; i++) {
-		bufsz_single = rand() % (bufsz_left / 2) + 1;
+		bufsz_single = rand() % ((bufsz_left / 2) + 1);
 		arr[i] = bufsz_single;
 		bufsz_left -= bufsz_single;
 	}
+
 	arr[arr_sz - 1] = bufsz_left;
 }
 
-static void child_alloc(int *bufsz_arr)
+static void child_alloc(const int *sizes, int nr_iovecs)
 {
-	char **foo;
 	int i, j;
-	char buf[BUFSIZ];
 	long count;
 
-	foo = SAFE_MALLOC(tst_exit, nr_iovecs * sizeof(char *));
-
 	count = 0;
 	for (i = 0; i < nr_iovecs; i++) {
-		foo[i] = SAFE_MALLOC(tst_exit, bufsz_arr[i]);
-		for (j = 0; j < bufsz_arr[i]; j++) {
-			foo[i][j] = count % 256;
+		data_ptr[i] = sizes[i] ? SAFE_MALLOC(sizes[i]) : NULL;
+
+		for (j = 0; j < sizes[i]; j++) {
+			data_ptr[i][j] = count % 256;
 			count++;
 		}
 	}
-	tst_resm(TINFO, "child 0: %d iovecs allocated and initialized.",
-		 nr_iovecs);
 
-	/* passing addr via pipe */
-	SAFE_CLOSE(tst_exit, pipe_fd[0]);
-	snprintf(buf, BUFSIZ, "%p", (void *)foo);
-	SAFE_WRITE(tst_exit, 1, pipe_fd[1], buf, strlen(buf) + 1);
-	SAFE_CLOSE(tst_exit, pipe_fd[1]);
+	tst_res(TINFO, "child 0: memory allocated and initialized");
 
-	/* wait until child_invoke is done reading from our VM */
-	TST_SAFE_CHECKPOINT_WAIT(cleanup, 0);
-}
-
-static long *fetch_remote_addrs(void)
-{
-	long *foo, *bar;
-	char buf[BUFSIZ];
-	long len;
-	struct iovec local, remote;
-
-	/* get addr from pipe */
-	SAFE_CLOSE(tst_exit, pipe_fd[1]);
-	SAFE_READ(tst_exit, 0, pipe_fd[0], buf, BUFSIZ);
-	SAFE_CLOSE(tst_exit, pipe_fd[0]);
-	if (sscanf(buf, "%p", &foo) != 1)
-		tst_brkm(TBROK | TERRNO, tst_exit, "sscanf");
-
-	len = nr_iovecs * sizeof(long);
-	bar = SAFE_MALLOC(tst_exit, len);
-	local.iov_base = bar;
-	local.iov_len = len;
-	remote.iov_base = foo;
-	remote.iov_len = len;
-
-	TEST(tst_syscall(__NR_process_vm_readv, pids[0], &local,
-			 1UL, &remote, 1UL, 0UL));
-	if (TEST_RETURN != len)
-		tst_brkm(TFAIL | TTERRNO, tst_exit, "process_vm_readv");
-
-	return local.iov_base;
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
 }
 
-static void child_invoke(int *bufsz_arr)
+static void child_invoke(const int *sizes, int local_iovecs, int remote_iovecs,
+			 pid_t pid_alloc, int buffsize)
 {
-	int i, j, count, nr_error;
+	struct iovec local[local_iovecs];
+	struct iovec remote[remote_iovecs];
+	int i, j;
+	int count;
+	int nr_error;
+	int *local_sizes;
 	unsigned char expect, actual;
-	long *addrs;
-	struct iovec local[NUM_LOCAL_VECS], *remote;
-	int rcv_arr[NUM_LOCAL_VECS];
-
-	addrs = fetch_remote_addrs();
 
-	remote = SAFE_MALLOC(tst_exit, nr_iovecs * sizeof(struct iovec));
-	for (i = 0; i < nr_iovecs; i++) {
-		remote[i].iov_base = (void *)addrs[i];
-		remote[i].iov_len = bufsz_arr[i];
+	for (i = 0; i < remote_iovecs; i++) {
+		remote[i].iov_base = (void *)data_ptr[i];
+		remote[i].iov_len = sizes[i];
 	}
-	tst_resm(TINFO, "child 1: %d remote iovecs received.", nr_iovecs);
 
-	gen_random_arr(rcv_arr, NUM_LOCAL_VECS);
-	for (i = 0; i < NUM_LOCAL_VECS; i++) {
-		local[i].iov_base = SAFE_MALLOC(tst_exit, rcv_arr[i]);
-		local[i].iov_len = rcv_arr[i];
+	local_sizes = SAFE_MALLOC(local_iovecs * sizeof(int));
+	create_data_size(local_sizes, local_iovecs, buffsize);
+	for (i = 0; i < local_iovecs; i++) {
+		local[i].iov_base = SAFE_MALLOC(local_sizes[i]);
+		local[i].iov_len = local_sizes[i];
 	}
-	tst_resm(TINFO, "child 1: %d local iovecs initialized.",
-		 NUM_LOCAL_VECS);
 
-	TEST(tst_syscall(__NR_process_vm_readv, pids[0], local,
-			    (unsigned long)NUM_LOCAL_VECS, remote,
-			    (unsigned long)nr_iovecs, 0UL));
-	if (TEST_RETURN != bufsz)
-		tst_brkm(TBROK | TTERRNO, tst_exit, "process_vm_readv");
+	tst_res(TINFO, "child 1: reading string from same memory location");
+
+	TST_EXP_POSITIVE(tst_syscall(__NR_process_vm_readv, pid_alloc, local,
+				     local_iovecs, remote, remote_iovecs, 0UL));
+
+	if (TST_RET != buffsize) {
+		tst_brk(TBROK, "process_vm_readv: expected %d bytes but got %ld",
+			buffsize, TST_RET);
+	}
 
-	/* verify every byte */
 	count = 0;
 	nr_error = 0;
-	for (i = 0; i < NUM_LOCAL_VECS; i++) {
+	for (i = 0; i < local_iovecs; i++) {
 		for (j = 0; j < (int)local[i].iov_len; j++) {
 			expect = count % 256;
 			actual = ((unsigned char *)local[i].iov_base)[j];
-			if (expect != actual) {
-#if DEBUG
-				tst_resm(TFAIL, "child 1: expected %i, got %i "
-					 "for byte seq %d",
-					 expect, actual, count);
-#endif
+			if (expect != actual)
 				nr_error++;
-			}
+
 			count++;
 		}
 	}
+
 	if (nr_error)
-		tst_brkm(TFAIL, tst_exit, "child 1: %d incorrect bytes "
-			 "received.", nr_error);
+		tst_brk(TFAIL, "child 1: %d incorrect bytes received", nr_error);
 	else
-		tst_resm(TPASS, "child 1: all bytes are correctly received.");
+		tst_res(TPASS, "child 1: all bytes are correctly received");
 }
 
 static void setup(void)
 {
-	tst_require_root();
-
-	/* Just a sanity check of the existence of syscall */
 	tst_syscall(__NR_process_vm_readv, getpid(), NULL, 0UL, NULL, 0UL, 0UL);
 
-	nr_iovecs = nflag ? SAFE_STRTOL(NULL, nr_opt, 1, IOV_MAX) : 10;
-	bufsz = sflag ? SAFE_STRTOL(NULL, sz_opt, NUM_LOCAL_VECS, LONG_MAX)
-	    : 100000;
-
-	tst_tmpdir();
-	TST_CHECKPOINT_INIT(cleanup);
-	srand(time(NULL));
-
-	TEST_PAUSE;
+	max_iovec = sysconf(_SC_IOV_MAX);
+	data_ptr = SAFE_MMAP(NULL, sizeof(void *) * max_iovec, PROT_READ | PROT_WRITE,
+			     MAP_SHARED | MAP_ANONYMOUS, -1, 0);
 }
 
 static void cleanup(void)
 {
-	tst_rmdir();
+	if (data_ptr)
+		SAFE_MUNMAP(data_ptr, sizeof(void *) * max_iovec);
 }
 
-static void help(void)
+static void run(unsigned int i)
 {
-	printf("    -n NUM  Set the number of iovecs to be allocated.\n");
-	printf("    -s NUM  Set the size of total buffer size.\n");
+	int bufsize = testcases[i].bufsize;
+	int remote_iovecs = testcases[i].remote_iovecs;
+	int local_iovecs = testcases[i].local_iovecs;
+	pid_t pid_alloc;
+	pid_t pid_invoke;
+	int status;
+	int *sizes;
+
+	tst_res(TINFO, "bufsize=%d, remote_iovecs=%d, local_iovecs=%d", bufsize,
+		remote_iovecs, local_iovecs);
+
+	sizes = SAFE_MALLOC(remote_iovecs * sizeof(int));
+	create_data_size(sizes, remote_iovecs, bufsize);
+
+	pid_alloc = SAFE_FORK();
+	if (!pid_alloc) {
+		child_alloc(sizes, remote_iovecs);
+		return;
+	}
+
+	TST_CHECKPOINT_WAIT(0);
+
+	pid_invoke = SAFE_FORK();
+	if (!pid_invoke) {
+		child_invoke(sizes, local_iovecs, remote_iovecs, pid_alloc, bufsize);
+		return;
+	}
+
+	SAFE_WAITPID(pid_invoke, &status, 0);
+	if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
+		tst_res(TFAIL, "child 1: returns %s", tst_strstatus(status));
+
+	TST_CHECKPOINT_WAKE(0);
+
+	SAFE_WAITPID(pid_alloc, &status, 0);
 }
+
+static struct tst_test test = {
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+	.tcnt = ARRAY_SIZE(testcases),
+	.min_kver = "2.0",
+};
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
