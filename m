Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3084B21D6
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 10:27:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C31E3C9EF5
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 10:27:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A1F453C9888
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 10:26:53 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DB22C1001372
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 10:26:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8747E1F38B;
 Fri, 11 Feb 2022 09:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644571612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShgsQW6pZttJ55TaRku8BCS7iu372t9C+rUj9gwRaMY=;
 b=eqALTIzUQPVl2j+dE4gajBZVUcWnmiI1/dihBpf8zmvXQL2tFMKmiaN1WHL0Sdj3V9gp5X
 yeAZKPbfECyY0SIh7WhAZBsDfjdjJGMfRN3cU7dqnNHITniea6guYE0VvYN6pPkw3bae/c
 lqHgEhmvUEYrEA0UhgfXsL7adyKia9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644571612;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShgsQW6pZttJ55TaRku8BCS7iu372t9C+rUj9gwRaMY=;
 b=wXk101yf2Qa4Nl7hzgT8zwKfvKb5xrES3CfbpgkzK/jtgdiJj4O67x9szNd7o0pKnro3kN
 L1imUb/Aio/KpUCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5BB1213BC3;
 Fri, 11 Feb 2022 09:26:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KCvaE9wrBmJ7EwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Fri, 11 Feb 2022 09:26:52 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri, 11 Feb 2022 10:26:41 +0100
Message-Id: <20220211092646.23748-4-andrea.cervesato@suse.de>
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
Subject: [LTP] [PATCH v1 3/8] Rewrite userns03.c test using new LTP API
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
 testcases/kernel/containers/userns/userns03.c | 235 +++++++++---------
 1 file changed, 113 insertions(+), 122 deletions(-)

diff --git a/testcases/kernel/containers/userns/userns03.c b/testcases/kernel/containers/userns/userns03.c
index be511fec8..bc23efb4c 100644
--- a/testcases/kernel/containers/userns/userns03.c
+++ b/testcases/kernel/containers/userns/userns03.c
@@ -1,16 +1,12 @@
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
  * /proc/PID/uid_map and /proc/PID/gid_map contains three values separated by
  * white space:
@@ -34,21 +30,17 @@
  *   commit 66d2f338ee4c449396b6f99f5e75cd18eb6df272
  *   Author: Eric W. Biederman <ebiederm@xmission.com>
  *   Date:   Fri Dec 5 19:36:04 2014 -0600
- *     userns: Allow setting gid_maps without privilege when setgroups is disabled
+ *     userns: Allow setting gid_maps without privilege when setgroups is
+ * disabled
  *
  */
 
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
-#include "userns_helper.h"
-#include "test.h"
+#include "common.h"
+#include "tst_test.h"
 
 #define CHILD1UID 0
 #define CHILD1GID 0
@@ -57,16 +49,16 @@
 #define UID_MAP 0
 #define GID_MAP 1
 
-char *TCID = "user_namespace3";
-int TST_TOTAL = 1;
-static int cpid1, parentuid, parentgid;
+static int cpid1;
+static int parentuid;
+static int parentgid;
 
 /*
  * child_fn1() - Inside a new user namespace
  */
 static int child_fn1(void)
 {
-	TST_SAFE_CHECKPOINT_WAIT(NULL, 0);
+	TST_CHECKPOINT_WAIT(0);
 	return 0;
 }
 
@@ -81,155 +73,154 @@ static int child_fn2(void)
 	char cpid1gidpath[BUFSIZ];
 	int idinsidens, idoutsidens, length;
 
-	TST_SAFE_CHECKPOINT_WAIT(NULL, 1);
+	TST_CHECKPOINT_WAIT(1);
 
 	uid = geteuid();
 	gid = getegid();
 
 	if (uid != CHILD2UID || gid != CHILD2GID) {
-		printf("unexpected uid=%d gid=%d\n", uid, gid);
+		tst_res(TFAIL, "unexpected uid=%d gid=%d\n", uid, gid);
 		exit_val = 1;
+	} else {
+		tst_res(TPASS, "expected uid and gid");
 	}
 
-	/*Get the uid parameters of the child_fn2 process.*/
-	SAFE_FILE_SCANF(NULL, "/proc/self/uid_map", "%d %d %d", &idinsidens,
-		&idoutsidens, &length);
+	/* Get the uid parameters of the child_fn2 process */
+	SAFE_FILE_SCANF("/proc/self/uid_map", "%d %d %d", &idinsidens, &idoutsidens, &length);
 
 	/* map file format:ID-inside-ns   ID-outside-ns   length
-	If the process opening the file is in the same user namespace as
-	the process PID, then ID-outside-ns is defined with respect to the
-	 parent user namespace.*/
+	 * If the process opening the file is in the same user namespace as
+	 * the process PID, then ID-outside-ns is defined with respect to the
+	 * parent user namespace
+	 */
 	if (idinsidens != CHILD2UID || idoutsidens != parentuid) {
-		printf("child_fn2 checks /proc/cpid2/uid_map:\n");
-		printf("unexpected: idinsidens=%d idoutsidens=%d\n",
+		tst_res(TINFO, "child2 checks /proc/cpid2/uid_map");
+		tst_res(TFAIL, "unexpected: namespace ID inside=%d outside=%d",
 			idinsidens, idoutsidens);
 		exit_val = 1;
+	} else {
+		tst_res(TPASS, "expected namespaces IDs");
 	}
 
 	sprintf(cpid1uidpath, "/proc/%d/uid_map", cpid1);
-	SAFE_FILE_SCANF(NULL, cpid1uidpath, "%d %d %d", &idinsidens,
-		&idoutsidens, &length);
+	SAFE_FILE_SCANF(cpid1uidpath, "%d %d %d", &idinsidens, &idoutsidens, &length);
 
 	/* If the process opening the file is in a different user namespace,
-	then ID-outside-ns is defined with respect to the user namespace
-	of the process opening the file.*/
+	 * then ID-outside-ns is defined with respect to the user namespace
+	 * of the process opening the file
+	 */
 	if (idinsidens != CHILD1UID || idoutsidens != CHILD2UID) {
-		printf("child_fn2 checks /proc/cpid1/uid_map:\n");
-		printf("unexpected: idinsidens=%d idoutsidens=%d\n",
+		tst_res(TINFO, "child2 checks /proc/cpid1/uid_map");
+		tst_res(TFAIL, "unexpected: namespace ID inside=%d outside=%d",
 			idinsidens, idoutsidens);
 		exit_val = 1;
+	} else {
+		tst_res(TPASS, "expected namespaces IDs");
 	}
 
 	sprintf(cpid1gidpath, "/proc/%d/gid_map", cpid1);
-	SAFE_FILE_SCANF(NULL, "/proc/self/gid_map", "%d %d %d",
-		 &idinsidens, &idoutsidens, &length);
+	SAFE_FILE_SCANF("/proc/self/gid_map", "%d %d %d", &idinsidens, &idoutsidens, &length);
 
 	if (idinsidens != CHILD2GID || idoutsidens != parentgid) {
-		printf("child_fn2 checks /proc/cpid2/gid_map:\n");
-		printf("unexpected: idinsidens=%d idoutsidens=%d\n",
+		tst_res(TINFO, "child2 checks /proc/cpid2/gid_map");
+		tst_res(TFAIL, "unexpected: namespace ID inside=%d outside=%d",
 			idinsidens, idoutsidens);
 		exit_val = 1;
+	} else {
+		tst_res(TPASS, "expected namespaces IDs");
 	}
 
-	SAFE_FILE_SCANF(NULL, cpid1gidpath, "%d %d %d", &idinsidens,
-		&idoutsidens, &length);
+	SAFE_FILE_SCANF(cpid1gidpath, "%d %d %d", &idinsidens, &idoutsidens, &length);
 
 	if (idinsidens != CHILD1GID || idoutsidens != CHILD2GID) {
-		printf("child_fn1 checks /proc/cpid1/gid_map:\n");
-		printf("unexpected: idinsidens=%d idoutsidens=%d\n",
+		tst_res(TINFO, "child1 checks /proc/cpid1/gid_map");
+		tst_res(TFAIL, "unexpected: namespace ID inside=%d outside=%d",
 			idinsidens, idoutsidens);
 		exit_val = 1;
+	} else {
+		tst_res(TPASS, "expected namespaces IDs");
 	}
 
-	TST_SAFE_CHECKPOINT_WAKE(NULL, 0);
-	TST_SAFE_CHECKPOINT_WAKE(NULL, 1);
-	return exit_val;
-}
+	TST_CHECKPOINT_WAKE(0);
+	TST_CHECKPOINT_WAKE(1);
 
-static void cleanup(void)
-{
-	tst_rmdir();
+	return exit_val;
 }
 
 static void setup(void)
 {
 	check_newuser();
-	tst_tmpdir();
-	TST_CHECKPOINT_INIT(NULL);
 }
 
-int main(int argc, char *argv[])
+static void run(void)
 {
 	pid_t cpid2;
 	char path[BUFSIZ];
-	int lc;
 	int fd;
 	int ret;
 
-	tst_parse_opts(argc, argv, NULL, NULL);
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		parentuid = geteuid();
-		parentgid = getegid();
-
-		cpid1 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD,
-			(void *)child_fn1, NULL);
-		if (cpid1 < 0)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				"cpid1 clone failed");
-
-		cpid2 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD,
-			(void *)child_fn2, NULL);
-		if (cpid2 < 0)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				"cpid2 clone failed");
-
-		if (access("/proc/self/setgroups", F_OK) == 0) {
-			sprintf(path, "/proc/%d/setgroups", cpid1);
-			fd = SAFE_OPEN(cleanup, path, O_WRONLY, 0644);
-			SAFE_WRITE(cleanup, 1, fd, "deny", 4);
-			SAFE_CLOSE(cleanup, fd);
-			/* If the setgroups file has the value "deny",
-			 * then the setgroups(2) system call can't
-			 * subsequently be reenabled (by writing "allow" to
-			 * the file) in this user namespace.  (Attempts to
-			 * do so will fail with the error EPERM.)
-			*/
-
-			/* test that setgroups can't be re-enabled */
-			fd = SAFE_OPEN(cleanup, path, O_WRONLY, 0644);
-			ret = write(fd, "allow", 5);
-
-			if (ret != -1) {
-				tst_brkm(TBROK | TERRNO, cleanup,
-					"write action should fail");
-			} else if (errno != EPERM) {
-				tst_brkm(TBROK | TERRNO, cleanup,
-					"unexpected error: \n");
-			}
-			SAFE_CLOSE(cleanup, fd);
-			tst_resm(TPASS, "setgroups can't be re-enabled");
-
-			sprintf(path, "/proc/%d/setgroups", cpid2);
-			fd = SAFE_OPEN(cleanup, path, O_WRONLY, 0644);
-			SAFE_WRITE(cleanup, 1, fd, "deny", 4);
-			SAFE_CLOSE(cleanup, fd);
-		}
-
-		updatemap(cpid1, UID_MAP, CHILD1UID, parentuid, cleanup);
-		updatemap(cpid2, UID_MAP, CHILD2UID, parentuid, cleanup);
-
-		updatemap(cpid1, GID_MAP, CHILD1GID, parentgid, cleanup);
-		updatemap(cpid2, GID_MAP, CHILD2GID, parentgid, cleanup);
-
-		TST_SAFE_CHECKPOINT_WAKE_AND_WAIT(cleanup, 1);
-
-		tst_record_childstatus(cleanup, cpid1);
-		tst_record_childstatus(cleanup, cpid2);
+	parentuid = geteuid();
+	parentgid = getegid();
+
+	cpid1 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD, (void *)child_fn1, NULL);
+	if (cpid1 < 0)
+		tst_brk(TBROK | TTERRNO, "cpid1 clone failed");
+
+	cpid2 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD, (void *)child_fn2, NULL);
+	if (cpid2 < 0)
+		tst_brk(TBROK | TTERRNO, "cpid2 clone failed");
+
+	if (access("/proc/self/setgroups", F_OK) == 0) {
+		sprintf(path, "/proc/%d/setgroups", cpid1);
+
+		fd = SAFE_OPEN(path, O_WRONLY, 0644);
+		SAFE_WRITE(1, fd, "deny", 4);
+		SAFE_CLOSE(fd);
+
+		/* If the setgroups file has the value "deny",
+		 * then the setgroups(2) system call can't
+		 * subsequently be reenabled (by writing "allow" to
+		 * the file) in this user namespace.  (Attempts to
+		 * do so will fail with the error EPERM.)
+		 */
+
+		/* test that setgroups can't be re-enabled */
+		fd = SAFE_OPEN(path, O_WRONLY, 0644);
+		ret = write(fd, "allow", 5);
+
+		if (ret >= 0)
+			tst_brk(TBROK, "write action should fail");
+		else if (errno != EPERM)
+			tst_brk(TBROK | TTERRNO, "unexpected error");
+
+		SAFE_CLOSE(fd);
+
+		tst_res(TPASS, "setgroups can't be re-enabled");
+
+		sprintf(path, "/proc/%d/setgroups", cpid2);
+
+		fd = SAFE_OPEN(path, O_WRONLY, 0644);
+		SAFE_WRITE(1, fd, "deny", 4);
+		SAFE_CLOSE(fd);
 	}
-	cleanup();
-	tst_exit();
+
+	updatemap(cpid1, UID_MAP, CHILD1UID, parentuid);
+	updatemap(cpid2, UID_MAP, CHILD2UID, parentuid);
+
+	updatemap(cpid1, GID_MAP, CHILD1GID, parentgid);
+	updatemap(cpid2, GID_MAP, CHILD2GID, parentgid);
+
+	TST_CHECKPOINT_WAKE_AND_WAIT(1);
 }
+
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
