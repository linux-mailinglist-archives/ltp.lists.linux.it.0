Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 068C878D757
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Aug 2023 17:55:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6FB53CE044
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Aug 2023 17:55:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D4A403CB7F1
 for <ltp@lists.linux.it>; Wed, 30 Aug 2023 17:55:50 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F198B14004EC
 for <ltp@lists.linux.it>; Wed, 30 Aug 2023 17:55:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 387E321862;
 Wed, 30 Aug 2023 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693410949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=v9PYe/UmjPi96MllR4J97cbD3y5/sCLJ+zE11LYr5HE=;
 b=TxLBCX8GqNfadpQA0fN/BXK5Bxo4MR4H6+882jFCHFA6f0CaI00tJYtMouLdVnmkLXomH4
 o5Rqc+BEJpFVfdWBKbOvtTLIjQWKT/X2UfTNNZAJ9LP/XbsXmIzZN4DeoCJ64iQD5vhOhI
 jSKkuRUABWtbValq2ipnfLoek41mUv4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693410949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=v9PYe/UmjPi96MllR4J97cbD3y5/sCLJ+zE11LYr5HE=;
 b=WSvYUL82Nr+KzpZ97oUemQMEM7ouFPrvsn0d6W0YvH376fwuiuk4n6uVytWKxoCL2yJM2R
 eanC8tQzRwqs9NBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1AE1713441;
 Wed, 30 Aug 2023 15:55:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u5UaBYVm72QsPQAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Wed, 30 Aug 2023 15:55:49 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Wed, 30 Aug 2023 17:55:48 +0200
Message-Id: <20230830155548.9402-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Refactor exit_group01 using new API
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

We provided a different approach to exit_group() testing, spawning
multiple threads inside the child and checking if they get killed with
the parent process.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/syscalls/exit_group/Makefile |   2 +
 .../kernel/syscalls/exit_group/exit_group01.c | 137 +++++++++++-------
 2 files changed, 85 insertions(+), 54 deletions(-)

diff --git a/testcases/kernel/syscalls/exit_group/Makefile b/testcases/kernel/syscalls/exit_group/Makefile
index 1273a4e9c..adbac3c51 100644
--- a/testcases/kernel/syscalls/exit_group/Makefile
+++ b/testcases/kernel/syscalls/exit_group/Makefile
@@ -3,6 +3,8 @@
 
 top_srcdir		?= ../../../..
 
+exit_group01: CFLAGS+=-pthread
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/exit_group/exit_group01.c b/testcases/kernel/syscalls/exit_group/exit_group01.c
index 5bf5b0218..0ed008115 100644
--- a/testcases/kernel/syscalls/exit_group/exit_group01.c
+++ b/testcases/kernel/syscalls/exit_group/exit_group01.c
@@ -1,68 +1,97 @@
-/******************************************************************************
- * Copyright (c) Crackerjack Project., 2007                                   *
- * Ported to LTP by Manas Kumar Nayak <maknayak@in.ibm.com>                   *
- * Copyright (C) 2015 Cyril Hrubis <chrubis@suse.cz>                          *
- *                                                                            *
- * This program is free software;  you can redistribute it and/or modify      *
- * it under the terms of the GNU General Public License as published by       *
- * the Free Software Foundation; either version 2 of the License, or          *
- * (at your option) any later version.                                        *
- *                                                                            *
- * This program is distributed in the hope that it will be useful,            *
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of            *
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  *
- * the GNU General Public License for more details.                           *
- *                                                                            *
- * You should have received a copy of the GNU General Public License          *
- * along with this program;  if not, write to the Free Software Foundation,   *
- * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA           *
- *                                                                            *
- ******************************************************************************/
-
-#include <stdio.h>
-#include <errno.h>
-#include <linux/unistd.h>
-#include <sys/wait.h>
-
-#include "test.h"
-#include "safe_macros.h"
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Ported to LTP by Manas Kumar Nayak <maknayak@in.ibm.com>
+ * Copyright (c) 2015 Linux Test Project
+ * Copyright (C) 2015 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test checks if exit_group() correctly ends a spawned child and all its
+ * running threads.
+ */
+
+#include <stdlib.h>
+#include "tst_safe_pthread.h"
+#include "tst_test.h"
 #include "lapi/syscalls.h"
 
-char *TCID = "exit_group01";
-int testno;
-int TST_TOTAL = 1;
+/* gittid is not defined by glibc */
+#define gettid() syscall(SYS_gettid)
+
+#define THREADS_NUM 10
 
-static void verify_exit_group(void)
+static pid_t *tids;
+
+static void *worker(void *arg)
 {
-	pid_t cpid, w;
-	int status;
+	int i = *((int *)arg);
 
-	cpid = fork();
-	if (cpid == -1)
-		tst_brkm(TFAIL | TERRNO, NULL, "fork failed");
+	tids[i] = gettid();
 
-	if (cpid == 0) {
-		TEST(tst_syscall(__NR_exit_group, 4));
-	} else {
-		w = SAFE_WAIT(NULL, &status);
-
-		if (WIFEXITED(status) && (WEXITSTATUS(status) == 4)) {
-			tst_resm(TPASS, "exit_group() succeeded");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-				 "exit_group() failed (wait status = %d)", w);
-		}
+	TST_CHECKPOINT_WAKE(0);
+	pause();
+
+	return arg;
+}
+
+static void spawn_threads(void)
+{
+	pthread_t threads[THREADS_NUM];
+
+	for (int i = 0; i < THREADS_NUM; i++) {
+		SAFE_PTHREAD_CREATE(&threads[i], NULL, worker, (void *)&i);
+		TST_CHECKPOINT_WAIT(0);
 	}
 }
 
-int main(int ac, char **av)
+static void run(void)
 {
-	int lc;
+	pid_t pid;
+	int status;
 
-	tst_parse_opts(ac, av, NULL, NULL);
+	pid = SAFE_FORK();
+	if (!pid) {
+		spawn_threads();
 
-	for (lc = 0; TEST_LOOPING(lc); lc++)
-		verify_exit_group();
+		TEST(tst_syscall(__NR_exit_group, 4));
+		if (TST_RET == -1)
+			tst_brk(TBROK | TERRNO, "exit_group() error");
+
+		return;
+	}
+
+	SAFE_WAITPID(pid, &status, 0);
+
+	TST_EXP_EXPR(WIFEXITED(status) && WEXITSTATUS(status) == 4,
+		"exit_group() succeeded");
+
+	for (int i = 0; i < THREADS_NUM; i++)
+		TST_EXP_FAIL(kill(tids[i], 0), ESRCH);
+}
+
+static void setup(void)
+{
+	tids = SAFE_MMAP(
+		NULL,
+		sizeof(pid_t) * THREADS_NUM,
+		PROT_READ | PROT_WRITE,
+		MAP_SHARED | MAP_ANONYMOUS,
+		-1, 0);
+}
 
-	tst_exit();
+static void cleanup(void)
+{
+	SAFE_MUNMAP(tids, sizeof(pid_t) * THREADS_NUM);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
