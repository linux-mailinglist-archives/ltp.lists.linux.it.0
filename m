Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEB717A6B3
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:49:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 794D23C6570
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:49:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8D8DE3C6550
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:48:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E82342016A9
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:48:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D416AB6D
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 13:48:40 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Mar 2020 14:48:32 +0100
Message-Id: <20200305134834.16736-7-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200305134834.16736-1-chrubis@suse.cz>
References: <20200305134834.16736-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 6/8] syscalls/clock_gettime03: Add basic time
 namespace test
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/containers                            |   1 +
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/clock_gettime/.gitignore  |   1 +
 .../syscalls/clock_gettime/clock_gettime03.c  | 113 ++++++++++++++++++
 4 files changed, 116 insertions(+)
 create mode 100644 testcases/kernel/syscalls/clock_gettime/clock_gettime03.c

diff --git a/runtest/containers b/runtest/containers
index 8100cd2bc..1006d8d35 100644
--- a/runtest/containers
+++ b/runtest/containers
@@ -89,3 +89,4 @@ userns07 userns07
 # time namespaces
 sysinfo03 sysinfo03
 clock_nanosleep03 clock_nanosleep03
+clock_gettime03 clock_gettime03
diff --git a/runtest/syscalls b/runtest/syscalls
index d19ae0041..778f722a3 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -91,6 +91,7 @@ clock_nanosleep03 clock_nanosleep03
 
 clock_gettime01 clock_gettime01
 clock_gettime02 clock_gettime02
+clock_gettime03 clock_gettime03
 leapsec01 leapsec01
 
 clock_settime01 clock_settime01
diff --git a/testcases/kernel/syscalls/clock_gettime/.gitignore b/testcases/kernel/syscalls/clock_gettime/.gitignore
index ba471c859..9d06613b6 100644
--- a/testcases/kernel/syscalls/clock_gettime/.gitignore
+++ b/testcases/kernel/syscalls/clock_gettime/.gitignore
@@ -1,3 +1,4 @@
 clock_gettime01
 clock_gettime02
+clock_gettime03
 leapsec01
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
new file mode 100644
index 000000000..533b3898e
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+
+  Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+
+ */
+/*
+
+  Basic test for timer namespaces.
+
+  After a call to unshare(CLONE_NEWTIME) a new timer namespace is created, the
+  process that has called the unshare() can adjust offsets for CLOCK_MONOTONIC
+  and CLOCK_BOOTTIME for its children by writing to the '/proc/self/timens_offsets'.
+
+  The child processes also switch to the initial parent namespace and checks
+  that the offset is set to 0.
+
+ */
+
+#define _GNU_SOURCE
+#include "lapi/setns.h"
+#include "tst_safe_clocks.h"
+#include "tst_timer.h"
+#include "lapi/namespaces_constants.h"
+#include "tst_test.h"
+
+static struct tcase {
+	int clk_id;
+	int clk_off;
+	int off;
+} tcases[] = {
+	{CLOCK_MONOTONIC, CLOCK_MONOTONIC, 10},
+	{CLOCK_BOOTTIME, CLOCK_BOOTTIME, 10},
+
+	{CLOCK_MONOTONIC, CLOCK_MONOTONIC, -10},
+	{CLOCK_BOOTTIME, CLOCK_BOOTTIME, -10},
+
+	{CLOCK_MONOTONIC_RAW, CLOCK_MONOTONIC, 100},
+	{CLOCK_MONOTONIC_COARSE, CLOCK_MONOTONIC, 100},
+};
+
+static struct timespec now;
+static int parent_ns;
+
+static void child(struct tcase *tc)
+{
+	struct timespec then;
+	struct timespec parent_then;
+	long long diff;
+
+	SAFE_CLOCK_GETTIME(tc->clk_id, &then);
+
+	setns(parent_ns, CLONE_NEWTIME);
+
+	SAFE_CLOCK_GETTIME(tc->clk_id, &parent_then);
+
+	diff = tst_timespec_diff_ms(then, now);
+
+	if (diff/1000 != tc->off) {
+		tst_res(TFAIL, "Wrong offset (%s) read %llims",
+		        tst_clock_name(tc->clk_id), diff);
+	} else {
+		tst_res(TPASS, "Offset (%s) is correct %llims",
+		        tst_clock_name(tc->clk_id), diff);
+	}
+
+	diff = tst_timespec_diff_ms(parent_then, now);
+
+	if (diff/1000) {
+		tst_res(TFAIL, "Wrong offset (%s) read %llims",
+		        tst_clock_name(tc->clk_id), diff);
+	} else {
+		tst_res(TPASS, "Offset (%s) is correct %llims",
+		        tst_clock_name(tc->clk_id), diff);
+	}
+}
+
+static void verify_ns_clock(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	SAFE_UNSHARE(CLONE_NEWTIME);
+
+	SAFE_FILE_PRINTF("/proc/self/timens_offsets", "%d %d 0",
+	                 tc->clk_off, tc->off);
+
+	SAFE_CLOCK_GETTIME(tc->clk_id, &now);
+
+	if (!SAFE_FORK())
+		child(tc);
+}
+
+static void setup(void)
+{
+	parent_ns = SAFE_OPEN("/proc/self/ns/time_for_children", O_RDONLY);
+}
+
+static void cleanup(void)
+{
+	SAFE_CLOSE(parent_ns);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_ns_clock,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_TIME_NS=y"
+	}
+};
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
