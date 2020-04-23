Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4507E1B5C38
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 15:14:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA8AC3C2945
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 15:14:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B43463C2934
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 15:14:24 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1F5F21A01163
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 15:14:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 963FBABBD
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 13:12:55 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 23 Apr 2020 15:12:54 +0200
Message-Id: <20200423131254.17805-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] Add test for CVE 2018-8897
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

Fixes #594

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/cve                                 |   1 +
 runtest/syscalls                            |   1 +
 testcases/kernel/syscalls/ptrace/.gitignore |   1 +
 testcases/kernel/syscalls/ptrace/ptrace09.c | 103 ++++++++++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ptrace/ptrace09.c

diff --git a/runtest/cve b/runtest/cve
index 629cf7035..826f76dfe 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -41,6 +41,7 @@ cve-2017-18075 pcrypt_aead01
 cve-2017-1000380 snd_timer01
 cve-2018-5803 sctp_big_chunk
 cve-2018-7566 snd_seq01
+cve-2018-8897 ptrace09
 cve-2018-9568 connect02
 cve-2018-1000001 realpath01
 cve-2018-1000199 ptrace08
diff --git a/runtest/syscalls b/runtest/syscalls
index f6df32859..6fb37eb1f 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -985,6 +985,7 @@ ptrace05 ptrace05
 #ptrace06 ptrace06
 ptrace07 ptrace07
 ptrace08 ptrace08
+ptrace09 ptrace09
 
 pwrite01 pwrite01
 pwrite02 pwrite02
diff --git a/testcases/kernel/syscalls/ptrace/.gitignore b/testcases/kernel/syscalls/ptrace/.gitignore
index 301e2f564..7639e1a9f 100644
--- a/testcases/kernel/syscalls/ptrace/.gitignore
+++ b/testcases/kernel/syscalls/ptrace/.gitignore
@@ -4,3 +4,4 @@
 /ptrace05
 /ptrace07
 /ptrace08
+/ptrace09
diff --git a/testcases/kernel/syscalls/ptrace/ptrace09.c b/testcases/kernel/syscalls/ptrace/ptrace09.c
new file mode 100644
index 000000000..85875ce65
--- /dev/null
+++ b/testcases/kernel/syscalls/ptrace/ptrace09.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2018 SUSE LLC <nstange@suse.de>
+ * Copyright (C) 2020 SUSE LLC <mdoucha@suse.cz>
+ *
+ * CVE-2018-8897
+ *
+ * Test that the MOV SS instruction touching a ptrace watchpoint followed by
+ * INT3 breakpoint is handled correctly by the kernel. Kernel crash fixed in:
+ *
+ *  commit d8ba61ba58c88d5207c1ba2f7d9a2280e7d03be9
+ *  Author: Andy Lutomirski <luto@kernel.org>
+ *  Date:   Thu Jul 23 15:37:48 2015 -0700
+ *
+ *  x86/entry/64: Don't use IST entry for #BP stack
+ */
+
+#include <stdlib.h>
+#include <stddef.h>
+#include <sys/ptrace.h>
+#include <sys/user.h>
+#include <signal.h>
+#include "tst_test.h"
+
+#if defined(__i386__) || defined(__x86_64__)
+static short watchpoint;
+static pid_t child_pid;
+
+static int child_main(void)
+{
+	SAFE_PTRACE(PTRACE_TRACEME, 0, NULL, NULL);
+	raise(SIGSTOP);
+	/* wait for SIGCONT from parent */
+
+	asm volatile(
+		"mov %%ss, %0\n"
+		"mov %0, %%ss\n"
+		"int $3\n"
+		: "+m" (watchpoint)
+	);
+
+	return 0;
+}
+
+static void run(void)
+{
+	int status;
+
+	child_pid = SAFE_FORK();
+
+	if (!child_pid) {
+		exit(child_main());
+	}
+
+	if (SAFE_WAITPID(child_pid, &status, 0) != child_pid)
+		tst_brk(TBROK, "Received event from unexpected PID");
+
+	SAFE_PTRACE(PTRACE_POKEUSER, child_pid,
+		(void *)offsetof(struct user, u_debugreg[0]), &watchpoint);
+	SAFE_PTRACE(PTRACE_POKEUSER, child_pid,
+		(void *)offsetof(struct user, u_debugreg[7]), (void *)0x30001);
+	SAFE_PTRACE(PTRACE_CONT, child_pid, NULL, NULL);
+
+	while (1) {
+		if (SAFE_WAITPID(child_pid, &status, 0) != child_pid)
+			tst_brk(TBROK, "Received event from unexpected PID");
+
+		if (WIFEXITED(status)) {
+			child_pid = 0;
+			break;
+		}
+
+		if (WIFSTOPPED(status)) {
+			SAFE_PTRACE(PTRACE_CONT, child_pid, NULL, NULL);
+			continue;
+		}
+
+		tst_brk(TBROK, "Unexpected event from child");
+	}
+
+	tst_res(TPASS, "We're still here. Nothing bad happened, probably.");
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
+		{"linux-git", "d8ba61ba58c8"},
+		{"CVE", "2018-8897"},
+		{}
+	}
+};
+#else
+TST_TEST_TCONF("This test is only supported on x86 systems");
+#endif
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
