Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D744C1956F9
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 13:16:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17E043C331F
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 13:16:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 18C1E3C32FB
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 13:16:14 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DACC260082C
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 13:16:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 65FBEAE63
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 12:16:13 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Mar 2020 13:16:11 +0100
Message-Id: <20200327121611.1566-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327121611.1566-1-mdoucha@suse.cz>
References: <20200327121611.1566-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] Add test for CVE 2018-1000199
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

Fixes #593

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Split off SAFE_PTRACE() to separate patch
- Fixed compilation on non-x86 platforms
- Use SAFE_FOPEN() and SAFE_FCLOSE() in setup()
- Allow child process to be killed by other signals than SIGTRAP

 runtest/cve                                 |   1 +
 runtest/syscalls                            |   1 +
 testcases/kernel/syscalls/ptrace/.gitignore |   1 +
 testcases/kernel/syscalls/ptrace/ptrace08.c | 144 ++++++++++++++++++++
 4 files changed, 147 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ptrace/ptrace08.c

diff --git a/runtest/cve b/runtest/cve
index a9a534300..dbd065fd1 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -41,5 +41,6 @@ cve-2017-18075 pcrypt_aead01
 cve-2017-1000380 snd_timer01
 cve-2018-5803 sctp_big_chunk
 cve-2018-1000001 realpath01
+cve-2018-1000199 ptrace08
 cve-2018-1000204 ioctl_sg01
 cve-2018-19854 crypto_user01
diff --git a/runtest/syscalls b/runtest/syscalls
index 0ad66ca5e..e63c6bad5 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -973,6 +973,7 @@ ptrace05 ptrace05
 # Broken test; See: testcases/kernel/syscalls/ptrace/Makefile for more details.
 #ptrace06 ptrace06
 ptrace07 ptrace07
+ptrace08 ptrace08
 
 pwrite01 pwrite01
 pwrite02 pwrite02
diff --git a/testcases/kernel/syscalls/ptrace/.gitignore b/testcases/kernel/syscalls/ptrace/.gitignore
index 4e4f83020..301e2f564 100644
--- a/testcases/kernel/syscalls/ptrace/.gitignore
+++ b/testcases/kernel/syscalls/ptrace/.gitignore
@@ -3,3 +3,4 @@
 /ptrace04
 /ptrace05
 /ptrace07
+/ptrace08
diff --git a/testcases/kernel/syscalls/ptrace/ptrace08.c b/testcases/kernel/syscalls/ptrace/ptrace08.c
new file mode 100644
index 000000000..448bc72e3
--- /dev/null
+++ b/testcases/kernel/syscalls/ptrace/ptrace08.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 Andrew Lutomirski
+ * Copyright (C) 2020 SUSE LLC <mdoucha@suse.cz>
+ *
+ * CVE-2018-1000199
+ *
+ * Test error handling when ptrace(POKEUSER) modifies debug registers.
+ * Even if the call returns error, it may create breakpoint in kernel code.
+ * Kernel crash partially fixed in:
+ *
+ *  commit f67b15037a7a50c57f72e69a6d59941ad90a0f0f
+ *  Author: Linus Torvalds <torvalds@linux-foundation.org>
+ *  Date:   Mon Mar 26 15:39:07 2018 -1000
+ *
+ *  perf/hwbp: Simplify the perf-hwbp code, fix documentation
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <stddef.h>
+#include <sys/ptrace.h>
+#include <sys/user.h>
+#include <signal.h>
+#include "tst_test.h"
+#include "tst_safe_stdio.h"
+
+#if defined(__i386__) || defined(__x86_64__)
+#define SYMNAME_SIZE 256
+#define KERNEL_SYM "do_debug"
+
+static unsigned long break_addr;
+static pid_t child_pid;
+
+static void setup(void)
+{
+	int fcount;
+	char endl, symname[256];
+	FILE *fr = SAFE_FOPEN("/proc/kallsyms", "r");
+
+	/* Find address of do_debug() in /proc/kallsyms */
+	do {
+		fcount = fscanf(fr, "%lx %*c %255s%c", &break_addr, symname,
+			&endl);
+
+		if (fcount <= 0 && feof(fr))
+			break;
+
+		if (fcount < 2) {
+			fclose(fr);
+			tst_brk(TBROK, "Unexpected data in /proc/kallsyms %d", fcount);
+		}
+
+		if (fcount >= 3 && endl != '\n')
+			while (!feof(fr) && fgetc(fr) != '\n');
+	} while (!feof(fr) && strcmp(symname, KERNEL_SYM));
+
+	SAFE_FCLOSE(fr);
+
+	if (strcmp(symname, KERNEL_SYM))
+		tst_brk(TBROK, "Cannot find address of kernel symbol \"%s\"",
+			KERNEL_SYM);
+
+	if (!break_addr)
+		tst_brk(TCONF, "Addresses in /proc/kallsyms are hidden");
+
+	tst_res(TINFO, "Kernel symbol \"%s\" found at 0x%lx", KERNEL_SYM,
+		break_addr);
+}
+
+static void debug_trap(void)
+{
+	/* x86 instruction INT1 */
+	asm volatile (".byte 0xf1");
+}
+
+static void child_main(void)
+{
+	raise(SIGSTOP);
+	/* wait for SIGCONT from parent */
+	debug_trap();
+	exit(0);
+}
+
+static void run(void)
+{
+	int status;
+	pid_t child;
+
+	child = child_pid = SAFE_FORK();
+
+	if (!child_pid) {
+		child_main();
+	}
+
+	if (SAFE_WAITPID(child_pid, &status, WUNTRACED) != child_pid)
+		tst_brk(TBROK, "Received event from unexpected PID");
+
+	SAFE_PTRACE(PTRACE_ATTACH, child_pid, NULL, NULL);
+	SAFE_PTRACE(PTRACE_POKEUSER, child_pid,
+		(void *)offsetof(struct user, u_debugreg[0]), (void *)1);
+	SAFE_PTRACE(PTRACE_POKEUSER, child_pid,
+		(void *)offsetof(struct user, u_debugreg[7]), (void *)1);
+
+	/* Return value intentionally ignored here */
+	ptrace(PTRACE_POKEUSER, child_pid,
+		(void *)offsetof(struct user, u_debugreg[0]),
+		(void *)break_addr);
+
+	SAFE_PTRACE(PTRACE_DETACH, child_pid, NULL, NULL);
+	SAFE_KILL(child_pid, SIGCONT);
+	child_pid = 0;
+
+	if (SAFE_WAITPID(child, &status, 0) != child)
+		tst_brk(TBROK, "Received event from unexpected PID");
+
+	if (!WIFSIGNALED(status))
+		tst_brk(TBROK, "Received unexpected event from child");
+
+	tst_res(TPASS, "Child killed by %s", tst_strsig(WTERMSIG(status)));
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
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "f67b15037a7a"},
+		{"CVE", "2018-1000199"},
+		{}
+	}
+};
+#else
+TST_TEST_TCONF("This test is only supported on x86 systems");
+#endif
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
