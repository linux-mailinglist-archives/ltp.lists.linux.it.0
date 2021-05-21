Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D1738C4AF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 12:26:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3E953C8627
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 12:26:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF26A3C19BB
 for <ltp@lists.linux.it>; Fri, 21 May 2021 12:25:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5FF581A014F9
 for <ltp@lists.linux.it>; Fri, 21 May 2021 12:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621592743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b1twhFNaB3PGQX0G7lTuLI0VSB7tUuIlx5eLzwvUQC4=;
 b=N0RH/7IdhfouvqYzhaF+TvXivxw/pWhM8npekOn92BxdbzXGnggg9T7/zJEDhSnZ23xMof
 Be7GxQwbP1wzf+UDjup9rq99BF1aO3ryMaqUyWXkm0m6/Ck8xB2d6eV44iZqBS7z+VYlZF
 NSqyBPOFV4VlWPJ2FWnEhXCJ0cPGE1E=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F350EAAFD;
 Fri, 21 May 2021 10:25:42 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 21 May 2021 11:25:28 +0100
Message-Id: <20210521102528.21102-7-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521102528.21102-1-rpalethorpe@suse.com>
References: <20210521102528.21102-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 6/6] sched/cgroup: Add cfs_bandwidth01
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 runtest/sched                                 |   1 +
 .../kernel/sched/cfs-scheduler/.gitignore     |   1 +
 testcases/kernel/sched/cfs-scheduler/Makefile |   4 +-
 .../sched/cfs-scheduler/cfs_bandwidth01.c     | 175 ++++++++++++++++++
 4 files changed, 179 insertions(+), 2 deletions(-)
 create mode 100644 testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c

diff --git a/runtest/sched b/runtest/sched
index bfc4f2711..592898723 100644
--- a/runtest/sched
+++ b/runtest/sched
@@ -6,6 +6,7 @@ pth_str03 pth_str03
 time-schedule01		time-schedule
 trace_sched01		trace_sched -c 1
 
+cfs_bandwidth01 cfs_bandwidth01 -i 5
 hackbench01 hackbench 50 process 1000
 hackbench02 hackbench 20 thread 1000
 
diff --git a/testcases/kernel/sched/cfs-scheduler/.gitignore b/testcases/kernel/sched/cfs-scheduler/.gitignore
index db2759e4f..c5dacd6ef 100644
--- a/testcases/kernel/sched/cfs-scheduler/.gitignore
+++ b/testcases/kernel/sched/cfs-scheduler/.gitignore
@@ -1 +1,2 @@
 /hackbench
+cfs_bandwidth01
diff --git a/testcases/kernel/sched/cfs-scheduler/Makefile b/testcases/kernel/sched/cfs-scheduler/Makefile
index aa3bf8459..2ffe1f7f9 100644
--- a/testcases/kernel/sched/cfs-scheduler/Makefile
+++ b/testcases/kernel/sched/cfs-scheduler/Makefile
@@ -18,8 +18,8 @@
 
 top_srcdir		?= ../../../..
 
-include $(top_srcdir)/include/mk/env_pre.mk
+include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS			+= -lpthread
+hackbench: LDLIBS			+= -lpthread
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
new file mode 100644
index 000000000..7c988730e
--- /dev/null
+++ b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com> */
+/*\
+ *
+ * [Description]
+ *
+ * Creates a multi-level CGroup hierarchy with the cpu controller
+ * enabled. The leaf groups are populated with "busy" processes which
+ * simulate intermittent cpu load. They spin for some time then sleep
+ * then repeat.
+ *
+ * Both the trunk and leaf groups are set cpu bandwidth limits. The
+ * busy processes will intermittently exceed these limits. Causing
+ * them to be throttled. When they begin sleeping this will then cause
+ * them to be unthrottle.
+ *
+ * The test is known to reproduce an issue with an update to
+ * SLE-15-SP1 (kernel 4.12.14-197.64, bsc#1179093).
+ */
+
+#include <stdlib.h>
+
+#include "tst_test.h"
+#include "tst_cgroup.h"
+#include "tst_timer.h"
+
+static const struct tst_cgroup_group *cg_test;
+static struct tst_cgroup_group *cg_level2, *cg_level3a, *cg_level3b;
+static struct tst_cgroup_group *cg_workers[3];
+
+static void set_cpu_quota(const struct tst_cgroup_group *const cg,
+			  const float quota_percent)
+{
+	const unsigned int period_us = 10000;
+	const unsigned int quota_us = (quota_percent / 100) * (float)period_us;
+
+	if (TST_CGROUP_VER(cg, "cpu") != TST_CGROUP_V1) {
+		SAFE_CGROUP_PRINTF(cg, "cpu.max",
+				   "%u %u", quota_us, period_us);
+	} else {
+		SAFE_CGROUP_PRINTF(cg, "cpu.max",
+				   "%u", quota_us);
+		SAFE_CGROUP_PRINTF(cg, "cpu.cfs_period_us",
+				  "%u", period_us);
+	}
+
+	tst_res(TINFO, "Set '%s/cpu.max' = '%d %d'",
+		tst_cgroup_group_name(cg), quota_us, period_us);
+}
+
+static struct tst_cgroup_group *
+mk_cpu_cgroup(const struct tst_cgroup_group *const cg_parent,
+	      const char *const cg_child_name,
+	      const float quota_percent)
+{
+	struct tst_cgroup_group *const cg =
+		tst_cgroup_group_mk(cg_parent, cg_child_name);
+
+	set_cpu_quota(cg, quota_percent);
+
+	return cg;
+}
+
+static void busy_loop(const unsigned int sleep_ms)
+{
+	for (;;) {
+		tst_timer_start(CLOCK_MONOTONIC_RAW);
+		while (!tst_timer_expired_ms(20))
+			;
+
+		const int ret = tst_checkpoint_wait(0, sleep_ms);
+
+		if (!ret)
+			exit(0);
+
+		if (errno != ETIMEDOUT)
+			tst_brk(TBROK | TERRNO, "tst_checkpoint_wait");
+	}
+}
+
+static void fork_busy_procs_in_cgroup(const struct tst_cgroup_group *const cg)
+{
+	const unsigned int sleeps_ms[] = {3000, 1000, 10};
+	const pid_t worker_pid = SAFE_FORK();
+	size_t i;
+
+	if (worker_pid)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(sleeps_ms); i++) {
+		const pid_t busy_pid = SAFE_FORK();
+
+		if (!busy_pid)
+			busy_loop(sleeps_ms[i]);
+
+		SAFE_CGROUP_PRINTF(cg, "cgroup.procs", "%d", busy_pid);
+	}
+
+	tst_reap_children();
+
+	exit(0);
+}
+
+static void do_test(void)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(cg_workers); i++)
+		fork_busy_procs_in_cgroup(cg_workers[i]);
+
+	tst_res(TPASS, "Scheduled bandwidth constrained workers");
+
+	sleep(1);
+
+	set_cpu_quota(cg_level2, 50);
+
+	sleep(2);
+
+	TST_CHECKPOINT_WAKE2(0, 3 * 3);
+	tst_reap_children();
+
+	tst_res(TPASS, "Workers exited");
+}
+
+static void setup(void)
+{
+	tst_cgroup_require("cpu", NULL);
+
+	cg_test = tst_cgroup_get_test_group();
+
+	cg_level2 = tst_cgroup_group_mk(cg_test, "level2");
+
+	cg_level3a = tst_cgroup_group_mk(cg_level2, "level3a");
+	cg_workers[0] = mk_cpu_cgroup(cg_level3a, "worker1", 30);
+	cg_workers[1] = mk_cpu_cgroup(cg_level3a, "worker2", 20);
+
+	cg_level3b = tst_cgroup_group_mk(cg_level2, "level3b");
+	cg_workers[2] = mk_cpu_cgroup(cg_level3b, "worker3", 30);
+}
+
+static void cleanup(void)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(cg_workers); i++) {
+		if (cg_workers[i])
+			cg_workers[i] = tst_cgroup_group_rm(cg_workers[i]);
+	}
+
+	if (cg_level3a)
+		cg_level3a = tst_cgroup_group_rm(cg_level3a);
+	if (cg_level3b)
+		cg_level3b = tst_cgroup_group_rm(cg_level3b);
+	if (cg_level2)
+		cg_level2 = tst_cgroup_group_rm(cg_level2);
+
+	tst_cgroup_cleanup();
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "39f23ce07b93"},
+		{"linux-git", "b34cb07dde7c"},
+		{"linux-git", "fe61468b2cbc"},
+		{"linux-git", "5ab297bab984"},
+		{"linux-git", "6d4d22468dae"},
+		{ }
+	}
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
