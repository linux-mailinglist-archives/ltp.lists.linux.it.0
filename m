Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F66525E141
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Sep 2020 20:00:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E90F13C54C4
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Sep 2020 20:00:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C76403C54BA
 for <ltp@lists.linux.it>; Fri,  4 Sep 2020 20:00:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 346591000A7B
 for <ltp@lists.linux.it>; Fri,  4 Sep 2020 20:00:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A8D9ABA2;
 Fri,  4 Sep 2020 18:00:02 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  4 Sep 2020 20:00:30 +0200
Message-Id: <20200904180030.14838-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ptrace10: Add new regression test
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 lkp@lists.01.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

New regression test for a kernel commit:

commit bd14406b78e6daa1ea3c1673bda1ffc9efdeead0
Author: Jiri Olsa <jolsa@kernel.org>
Date:   Mon Aug 27 11:12:25 2018 +0200

    perf/hw_breakpoint: Modify breakpoint even if the new attr has disabled set

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Andy Lutomirski <luto@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Alexandre Chartre <alexandre.chartre@oracle.com>
---

This is a follow up for the ptrace08 fixes.

 runtest/syscalls                            |  1 +
 testcases/kernel/syscalls/ptrace/.gitignore |  1 +
 testcases/kernel/syscalls/ptrace/ptrace10.c | 86 +++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ptrace/ptrace10.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 398145f65..163471bcd 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -993,6 +993,7 @@ ptrace05 ptrace05
 ptrace07 ptrace07
 ptrace08 ptrace08
 ptrace09 ptrace09
+ptrace10 ptrace10
 
 pwrite01 pwrite01
 pwrite02 pwrite02
diff --git a/testcases/kernel/syscalls/ptrace/.gitignore b/testcases/kernel/syscalls/ptrace/.gitignore
index 7639e1a9f..7ee3b3c47 100644
--- a/testcases/kernel/syscalls/ptrace/.gitignore
+++ b/testcases/kernel/syscalls/ptrace/.gitignore
@@ -5,3 +5,4 @@
 /ptrace07
 /ptrace08
 /ptrace09
+/ptrace10
diff --git a/testcases/kernel/syscalls/ptrace/ptrace10.c b/testcases/kernel/syscalls/ptrace/ptrace10.c
new file mode 100644
index 000000000..b5d6b9f8f
--- /dev/null
+++ b/testcases/kernel/syscalls/ptrace/ptrace10.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Cyril Hrubis <chrbis@suse.cz>
+ *
+ * After fix for CVE-2018-1000199 (see ptrace08.c) subsequent calls to POKEUSER
+ * for x86 debug registers were ignored silently.
+ *
+ * This is a regression test for commit:
+ *
+ * commit bd14406b78e6daa1ea3c1673bda1ffc9efdeead0
+ * Author: Jiri Olsa <jolsa@kernel.org>
+ * Date:   Mon Aug 27 11:12:25 2018 +0200
+ *
+ *     perf/hw_breakpoint: Modify breakpoint even if the new attr has disabled set
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <stddef.h>
+#include <sys/ptrace.h>
+#include <sys/user.h>
+#include <signal.h>
+#include "tst_test.h"
+
+#if defined(__i386__) || defined(__x86_64__)
+
+static pid_t child_pid;
+
+static void child_main(void)
+{
+	raise(SIGSTOP);
+	exit(0);
+}
+
+static void run(void)
+{
+	int status;
+	unsigned long addr;
+
+	child_pid = SAFE_FORK();
+
+	if (!child_pid)
+		child_main();
+
+	if (SAFE_WAITPID(child_pid, &status, WUNTRACED) != child_pid)
+		tst_brk(TBROK, "Received event from unexpected PID");
+
+	SAFE_PTRACE(PTRACE_ATTACH, child_pid, NULL, NULL);
+	SAFE_PTRACE(PTRACE_POKEUSER, child_pid,
+		(void *)offsetof(struct user, u_debugreg[0]), (void *)1);
+	SAFE_PTRACE(PTRACE_POKEUSER, child_pid,
+		(void *)offsetof(struct user, u_debugreg[0]), (void *)2);
+
+	addr = ptrace(PTRACE_PEEKUSER, child_pid,
+	              (void*)offsetof(struct user, u_debugreg[0]), NULL);
+
+	if (addr == 2)
+		tst_res(TPASS, "The rd0 was set on second PTRACE_POKEUSR");
+	else
+		tst_res(TFAIL, "The rd0 wasn't set on second PTRACE_POKEUSER");
+
+	SAFE_PTRACE(PTRACE_DETACH, child_pid, NULL, NULL);
+	SAFE_KILL(child_pid, SIGCONT);
+	child_pid = 0;
+	tst_reap_children();
+}
+
+static void cleanup(void)
+{
+	/* Main process terminated by tst_brk() with child still paused */
+	if (child_pid)
+		SAFE_KILL(child_pid, SIGKILL);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "bd14406b78e6"},
+		{}
+	}
+};
+#else
+TST_TEST_TCONF("This test is only supported on x86 systems");
+#endif
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
