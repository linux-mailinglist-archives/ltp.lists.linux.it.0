Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A7679EB84
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Sep 2023 16:47:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D88BB3CE778
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Sep 2023 16:47:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA3763CB2FB
 for <ltp@lists.linux.it>; Wed, 13 Sep 2023 16:47:09 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0C6FF20014C
 for <ltp@lists.linux.it>; Wed, 13 Sep 2023 16:47:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8BCD4218E4;
 Wed, 13 Sep 2023 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694616428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pD9L/gY/bh17gMAx5ULwVGvKOmMBGLJ5ZPa5wm4CXGg=;
 b=pN01+4H2yPPi5Ked/SgqfD5d1PbbqO070dIX5j6d+PuRIteH9K9PGYXYzoE4bYLuxVuyv1
 3jaMWg7A+dRD0OPMhsXFLPz5hy5edliJV6rA+XZRrTVqeeeU2oHTNKEh8C7wTOW5nUU84A
 NyxBtHYcn6BVQvkBokNPHAL3Ncki1kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694616428;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pD9L/gY/bh17gMAx5ULwVGvKOmMBGLJ5ZPa5wm4CXGg=;
 b=zdKnFTgt0qCoU1ylLrHJc39mW6CTkWDfDu6zDyBbx5LuGydiOaYZoXeJotcdt8NTW74LyR
 vYcjiv2a6ZUasxBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5593713440;
 Wed, 13 Sep 2023 14:47:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2PxeEmzLAWWXbAAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Wed, 13 Sep 2023 14:47:08 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Wed, 13 Sep 2023 16:47:04 +0200
Message-Id: <20230913144706.7126-3-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230913144706.7126-1-andrea.cervesato@suse.de>
References: <20230913144706.7126-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v9 2/4] Refactor mqns_04 using new LTP API
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
Removed absolute path

 testcases/kernel/containers/mqns/mqns_04.c | 280 ++++++++++-----------
 1 file changed, 126 insertions(+), 154 deletions(-)

diff --git a/testcases/kernel/containers/mqns/mqns_04.c b/testcases/kernel/containers/mqns/mqns_04.c
index d07a85c04..196e116f0 100644
--- a/testcases/kernel/containers/mqns/mqns_04.c
+++ b/testcases/kernel/containers/mqns/mqns_04.c
@@ -1,187 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
-* Copyright (c) International Business Machines Corp., 2009
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by
-* the Free Software Foundation; either version 2 of the License, or
-* (at your option) any later version.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
-* the GNU General Public License for more details.
-* You should have received a copy of the GNU General Public License
-* along with this program; if not, write to the Free Software
-* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-*
-* Author: Serge Hallyn <serue@us.ibm.com>
-*
-* Check mqueuefs lifetime
-* . parent creates /dev/mqueue2
-* . child mounts mqueue there
-* . child does mq_open("/ab")
-* . parent checks for /dev/mqueue2
-* . child exits
-* . parent checks for /dev/mqueue2
-* . parent tries 'touch /dev/mqueue2/dd' -> should fail
-* . parent umounts /dev/mqueue2
-
-***************************************************************************/
-
-#ifndef _GNU_SOURCE
-#define _GNU_SOURCE
-#endif
-#include <sys/types.h>
-#include <sys/stat.h>
+ * Copyright (c) International Business Machines Corp., 2009
+ * Copyright (c) Serge Hallyn <serue@us.ibm.com>
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Test mqueuefs manipulation from child/parent namespaces.
+ *
+ * [Algorithm]
+ *
+ * - parent creates mqueue folder in <tmpdir>
+ * - child mounts mqueue there
+ * - child creates /MQ1 mqueue
+ * - parent checks for <tmpdir>/mqueue/MQ1 existence
+ * - child exits
+ * - parent checks for <tmpdir>/mqueue/MQ1 existence
+ * - parent tries 'touch <tmpdir>/mqueue/MQ2' -> should fail
+ * - parent umount mqueuefs
+ */
+
 #include <sys/wait.h>
-#include <assert.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <string.h>
-#include <errno.h>
-#include "mqns.h"
-#include "mqns_helper.h"
+#include "tst_test.h"
+#include "lapi/sched.h"
+#include "tst_safe_posix_ipc.h"
+#include "tst_safe_stdio.h"
+#include "tst_safe_macros.h"
 
-char *TCID = "posixmq_namespace_04";
-int TST_TOTAL = 1;
+#define CHECK_MQ_OPEN_RET(x) ((x) >= 0 || ((x) == -1 && errno != EMFILE))
 
-int p1[2];
-int p2[2];
+#define DEVDIR "ltp_mqueue"
+#define MQNAME1 "/MQ1"
+#define MQNAME2 "/MQ2"
 
-#define FNAM1 DEV_MQUEUE2 SLASH_MQ1
-#define FNAM2 DEV_MQUEUE2 SLASH_MQ2
+static char *str_op;
+static char *mqueue1;
+static char *mqueue2;
+static volatile int *mq_freed;
 
-int check_mqueue(void *vtest)
+static void check_mqueue(void)
 {
-	char buf[30];
 	mqd_t mqd;
-	int rc;
 
-	(void) vtest;
+	tst_res(TINFO, "Creating %s mqueue from within child process", MQNAME1);
 
-	close(p1[1]);
-	close(p2[0]);
+	mqd = TST_RETRY_FUNC(
+		mq_open(MQNAME1, O_RDWR | O_CREAT | O_EXCL, 0755, NULL),
+		CHECK_MQ_OPEN_RET);
+	if (mqd == -1)
+		tst_brk(TBROK | TERRNO, "mq_open failed");
 
-	read(p1[0], buf, 3);	/* go */
+	SAFE_MQ_CLOSE(mqd);
+	mq_freed[0] = 1;
 
-	mqd = tst_syscall(__NR_mq_open, NOSLASH_MQ1, O_RDWR | O_CREAT | O_EXCL,
-		0755, NULL);
-	if (mqd == -1) {
-		write(p2[1], "mqfail", 7);
-		tst_exit();
-	}
+	tst_res(TINFO, "Mount %s from within child process", DEVDIR);
 
-	mq_close(mqd);
+	SAFE_MOUNT("mqueue", DEVDIR, "mqueue", 0, NULL);
+
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
+}
+
+static void run(void)
+{
+	const struct tst_clone_args clone_args = { CLONE_NEWIPC, SIGCHLD };
+	struct stat statbuf;
 
-	rc = mount("mqueue", DEV_MQUEUE2, "mqueue", 0, NULL);
-	if (rc == -1) {
-		perror("mount");
-		write(p2[1], "mount", 6);
-		tst_exit();
+	if (str_op && !strcmp(str_op, "clone")) {
+		tst_res(TINFO, "Spawning isolated process");
+
+		if (!SAFE_CLONE(&clone_args)) {
+			check_mqueue();
+			return;
+		}
+	} else if (str_op && !strcmp(str_op, "unshare")) {
+		tst_res(TINFO, "Spawning unshared process");
+
+		if (!SAFE_FORK()) {
+			SAFE_UNSHARE(CLONE_NEWIPC);
+			check_mqueue();
+			return;
+		}
 	}
 
-	write(p2[1], "go", 3);
-	read(p1[0], buf, 3);
+	TST_CHECKPOINT_WAIT(0);
 
-	tst_exit();
-}
+	SAFE_STAT(mqueue1, &statbuf);
+	tst_res(TPASS, "%s child's mqueue can be accessed from parent", mqueue1);
 
-static void setup(void)
-{
-	tst_require_root();
-	check_mqns();
-}
+	TST_CHECKPOINT_WAKE(0);
 
-int main(int argc, char *argv[])
-{
-	int rc;
-	int status;
-	char buf[30];
-	struct stat statbuf;
-	int use_clone = T_UNSHARE;
+	tst_res(TINFO, "Waiting child to exit");
 
-	setup();
+	tst_reap_children();
+	mq_freed[0] = 0;
 
-	if (argc == 2 && strcmp(argv[1], "-clone") == 0) {
-		tst_resm(TINFO,
-			 "Testing posix mq namespaces through clone(2).");
-		use_clone = T_CLONE;
-	} else
-		tst_resm(TINFO,
-			 "Testing posix mq namespaces through unshare(2).");
+	SAFE_STAT(mqueue1, &statbuf);
+	tst_res(TPASS, "%s child's mqueue can be accessed from parent after child's dead", mqueue1);
 
-	if (pipe(p1) == -1) {
-		perror("pipe");
-		exit(EXIT_FAILURE);
-	}
-	if (pipe(p2) == -1) {
-		perror("pipe");
-		exit(EXIT_FAILURE);
-	}
+	tst_res(TINFO, "Try to create %s from parent", mqueue2);
 
-	mkdir(DEV_MQUEUE2, 0755);
+	TST_EXP_FAIL(creat(mqueue2, 0755), EACCES);
+	if (!TST_PASS)
+		mq_freed[1] = 1;
 
-	tst_resm(TINFO, "Checking mqueue filesystem lifetime");
+	SAFE_UMOUNT(DEVDIR);
+}
 
-	/* fire off the test */
-	rc = do_clone_unshare_test(use_clone, CLONE_NEWIPC, check_mqueue, NULL);
-	if (rc < 0) {
-		tst_resm(TFAIL, "failed clone/unshare");
-		goto fail;
-	}
+static void setup(void)
+{
+	if (!str_op || (strcmp(str_op, "clone") && strcmp(str_op, "unshare")))
+		tst_brk(TCONF, "Please specify clone|unshare child isolation");
 
-	close(p1[0]);
-	close(p2[1]);
-	write(p1[1], "go", 3);
-
-	read(p2[0], buf, 7);
-	if (!strcmp(buf, "mqfail")) {
-		tst_resm(TFAIL, "child process could not create mqueue");
-		goto fail;
-	} else if (!strcmp(buf, "mount")) {
-		tst_resm(TFAIL, "child process could not mount mqueue");
-		goto fail;
-	}
+	SAFE_MKDIR(DEVDIR, 0755);
 
-	rc = stat(FNAM1, &statbuf);
-	if (rc == -1) {
-		perror("stat");
-		write(p1[1], "go", 3);
-		tst_resm(TFAIL, "parent could not see child's created mq");
-		goto fail;
-	}
-	write(p1[1], "go", 3);
+	SAFE_ASPRINTF(&mqueue1, "%s" MQNAME1, DEVDIR);
+	SAFE_ASPRINTF(&mqueue2, "%s" MQNAME2, DEVDIR);
 
-	rc = wait(&status);
-	if (rc == -1) {
-		perror("wait");
-		tst_resm(TFAIL, "error while parent waited on child to exit");
-		goto fail;
-	}
-	if (!WIFEXITED(status)) {
-		tst_resm(TFAIL, "Child did not exit normally (status %d)",
-			 status);
-		goto fail;
-	}
-	rc = stat(FNAM1, &statbuf);
-	if (rc == -1) {
-		tst_resm(TFAIL,
-			 "parent's view of child's mq died with child");
-		goto fail;
-	}
+	mq_freed = SAFE_MMAP(NULL,
+		2 * sizeof(int),
+		PROT_READ | PROT_WRITE,
+		MAP_SHARED | MAP_ANONYMOUS,
+		-1, 0);
+}
 
-	rc = creat(FNAM2, 0755);
-	if (rc != -1) {
-		tst_resm(TFAIL,
-			 "parent was able to create a file in dead child's mqfs");
-		goto fail;
-	}
+static void cleanup(void)
+{
+	if (!access(mqueue1, F_OK))
+		SAFE_MQ_UNLINK(MQNAME1);
 
-	tst_resm(TPASS, "Child mqueue fs still visible for parent");
+	if (!access(mqueue2, F_OK))
+		SAFE_MQ_UNLINK(MQNAME2);
 
-fail:
-	umount(DEV_MQUEUE2);
-	rmdir(DEV_MQUEUE2);
+	if (tst_is_mounted(DEVDIR))
+		SAFE_UMOUNT(DEVDIR);
 
-	tst_exit();
+	if (*mq_freed)
+		SAFE_MUNMAP((void *)mq_freed, 2 * sizeof(int));
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_tmpdir = 1,
+	.needs_checkpoints = 1,
+	.options = (struct tst_option[]) {
+		{ "m:", &str_op, "Child process isolation <clone|unshare>" },
+		{},
+	},
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_USER_NS",
+		NULL
+	},
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
