Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB71182A6D
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 09:04:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF8603C5E72
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 09:04:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3986A3C5E5B
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 09:04:48 +0100 (CET)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A00CD1401A4A
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 09:04:42 +0100 (CET)
Received: by mail-pg1-x542.google.com with SMTP id u12so2664506pgb.10
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 01:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UfLqlZkVCTGdJJ5+hvwHcYueaj2hZ0szjVOpk+Ig7TU=;
 b=ZLLNFxAI6VmbzeBR7hP1ZuNneX43srKihE+P2Rxh8hWA60mPdv69kKFL5PTtrJQyq4
 hERIDuE1MSSi1hnOmQUTZMrSuPMwQXnXKF2XwIiTO80OmGk9g6ywTC0MT5HqBxnBXdec
 JFwrExkpRhcH7R3INLRtgJMd4+ar7fPnUBljvwpF/JmGf+gDB5I+F5yz3KZGH0Z2SdpG
 ATNGilN5goDKifLhjGMf+6PoGgqCRbw6dfUSo3Mb3PfXSWM9QosPaYKudbGdq++TXLYg
 BIySvhWzhErPdOq1MSxwqDECPM+jyl04oA0wa07RwX++AI7esCslh8XRk8D6modaiZZ9
 pbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UfLqlZkVCTGdJJ5+hvwHcYueaj2hZ0szjVOpk+Ig7TU=;
 b=ApqRc4QEtsZapn09INROWW1qtcIdpC6EbxQIunTu3YFv78/oWEbrNovmQIH8z61ZB+
 qIZ7yYIP66ZvdI3MiL5361d63cuJXhqhEmhthNQ7hFBIhqFxnQHTr34mim4UcDEhGPSv
 aOfyBLtBPVppJVO9QvdBbA4ja6arFBUR65iMyeCPKvLHXzuxMDniNeu/aAlSXJO71Zoa
 RCvY02BJ+Fb/9A+IMawiKfJJhJK3cXC/6e+ZsMwcTgVbP5loKnNbAyB28glMJOWsTJKC
 fWSbrpKHfLuKOZxfXPEVxLFmGmyLdjOVNSVWzpfi86S+WEyZ72oLRSvBcWXxd0JtwJLt
 IJMA==
X-Gm-Message-State: ANhLgQ1raGQFoqsnCP0yh4XHzi38uyuSLNj176MahYsech1qszbbnE51
 /UnttvWJmf+ksebveS8GA694KVDsqAc=
X-Google-Smtp-Source: ADFU+vsXBwF+PJYDhm98mpoXzZCy6/+izZzbZMNwfWevicKy/N3AOqjYLSesQe3Bfm9dXhIKJJgu7A==
X-Received: by 2002:a62:e40b:: with SMTP id r11mr6584474pfh.137.1584000280414; 
 Thu, 12 Mar 2020 01:04:40 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id u12sm52526305pfm.165.2020.03.12.01.04.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 01:04:39 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 13:34:33 +0530
Message-Id: <08f6f9f8af7b8f999136cc2a30744a8d678d2b5f.1584000268.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/clone3: New tests
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
 configure.ac                                |  1 +
 include/lapi/clone.h                        | 49 ++++++++++++
 runtest/syscalls                            |  3 +
 testcases/kernel/syscalls/clone3/.gitignore |  2 +
 testcases/kernel/syscalls/clone3/Makefile   |  7 ++
 testcases/kernel/syscalls/clone3/clone301.c | 67 ++++++++++++++++
 testcases/kernel/syscalls/clone3/clone302.c | 86 +++++++++++++++++++++
 7 files changed, 215 insertions(+)
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
index 7dd109400075..48015fe15525 100644
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
index 000000000000..7402a637d679
--- /dev/null
+++ b/testcases/kernel/syscalls/clone3/clone301.c
@@ -0,0 +1,67 @@
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
+
+static struct clone_args *args;
+static int pidfd, child_tid, parent_tid;
+
+static struct tcase {
+	uint64_t flags;
+	int exit_signal;
+} tcases[] = {
+	{0, SIGCHLD},
+	{CLONE_FS, SIGCHLD},
+	{CLONE_NEWPID, SIGCHLD},
+	{CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, SIGCHLD},
+};
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	pid_t pid;
+	int status;
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
+
+	if (pid < 0) {
+		tst_res(TFAIL | TTERRNO, "clone3() failed (%d)", n);
+		return;
+	}
+
+	if (!pid)
+		exit(EXIT_SUCCESS);
+
+	SAFE_WAIT(&status);
+
+	tst_res(TPASS, "clone3() passed with status:%d, pidfd:%d, ctid:%d, ptid:%d (index %d)",
+		WEXITSTATUS(status), pidfd, child_tid, parent_tid, n);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = clone3_supported_by_kernel,
+	.needs_tmpdir = 1,
+	.bufs = (struct tst_buffers []) {
+		{&args, .size = sizeof(*args)},
+		{},
+	}
+};
diff --git a/testcases/kernel/syscalls/clone3/clone302.c b/testcases/kernel/syscalls/clone3/clone302.c
new file mode 100644
index 000000000000..5c3e001d088d
--- /dev/null
+++ b/testcases/kernel/syscalls/clone3/clone302.c
@@ -0,0 +1,86 @@
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
+
+static struct tcase {
+	const char *name;
+	struct clone_args **args;
+	size_t size;
+	uint64_t flags;
+	int *pidfd;
+	int *child_tid;
+	int *parent_tid;
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
+	{"zero-stack-size", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, (unsigned long)&stack, 0, 0, EINVAL},
+	{"invalid-stack", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, 0, 4, 0, EINVAL},
+};
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	struct clone_args *args = *tc->args;
+
+	if (args) {
+		args->flags = tc->flags;
+		args->pidfd = (uint64_t)(tc->pidfd);
+		args->child_tid = (uint64_t)(tc->child_tid);
+		args->parent_tid = (uint64_t)(tc->parent_tid);
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
+	.setup = clone3_supported_by_kernel,
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
