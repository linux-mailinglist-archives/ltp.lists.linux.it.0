Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D7F75DCC8
	for <lists+linux-ltp@lfdr.de>; Sat, 22 Jul 2023 15:49:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 878863C94AF
	for <lists+linux-ltp@lfdr.de>; Sat, 22 Jul 2023 15:49:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4818B3C9331
 for <ltp@lists.linux.it>; Sat, 22 Jul 2023 15:49:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4121A1400B82
 for <ltp@lists.linux.it>; Sat, 22 Jul 2023 15:49:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6931A21D81
 for <ltp@lists.linux.it>; Sat, 22 Jul 2023 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690033791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Vxq6msP2F/WiipV1gIgbTQjdtrk5GTA6sHDXzPgot0Y=;
 b=orYXWpnygzPa7RslpcBEuaT42LAb+qy1cGMHp0ACB4/7KwwFdl83v7Iruw6A9Bpq2PRvJl
 eTJl97KtbUZZd2v6dSs2QjePpA8IezZQA8CvCsurdUoYxZg9xSU5ufQtbQR/t2Y6gBh2bD
 9Ou3g1g6A7/+XvIl+vB4z3jj9bQEdB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690033791;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Vxq6msP2F/WiipV1gIgbTQjdtrk5GTA6sHDXzPgot0Y=;
 b=E0xwyQgRPgJwgScd+Cr+HrbwqMA0VoBF4oV8W7pA+ewnNUz4uYJhf5XMri2UbHOpJpMANq
 x+TWVLoaIcdfXCDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5EC51322C
 for <ltp@lists.linux.it>; Sat, 22 Jul 2023 13:49:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Qc9xLn7eu2RGQgAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Sat, 22 Jul 2023 13:49:50 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Sat, 22 Jul 2023 19:19:34 +0530
Message-ID: <20230722134949.15684-1-akumar@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/pipe07: Rewrite the test using new LTP API
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

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/pipe/pipe07.c | 201 +++++++-----------------
 1 file changed, 60 insertions(+), 141 deletions(-)

diff --git a/testcases/kernel/syscalls/pipe/pipe07.c b/testcases/kernel/syscalls/pipe/pipe07.c
index 55bb9f419..ed3ca6336 100644
--- a/testcases/kernel/syscalls/pipe/pipe07.c
+++ b/testcases/kernel/syscalls/pipe/pipe07.c
@@ -1,176 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2002
- *               Ported by Paul Larson
+ *  Ported by Paul Larson
  * Copyright (c) 2013 Cyril Hrubis <chrubis@suse.cz>
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
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Copyright (c) 2023 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
  */
 
-/*
- * Test the ability of pipe to open the maximum even number of file
- * descriptors permitted (or (maxfds - 3)/2 pipes)
+/*\
+ * [Description]
  *
- * ALGORITHM
- *      1. record file descriptors open prior to test run
- * 	2. open pipes until EMFILE is returned
- * 	3. check to see that the number of pipes opened is (maxfds - 3) / 2
- * 	4. close all fds in range 0, maximal fd that were not open prior to
- * 	   the test execution
+ * Verify that, pipe(2) syscall can open the maximum number of
+ * file descriptors permitted.
  */
-#include <unistd.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <dirent.h>
-
-#include "test.h"
-#include "safe_macros.h"
 
-char *TCID = "pipe07";
-int TST_TOTAL = 1;
-
-/* used to record file descriptors open at the test start */
-static int rec_fds[128];
-static int rec_fds_max;
-static void record_open_fds(void);
-static void close_test_fds(int max_fd);
+#include "tst_test.h"
+#include <stdlib.h>
 
-static void setup(void);
-static void cleanup(void);
+static int *opened_fds, *pipe_fds;
+static int num_opened_fds, num_pipe_fds, exp_num_pipe_fds;
 
-int main(int ac, char **av)
+static void record_open_fds(void)
 {
-	int lc;
-	int min, ret;
-	int npipes;
-	int pipes[2], max_fd = 0;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	DIR *dir;
+	struct dirent *ent;
+	int fd;
 
-	min = getdtablesize() - rec_fds_max;
+	dir = SAFE_OPENDIR("/proc/self/fd");
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (npipes = 0;; npipes++) {
-			ret = pipe(pipes);
-			if (ret < 0) {
-				if (errno != EMFILE) {
-					tst_brkm(TFAIL, cleanup,
-						 "got unexpected error - %d",
-						 errno);
-				}
-				break;
-			}
-
-			max_fd = MAX(pipes[0], max_fd);
-			max_fd = MAX(pipes[1], max_fd);
-		}
-
-		if (npipes == (min / 2))
-			tst_resm(TPASS, "Opened %d pipes", npipes);
-		else
-			tst_resm(TFAIL, "Unable to open maxfds/2 pipes");
-
-		close_test_fds(max_fd);
-		max_fd = 0;
+	while ((ent = SAFE_READDIR(dir))) {
+		if (!strcmp(ent->d_name, ".") ||
+			!strcmp(ent->d_name, ".."))
+			continue;
+		fd = atoi(ent->d_name);
+		opened_fds = SAFE_REALLOC(opened_fds, (num_opened_fds + 1) * sizeof(int));
+		opened_fds[num_opened_fds++] = fd;
 	}
-
-	cleanup();
-	tst_exit();
 }
 
 static void setup(void)
 {
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-	TEST_PAUSE;
+	int max_fds;
+
+	max_fds = getdtablesize();
+	tst_res(TINFO, "getdtablesize() = %d", max_fds);
+	pipe_fds = SAFE_MALLOC(max_fds * sizeof(int));
 
 	record_open_fds();
+	tst_res(TINFO, "open fds before pipe() calls: %d", num_opened_fds);
+
+	exp_num_pipe_fds = max_fds - num_opened_fds;
+	exp_num_pipe_fds = (exp_num_pipe_fds % 2) ?
+						(exp_num_pipe_fds - 1) : exp_num_pipe_fds;
+	tst_res(TINFO, "expected max fds to be opened by pipe(): %d", exp_num_pipe_fds);
 }
 
-static void record_open_fds(void)
+static void run(void)
 {
-	DIR *dir = opendir("/proc/self/fd");
-	int dir_fd, fd;
-	struct dirent *file;
+	int fds[2];
 
-	if (dir == NULL)
-		tst_brkm(TBROK | TERRNO, cleanup, "opendir()");
-
-	dir_fd = dirfd(dir);
-
-	if (dir_fd == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "dirfd()");
-
-	errno = 0;
-
-	while ((file = readdir(dir))) {
-		if (!strcmp(file->d_name, ".") || !strcmp(file->d_name, ".."))
-			continue;
-
-		fd = atoi(file->d_name);
-
-		if (fd == dir_fd)
-			continue;
-
-		if (rec_fds_max >= (int)ARRAY_SIZE(rec_fds)) {
-			tst_brkm(TBROK, cleanup,
-			         "Too much file descriptors open");
+	do {
+		TEST(pipe(fds));
+		if (TST_RET != -1) {
+			pipe_fds[num_pipe_fds++] = fds[0];
+			pipe_fds[num_pipe_fds++] = fds[1];
 		}
+	} while (TST_RET != -1);
 
-		rec_fds[rec_fds_max++] = fd;
-	}
-
-	if (errno)
-		tst_brkm(TBROK | TERRNO, cleanup, "readdir()");
+	TST_EXP_EQ_LI(errno, EMFILE);
+	TST_EXP_EQ_LI(exp_num_pipe_fds, num_pipe_fds);
 
-	closedir(dir);
+	for (int i = 0; i < num_pipe_fds; i++)
+		SAFE_CLOSE(pipe_fds[i]);
 
-	tst_resm(TINFO, "Found %u files open", rec_fds_max);
+	num_pipe_fds = 0;
 }
 
-static int not_recorded(int fd)
+static void cleanup(void)
 {
-	int i;
+	if (opened_fds)
+		free(opened_fds);
 
-	for (i = 0; i < rec_fds_max; i++)
-		if (fd == rec_fds[i])
-			return 0;
+	if (pipe_fds)
+		free(pipe_fds);
 
-	return 1;
-}
-
-static void close_test_fds(int max_fd)
-{
-	int i;
-
-	for (i = 0; i <= max_fd; i++) {
-		if (not_recorded(i)) {
-			if (close(i)) {
-				if (errno == EBADF)
-					continue;
-				tst_resm(TWARN | TERRNO, "close(%i)", i);
-			}
-		}
-	}
+	for (int i = 0; i < num_pipe_fds; i++)
+		if (pipe_fds[i])
+			SAFE_CLOSE(pipe_fds[i]);
 }
 
-static void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run
+};
-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
