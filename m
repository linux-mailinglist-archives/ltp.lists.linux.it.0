Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40201258F56
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Sep 2020 15:46:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E18443C2DD7
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Sep 2020 15:46:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6A6AF3C2DA1
 for <ltp@lists.linux.it>; Tue,  1 Sep 2020 15:46:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C961E1A007ED
 for <ltp@lists.linux.it>; Tue,  1 Sep 2020 15:46:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A6FBAC58
 for <ltp@lists.linux.it>; Tue,  1 Sep 2020 13:46:14 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  1 Sep 2020 15:46:13 +0200
Message-Id: <20200901134613.20839-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901134613.20839-1-mdoucha@suse.cz>
References: <20200901134613.20839-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] Add test for CVE 2018-12896
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

Fixes #353

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Fix running the test with -i parameter
- Move checks out of signal handler to make it async safe

 runtest/cve                                   |   1 +
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/timer_settime/.gitignore  |   1 +
 .../syscalls/timer_settime/timer_settime03.c  | 123 ++++++++++++++++++
 4 files changed, 126 insertions(+)
 create mode 100644 testcases/kernel/syscalls/timer_settime/timer_settime03.c

diff --git a/runtest/cve b/runtest/cve
index a2ca8d27c..07c69e8ff 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -52,6 +52,7 @@ cve-2018-9568 connect02
 cve-2018-1000001 realpath01
 cve-2018-1000199 ptrace08
 cve-2018-1000204 ioctl_sg01
+cve-2018-12896 timer_settime03
 cve-2018-18445 bpf_prog04
 cve-2018-18559 bind06
 cve-2018-19854 crypto_user01
diff --git a/runtest/syscalls b/runtest/syscalls
index a6ab75ba7..398145f65 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1543,6 +1543,7 @@ timer_gettime01 timer_gettime01
 
 timer_settime01 timer_settime01
 timer_settime02 timer_settime02
+timer_settime03 timer_settime03
 
 tkill01 tkill01
 tkill02 tkill02
diff --git a/testcases/kernel/syscalls/timer_settime/.gitignore b/testcases/kernel/syscalls/timer_settime/.gitignore
index e1ed3ef17..2541a5b57 100644
--- a/testcases/kernel/syscalls/timer_settime/.gitignore
+++ b/testcases/kernel/syscalls/timer_settime/.gitignore
@@ -1,2 +1,3 @@
 /timer_settime01
 /timer_settime02
+/timer_settime03
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime03.c b/testcases/kernel/syscalls/timer_settime/timer_settime03.c
new file mode 100644
index 000000000..4cc1f8bd8
--- /dev/null
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime03.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 SUSE LLC <mdoucha@suse.cz>
+ */
+
+/*
+ * CVE 2018-12896
+ *
+ * Check for possible overflow of posix timer overrun counter. Create
+ * a CLOCK_REALTIME timer, set extremely low timer interval and expiration
+ * value just right to cause overrun overflow into negative values, start
+ * the timer with TIMER_ABSTIME flag to cause overruns immediately. Then just
+ * check the overrun counter in the timer signal handler. On a patched system,
+ * the value returned by timer_getoverrun() should be capped at INT_MAX and
+ * not allowed to overflow into negative range. Bug fixed in:
+ *
+ *  commit 78c9c4dfbf8c04883941445a195276bb4bb92c76
+ *  Author: Thomas Gleixner <tglx@linutronix.de>
+ *  Date:   Tue Jun 26 15:21:32 2018 +0200
+ *
+ *  posix-timers: Sanitize overrun handling
+ */
+
+#include <unistd.h>
+#include <signal.h>
+#include <time.h>
+#include <limits.h>
+
+#include "tst_test.h"
+#include "tst_safe_clocks.h"
+
+static timer_t timer;
+static volatile int handler_called, overrun, saved_errno;
+
+static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
+{
+	struct itimerspec spec;
+
+	/*
+	 * Signal handler will be called twice in total because kernel will
+	 * schedule another pending signal before the timer gets disabled.
+	 */
+	if (handler_called)
+		return;
+
+	errno = 0;
+	overrun = timer_getoverrun(timer);
+	saved_errno = errno;
+	memset(&spec, 0, sizeof(struct itimerspec));
+	SAFE_TIMER_SETTIME(timer, 0, &spec, NULL);
+	handler_called = 1;
+}
+
+static void setup(void)
+{
+	struct sigevent sev;
+
+	memset(&sev, 0, sizeof(struct sigevent));
+	sev.sigev_notify = SIGEV_SIGNAL;
+	sev.sigev_signo = SIGUSR1;
+
+	SAFE_SIGNAL(SIGUSR1, sighandler);
+	SAFE_TIMER_CREATE(CLOCK_REALTIME, &sev, &timer);
+}
+
+static void run(void)
+{
+	int handler_delay = INT_MAX / 7;
+	long nsec;
+	struct itimerspec spec;
+
+	handler_called = 0;
+	memset(&spec, 0, sizeof(struct itimerspec));
+	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, &spec.it_value);
+	nsec = (handler_delay % 100000000) * 10L;
+
+	if (nsec > spec.it_value.tv_nsec) {
+		spec.it_value.tv_sec -= 1;
+		spec.it_value.tv_nsec += 1000000000;
+	}
+
+	/* spec.it_value = now - 1.4 * max overrun value */
+	/* IOW, overflow will land right in the middle of negative range */
+	spec.it_value.tv_sec -= handler_delay / 100000000;
+	spec.it_value.tv_nsec -= nsec;
+	spec.it_interval.tv_nsec = 1;
+
+	SAFE_TIMER_SETTIME(timer, TIMER_ABSTIME, &spec, NULL);
+	while (!handler_called);
+	errno = saved_errno;
+
+	if (overrun == -1)
+		tst_brk(TBROK | TERRNO, "Error reading timer overrun count");
+
+	if (overrun == INT_MAX) {
+		tst_res(TPASS, "Timer overrun count is capped");
+		return;
+	}
+
+	if (overrun < 0) {
+		tst_res(TFAIL, "Timer overrun counter overflow");
+		return;
+	}
+
+	tst_res(TFAIL, "Timer overrun counter is wrong: %d; expected %d or "
+		"negative number", overrun, INT_MAX);
+}
+
+static void cleanup(void)
+{
+	SAFE_TIMER_DELETE(timer);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "78c9c4dfbf8c"},
+		{"CVE", "2018-12896"},
+		{}
+	}
+};
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
