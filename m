Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E4F4B21DF
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 10:28:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FE1F3C9F11
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 10:28:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E8FA3C9EEA
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 10:26:54 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B55C2100137D
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 10:26:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 593812112A;
 Fri, 11 Feb 2022 09:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644571613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KxsaoypdrfC60P+BuOWrglcqSaB0IyEQ/xdu9c/NpgE=;
 b=VRGaD2pLFwnvpWXkf4XneVEVbAOHnAOoWoe3C0qa45gb+kN6w0N6VuvyQqsrwe0xqxoTAQ
 ErOjZAJCPCKhaZ1jSp9wzqnLSLrn3ebxzExmTRm5xQPrsmjy+kpXREircDrImmBm8LbN36
 +jftpE+shjuPnbxoQpZ/bOPBSykNHGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644571613;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KxsaoypdrfC60P+BuOWrglcqSaB0IyEQ/xdu9c/NpgE=;
 b=YZDcxv23v3hjawOKh12xZYiiVVr0jyXzSJ6+Tl1DBl7E+SIjzbBsQ8epR02Sg4NUoLo7L7
 PLz+7hvoCCw+IHDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3332413BCF;
 Fri, 11 Feb 2022 09:26:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8KddCt0rBmJ7EwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Fri, 11 Feb 2022 09:26:53 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri, 11 Feb 2022 10:26:45 +0100
Message-Id: <20220211092646.23748-8-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211092646.23748-1-andrea.cervesato@suse.de>
References: <20220211092646.23748-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1 7/8] Rewrite userns07.c using new LTP API
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

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
 testcases/kernel/containers/userns/userns07.c | 126 ++++++++----------
 1 file changed, 52 insertions(+), 74 deletions(-)

diff --git a/testcases/kernel/containers/userns/userns07.c b/testcases/kernel/containers/userns/userns07.c
index 49915969e..03b2a49fe 100644
--- a/testcases/kernel/containers/userns/userns07.c
+++ b/testcases/kernel/containers/userns/userns07.c
@@ -1,47 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Huawei Technologies Co., Ltd., 2015
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
  */
 
-/*
+/*\
+ * [Description]
+ *
  * Verify that:
  * The kernel imposes a limit of at least 32 nested levels on user namespaces.
  */
 
 #define _GNU_SOURCE
-#include <sys/wait.h>
-#include <assert.h>
+
 #include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <string.h>
-#include <errno.h>
-#include "userns_helper.h"
-#include "test.h"
+#include <stdbool.h>
+#include <sys/wait.h>
+#include "common.h"
+#include "tst_test.h"
 
 #define MAXNEST 32
 
-char *TCID = "userns07";
-int TST_TOTAL = 1;
-
 static void setup(void)
 {
 	check_newuser();
-	tst_tmpdir();
-	TST_CHECKPOINT_INIT(NULL);
-}
-
-static void cleanup(void)
-{
-	tst_rmdir();
 }
 
 static int child_fn1(void *arg)
@@ -52,40 +34,42 @@ static int child_fn1(void *arg)
 	int parentuid;
 	int parentgid;
 
-	TST_SAFE_CHECKPOINT_WAIT(NULL, 0);
+	TST_CHECKPOINT_WAIT(0);
 
-	if (level == MAXNEST)
+	if (level == MAXNEST) {
+		tst_res(TPASS, "nested all children");
 		return 0;
-	cpid1 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD,
-		(void *)child_fn1, (void *)(level + 1));
-	if (cpid1 < 0) {
-		printf("level %ld:unexpected error: (%d) %s\n",
-			level, errno, strerror(errno));
+	}
+
+	TEST(ltp_clone_quick(CLONE_NEWUSER | SIGCHLD, (void *)child_fn1,
+			     (void *)(level + 1)));
+	if (TST_RET < 0) {
+		tst_res(TFAIL, "level %ld, unexpected error: (%d) %s", level,
+			TST_ERR, tst_strerrno(TST_ERR));
 		return 1;
 	}
 
+	cpid1 = (int)TST_RET;
+
 	parentuid = geteuid();
 	parentgid = getegid();
 
-	updatemap(cpid1, UID_MAP, 0, parentuid, NULL);
-	updatemap(cpid1, GID_MAP, 0, parentgid, NULL);
+	updatemap(cpid1, UID_MAP, 0, parentuid);
+	updatemap(cpid1, GID_MAP, 0, parentgid);
 
-	TST_SAFE_CHECKPOINT_WAKE(cleanup, 0);
+	TST_CHECKPOINT_WAKE(0);
 
-	if (waitpid(cpid1, &status, 0) == -1)
-		return 1;
+	SAFE_WAITPID(cpid1, &status, 0);
+
+	if (WIFEXITED(status) && WEXITSTATUS(status) != 0)
+		tst_brk(TBROK, "child exited abnormally %s", tst_strstatus(status));
+	else if (WIFSIGNALED(status))
+		tst_brk(TBROK, "child was killed with signal = %d", WTERMSIG(status));
 
-	if (WIFEXITED(status) && WEXITSTATUS(status) != 0) {
-		printf("child exited abnormally\n");
-		return 1;
-	} else if (WIFSIGNALED(status)) {
-		printf("child was killed with signal = %d", WTERMSIG(status));
-		return 1;
-	}
 	return 0;
 }
 
-static void test_max_nest(void)
+static void run(void)
 {
 	pid_t cpid1;
 	int parentuid;
@@ -93,41 +77,35 @@ static void test_max_nest(void)
 	int fd;
 	char path[BUFSIZ];
 
-	cpid1 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD,
-		(void *)child_fn1, (void *)0);
+	cpid1 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD, (void *)child_fn1, (void *)0);
 	if (cpid1 < 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "clone failed");
+		tst_brk(TBROK | TTERRNO, "clone failed");
 
 	parentuid = geteuid();
 	parentgid = getegid();
 
 	if (access("/proc/self/setgroups", F_OK) == 0) {
 		sprintf(path, "/proc/%d/setgroups", cpid1);
-		fd = SAFE_OPEN(cleanup, path, O_WRONLY, 0644);
-		SAFE_WRITE(cleanup, 1, fd, "deny", 4);
-		SAFE_CLOSE(cleanup, fd);
-	}
-
-	updatemap(cpid1, UID_MAP, 0, parentuid, cleanup);
-	updatemap(cpid1, GID_MAP, 0, parentgid, cleanup);
 
-	TST_SAFE_CHECKPOINT_WAKE(cleanup, 0);
-	tst_record_childstatus(cleanup, cpid1);
-}
-
-int main(int argc, char *argv[])
-{
-	int lc;
-
-	setup();
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		test_max_nest();
+		fd = SAFE_OPEN(path, O_WRONLY, 0644);
+		SAFE_WRITE(1, fd, "deny", 4);
+		SAFE_CLOSE(fd);
 	}
 
-	cleanup();
-	tst_exit();
+	updatemap(cpid1, UID_MAP, 0, parentuid);
+	updatemap(cpid1, GID_MAP, 0, parentgid);
+
+	TST_CHECKPOINT_WAKE(0);
 }
 
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.needs_root = 1,
+	.needs_checkpoints = 1,
+	.needs_kconfigs =
+		(const char *[]){
+			"CONFIG_USER_NS",
+			NULL,
+		},
+};
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
