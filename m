Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE96189FBA
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 16:35:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEBF43C5550
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 16:35:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 84AB33C5537
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 16:34:19 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2939C2001B4
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 16:34:19 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF69CAE57
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 15:34:18 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 18 Mar 2020 16:37:58 +0100
Message-Id: <20200318153801.3529-7-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318153801.3529-1-chrubis@suse.cz>
References: <20200318153801.3529-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 6/9] syscalls/clock_nanosleep03: Add test for time
 namespace
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

Test that absolute timeout for clock nanosleep is adjusted by the offset
correctly inside of a time namespace.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/containers                            |  1 +
 runtest/syscalls                              |  1 +
 .../syscalls/clock_nanosleep/.gitignore       |  1 +
 .../clock_nanosleep/clock_nanosleep03.c       | 71 +++++++++++++++++++
 4 files changed, 74 insertions(+)
 create mode 100644 testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c

diff --git a/runtest/containers b/runtest/containers
index 4dc05af93..8100cd2bc 100644
--- a/runtest/containers
+++ b/runtest/containers
@@ -88,3 +88,4 @@ userns07 userns07
 
 # time namespaces
 sysinfo03 sysinfo03
+clock_nanosleep03 clock_nanosleep03
diff --git a/runtest/syscalls b/runtest/syscalls
index fb0b9e539..eac4eeffc 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -87,6 +87,7 @@ clock_getres01 clock_getres01
 clock_nanosleep01 clock_nanosleep01
 clock_nanosleep02 clock_nanosleep02
 clock_nanosleep2_01 clock_nanosleep2_01
+clock_nanosleep03 clock_nanosleep03
 
 clock_gettime01 clock_gettime01
 clock_gettime02 clock_gettime02
diff --git a/testcases/kernel/syscalls/clock_nanosleep/.gitignore b/testcases/kernel/syscalls/clock_nanosleep/.gitignore
index 6714ff468..406897cde 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/.gitignore
+++ b/testcases/kernel/syscalls/clock_nanosleep/.gitignore
@@ -1,2 +1,3 @@
 /clock_nanosleep01
 /clock_nanosleep02
+/clock_nanosleep03
diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
new file mode 100644
index 000000000..99ff99736
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+
+  Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+
+ */
+/*
+
+   Test that clock_nanosleep() adds correctly an offset with absolute timeout
+   and CLOCK_MONOTONIC inside of a timer namespace.
+
+   After a call to unshare(CLONE_NEWTIME) a new timer namespace is created, the
+   process that has called the unshare() can adjust offsets for CLOCK_MONOTONIC
+   and CLOCK_BOOTTIME for its children by writing to the '/proc/self/timens_offsets'.
+
+ */
+
+#include <stdlib.h>
+#include "tst_safe_clocks.h"
+#include "tst_timer.h"
+#include "lapi/namespaces_constants.h"
+#include "tst_test.h"
+
+#define OFFSET_S 10
+#define SLEEP_US 100000
+
+static void verify_clock_nanosleep(void)
+{
+	struct timespec start, end, sleep_abs;
+
+	SAFE_UNSHARE(CLONE_NEWTIME);
+
+	SAFE_FILE_PRINTF("/proc/self/timens_offsets", "%d %d 0", CLOCK_MONOTONIC, OFFSET_S);
+
+	SAFE_CLOCK_GETTIME(CLOCK_MONOTONIC, &start);
+
+	sleep_abs = tst_timespec_add_us(start, 1000000 * OFFSET_S + SLEEP_US);
+
+	if (!SAFE_FORK()) {
+		clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &sleep_abs, NULL);
+		exit(0);
+	}
+
+	SAFE_WAIT(NULL);
+
+	SAFE_CLOCK_GETTIME(CLOCK_MONOTONIC, &end);
+
+	long long diff = tst_timespec_diff_us(end, start);
+
+	if (diff > 5 * SLEEP_US) {
+		tst_res(TFAIL, "clock_nanosleep() slept too long %lli", diff);
+		return;
+	}
+
+	if (diff < SLEEP_US) {
+		tst_res(TFAIL, "clock_nanosleep() slept too short %lli", diff);
+		return;
+	}
+
+	tst_res(TPASS, "clock_nanosleep() slept correctly %lli", diff);
+}
+
+static struct tst_test test = {
+	.test_all = verify_clock_nanosleep,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_TIME_NS=y"
+	}
+
+};
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
