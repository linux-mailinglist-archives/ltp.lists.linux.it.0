Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F7D4E73CD
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Mar 2022 13:56:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DB4A3C8C8E
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Mar 2022 13:56:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5BF773C1FF3
 for <ltp@lists.linux.it>; Fri, 25 Mar 2022 13:54:49 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B941B1401193
 for <ltp@lists.linux.it>; Fri, 25 Mar 2022 13:54:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 68F9A1F38D;
 Fri, 25 Mar 2022 12:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648212888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCwGgLBxduNGFREGs0cswOTgJzLRuo3Y8Lpd5IABBd0=;
 b=t6E+Gke37nDiQ2H1tmLXpxveqigBIBxvOYRbD5nRavFgsC7wbygFMCSST4iDRbMqHW8iDk
 MWY3QQ7FF4BZ1attOWSJISmI2Du6WoZnx8h+/jQrzsTLa4WOKi+QPEXZTvTB9LAAx6BSKG
 FMN68njrxHoBtE4NiTledD5RWzK3ZC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648212888;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCwGgLBxduNGFREGs0cswOTgJzLRuo3Y8Lpd5IABBd0=;
 b=TNbyYUjEO0Qg9hS4aKZIdGzOqbaWUgZs7Lt2YB6DM7dkZnPJcpasFalWstja1FX/va83+y
 XrvjtN3xHtj/1jAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40C8C1332D;
 Fri, 25 Mar 2022 12:54:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WDX7DZi7PWKoZgAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Fri, 25 Mar 2022 12:54:48 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri, 25 Mar 2022 13:54:43 +0100
Message-Id: <20220325125445.11984-9-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325125445.11984-1-andrea.cervesato@suse.de>
References: <20220325125445.11984-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 08/10] Rewrite shm_comm.c using new LTP API
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
 .../kernel/containers/sysvipc/shm_comm.c      | 167 ++++++------------
 1 file changed, 50 insertions(+), 117 deletions(-)

diff --git a/testcases/kernel/containers/sysvipc/shm_comm.c b/testcases/kernel/containers/sysvipc/shm_comm.c
index 4b3bbfaa8..12ad49110 100644
--- a/testcases/kernel/containers/sysvipc/shm_comm.c
+++ b/testcases/kernel/containers/sysvipc/shm_comm.c
@@ -1,20 +1,17 @@
-/* Copyright (c) 2014 Red Hat, Inc.
- *
- * This program is free software: you can redistribute it and/or modify
- * it under the terms of version 2 the GNU General Public License as
- * published by the Free Software Foundation.
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2014 Red Hat, Inc.
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
  *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
+ * Test if SysV IPC shared memory is properly working between two different
+ * namespaces.
  *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- ***********************************************************************
- * File: shm_comm.c
+ * [Algorithm]
  *
- * Description:
  * 1. Clones two child processes with CLONE_NEWIPC flag, each child
  *    allocates System V shared memory segment (shm) with the _identical_
  *    key and attaches that segment into its address space.
@@ -27,141 +24,77 @@
  */
 
 #define _GNU_SOURCE
-#include <sys/ipc.h>
-#include <sys/shm.h>
-#include <sys/types.h>
-#include <sys/wait.h>
-#include <stdio.h>
-#include <errno.h>
-#include "ipcns_helper.h"
-#include "test.h"
-#include "safe_macros.h"
 
+#include <sys/wait.h>
+#include <sys/msg.h>
+#include <sys/types.h>
+#include "tst_safe_sysv_ipc.h"
+#include "tst_test.h"
+#include "common.h"
 
 #define TESTKEY 124426L
 #define SHMSIZE 50
-char *TCID	= "shm_comm";
-int TST_TOTAL	= 1;
-
-static void cleanup(void)
-{
-	tst_rmdir();
-}
-
-static void setup(void)
-{
-	tst_require_root();
-	check_newipc();
-	tst_tmpdir();
-	TST_CHECKPOINT_INIT(tst_rmdir);
-}
 
-int chld1_shm(void *arg)
+static int chld1_shm(LTP_ATTRIBUTE_UNUSED void *arg)
 {
-	int id, rval = 0;
+	int id;
 	char *shmem;
 
-	id = shmget(TESTKEY, SHMSIZE, IPC_CREAT);
-	if (id == -1) {
-		perror("shmget");
-		return 2;
-	}
-
-	if ((shmem = shmat(id, NULL, 0)) == (char *) -1) {
-		perror("shmat");
-		shmctl(id, IPC_RMID, NULL);
-		return 2;
-	}
+	id = SAFE_SHMGET(TESTKEY, SHMSIZE, IPC_CREAT);
 
+	shmem = SAFE_SHMAT(id, NULL, 0);
 	*shmem = 'A';
 
-	TST_SAFE_CHECKPOINT_WAKE_AND_WAIT(NULL, 0);
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
 
-	/* if child1 shared segment has changed (by child2) report fail */
 	if (*shmem != 'A')
-		rval = 1;
+		tst_res(TFAIL, "shared memory leak between namespaces");
+	else
+		tst_res(TPASS, "shared memory didn't leak between namespaces");
+
+	TST_CHECKPOINT_WAKE(0);
 
-	/* tell child2 to continue */
-	TST_SAFE_CHECKPOINT_WAKE(NULL, 0);
+	SAFE_SHMDT(shmem);
+	SAFE_SHMCTL(id, IPC_RMID, NULL);
 
-	shmdt(shmem);
-	shmctl(id, IPC_RMID, NULL);
-	return rval;
+	return 0;
 }
 
-int chld2_shm(void *arg)
+static int chld2_shm(LTP_ATTRIBUTE_UNUSED void *arg)
 {
 	int id;
 	char *shmem;
 
-	id = shmget(TESTKEY, SHMSIZE, IPC_CREAT);
-	if (id == -1) {
-		perror("shmget");
-		return 2;
-	}
+	id = SAFE_SHMGET(TESTKEY, SHMSIZE, IPC_CREAT);
 
-	if ((shmem = shmat(id, NULL, 0)) == (char *) -1) {
-		perror("shmat");
-		shmctl(id, IPC_RMID, NULL);
-		return 2;
-	}
+	shmem = SAFE_SHMAT(id, NULL, 0);
 
-	/* wait for child1 to write to his segment */
-	TST_SAFE_CHECKPOINT_WAIT(NULL, 0);
+	TST_CHECKPOINT_WAIT(0);
 
 	*shmem = 'B';
 
-	TST_SAFE_CHECKPOINT_WAKE_AND_WAIT(NULL, 0);
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
+
+	SAFE_SHMDT(shmem);
+	SAFE_SHMCTL(id, IPC_RMID, NULL);
 
-	shmdt(shmem);
-	shmctl(id, IPC_RMID, NULL);
 	return 0;
 }
 
-static void test(void)
+static void run(void)
 {
-	int status, ret = 0;
-
-	ret = do_clone_unshare_test(T_CLONE, CLONE_NEWIPC, chld1_shm, NULL);
-	if (ret == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "clone failed");
-
-	ret = do_clone_unshare_test(T_CLONE, CLONE_NEWIPC, chld2_shm, NULL);
-	if (ret == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "clone failed");
-
-
-	while (wait(&status) > 0) {
-		if (WIFEXITED(status) && WEXITSTATUS(status) == 1)
-			ret = 1;
-		if (WIFEXITED(status) && WEXITSTATUS(status) == 2)
-			tst_brkm(TBROK | TERRNO, cleanup, "error in child");
-		if (WIFSIGNALED(status)) {
-			tst_resm(TFAIL, "child was killed with signal %s",
-					tst_strsig(WTERMSIG(status)));
-			return;
-		}
-	}
-
-	if (ret)
-		tst_resm(TFAIL, "SysV shm: communication with identical keys"
-				" between namespaces");
-	else
-		tst_resm(TPASS, "SysV shm: communication with identical keys"
-				" between namespaces");
+	clone_unshare_test(T_CLONE, CLONE_NEWIPC, chld1_shm, NULL);
+	clone_unshare_test(T_CLONE, CLONE_NEWIPC, chld2_shm, NULL);
 }
 
-int main(int argc, char *argv[])
+static void setup(void)
 {
-	int lc;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++)
-		test();
-
-	cleanup();
-	tst_exit();
+	check_newipc();
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.needs_root = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
