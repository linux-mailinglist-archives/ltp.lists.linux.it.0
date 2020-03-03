Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A82177581
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 12:53:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 548683C66E4
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 12:53:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A82DD3C66D5
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 12:53:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0CD5C6008B5
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 12:53:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4D278AD4F
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 11:53:07 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Tue,  3 Mar 2020 12:53:06 +0100
Message-Id: <20200303115306.16443-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3] Add test for CVE 2017-10661
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
Changes since v1:
- typo fixes
- code style fixes
- move test from cve/ to kernel/syscall/timerfd/
- add test to cve runfile

Changes since v2:
- Fix broken Makefile
- Remove CFLAGS because timer_settime02 gets compiled and linked in one step
- Fix tst_res(TBROK) calls which were meant to be tst_brk(TBROK)

 runtest/cve                                   |   1 +
 testcases/kernel/syscalls/timerfd/Makefile    |   3 +-
 .../syscalls/timerfd/timerfd_settime02.c      | 110 ++++++++++++++++++
 3 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 testcases/kernel/syscalls/timerfd/timerfd_settime02.c

diff --git a/runtest/cve b/runtest/cve
index 57cf66075..36c5ba1d6 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -19,6 +19,7 @@ cve-2017-2671 cve-2017-2671
 cve-2017-6951 request_key05
 cve-2017-7308 setsockopt02
 cve-2017-7472 keyctl04
+cve-2017-10661 timerfd_settime02
 cve-2017-12192 keyctl07
 cve-2017-12193 add_key04
 cve-2017-15274 add_key02
diff --git a/testcases/kernel/syscalls/timerfd/Makefile b/testcases/kernel/syscalls/timerfd/Makefile
index 3691a8c36..b47e156d3 100644
--- a/testcases/kernel/syscalls/timerfd/Makefile
+++ b/testcases/kernel/syscalls/timerfd/Makefile
@@ -20,6 +20,7 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS			+= -lpthread -lrt
+LDLIBS			+= -lrt
+timerfd_settime02:	LDLIBS	+= -pthread
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/timerfd/timerfd_settime02.c b/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
new file mode 100644
index 000000000..7fa26de62
--- /dev/null
+++ b/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
@@ -0,0 +1,110 @@
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
+	int ttype;
+
+	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
+	errno = 0;
+	fd = timerfd_create(CLOCK_REALTIME, 0);
+
+	if (fd < 0) {
+		ttype = (errno == ENOTSUP ? TCONF : TBROK);
+		tst_brk(ttype | TERRNO, "Cannot create timer");
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
+		TEST(punch_clock(TFD_TIMER_ABSTIME | TFD_TIMER_CANCEL_ON_SET));
+
+		if (TST_RET == -1)
+			tst_brk(TBROK | TTERRNO, TIMERFD_FLAGS " failed");
+
+		if (TST_RET != 0)
+			tst_brk(TBROK | TTERRNO, "Invalid " TIMERFD_FLAGS
+				" return value");
+
+		tst_fzsync_start_race_a(&fzsync_pair);
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
