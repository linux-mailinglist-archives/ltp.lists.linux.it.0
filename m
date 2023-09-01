Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED5678FF66
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 16:44:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 819033CE034
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 16:44:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D59013CBB56
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 16:43:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1B0571A00E32
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 16:43:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 932EB1F45F
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 14:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693579437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3PP5c1tUV4qj/4o13rzoN3nmZoBL3XOsgEa6f8gNM7I=;
 b=tinjAResIdeRpn4XiVYyh/FbGeEDntJiuyg86zJO73JA/gU6bVs/zTziMzZV/YXaNo/XQh
 VnbWamOUbx4rQaSRbW18l8qL26LnxzEyFmFYm+cL0hDUmZMep2hWScYXHaRuk2CAYQnsuf
 yI8vKIkJJx38m2BCeQ4CE0DytVKqsbM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693579437;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3PP5c1tUV4qj/4o13rzoN3nmZoBL3XOsgEa6f8gNM7I=;
 b=fyoIwCFqPbvkrhFxJHrgA08V3IYs2GPofCIkPUSNpmoszajJGXR/g1jmTlQX6/YgHwT+Jo
 ZM9gHcI0UZM+abDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 739331358B
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 14:43:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Vb7NG6348WS5aAAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 01 Sep 2023 14:43:57 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  1 Sep 2023 16:44:33 +0200
Message-ID: <20230901144433.2526-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] sched: add sched sysctl sanity test
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

Currently the test fails due to kernel bug, I will send patch to LKML
later on.

The problem with kernel is that sysctl_sched_rt_period is unsigned int
but it's processed with proc_dointvec() which means that you are allowed
to write negative values into the variable even though documentation
says it shouldn't be possible and the kernel code asserts that rt_period
is > 0.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/sched                                 |   2 +
 testcases/kernel/sched/sysctl/.gitignore      |   1 +
 testcases/kernel/sched/sysctl/Makefile        |   7 ++
 .../kernel/sched/sysctl/proc_sched_rt01.c     | 115 ++++++++++++++++++
 4 files changed, 125 insertions(+)
 create mode 100644 testcases/kernel/sched/sysctl/.gitignore
 create mode 100644 testcases/kernel/sched/sysctl/Makefile
 create mode 100644 testcases/kernel/sched/sysctl/proc_sched_rt01.c

diff --git a/runtest/sched b/runtest/sched
index 172fe4174..3457114f4 100644
--- a/runtest/sched
+++ b/runtest/sched
@@ -16,3 +16,5 @@ sched_cli_serv run_sched_cliserv.sh
 sched_stress sched_stress.sh
 
 autogroup01 autogroup01
+
+proc_sched_rt01
diff --git a/testcases/kernel/sched/sysctl/.gitignore b/testcases/kernel/sched/sysctl/.gitignore
new file mode 100644
index 000000000..29b859b81
--- /dev/null
+++ b/testcases/kernel/sched/sysctl/.gitignore
@@ -0,0 +1 @@
+proc_sched_rt01
diff --git a/testcases/kernel/sched/sysctl/Makefile b/testcases/kernel/sched/sysctl/Makefile
new file mode 100644
index 000000000..18896b6f2
--- /dev/null
+++ b/testcases/kernel/sched/sysctl/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/sched/sysctl/proc_sched_rt01.c b/testcases/kernel/sched/sysctl/proc_sched_rt01.c
new file mode 100644
index 000000000..b30256792
--- /dev/null
+++ b/testcases/kernel/sched/sysctl/proc_sched_rt01.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*\
+ * [Description]
+ *
+ * Sanity tests for the /proc/sys/kernel/sched_r* files.
+ *
+ * - The sched_rt_period_us range is 1 to INT_MAX
+ *   try invalid values and check for EINVAL
+ *
+ * - The sched_rt_runtime_us range is -1 to INT_MAX
+ *   try invalid values and check for EINVAL
+ *
+ * - The sched_rt_runtime_us must be less or equal to sched_rt_period_us
+ *
+ * - Reset sched_rr_timeslice_ms to default value by writing -1 and check that
+ *   we get the default value on next read.
+ *
+ *   This is a regression test for a commit:
+ *
+ *   commit c1fc6484e1fb7cc2481d169bfef129a1b0676abe
+ *   Author: Cyril Hrubis <chrubis@suse.cz>
+ *   Date:   Wed Aug 2 17:19:06 2023 +0200
+ *
+ *       sched/rt: sysctl_sched_rr_timeslice show default timeslice after reset
+ */
+
+#include <stdio.h>
+#include "tst_test.h"
+
+#define RT_PERIOD_US "/proc/sys/kernel/sched_rt_period_us"
+#define RT_RUNTIME_US "/proc/sys/kernel/sched_rt_runtime_us"
+#define RR_TIMESLICE_MS "/proc/sys/kernel/sched_rr_timeslice_ms"
+
+static int period_fd;
+static int runtime_fd;
+
+static void rr_timeslice_ms_reset(void)
+{
+	long timeslice_ms;
+
+	SAFE_FILE_PRINTF(RR_TIMESLICE_MS, "-1");
+	SAFE_FILE_SCANF(RR_TIMESLICE_MS, "%li", &timeslice_ms);
+
+	TST_EXP_EXPR(timeslice_ms > 0,
+	             "timeslice_ms > 0 after reset to default");
+}
+
+static void rt_period_us_einval(void)
+{
+	TST_EXP_FAIL(write(period_fd, "0", 2), EINVAL,
+	             "echo 0 > "RT_PERIOD_US);
+	TST_EXP_FAIL(write(period_fd, "-1", 2), EINVAL,
+	             "echo -1 > "RT_PERIOD_US);
+}
+
+static void rt_runtime_us_einval(void)
+{
+	TST_EXP_FAIL(write(runtime_fd, "-2", 2), EINVAL,
+	             "echo -2 > "RT_RUNTIME_US);
+}
+
+static void rt_runtime_us_le_period_us(void)
+{
+	int period_us;
+	char buf[32];
+
+	SAFE_FILE_SCANF(RT_PERIOD_US, "%i", &period_us);
+
+	sprintf(buf, "%i", period_us+1);
+
+	TST_EXP_FAIL(write(runtime_fd, buf, strlen(buf)), EINVAL,
+	             "echo rt_period_us+1 > "RT_RUNTIME_US);
+}
+
+static void verify_sched_proc(void)
+{
+	rr_timeslice_ms_reset();
+	rt_period_us_einval();
+	rt_runtime_us_einval();
+	rt_runtime_us_le_period_us();
+}
+
+static void setup(void)
+{
+	period_fd = open(RT_PERIOD_US, O_RDWR);
+	runtime_fd = open(RT_RUNTIME_US, O_RDWR);
+}
+
+static void cleanup(void)
+{
+	if (period_fd > 0)
+		SAFE_CLOSE(period_fd);
+
+	if (runtime_fd > 0)
+		SAFE_CLOSE(runtime_fd);
+}
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_sched_proc,
+	.tags = (struct tst_tag []) {
+		{"linux-git", "c1fc6484e1fb"},
+		{}
+	},
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_SYSCTL",
+		NULL
+	},
+};
-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
