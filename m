Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A1449E271
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jan 2022 13:36:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A9A13C974C
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jan 2022 13:36:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0085B3C2AE9
 for <ltp@lists.linux.it>; Thu, 27 Jan 2022 13:36:54 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4270D60064B
 for <ltp@lists.linux.it>; Thu, 27 Jan 2022 13:36:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 66593218B8;
 Thu, 27 Jan 2022 12:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643287013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0UjwhoUuNglPW1ZZ77YdZKj9QIX5Ln7J2eTJ/tC4zc0=;
 b=wnZgKianUiYvw2YOoRJ8cyUuI64FrMgZTkSPDr2rRObZTjWlKeoen0kFiW3haaYPr7V8e0
 4WYjFMK8iMQlyagleCwsMpFy/jBfSRhoiCRoG7pPLKr1SLo9A9pBJFI8+hfGeKWPeMtlYs
 JankHMVbNhjma9XHmPXIh3cryskyp78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643287013;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0UjwhoUuNglPW1ZZ77YdZKj9QIX5Ln7J2eTJ/tC4zc0=;
 b=+iv51DKmvqagTwW6/TFx2NrwZzu8N6KxHIao+xLTWknglHqq4XKQ/9ijvM8y+WECZw0otZ
 TeP9Xa3WtX2EgZBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33F3113B46;
 Thu, 27 Jan 2022 12:36:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qVmbCuWR8mGqBQAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Thu, 27 Jan 2022 12:36:53 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Thu, 27 Jan 2022 13:36:51 +0100
Message-Id: <20220127123651.1850-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Rewrite process_vm_writev02.c using new LTP API
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
 .../kernel/syscalls/cma/process_vm_writev02.c | 268 +++++++-----------
 1 file changed, 100 insertions(+), 168 deletions(-)

diff --git a/testcases/kernel/syscalls/cma/process_vm_writev02.c b/testcases/kernel/syscalls/cma/process_vm_writev02.c
index e70ead4ed..1cf44a414 100644
--- a/testcases/kernel/syscalls/cma/process_vm_writev02.c
+++ b/testcases/kernel/syscalls/cma/process_vm_writev02.c
@@ -1,205 +1,137 @@
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
+ * Fork two children, the first one allocates a chunk of memory and the
+ * other one call process_vm_writev to write known data into the first
+ * child. Then first child verifies that the data is as expected.
  */
 
-#define _GNU_SOURCE
+#include <stdlib.h>
 #include <sys/types.h>
 #include <sys/uio.h>
-#include <sys/wait.h>
-#include <errno.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <limits.h>
-
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 #include "lapi/syscalls.h"
 
-char *TCID = "process_vm_writev02";
-int TST_TOTAL = 1;
-
-#define PADDING_SIZE 10
-#define DEFAULT_CHAR 53
+static uintptr_t *data_ptr;
+static char *str_buffsize;
+static int bufsize = 100000;
 
-static int sflag;
-static char *sz_opt;
-static option_t options[] = {
-	{"s:", &sflag, &sz_opt},
-	{NULL, NULL, NULL}
-};
+static void child_alloc_and_verify(int buffsize)
+{
+	char foo[buffsize];
+	int i;
+	int err;
 
-static long bufsz;
-static int pipe_fd[2];
-static pid_t pids[2];
+	tst_res(TINFO, "child 0: allocate memory");
 
-static void child_init_and_verify(void);
-static void child_write(void);
-static void setup(void);
-static void cleanup(void);
-static void help(void);
+	memset(foo, 'a', buffsize);
+	*data_ptr = (uintptr_t)foo;
 
-int main(int argc, char **argv)
-{
-	int lc, status;
-
-	tst_parse_opts(argc, argv, options, &help);
-
-	setup();
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		SAFE_PIPE(cleanup, pipe_fd);
-
-		/* the start of child_init_and_verify and child_write is
-		 * already synchronized via pipe */
-		pids[0] = fork();
-		switch (pids[0]) {
-		case -1:
-			tst_brkm(TBROK | TERRNO, cleanup, "fork #0");
-		case 0:
-			child_init_and_verify();
-			exit(0);
-		default:
-			break;
-		}
-
-		pids[1] = fork();
-		switch (pids[1]) {
-		case -1:
-			tst_brkm(TBROK | TERRNO, cleanup, "fork #1");
-		case 0:
-			child_write();
-			exit(0);
-		}
-
-		/* wait until child_write writes into
-		 * child_init_and_verify's VM */
-		SAFE_WAITPID(cleanup, pids[1], &status, 0);
-		if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
-			tst_resm(TFAIL, "child 1 returns %d", status);
-
-		/* signal child_init_and_verify to verify its VM now */
-		TST_SAFE_CHECKPOINT_WAKE(cleanup, 0);
-
-		SAFE_WAITPID(cleanup, pids[0], &status, 0);
-		if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
-			tst_resm(TFAIL, "child 0 returns %d", status);
-	}
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
 
-	cleanup();
-	tst_exit();
-}
+	err = 0;
+	for (i = 0; i < buffsize; i++)
+		if (foo[i] != 'w')
+			err++;
 
-static void child_init_and_verify(void)
-{
-	unsigned char *foo;
-	char buf[bufsz];
-	long i, nr_err;
-
-	foo = SAFE_MALLOC(tst_exit, bufsz);
-	for (i = 0; i < bufsz; i++)
-		foo[i] = DEFAULT_CHAR;
-	tst_resm(TINFO, "child 0: memory allocated.");
-
-	/* passing addr of string "foo" via pipe */
-	SAFE_CLOSE(tst_exit, pipe_fd[0]);
-	snprintf(buf, bufsz, "%p", foo);
-	SAFE_WRITE(tst_exit, 1, pipe_fd[1], buf, strlen(buf) + 1);
-	SAFE_CLOSE(tst_exit, pipe_fd[1]);
-
-	/* wait until child_write() is done writing to our VM */
-	TST_SAFE_CHECKPOINT_WAIT(cleanup, 0);
-
-	nr_err = 0;
-	for (i = 0; i < bufsz; i++) {
-		if (foo[i] != i % 256) {
-#if DEBUG
-			tst_resm(TFAIL, "child 0: expected %i, got %i for "
-				 "byte seq %ld", i % 256, foo[i], i);
-#endif
-			nr_err++;
-		}
-	}
-	if (nr_err)
-		tst_brkm(TFAIL, tst_exit, "child 0: got %ld incorrect bytes.",
-			 nr_err);
+	if (err)
+		tst_res(TFAIL, "child 0: found %d differences from expected data", err);
 	else
-		tst_resm(TPASS, "child 0: all bytes are expected.");
+		tst_res(TPASS, "child 0: read back expected data");
 }
 
-static void child_write(void)
+static void child_write(int buffsize, pid_t pid_alloc)
 {
-	unsigned char *lp, *rp;
-	char buf[bufsz];
+	char lp[buffsize];
 	struct iovec local, remote;
-	long i;
-
-	/* get addr from pipe */
-	SAFE_CLOSE(tst_exit, pipe_fd[1]);
-	SAFE_READ(tst_exit, 0, pipe_fd[0], buf, bufsz);
-	SAFE_CLOSE(tst_exit, pipe_fd[0]);
-	if (sscanf(buf, "%p", &rp) != 1)
-		tst_brkm(TBROK | TERRNO, tst_exit, "sscanf");
-
-	lp = SAFE_MALLOC(tst_exit, bufsz + PADDING_SIZE * 2);
-
-	for (i = 0; i < bufsz + PADDING_SIZE * 2; i++)
-		lp[i] = DEFAULT_CHAR;
-	for (i = 0; i < bufsz; i++)
-		lp[i + PADDING_SIZE] = i % 256;
-
-	local.iov_base = lp + PADDING_SIZE;
-	local.iov_len = bufsz;
-	remote.iov_base = rp;
-	remote.iov_len = bufsz;
-
-	tst_resm(TINFO, "child 2: write to the same memory location.");
-	TEST(tst_syscall(__NR_process_vm_writev, pids[0], &local,
-			 1UL, &remote, 1UL, 0UL));
-	if (TEST_RETURN != bufsz)
-		tst_brkm(TFAIL | TTERRNO, tst_exit, "process_vm_readv");
+
+	tst_res(TINFO, "child 1: write to the same memory location");
+
+	memset(lp, 'w', buffsize);
+
+	local.iov_base = lp;
+	local.iov_len = buffsize;
+	remote.iov_base = (void *)*data_ptr;
+	remote.iov_len = buffsize;
+
+	TEST(tst_syscall(__NR_process_vm_writev, pid_alloc, &local, 1UL, &remote,
+					 1UL, 0UL));
+
+	if (TST_RET < 0)
+		tst_brk(TBROK, "process_vm_writev: %s", tst_strerrno(-TST_RET));
+
+	if (TST_RET != buffsize)
+		tst_brk(TBROK, "process_vm_writev: expected %d bytes but got %ld",
+				buffsize, TST_RET);
 }
 
 static void setup(void)
 {
-	tst_require_root();
-
 	/* Just a sanity check of the existence of syscall */
 	tst_syscall(__NR_process_vm_writev, getpid(), NULL, 0UL, NULL, 0UL, 0UL);
 
-	bufsz =
-	    sflag ? SAFE_STRTOL(NULL, sz_opt, 1, LONG_MAX - PADDING_SIZE * 2)
-	    : 100000;
+	if (tst_parse_int(str_buffsize, &bufsize, 1, INT_MAX))
+		tst_brk(TBROK, "Invalid buffer size '%s'", str_buffsize);
 
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
+		SAFE_MUNMAP(data_ptr, sizeof(uintptr_t));
 }
 
-static void help(void)
+static void run(void)
 {
-	printf("    -s NUM  Set the size of total buffer size.\n");
+	pid_t pid_alloc;
+	pid_t pid_write;
+	int status;
+
+	pid_alloc = SAFE_FORK();
+	if (!pid_alloc) {
+		child_alloc_and_verify(bufsize);
+		return;
+	}
+
+	/* wait until child_alloc_and_verify has allocated VM */
+	TST_CHECKPOINT_WAIT(0);
+
+	pid_write = SAFE_FORK();
+	if (!pid_write) {
+		child_write(bufsize, pid_alloc);
+		return;
+	}
+
+	/* wait until pid_write reads from child_alloc_and_verify's VM */
+	SAFE_WAITPID(pid_write, &status, 0);
+	if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
+		tst_res(TFAIL, "child 1: returns %d", status);
+
+	/* child_alloc_and_verify is free to exit now */
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
+	.options = (struct tst_option[]) {
+		{"s:", &str_buffsize, "Total buffer size (default 100000)"},
+		{},
+	},
+};
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
