Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB30B4B21DC
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 10:27:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADDEE3C9EEB
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 10:27:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 445FE3C9EEB
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 10:26:54 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 88EC3601098
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 10:26:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35F3D1F3AA;
 Fri, 11 Feb 2022 09:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644571613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYj5uqupm2ON+ZyMwmVWTEh2LHrz1YbP9bXfeu5EnOo=;
 b=iziIOMEpHBdrl3dnpcf091n5xpfmEk1wTQnozdvBjIeasCiEO7h9Bok5EgE/oxNCoguTB9
 AO1c7uLh4IIAGf713e6vQ8TGa0y4ePw2JbOQj5r3toI4q+7FEim2Ma32vTdYE5KMkKz8sH
 4sL1wIGQucLmfBfnXdlsD5kn4Gxz0rs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644571613;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYj5uqupm2ON+ZyMwmVWTEh2LHrz1YbP9bXfeu5EnOo=;
 b=25w2CJ3OyzZJwyVO3wFatzXAfzlbKTVT7hi53fYuqDRkziqytcgWZH75itPH30vGa7e/cl
 86BE8KEyeNAvnJBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0030B13BC3;
 Fri, 11 Feb 2022 09:26:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2IirOdwrBmJ7EwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Fri, 11 Feb 2022 09:26:52 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri, 11 Feb 2022 10:26:44 +0100
Message-Id: <20220211092646.23748-7-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211092646.23748-1-andrea.cervesato@suse.de>
References: <20220211092646.23748-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1 6/8] Rewrite userns06.c test using new LTP API
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
 testcases/kernel/containers/userns/userns06.c | 175 ++++++++----------
 .../containers/userns/userns06_capcheck.c     |  75 +++++---
 2 files changed, 125 insertions(+), 125 deletions(-)

diff --git a/testcases/kernel/containers/userns/userns06.c b/testcases/kernel/containers/userns/userns06.c
index 29f635de5..b88718333 100644
--- a/testcases/kernel/containers/userns/userns06.c
+++ b/testcases/kernel/containers/userns/userns06.c
@@ -1,65 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Huawei Technologies Co., Ltd., 2015
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the Free
- * Software Foundation; either version 2 of the License, or (at your option)
- * any later version. This program is distributed in the hope that it will be
- * useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
- * Public License for more details. You should have received a copy of the GNU
- * General Public License along with this program.
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
  */
 
-/*
+/*\
+ * [Description]
+ *
  * Verify that:
  * When a process with non-zero user IDs performs an execve(), the process's
  * capability sets are cleared.
  * When a process with zero user IDs performs an execve(), the process's
  * capability sets are set.
- *
  */
 
+#include "tst_test.h"
+#include "config.h"
+
+#ifdef HAVE_LIBCAP
 #define _GNU_SOURCE
-#include <sys/wait.h>
-#include <assert.h>
+
 #include <stdio.h>
-#include <stdlib.h>
 #include <stdbool.h>
-#include <unistd.h>
-#include <string.h>
-#include <errno.h>
-#include "libclone.h"
-#include "test.h"
-#include "config.h"
-#include "userns_helper.h"
+#include "common.h"
+
+#define TEST_APP "userns06_capcheck"
 
 #define CHILD1UID 0
 #define CHILD1GID 0
 #define CHILD2UID 200
 #define CHILD2GID 200
 
-char *TCID = "user_namespace6";
-int TST_TOTAL = 1;
-
-static int cpid1, parentuid, parentgid;
-
 /*
  * child_fn1() - Inside a new user namespace
  */
 static int child_fn1(void)
 {
-	int exit_val = 0;
-	char *const args[] = { "userns06_capcheck", "privileged", NULL };
+	char *const args[] = { TEST_APP, "privileged", NULL };
 
-	TST_SAFE_CHECKPOINT_WAIT(NULL, 0);
+	TST_CHECKPOINT_WAIT(0);
 
-	if (execve(args[0], args, NULL) == -1) {
-		printf("execvp unexpected error: (%d) %s\n",
-			errno, strerror(errno));
-		exit_val = 1;
-	}
+	/* execv will replace the main function and it will end this child
+	 * accordingly.
+	 */
+	execv(args[0], args);
 
-	return exit_val;
+	return 0;
 }
 
 /*
@@ -67,97 +53,96 @@ static int child_fn1(void)
  */
 static int child_fn2(void)
 {
-	int exit_val = 0;
 	int uid, gid;
-	char *const args[] = { "userns06_capcheck", "unprivileged", NULL };
+	char *const args[] = { TEST_APP, "unprivileged", NULL };
 
-	TST_SAFE_CHECKPOINT_WAIT(NULL, 1);
+	TST_CHECKPOINT_WAIT(1);
 
 	uid = geteuid();
 	gid = getegid();
 
 	if (uid != CHILD2UID || gid != CHILD2GID) {
-		printf("unexpected uid=%d gid=%d\n", uid, gid);
-		exit_val = 1;
+		tst_res(TFAIL, "unexpected uid=%d gid=%d", uid, gid);
+		return 1;
 	}
 
-	if (execve(args[0], args, NULL) == -1) {
-		printf("execvp unexpected error: (%d) %s\n",
-			errno, strerror(errno));
-		exit_val = 1;
-	}
+	tst_res(TPASS, "expected uid and gid");
 
-	return exit_val;
-}
+	/* execv will replace the main function and it will end this child
+	 * accordingly.
+	 */
+	execv(args[0], args);
 
-static void cleanup(void)
-{
-	tst_rmdir();
+	return 0;
 }
 
 static void setup(void)
 {
 	check_newuser();
-	tst_tmpdir();
-	TST_CHECKPOINT_INIT(NULL);
-	TST_RESOURCE_COPY(cleanup, "userns06_capcheck", NULL);
 }
 
-int main(int argc, char *argv[])
+static void run(void)
 {
+	pid_t cpid1;
 	pid_t cpid2;
+	int parentuid;
+	int parentgid;
 	char path[BUFSIZ];
-	int lc;
 	int fd;
 
-	tst_parse_opts(argc, argv, NULL, NULL);
-#ifndef HAVE_LIBCAP
-	tst_brkm(TCONF, NULL, "System is missing libcap.");
-#endif
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
+	parentuid = geteuid();
+	parentgid = getegid();
 
-		parentuid = geteuid();
-		parentgid = getegid();
+	cpid1 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD, (void *)child_fn1, NULL);
+	if (cpid1 < 0)
+		tst_brk(TBROK | TTERRNO, "cpid1 clone failed");
 
-		cpid1 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD,
-			(void *)child_fn1, NULL);
-		if (cpid1 < 0)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				"cpid1 clone failed");
+	cpid2 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD, (void *)child_fn2, NULL);
+	if (cpid2 < 0)
+		tst_brk(TBROK | TTERRNO, "cpid2 clone failed");
 
-		cpid2 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD,
-			(void *)child_fn2, NULL);
-		if (cpid2 < 0)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				"cpid2 clone failed");
+	if (access("/proc/self/setgroups", F_OK) == 0) {
+		sprintf(path, "/proc/%d/setgroups", cpid1);
 
-		if (access("/proc/self/setgroups", F_OK) == 0) {
-			sprintf(path, "/proc/%d/setgroups", cpid1);
-			fd = SAFE_OPEN(cleanup, path, O_WRONLY, 0644);
-			SAFE_WRITE(cleanup, 1, fd, "deny", 4);
-			SAFE_CLOSE(cleanup, fd);
+		fd = SAFE_OPEN(path, O_WRONLY, 0644);
+		SAFE_WRITE(1, fd, "deny", 4);
+		SAFE_CLOSE(fd);
 
-			sprintf(path, "/proc/%d/setgroups", cpid2);
-			fd = SAFE_OPEN(cleanup, path, O_WRONLY, 0644);
-			SAFE_WRITE(cleanup, 1, fd, "deny", 4);
-			SAFE_CLOSE(cleanup, fd);
-		}
+		sprintf(path, "/proc/%d/setgroups", cpid2);
 
-		updatemap(cpid1, UID_MAP, CHILD1UID, parentuid, cleanup);
-		updatemap(cpid2, UID_MAP, CHILD2UID, parentuid, cleanup);
+		fd = SAFE_OPEN(path, O_WRONLY, 0644);
+		SAFE_WRITE(1, fd, "deny", 4);
+		SAFE_CLOSE(fd);
+	}
 
-		updatemap(cpid1, GID_MAP, CHILD1GID, parentgid, cleanup);
-		updatemap(cpid2, GID_MAP, CHILD2GID, parentgid, cleanup);
+	updatemap(cpid1, UID_MAP, CHILD1UID, parentuid);
+	updatemap(cpid2, UID_MAP, CHILD2UID, parentuid);
 
-		TST_SAFE_CHECKPOINT_WAKE(cleanup, 0);
-		TST_SAFE_CHECKPOINT_WAKE(cleanup, 1);
+	updatemap(cpid1, GID_MAP, CHILD1GID, parentgid);
+	updatemap(cpid2, GID_MAP, CHILD2GID, parentgid);
 
-		tst_record_childstatus(cleanup, cpid1);
-		tst_record_childstatus(cleanup, cpid2);
-	}
-	cleanup();
-	tst_exit();
+	TST_CHECKPOINT_WAKE(0);
+	TST_CHECKPOINT_WAKE(1);
 }
+
+static const char *const resource_files[] = {
+	TEST_APP,
+	NULL,
+};
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.needs_root = 1,
+	.needs_checkpoints = 1,
+	.resource_files = resource_files,
+	.needs_kconfigs =
+		(const char *[]){
+			"CONFIG_USER_NS",
+			NULL,
+		},
+};
+
+#else
+TST_TEST_TCONF("System is missing libcap");
+#endif
diff --git a/testcases/kernel/containers/userns/userns06_capcheck.c b/testcases/kernel/containers/userns/userns06_capcheck.c
index 31f7e0a25..d8e670fb1 100644
--- a/testcases/kernel/containers/userns/userns06_capcheck.c
+++ b/testcases/kernel/containers/userns/userns06_capcheck.c
@@ -1,62 +1,66 @@
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
- * Verify that:
+/*\
+ * [Description]
+ *
  * When a process with non-zero user IDs performs an execve(), the
  * process's capability sets are cleared. When a process with zero
  * user IDs performs an execve(), the process's capability sets
  * are set.
  */
 
-#define _GNU_SOURCE
-#include <sys/wait.h>
-#include <assert.h>
+#include "config.h"
 #include <stdio.h>
 #include <stdlib.h>
+
+#ifdef HAVE_LIBCAP
+#define _GNU_SOURCE
+
+#include <assert.h>
 #include <unistd.h>
 #include <string.h>
 #include <errno.h>
-#include "libclone.h"
-#include "test.h"
-#include "config.h"
-#if HAVE_SYS_CAPABILITY_H
+#include <sys/wait.h>
 #include <sys/capability.h>
-#endif
-
-char *TCID = "userns06_capcheck";
-int TST_TOTAL = 1;
 
 int main(int argc, char *argv[])
 {
-#ifdef HAVE_LIBCAP
+	FILE *f = NULL;
 	cap_t caps;
 	int i, last_cap;
 	cap_flag_value_t flag_val;
 	cap_flag_value_t expected_flag = 1;
-#endif
-	tst_parse_opts(argc, argv, NULL, NULL);
 
-#ifdef HAVE_LIBCAP
+	if (argc < 2) {
+		printf("userns06_capcheck <privileged|unprivileged>\n");
+		goto error;
+	}
+
+	f = fopen("/proc/sys/kernel/cap_last_cap", "r");
+	if (f == NULL) {
+		printf("fopen error: %s\n", strerror(errno));
+		goto error;
+	}
+
+	if (!fscanf(f, "%d", &last_cap)) {
+		printf("fscanf error: %s\n", strerror(errno));
+		goto error;
+	}
+
 	if (strcmp("privileged", argv[1]))
 		expected_flag = 0;
 
 	caps = cap_get_proc();
-	SAFE_FILE_SCANF(NULL, "/proc/sys/kernel/cap_last_cap", "%d", &last_cap);
+
 	for (i = 0; i <= last_cap; i++) {
 		cap_get_flag(caps, i, CAP_EFFECTIVE, &flag_val);
 		if (flag_val != expected_flag)
 			break;
+
 		cap_get_flag(caps, i, CAP_PERMITTED, &flag_val);
 		if (flag_val != expected_flag)
 			break;
@@ -64,11 +68,22 @@ int main(int argc, char *argv[])
 
 	if (flag_val != expected_flag) {
 		printf("unexpected effective/permitted caps at %d\n", i);
-		exit(1);
+		goto error;
 	}
 
+	exit(0);
+
+error:
+	if (f)
+		fclose(f);
+
+	exit(1);
+}
+
 #else
+int main(void)
+{
 	printf("System is missing libcap.\n");
-#endif
-	tst_exit();
+	exit(1);
 }
+#endif
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
