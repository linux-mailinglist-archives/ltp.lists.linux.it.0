Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A5649C5F7
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jan 2022 10:14:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D6B33C95EF
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jan 2022 10:14:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 123273C9402
 for <ltp@lists.linux.it>; Wed, 26 Jan 2022 10:14:40 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1590C1400DC7
 for <ltp@lists.linux.it>; Wed, 26 Jan 2022 10:14:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 39B7A21117;
 Wed, 26 Jan 2022 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643188478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7sie3Z3WaGoiI2+6qCtFnTvJdcxBoZpFEgaXhUa1jaA=;
 b=yvLkVkxUR7GxKyLY3IKkdBE/H82gatCHH6M0zXy2Pmw6peyRVkpyA9A7azMJHNhY4R+HYz
 1EFXKiLR+ZGsDVogth/CZpo/WUlOcTDfQ1s5c2pj7OVSeSwG7hpV5NP8q7OxQnvvmSHbN4
 aqHRb48EMmpLPPnEMu0yosrLcPMO2Rk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643188478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7sie3Z3WaGoiI2+6qCtFnTvJdcxBoZpFEgaXhUa1jaA=;
 b=85vI92EV4GsIgp5iomc5fv+XVSQvr9eEkJbctqsEJvU9hSHUC5baVah2kH+kjlQk/waBB2
 o6PW/YOFLE37IRDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 111DB13B8D;
 Wed, 26 Jan 2022 09:14:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XeP4Af4Q8WFuQQAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Wed, 26 Jan 2022 09:14:38 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Wed, 26 Jan 2022 10:14:35 +0100
Message-Id: <20220126091435.16022-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3] Rewrite process_vm_readv02.c test with new LTP API
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

Removed pipe and replaced with shared memory.
Replaced TST_CHECKPOINT_INIT usage with .needs_checkpoints from the new
LTP API.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
Since we compare length, there's no need to alloc length+1 size when
reading remote VM
 .../kernel/syscalls/cma/process_vm_readv02.c  | 217 +++++++-----------
 1 file changed, 88 insertions(+), 129 deletions(-)

diff --git a/testcases/kernel/syscalls/cma/process_vm_readv02.c b/testcases/kernel/syscalls/cma/process_vm_readv02.c
index b705b946b..ed905a735 100644
--- a/testcases/kernel/syscalls/cma/process_vm_readv02.c
+++ b/testcases/kernel/syscalls/cma/process_vm_readv02.c
@@ -1,164 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2012
  * Copyright (c) Linux Test Project, 2012
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/* \
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
+ * Fork two children, one child allocates memory and initializes it;
+ * then the other one calls process_vm_readv and reads from the same
+ * memory location, it then verifies if process_vm_readv returns
+ * correct data.
  */
 
-#define _GNU_SOURCE
+#include <stdio.h>
 #include <sys/types.h>
-#include <sys/uio.h>
 #include <sys/wait.h>
-#include <errno.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 #include "lapi/syscalls.h"
 
-char *TCID = "process_vm_readv02";
-int TST_TOTAL = 1;
-
-static char *tst_string = "THIS IS A TEST";
-static int len;
-static int pipe_fd[2];
-static pid_t pids[2];
+static uintptr_t *data_ptr;
 
-static void child_alloc(void);
-static void child_invoke(void);
-static void setup(void);
-static void cleanup(void);
-
-int main(int argc, char **argv)
-{
-	int lc, status;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		len = strlen(tst_string);
-
-		SAFE_PIPE(cleanup, pipe_fd);
-
-		/* the start of child_alloc and child_invoke is already
-		 * synchronized via pipe */
-		pids[0] = fork();
-		switch (pids[0]) {
-		case -1:
-			tst_brkm(TBROK | TERRNO, cleanup, "fork #0");
-		case 0:
-			child_alloc();
-			exit(0);
-		}
-
-		pids[1] = fork();
-		switch (pids[1]) {
-		case -1:
-			tst_brkm(TBROK | TERRNO, cleanup, "fork #1");
-		case 0:
-			child_invoke();
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
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-static void child_alloc(void)
+static void child_alloc(const char *data)
 {
 	char *foo;
-	char buf[BUFSIZ];
 
-	foo = SAFE_MALLOC(tst_exit, len + 1);
-	strncpy(foo, tst_string, len);
-	foo[len] = '\0';
-	tst_resm(TINFO, "child 0: memory allocated and initialized.");
+	foo = strdup(data);
+	*data_ptr = (uintptr_t)foo;
 
-	/* passing addr of string "foo" via pipe */
-	SAFE_CLOSE(tst_exit, pipe_fd[0]);
-	snprintf(buf, BUFSIZ, "%p", foo);
-	SAFE_WRITE(tst_exit, 1, pipe_fd[1], buf, strlen(buf) + 1);
-	SAFE_CLOSE(tst_exit, pipe_fd[1]);
+	tst_res(TINFO, "child 0: memory allocated and initialized");
 
-	/* wait until child_invoke is done reading from our VM */
-	TST_SAFE_CHECKPOINT_WAIT(cleanup, 0);
+	/* wake and wait until child_invoke is done reading from our VM */
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
 }
 
-static void child_invoke(void)
+static void child_invoke(const char *data, int length, pid_t pid_alloc)
 {
-	char *lp, *rp;
-	char buf[BUFSIZ];
+	char *lp;
 	struct iovec local, remote;
 
-	/* get addr from pipe */
-	SAFE_CLOSE(tst_exit, pipe_fd[1]);
-	SAFE_READ(tst_exit, 0, pipe_fd[0], buf, BUFSIZ);
-	SAFE_CLOSE(tst_exit, pipe_fd[0]);
-	if (sscanf(buf, "%p", &rp) != 1)
-		tst_brkm(TBROK | TERRNO, tst_exit, "sscanf");
-
-	lp = SAFE_MALLOC(tst_exit, len + 1);
+	lp = SAFE_MALLOC(length);
 	local.iov_base = lp;
-	local.iov_len = len;
-	remote.iov_base = rp;
-	remote.iov_len = len;
-
-	tst_resm(TINFO, "child 1: reading string from same memory location.");
-	TEST(tst_syscall(__NR_process_vm_readv, pids[0],
-			 &local, 1UL, &remote, 1UL, 0UL));
-	if (TEST_RETURN != len)
-		tst_brkm(TFAIL | TTERRNO, tst_exit, "process_vm_readv");
-	if (strncmp(lp, tst_string, len) != 0)
-		tst_brkm(TFAIL, tst_exit, "child 1: expected string: %s, "
-			 "received string: %256s", tst_string, lp);
+	local.iov_len = length;
+	remote.iov_base = (void *)*data_ptr;
+	remote.iov_len = length;
+
+	tst_res(TINFO, "child 1: reading string from same memory location");
+
+	TEST(tst_syscall(__NR_process_vm_readv, pid_alloc, &local, 1UL, &remote,
+					 1UL, 0UL));
+
+	if (TST_RET != length)
+		tst_brk(TBROK, "process_vm_readv: %s", tst_strerrno(-TST_RET));
+
+	if (strncmp(lp, data, length) != 0)
+		tst_res(TFAIL, "child 1: expected string: %s, received string: %256s",
+				data, lp);
 	else
-		tst_resm(TPASS, "expected string received.");
+		tst_res(TPASS, "expected string received");
 }
 
 static void setup(void)
 {
-	tst_require_root();
-
 	/* Just a sanity check of the existence of syscall */
 	tst_syscall(__NR_process_vm_readv, getpid(), NULL, 0UL, NULL, 0UL, 0UL);
 
-	tst_tmpdir();
-	TST_CHECKPOINT_INIT(cleanup);
-
-	TEST_PAUSE;
+	data_ptr = SAFE_MMAP(NULL, sizeof(uintptr_t), PROT_READ | PROT_WRITE,
+						 MAP_SHARED | MAP_ANONYMOUS, -1, 0);
 }
 
 static void cleanup(void)
 {
-	tst_rmdir();
+	if (data_ptr)
+		SAFE_MUNMAP(data_ptr, BUFSIZ);
+}
+
+static void run(void)
+{
+	const char *data = "test";
+	pid_t pid_alloc;
+	pid_t pid_invoke;
+	int length;
+	int status;
+
+	length = strlen(data);
+
+	pid_alloc = SAFE_FORK();
+	if (!pid_alloc) {
+		child_alloc(data);
+		return;
+	}
+
+	/* wait until child_alloc has allocated VM */
+	TST_CHECKPOINT_WAIT(0);
+
+	pid_invoke = SAFE_FORK();
+	if (!pid_invoke) {
+		child_invoke(data, length, pid_alloc);
+		return;
+	}
+
+	/* wait until child_invoke reads from child_alloc's VM */
+	SAFE_WAITPID(pid_invoke, &status, 0);
+	if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
+		tst_res(TFAIL, "child 1: returns %d", status);
+
+	/* child_alloc is free to exit now */
+	TST_CHECKPOINT_WAKE(0);
+
+	SAFE_WAITPID(pid_alloc, &status, 0);
+	if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
+		tst_res(TFAIL, "child 0: returns %d", status);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
