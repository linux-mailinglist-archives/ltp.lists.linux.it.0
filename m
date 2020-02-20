Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D671165FEE
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 15:46:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B80CC3C25CE
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 15:46:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A72CF3C2231
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 15:46:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D5C652015AB
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 15:46:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32001AE1C
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 14:46:00 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 20 Feb 2020 15:45:59 +0100
Message-Id: <20200220144559.22440-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] Add test for CVE 2017-10661
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/cve/Makefile         |   3 +
 testcases/cve/cve-2017-10661.c | 112 +++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 testcases/cve/cve-2017-10661.c

diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
index da44fff60..1faee9fc5 100644
--- a/testcases/cve/Makefile
+++ b/testcases/cve/Makefile
@@ -36,6 +36,9 @@ endif
 cve-2017-2671:	CFLAGS += -pthread
 cve-2017-2671:	LDLIBS += -lrt
 
+cve-2017-10661:	CFLAGS += -pthread
+cve-2017-10661:	LDLIBS += -lrt
+
 meltdown: CFLAGS += -I$(abs_srcdir)/../realtime/include
 
 ifneq (,$(filter $(HOST_CPU),x86 x86_64))
diff --git a/testcases/cve/cve-2017-10661.c b/testcases/cve/cve-2017-10661.c
new file mode 100644
index 000000000..6fe6b63c7
--- /dev/null
+++ b/testcases/cve/cve-2017-10661.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 SUSE LLC <mdoucha@suse.cz>
+ *
+ * CVE-2017-10661
+ *
+ * Test for race condition vulnerability in timerfd_settime(). Multiple
+ * concurrent calls of timerfd_settime() clearing the CANCEL_ON_SET flag may
+ * cause memory corruption. Fixed in:
+ *
+ *  commit 1e38da300e1e395a15048b0af1e5305bd91402f6
+ *  Author: Thomas Gleixner <tglx@linutronix.de>
+ *  Date:   Tue Jan 31 15:24:03 2017 +0100
+ *
+ *  timerfd: Protect the might cancel mechanism proper
+ */
+#include <unistd.h>
+#include <lapi/timerfd.h>
+#include "tst_test.h"
+#include "tst_fuzzy_sync.h"
+#include "tst_taint.h"
+
+#define TIMERFD_FLAGS "timerfd_settime(TFD_TIMER_ABSTIME | TFD_TIMER_CANCEL_ON_SET)"
+
+#ifndef TFD_TIMER_CANCEL_ON_SET
+#define TFD_TIMER_CANCEL_ON_SET (1<<1)
+#endif
+
+static int fd = -1;
+static struct itimerspec its;
+static struct tst_fzsync_pair fzsync_pair;
+
+static void setup(void)
+{
+	int tmp;
+
+	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
+	fd = timerfd_create(CLOCK_REALTIME, 0);
+
+	if (fd < 0) {
+		tmp = (errno == ENOTSUP ? TCONF : TBROK) | TERRNO,
+		tst_brk(tmp, "Cannot create timer");
+	}
+
+	fzsync_pair.exec_loops = 1000000;
+	tst_fzsync_pair_init(&fzsync_pair);
+}
+
+static void cleanup(void)
+{
+	if (fd >= 0)
+		SAFE_CLOSE(fd);
+	tst_fzsync_pair_cleanup(&fzsync_pair);
+}
+
+static int punch_clock(int flags)
+{
+	return timerfd_settime(fd, flags, &its, NULL);
+}
+
+static void *thread_run(void *arg)
+{
+	while (tst_fzsync_run_b(&fzsync_pair)) {
+		tst_fzsync_start_race_b(&fzsync_pair);
+		// race to clear the CANCEL_ON_SET flag
+		punch_clock(0);
+		tst_fzsync_end_race_b(&fzsync_pair);
+	}
+
+	return arg;
+}
+
+static void run(void)
+{
+	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
+
+	while (tst_fzsync_run_a(&fzsync_pair)) {
+		// set the CANCEL_ON_SET flag
+		TEST(punch_clock(TFD_TIMER_ABSTIME | TFD_TIMER_CANCEL_ON_SET));
+
+		if (TST_RET == -1)
+			tst_res(TBROK | TTERRNO, TIMERFD_FLAGS " failed");
+
+		if (TST_RET != 0)
+			tst_res(TBROK | TTERRNO, "Invalid " TIMERFD_FLAGS
+				" return value");
+
+		tst_fzsync_start_race_a(&fzsync_pair);
+		// race to clear the CANCEL_ON_SET flag
+		punch_clock(0);
+		tst_fzsync_end_race_a(&fzsync_pair);
+
+		if (tst_taint_check()) {
+			tst_res(TFAIL, "Kernel is vulnerable");
+			return;
+		}
+	}
+
+	tst_res(TPASS, "Nothing bad happened, probably");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.min_kver = "2.6.25",
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "1e38da300e1e"},
+		{"CVE", "2017-10661"},
+		{}
+	}
+};
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
