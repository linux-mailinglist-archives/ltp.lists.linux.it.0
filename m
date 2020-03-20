Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF918C669
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:24:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E52E3C5475
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:24:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3A0F63C5498
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:24:19 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 230171000D5B
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:24:18 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id t24so2426193pgj.7
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 21:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=07XdwaZxt4m4OnfINa0axM18p5FxtN2nBgfoffV+AWo=;
 b=k2voHw5wFNJERqbtvtzE8+Af9YVNTEQZ2utNAOtMCQ14lKUYUTyn9peVUZOB1eQXLd
 DC++cB4Mly7Gz0dXQuVz7vHOk2L5jKhc51WmYjKMqVwuC23tohvkT/JvQdYp9tkXL8fa
 81WGhDIxxCYUqtXnBptanf3ih1Zm2AxIv5mWzBb0EjbD4VQ+h3GuH0igGT5pyyAIuoDJ
 2DEZTo88fCg+fweILjMkhyYyd4Z/+vPnN96fCOenZMPZf46oxOKmLcJ3IwGsjC3Ah4Ol
 T2nKBXR+Xcl54qBJdG3MrHldwtXpy41X17D5MuojsXQI534FoNjIZagOJaweb6sCgz1m
 QSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=07XdwaZxt4m4OnfINa0axM18p5FxtN2nBgfoffV+AWo=;
 b=j5UNY4QAWaqnnghmrUkR0XKtBZXHVxnvc2NgAb60zYRBi3NYoNFOvBV41viQhRoL6+
 tabbUNo53zrQlBNfB+k0j2dRVyz/hgOyNwG0XugMeUHJcRXIZ8dqMNYyu/9ERlvuL8uu
 mKIWojudO8KnLHzfNRSYJQ4XnKzrRFY3eaH+lD4o08Fu3rwBOq7Z6mKrnGyvdJbW1j2G
 HxfiZNqBNAjrVptLt8gVIEd//bbOCnuW1ldY1hNxBesCYYoYJMbnb7gUcaW7+8Y6622b
 7ZYD2TGhpAlH1BxaYCkwbOCcE8BLKrVgaPS8Nxq6yqWRvYM/d4eiYq/CWpL51f8y8XoQ
 DFNA==
X-Gm-Message-State: ANhLgQ1nUWAO0ArMmciBgp8uO9TYTmgirnXVGraKX+BkwXXvVRdO7cYC
 JwoHx36q/KhsB8xHvQxEaYHGsh4EXaM=
X-Google-Smtp-Source: ADFU+vunMZ5VzmudQGkqBIhT/p2HRRXZsm2JhK4d9EuEpZFH8GBI9l163zviNScuer5eQMgfu5i/Aw==
X-Received: by 2002:a63:3187:: with SMTP id x129mr6521284pgx.180.1584678255982; 
 Thu, 19 Mar 2020 21:24:15 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id j25sm3827979pfh.22.2020.03.19.21.24.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 21:24:15 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 20 Mar 2020 09:54:02 +0530
Message-Id: <cf1af6a80a8e2fc4016cf67ab52300c9e7ed3f7d.1584677993.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1584677993.git.viresh.kumar@linaro.org>
References: <cover.1584677993.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V3 2/2] syscalls/clone3: New tests
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add tests to check working of clone3() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac                                |   1 +
 include/lapi/clone.h                        |  49 +++++++
 runtest/syscalls                            |   3 +
 testcases/kernel/syscalls/clone3/.gitignore |   2 +
 testcases/kernel/syscalls/clone3/Makefile   |   7 +
 testcases/kernel/syscalls/clone3/clone301.c | 150 ++++++++++++++++++++
 testcases/kernel/syscalls/clone3/clone302.c | 102 +++++++++++++
 7 files changed, 314 insertions(+)
 create mode 100644 include/lapi/clone.h
 create mode 100644 testcases/kernel/syscalls/clone3/.gitignore
 create mode 100644 testcases/kernel/syscalls/clone3/Makefile
 create mode 100644 testcases/kernel/syscalls/clone3/clone301.c
 create mode 100644 testcases/kernel/syscalls/clone3/clone302.c

diff --git a/configure.ac b/configure.ac
index 238d1cde85f2..cf89bd8c351e 100644
--- a/configure.ac
+++ b/configure.ac
@@ -75,6 +75,7 @@ AC_CHECK_HEADERS(fts.h, [have_fts=1])
 AC_SUBST(HAVE_FTS_H, $have_fts)
 
 AC_CHECK_FUNCS([ \
+    clone3 \
     copy_file_range \
     epoll_pwait \
     execveat \
diff --git a/include/lapi/clone.h b/include/lapi/clone.h
new file mode 100644
index 000000000000..2b8cbdbe08e0
--- /dev/null
+++ b/include/lapi/clone.h
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef LAPI_CLONE_H__
+#define LAPI_CLONE_H__
+
+#include <sys/syscall.h>
+#include <linux/types.h>
+#include <sched.h>
+
+#include "config.h"
+#include "lapi/syscalls.h"
+
+#ifndef HAVE_CLONE3
+struct clone_args {
+	uint64_t __attribute__((aligned(8))) flags;
+	uint64_t __attribute__((aligned(8))) pidfd;
+	uint64_t __attribute__((aligned(8))) child_tid;
+	uint64_t __attribute__((aligned(8))) parent_tid;
+	uint64_t __attribute__((aligned(8))) exit_signal;
+	uint64_t __attribute__((aligned(8))) stack;
+	uint64_t __attribute__((aligned(8))) stack_size;
+	uint64_t __attribute__((aligned(8))) tls;
+};
+
+int clone3(struct clone_args *args, size_t size)
+{
+	return tst_syscall(__NR_clone3, args, size);
+}
+#endif
+
+#ifndef CLONE_PIDFD
+#define CLONE_PIDFD	0x00001000	/* set if a pidfd should be placed in parent */
+#endif
+
+void clone3_supported_by_kernel(void)
+{
+	if ((tst_kvercmp(5, 3, 0)) < 0) {
+		/* Check if the syscall is backported on an older kernel */
+		TEST(syscall(__NR_clone3, NULL, 0));
+		if (TST_RET == -1 && TST_ERR == ENOSYS)
+			tst_brk(TCONF, "Test not supported on kernel version < v5.3");
+	}
+}
+
+#endif /* LAPI_CLONE_H__ */
diff --git a/runtest/syscalls b/runtest/syscalls
index 6f2dcd82acf6..65ef53f33e0b 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -105,6 +105,9 @@ clone07 clone07
 clone08 clone08
 clone09 clone09
 
+clone301 clone301
+clone302 clone302
+
 close01 close01
 close02 close02
 close08 close08
diff --git a/testcases/kernel/syscalls/clone3/.gitignore b/testcases/kernel/syscalls/clone3/.gitignore
new file mode 100644
index 000000000000..604cb903e33d
--- /dev/null
+++ b/testcases/kernel/syscalls/clone3/.gitignore
@@ -0,0 +1,2 @@
+clone301
+clone302
diff --git a/testcases/kernel/syscalls/clone3/Makefile b/testcases/kernel/syscalls/clone3/Makefile
new file mode 100644
index 000000000000..18896b6f28c0
--- /dev/null
+++ b/testcases/kernel/syscalls/clone3/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/clone3/clone301.c b/testcases/kernel/syscalls/clone3/clone301.c
new file mode 100644
index 000000000000..08f58f4ae2f2
--- /dev/null
+++ b/testcases/kernel/syscalls/clone3/clone301.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic clone3() test.
+ */
+#define _GNU_SOURCE
+
+#include <stdlib.h>
+
+#include "tst_test.h"
+#include "lapi/clone.h"
+#include "lapi/pidfd_send_signal.h"
+
+#define CHILD_SIGNAL	SIGUSR1
+#define DATA	777
+
+static void parent_rx_signal(int sig, siginfo_t *info, void *ucontext);
+static void child_rx_signal(int sig, siginfo_t *info, void *ucontext);
+
+static struct sigaction psig_action = {
+	.sa_sigaction = parent_rx_signal,
+	.sa_flags = SA_SIGINFO,
+};
+
+static struct sigaction csig_action = {
+	.sa_sigaction = child_rx_signal,
+	.sa_flags = SA_SIGINFO,
+};
+
+static siginfo_t uinfo = {
+	.si_signo = CHILD_SIGNAL,
+	.si_code = SI_QUEUE,
+	.si_value.sival_int = DATA,
+};
+
+static int pidfd, child_tid, parent_tid, parent_received_signal;
+static volatile int child_received_signal;
+static struct clone_args *args;
+
+static struct tcase {
+	uint64_t flags;
+	int exit_signal;
+} tcases[] = {
+	{0, SIGCHLD},
+	{0, SIGUSR2},
+	{CLONE_FS, SIGCHLD},
+	{CLONE_NEWPID, SIGCHLD},
+	{CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, SIGCHLD},
+};
+
+static void parent_rx_signal(int sig, siginfo_t *info, void *ucontext)
+{
+	parent_received_signal = sig;
+}
+
+static void child_rx_signal(int sig, siginfo_t *info, void *ucontext)
+{
+	if (sig == CHILD_SIGNAL && info && info->si_value.sival_int == DATA)
+		child_received_signal = 1;
+}
+
+static void do_child(int clone_pidfd, int n)
+{
+	int count = 1000;
+
+	if (clone_pidfd) {
+		child_received_signal = 0;
+		SAFE_SIGACTION(CHILD_SIGNAL, &csig_action, NULL);
+
+		TST_CHECKPOINT_WAKE(0);
+
+		while(!child_received_signal && --count)
+			usleep(100);
+
+		if (child_received_signal)
+			tst_res(TPASS, "clone3() passed: Child received correct signal (index %d)", n);
+		else
+			tst_res(TFAIL, "clone3() failed: Child received incorrect signal (index %d)", n);
+	}
+
+	exit(0);
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int status, clone_pidfd = tc->flags & CLONE_PIDFD;
+	pid_t pid;
+
+	args->flags = tc->flags;
+	args->pidfd = (uint64_t)(&pidfd);
+	args->child_tid = (uint64_t)(&child_tid);
+	args->parent_tid = (uint64_t)(&parent_tid);
+	args->exit_signal = tc->exit_signal;
+	args->stack = 0;
+	args->stack_size = 0;
+	args->tls = 0;
+
+	TEST(pid = clone3(args, sizeof(*args)));
+	if (pid < 0) {
+		tst_res(TFAIL | TTERRNO, "clone3() failed (%d)", n);
+		return;
+	}
+
+	if (!pid)
+		do_child(clone_pidfd, n);
+
+	parent_received_signal = 0;
+	SAFE_SIGACTION(tc->exit_signal, &psig_action, NULL);
+
+	/* Need to send signal to child process */
+	if (clone_pidfd) {
+		TST_CHECKPOINT_WAIT(0);
+
+		TEST(pidfd_send_signal(pidfd, CHILD_SIGNAL, &uinfo, 0));
+		if (TST_RET != 0) {
+			tst_res(TFAIL | TTERRNO, "pidfd_send_signal() failed");
+			return;
+		}
+	}
+
+	SAFE_WAITPID(pid, &status, __WALL);
+
+	if (parent_received_signal == tc->exit_signal)
+		tst_res(TPASS, "clone3() passed: Parent received correct signal (index %d)", n);
+	else
+		tst_res(TFAIL, "clone3() failed: Parent received incorrect signal (index %d)", n);
+}
+
+static void setup(void)
+{
+	clone3_supported_by_kernel();
+
+	uinfo.si_pid = getpid();
+	uinfo.si_uid = getuid();
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.needs_checkpoints = 1,
+	.bufs = (struct tst_buffers []) {
+		{&args, .size = sizeof(*args)},
+		{},
+	}
+};
diff --git a/testcases/kernel/syscalls/clone3/clone302.c b/testcases/kernel/syscalls/clone3/clone302.c
new file mode 100644
index 000000000000..2f99e15d2cc4
--- /dev/null
+++ b/testcases/kernel/syscalls/clone3/clone302.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic clone3() test to check various failures.
+ */
+#define _GNU_SOURCE
+
+#include <stdlib.h>
+
+#include "tst_test.h"
+#include "lapi/clone.h"
+
+static struct clone_args *valid_args, *invalid_args;
+unsigned long stack;
+static int *invalid_address;
+
+static struct tcase {
+	const char *name;
+	struct clone_args **args;
+	size_t size;
+	uint64_t flags;
+	int **pidfd;
+	int **child_tid;
+	int **parent_tid;
+	int exit_signal;
+	unsigned long stack;
+	unsigned long stack_size;
+	unsigned long tls;
+	int exp_errno;
+} tcases[] = {
+	{"invalid args", &invalid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
+	{"zero size", &valid_args, 0, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
+	{"short size", &valid_args, sizeof(*valid_args) - 1, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
+	{"extra size", &valid_args, sizeof(*valid_args) + 1, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
+	{"sighand-no-VM", &valid_args, sizeof(*valid_args), CLONE_SIGHAND, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
+	{"thread-no-sighand", &valid_args, sizeof(*valid_args), CLONE_THREAD, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
+	{"fs-newns", &valid_args, sizeof(*valid_args), CLONE_FS | CLONE_NEWNS, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
+	{"invalid pidfd", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, &invalid_address, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
+	{"invalid childtid", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, NULL, &invalid_address, NULL, SIGCHLD, 0, 0, 0, EFAULT},
+	{"invalid parenttid", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, NULL, NULL, &invalid_address, SIGCHLD, 0, 0, 0, EFAULT},
+	{"invalid signal", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, CSIGNAL + 1, 0, 0, 0, EINVAL},
+	{"zero-stack-size", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, (unsigned long)&stack, 0, 0, EINVAL},
+	{"invalid-stack", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, 0, 4, 0, EINVAL},
+};
+
+static void setup(void)
+{
+	clone3_supported_by_kernel();
+
+	invalid_address = tst_get_bad_addr(NULL);
+	invalid_args = tst_get_bad_addr(NULL);
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	struct clone_args *args = *tc->args;
+
+	if (args == valid_args) {
+		args->flags = tc->flags;
+		if (tc->pidfd)
+			args->pidfd = (uint64_t)(*tc->pidfd);
+		if (tc->child_tid)
+			args->child_tid = (uint64_t)(*tc->child_tid);
+		if (tc->parent_tid)
+			args->parent_tid = (uint64_t)(*tc->parent_tid);
+		args->exit_signal = tc->exit_signal;
+		args->stack = tc->stack;
+		args->stack_size = tc->stack_size;
+		args->tls = tc->tls;
+	}
+
+	TEST(clone3(args, tc->size));
+
+	if (!TST_RET)
+		exit(EXIT_SUCCESS);
+
+	if (TST_RET >= 0) {
+		tst_res(TFAIL, "%s: clone3() passed unexpectedly", tc->name);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: clone3() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+		return;
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: clone3() failed as expected", tc->name);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.needs_tmpdir = 1,
+	.bufs = (struct tst_buffers []) {
+		{&valid_args, .size = sizeof(*valid_args)},
+		{},
+	}
+};
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
