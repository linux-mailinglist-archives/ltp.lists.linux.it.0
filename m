Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6D2706796
	for <lists+linux-ltp@lfdr.de>; Wed, 17 May 2023 14:08:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D40B63CD451
	for <lists+linux-ltp@lfdr.de>; Wed, 17 May 2023 14:08:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EC97A3CB2FD
 for <ltp@lists.linux.it>; Wed, 17 May 2023 14:08:38 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 284602009BC
 for <ltp@lists.linux.it>; Wed, 17 May 2023 14:08:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 228F320224;
 Wed, 17 May 2023 12:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1684325317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06eusxNDjqw89plsYNrQEG6k1Mp03kmK6ehyzPcMbo0=;
 b=X4zz0oa9PgY1wnhjJWCRc0Z9LPG5hUGY9/tJJx7AW6PSp+u1ZvJhflcnDTI8pEdug4yd8L
 Tr+hJUHaYVDi1xHFeRH1u8uI0WaImBiUiN9LfrgD40qB/4cs36p7YC+SjMDwkZDZ745VDh
 mMVmNSGBw8VaBRTYo7ef+NcFkUf/zbQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A849613358;
 Wed, 17 May 2023 12:08:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id smQ1GcPDZGTEHwAAMHmgww
 (envelope-from <wegao@suse.com>); Wed, 17 May 2023 12:08:35 +0000
To: ltp@lists.linux.it
Date: Wed, 17 May 2023 08:08:27 -0400
Message-Id: <20230517120827.9350-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230509003148.16094-1-wegao@suse.com>
References: <20230509003148.16094-1-wegao@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v5] clone3: Add clone3's clone_args cgroup
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
 include/lapi/sched.h                        |   8 ++
 include/tst_cgroup.h                        |   4 +
 include/tst_clone.h                         |   1 +
 lib/tst_cgroup.c                            |   9 ++
 lib/tst_clone.c                             |   1 +
 runtest/syscalls                            |   1 +
 testcases/kernel/syscalls/clone3/.gitignore |   1 +
 testcases/kernel/syscalls/clone3/clone303.c | 101 ++++++++++++++++++++
 8 files changed, 126 insertions(+)
 create mode 100644 testcases/kernel/syscalls/clone3/clone303.c

diff --git a/include/lapi/sched.h b/include/lapi/sched.h
index 1065665d1..ac766efc5 100644
--- a/include/lapi/sched.h
+++ b/include/lapi/sched.h
@@ -13,6 +13,7 @@
 #include <inttypes.h>
 #include "config.h"
 #include "lapi/syscalls.h"
+#include "lapi/sched.h"
 
 struct sched_attr {
 	uint32_t size;
@@ -54,6 +55,9 @@ struct clone_args {
 	uint64_t __attribute__((aligned(8))) stack;
 	uint64_t __attribute__((aligned(8))) stack_size;
 	uint64_t __attribute__((aligned(8))) tls;
+	uint64_t __attribute__((aligned(8))) set_tid;
+	uint64_t __attribute__((aligned(8))) set_tid_size;
+	uint64_t __attribute__((aligned(8))) cgroup;
 };
 
 static inline int clone3(struct clone_args *args, size_t size)
@@ -133,4 +137,8 @@ static inline int getcpu(unsigned *cpu, unsigned *node)
 # define CLONE_NEWTIME		0x00000080
 #endif
 
+#ifndef CLONE_INTO_CGROUP
+# define CLONE_INTO_CGROUP 0x200000000ULL
+#endif
+
 #endif /* LAPI_SCHED_H__ */
diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
index 2826ddad1..be14d07c6 100644
--- a/include/tst_cgroup.h
+++ b/include/tst_cgroup.h
@@ -157,6 +157,10 @@ const char *
 tst_cg_group_name(const struct tst_cg_group *const cg)
 		      __attribute__ ((nonnull, warn_unused_result));
 
+/* This call returns a fd pointing to a v2 directory */
+int tst_cg_group_unified_dir_fd(const struct tst_cg_group *const cg)
+		      __attribute__ ((nonnull, warn_unused_result));
+
 /* Remove a descendant CGroup */
 struct tst_cg_group *
 tst_cg_group_rm(struct tst_cg_group *const cg)
diff --git a/include/tst_clone.h b/include/tst_clone.h
index 9ffdc68d1..7b278dfa7 100644
--- a/include/tst_clone.h
+++ b/include/tst_clone.h
@@ -11,6 +11,7 @@
 struct tst_clone_args {
 	uint64_t flags;
 	uint64_t exit_signal;
+	uint64_t cgroup;
 };
 
 /* clone3 with fallbacks to clone when possible. Be aware that it
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 274c73fea..43055e8cf 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -1112,6 +1112,15 @@ const char *tst_cg_group_name(const struct tst_cg_group *const cg)
 	return cg->group_name;
 }
 
+int tst_cg_group_unified_dir_fd(const struct tst_cg_group *const cg)
+{
+	for (int i = 0; cg->dirs[i]; i++) {
+		if (cg->dirs[i]->dir_root->ver == TST_CG_V2)
+			return cg->dirs[i]->dir_fd;
+	}
+	return -1;
+}
+
 struct tst_cg_group *tst_cg_group_rm(struct tst_cg_group *const cg)
 {
 	struct cgroup_dir **dir;
diff --git a/lib/tst_clone.c b/lib/tst_clone.c
index ecc84408c..2aa00beb1 100644
--- a/lib/tst_clone.c
+++ b/lib/tst_clone.c
@@ -15,6 +15,7 @@ pid_t tst_clone(const struct tst_clone_args *tst_args)
 	struct clone_args args = {
 		.flags = tst_args->flags,
 		.exit_signal = tst_args->exit_signal,
+		.cgroup = tst_args->cgroup,
 	};
 	int flags;
 	pid_t pid = -1;
diff --git a/runtest/syscalls b/runtest/syscalls
index 9c23a4248..0b6adfd7f 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -117,6 +117,7 @@ clone09 clone09
 
 clone301 clone301
 clone302 clone302
+clone303 clone303
 
 close01 close01
 close02 close02
diff --git a/testcases/kernel/syscalls/clone3/.gitignore b/testcases/kernel/syscalls/clone3/.gitignore
index 604cb903e..10369954b 100644
--- a/testcases/kernel/syscalls/clone3/.gitignore
+++ b/testcases/kernel/syscalls/clone3/.gitignore
@@ -1,2 +1,3 @@
 clone301
 clone302
+clone303
diff --git a/testcases/kernel/syscalls/clone3/clone303.c b/testcases/kernel/syscalls/clone3/clone303.c
new file mode 100644
index 000000000..5bf02edef
--- /dev/null
+++ b/testcases/kernel/syscalls/clone3/clone303.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2023 SUSE LLC <wegao@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test case check clone3 CLONE_INTO_CGROUP flag
+ *
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/wait.h>
+
+#include "tst_test.h"
+#include "lapi/sched.h"
+#include "lapi/pidfd.h"
+
+#define BUF_LEN 20
+
+static struct tst_cg_group *cg_child_test_simple;
+static int fd;
+static struct clone_args *args;
+
+static pid_t clone_into_cgroup(int cgroup_fd)
+{
+	pid_t pid;
+
+	args->flags = CLONE_INTO_CGROUP;
+	args->exit_signal = SIGCHLD;
+	args->cgroup = cgroup_fd;
+
+	pid = clone3(args, sizeof(*args));
+
+	if (pid < 0)
+		tst_res(TFAIL | TTERRNO, "clone3() failed !");
+
+	return pid;
+}
+
+static void run(void)
+{
+	pid_t pid;
+
+	pid = clone_into_cgroup(fd);
+
+	if (!pid) {
+		TST_CHECKPOINT_WAIT(0);
+		return;
+	}
+
+	char buf[BUF_LEN];
+
+	SAFE_CG_READ(cg_child_test_simple, "cgroup.procs", buf, BUF_LEN);
+
+	if (atoi(buf) == pid)
+		tst_res(TPASS, "clone3 case pass!");
+	else
+		tst_brk(TFAIL | TTERRNO, "clone3() failed !");
+
+	TST_CHECKPOINT_WAKE(0);
+
+	SAFE_WAITPID(pid, NULL, 0);
+
+}
+
+static void setup(void)
+{
+	clone3_supported_by_kernel();
+
+	cg_child_test_simple = tst_cg_group_mk(tst_cg, "cg_test_simple");
+
+	fd = tst_cg_group_unified_dir_fd(cg_child_test_simple);
+
+	if (fd < 0)
+		tst_brk(TBROK, "get dir fd failed!");
+}
+
+static void cleanup(void)
+{
+	cg_child_test_simple = tst_cg_group_rm(cg_child_test_simple);
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
+	.min_kver = "5.7",
+	.bufs = (struct tst_buffers []) {
+		{&args, .size = sizeof(*args)},
+		{},
+	}
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
