Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 078EF6F150B
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Apr 2023 12:11:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B93B63CBA76
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Apr 2023 12:11:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF9333CB36F
 for <ltp@lists.linux.it>; Fri, 28 Apr 2023 12:10:52 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CD7441400760
 for <ltp@lists.linux.it>; Fri, 28 Apr 2023 12:10:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4A95E20044;
 Fri, 28 Apr 2023 10:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1682676651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/zME+/9i0VC6QMJab2+UnfqyioEyVQ3lXGGWGPwdYM=;
 b=F1w000rw0RHfdpBa6wSuZXnFxK15Uv//8D0tuE4AS03kSVjzGZWJJYPmBRJbab5vKpY6cL
 lnlgr8ls6WPwnox2uzNlRv19+dYnQXqLYAKd8HLPM+x0fuosIlS9+2sOc7NhPImWJqMedt
 csTvVDajDIJmiXv+7O4TthiBJZ/QHS8=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D02D1390E;
 Fri, 28 Apr 2023 10:10:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kFo/HKqbS2TbLQAAMHmgww
 (envelope-from <wegao@suse.com>); Fri, 28 Apr 2023 10:10:50 +0000
To: ltp@lists.linux.it
Date: Fri, 28 Apr 2023 06:10:38 -0400
Message-Id: <20230428101038.7253-3-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230428101038.7253-1-wegao@suse.com>
References: <20230428001701.31670-1-wegao@suse.com>
 <20230428101038.7253-1-wegao@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v11 2/2] cgroup_core03.c: New case test cgroup kill
 feature
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Wei Gao <wegao@suse.com>
---
 lib/tst_cgroup.c                              |   1 +
 runtest/controllers                           |   1 +
 .../kernel/controllers/cgroup/.gitignore      |   1 +
 .../kernel/controllers/cgroup/cgroup_core03.c | 125 ++++++++++++++++++
 4 files changed, 128 insertions(+)
 create mode 100644 testcases/kernel/controllers/cgroup/cgroup_core03.c

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 249f25aa4..8f7204340 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -167,6 +167,7 @@ static const struct cgroup_file cgroup_ctrl_files[] = {
 	{ "cgroup.controllers", NULL, 0 },
 	{ "cgroup.subtree_control", NULL, 0 },
 	{ "cgroup.clone_children", "cgroup.clone_children", 0 },
+	{ "cgroup.kill", NULL, 0 },
 	{ }
 };
 
diff --git a/runtest/controllers b/runtest/controllers
index 8d1b936bf..93c52c439 100644
--- a/runtest/controllers
+++ b/runtest/controllers
@@ -1,6 +1,7 @@
 #DESCRIPTION:Resource Management testing
 cgroup_core01	cgroup_core01
 cgroup_core02	cgroup_core02
+cgroup_core03	cgroup_core03
 cgroup		cgroup_regression_test.sh
 memcg_regression	memcg_regression_test.sh
 memcg_test_3	memcg_test_3
diff --git a/testcases/kernel/controllers/cgroup/.gitignore b/testcases/kernel/controllers/cgroup/.gitignore
index 8deae77da..9f1d1ada9 100644
--- a/testcases/kernel/controllers/cgroup/.gitignore
+++ b/testcases/kernel/controllers/cgroup/.gitignore
@@ -2,3 +2,4 @@
 /cgroup_regression_getdelays
 /cgroup_core01
 /cgroup_core02
+/cgroup_core03
diff --git a/testcases/kernel/controllers/cgroup/cgroup_core03.c b/testcases/kernel/controllers/cgroup/cgroup_core03.c
new file mode 100644
index 000000000..ed876fff3
--- /dev/null
+++ b/testcases/kernel/controllers/cgroup/cgroup_core03.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2012 Christian Brauner <brauner-AT-kernel.org>
+ * Copyright (c) 2023 SUSE LLC <wegao@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test is copied from kselftest
+ * tools/testing/selftests/cgroup/test_kill.c
+ * Only simple test implemented within current case, the other cases such
+ * as test_cgkill_tree and test_cgkill_forkbomb can be created later.
+ *
+ */
+
+#include <sys/wait.h>
+
+#include "lapi/syscalls.h"
+#include "tst_test.h"
+
+#define MAX_PID_NUM 100
+#define PID_NUM MIN(MAX_PID_NUM, (tst_ncpus_available() + 1))
+#define BUF_LEN (20 * PID_NUM)
+
+static int *data_ptr;
+static char *buf;
+static struct tst_cg_group *cg_child_test_simple;
+
+static int wait_for_pid(pid_t pid)
+{
+	int status, ret;
+
+again:
+	ret = waitpid(pid, &status, 0);
+	if (ret == -1) {
+		if (errno == EINTR)
+			goto again;
+
+		return -1;
+	}
+
+	if (WIFSIGNALED(status))
+		return 0;
+
+	return -1;
+}
+
+static int cg_run_nowait(const struct tst_cg_group *const cg)
+{
+	int pid;
+
+	pid = SAFE_FORK();
+	if (pid == 0) {
+		SAFE_CG_PRINTF(cg, "cgroup.procs", "%d", getpid());
+		if (tst_atomic_inc(data_ptr) == PID_NUM)
+			TST_CHECKPOINT_WAKE(0);
+		pause();
+	}
+
+	return pid;
+}
+
+static int cg_count_procs(const struct tst_cg_group *cg)
+{
+	char *ptr;
+
+	int nr = 0;
+
+	SAFE_CG_READ(cg, "cgroup.procs", buf, BUF_LEN);
+
+	for (ptr = buf; *ptr; ptr++)
+		if (*ptr == '\n')
+			nr++;
+
+	return nr;
+}
+
+static void run(void)
+{
+	pid_t pids[MAX_PID_NUM];
+	int i;
+	*data_ptr = 0;
+
+	cg_child_test_simple = tst_cg_group_mk(tst_cg, "cg_test_simple");
+
+	memset(buf, 0, BUF_LEN);
+
+	for (i = 0; i < PID_NUM; i++)
+		pids[i] = cg_run_nowait(cg_child_test_simple);
+
+	TST_CHECKPOINT_WAIT(0);
+	TST_EXP_VAL(cg_count_procs(cg_child_test_simple), PID_NUM);
+	SAFE_CG_PRINTF(cg_child_test_simple, "cgroup.kill", "%d", 1);
+
+	for (i = 0; i < PID_NUM; i++)
+		TST_EXP_PASS_SILENT(wait_for_pid(pids[i]));
+
+	TST_EXP_VAL(cg_count_procs(cg_child_test_simple), 0);
+	cg_child_test_simple = tst_cg_group_rm(cg_child_test_simple);
+}
+
+static void setup(void)
+{
+	buf = tst_alloc(BUF_LEN);
+	data_ptr = SAFE_MMAP(NULL, sizeof(uintptr_t), PROT_READ | PROT_WRITE,
+						 MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+}
+
+static void cleanup(void)
+{
+	if (data_ptr)
+		SAFE_MUNMAP(data_ptr, sizeof(uintptr_t));
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.max_runtime = 20,
+	.needs_cgroup_ctrls = (const char *const []){ "base", NULL },
+	.needs_cgroup_ver = TST_CG_V2,
+	.needs_checkpoints = 1,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
