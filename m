Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 693A11735A2
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 11:50:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9BFC3C6AE9
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 11:50:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EF53D3C6AB6
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 11:50:34 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 75FDF1A0240B
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 11:50:30 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id g6so1101363plp.6
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 02:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=faYrj3O9JwWty84JboM/7aJ0xvb2yfRo7zKfDJoDCks=;
 b=Kz8JBmj8zyKSt81taI58sg44+hnf8XAJDC3YFX+POJOB3PJGjwslL0JJH5zoGTYxyu
 uDwMTJ2oJ96z1S+s/8Hdg8m0W+Y4eEkX/oTTV9jVwALfd0TN99kYPejbTjx9jfP5+CyM
 Qy3d4LIg/KeJD2D+H6o/N2Qo2rNyWYa7fy6zkwK1c5aJl3zS7Fb/4NTZwsSj9kgv1OOw
 5vK3S8GjsietHywEjX+SyQQ7/Xm/Jj898FWg2ZkrTIlIDvtheiQK7ZVK0kbHhZrhGIeJ
 EFtKkvIWzXPcd2tN/pzNvJooIaD4RZ/Yb5ufWxFnCwHDbkYZa+ZBvW/rwld/pgFjuQwI
 8p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=faYrj3O9JwWty84JboM/7aJ0xvb2yfRo7zKfDJoDCks=;
 b=svcjZEMIlEiGCf1uq7RsOb4fSYInpFMR6V3SIDtf6omICUExpeqbRttXbozRCu01Da
 omp+B02hWCnFJEwmmVfgqIOG8vOK0BLSk0z+fUkE7QNiMF5ek6jTu0Wpch7vg19s7oyp
 DbDasEG0v6y2sBGVUk6NftAzlIzfJO8GmDQwjrp7Lfu8o3WPps55J/5L8Xppm7ReaxUX
 KO4GJqJQnROYwHuDp8YjcDUwkQgh48aTcdicNdCM9RlLGzXg18MsEmetiCFbfdQPPGG7
 JmyY8T0Ronxg7VZX1CLUH3kUMqdCJzLTE3JV8SPL2mR1CzS4sRwolGdly635xF7qfIYI
 7WEw==
X-Gm-Message-State: APjAAAXHh/tMUCU8CRWGzxR47sQnro9P8p097q5RbG7Q1Nkb08WXUuYe
 XPmnpVuiaXc4dZQ+LJTtbDKshtZV180=
X-Google-Smtp-Source: APXvYqzBkBWGIgh4J7i+YNC7khp8hUpfPJ2pwUO9MikBMIErzWdLOSkFelKwKP/80jwtWFI6Y4Y8sw==
X-Received: by 2002:a17:90a:cb96:: with SMTP id
 a22mr4075780pju.96.1582887028255; 
 Fri, 28 Feb 2020 02:50:28 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id b24sm10108229pfo.84.2020.02.28.02.50.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Feb 2020 02:50:27 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 28 Feb 2020 16:20:23 +0530
Message-Id: <b927e5f2cd36ec2dd57202b492563922b1a94e77.1582886993.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/openat2: New tests
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

Add tests to check working of openat2() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac                                  |  1 +
 include/lapi/openat2.h                        | 66 ++++++++++++++
 runtest/syscalls                              |  3 +
 testcases/kernel/syscalls/openat2/.gitignore  |  2 +
 testcases/kernel/syscalls/openat2/Makefile    |  9 ++
 testcases/kernel/syscalls/openat2/openat201.c | 87 +++++++++++++++++++
 testcases/kernel/syscalls/openat2/openat202.c | 62 +++++++++++++
 7 files changed, 230 insertions(+)
 create mode 100644 include/lapi/openat2.h
 create mode 100644 testcases/kernel/syscalls/openat2/.gitignore
 create mode 100644 testcases/kernel/syscalls/openat2/Makefile
 create mode 100644 testcases/kernel/syscalls/openat2/openat201.c
 create mode 100644 testcases/kernel/syscalls/openat2/openat202.c

diff --git a/configure.ac b/configure.ac
index c9ec39fce2df..238d1cde85f2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -96,6 +96,7 @@ AC_CHECK_FUNCS([ \
     name_to_handle_at \
     open_tree \
     openat \
+    openat2 \
     pidfd_open \
     pidfd_send_signal \
     pkey_mprotect \
diff --git a/include/lapi/openat2.h b/include/lapi/openat2.h
new file mode 100644
index 000000000000..2212a84c4d93
--- /dev/null
+++ b/include/lapi/openat2.h
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef OPENAT2_H
+#define OPENAT2_H
+
+#include <sys/syscall.h>
+#include <linux/types.h>
+
+#include "lapi/syscalls.h"
+
+#include "config.h"
+
+#ifndef HAVE_OPENAT2
+/*
+ * Arguments for how openat2(2) should open the target path. If only @flags and
+ * @mode are non-zero, then openat2(2) operates very similarly to openat(2).
+ *
+ * However, unlike openat(2), unknown or invalid bits in @flags result in
+ * -EINVAL rather than being silently ignored. @mode must be zero unless one of
+ * {O_CREAT, O_TMPFILE} are set.
+ *
+ * @flags: O_* flags.
+ * @mode: O_CREAT/O_TMPFILE file mode.
+ * @resolve: RESOLVE_* flags.
+ */
+struct open_how {
+	__u64 flags;
+	__u64 mode;
+	__u64 resolve;
+};
+
+/* how->resolve flags for openat2(2). */
+#define RESOLVE_NO_XDEV                0x01 /* Block mount-point crossings
+                                       (includes bind-mounts). */
+#define RESOLVE_NO_MAGICLINKS  0x02 /* Block traversal through procfs-style
+                                       "magic-links". */
+#define RESOLVE_NO_SYMLINKS    0x04 /* Block traversal through all symlinks
+                                       (implies OEXT_NO_MAGICLINKS) */
+#define RESOLVE_BENEATH                0x08 /* Block "lexical" trickery like
+                                       "..", symlinks, and absolute
+                                       paths which escape the dirfd. */
+#define RESOLVE_IN_ROOT                0x10 /* Make all jumps to "/" and ".."
+                                       be scoped inside the dirfd
+                                       (similar to chroot(2)). */
+
+int openat2(int dfd, const char *pathname, struct open_how *how, size_t size)
+{
+	return tst_syscall(__NR_openat2, dfd, pathname, how, size);
+}
+#endif
+
+void openat2_supported_by_kernel(void)
+{
+	if ((tst_kvercmp(5, 6, 0)) < 0) {
+		/* Check if the syscall is backported on an older kernel */
+		TEST(syscall(__NR_openat2, -1, NULL, NULL, 0));
+		if (TST_RET == -1 && TST_ERR == ENOSYS)
+			tst_brk(TCONF, "Test not supported on kernel version < v5.2");
+	}
+}
+
+#endif /* OPENAT2_H */
diff --git a/runtest/syscalls b/runtest/syscalls
index 14df8d34338e..b85ba83a4095 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -845,6 +845,9 @@ openat01 openat01
 openat02 openat02
 openat03 openat03
 
+openat201 openat201
+openat202 openat202
+
 open_tree01 open_tree01
 open_tree02 open_tree02
 
diff --git a/testcases/kernel/syscalls/openat2/.gitignore b/testcases/kernel/syscalls/openat2/.gitignore
new file mode 100644
index 000000000000..3da61e6e40c1
--- /dev/null
+++ b/testcases/kernel/syscalls/openat2/.gitignore
@@ -0,0 +1,2 @@
+openat201
+openat202
diff --git a/testcases/kernel/syscalls/openat2/Makefile b/testcases/kernel/syscalls/openat2/Makefile
new file mode 100644
index 000000000000..c26cffd37f39
--- /dev/null
+++ b/testcases/kernel/syscalls/openat2/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+LDLIBS			+= $(AIO_LIBS)
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/openat2/openat201.c b/testcases/kernel/syscalls/openat2/openat201.c
new file mode 100644
index 000000000000..b35cea6725b3
--- /dev/null
+++ b/testcases/kernel/syscalls/openat2/openat201.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic openat2() test.
+ */
+#include "tst_test.h"
+#include "lapi/openat2.h"
+
+#define TEST_FILE "test_file"
+#define TEST_DIR "test_dir"
+
+static int dir_fd = -1, fd_atcwd = AT_FDCWD;
+
+static struct tcase {
+	int *dfd;
+	const char *pathname;
+	__u64 flags;
+	__u64 mode;
+	__u64 resolve;
+} tcases[] = {
+	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, 0},
+	{&dir_fd, TEST_FILE, O_RDONLY, S_IRUSR, 0},
+	{&dir_fd, TEST_FILE, O_WRONLY, S_IWUSR, 0},
+	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_XDEV},
+	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_MAGICLINKS},
+	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_SYMLINKS},
+	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_BENEATH},
+	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_IN_ROOT},
+	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, 0},
+	{&fd_atcwd, TEST_FILE, O_RDONLY, S_IRUSR, 0},
+	{&fd_atcwd, TEST_FILE, O_WRONLY, S_IWUSR, 0},
+	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_XDEV},
+	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_MAGICLINKS},
+	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_SYMLINKS},
+	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_BENEATH},
+	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_IN_ROOT},
+};
+
+static void cleanup(void)
+{
+	if (dir_fd != -1)
+		SAFE_CLOSE(dir_fd);
+}
+
+static void setup(void)
+{
+	openat2_supported_by_kernel();
+
+	SAFE_MKDIR(TEST_DIR, 0700);
+	dir_fd = SAFE_OPEN(TEST_DIR, O_DIRECTORY);
+}
+
+static void run(unsigned int n)
+{
+	int fd;
+	struct stat file_stat;
+	struct tcase *tc = &tcases[n];
+	struct open_how how = {
+		.flags = tc->flags | O_CREAT,
+		.mode = tc->mode,
+		.resolve = tc->resolve
+	};
+
+	TEST(fd = openat2(*tc->dfd, tc->pathname, &how, sizeof(how)));
+	if (fd == -1) {
+		tst_res(TFAIL | TTERRNO, "openat2() failed (%d)", n);
+		return;
+	}
+
+	SAFE_FSTAT(fd, &file_stat);
+
+	if (file_stat.st_size == 0)
+		tst_res(TPASS, "openat2() passed (%d)", n);
+	else
+		tst_res(TFAIL, "fstat() didn't work as expected (%d)", n);
+
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+};
diff --git a/testcases/kernel/syscalls/openat2/openat202.c b/testcases/kernel/syscalls/openat2/openat202.c
new file mode 100644
index 000000000000..aef2246d098d
--- /dev/null
+++ b/testcases/kernel/syscalls/openat2/openat202.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic openat2() test to check various failures.
+ */
+#include "tst_test.h"
+#include "lapi/openat2.h"
+
+#define TEST_FILE "test_file"
+#define TEST_DIR "test_dir"
+
+static struct tcase {
+	int dfd;
+	const char *pathname;
+	__u64 flags;
+	__u64 mode;
+	__u64 resolve;
+	size_t size;
+	int exp_errno;
+} tcases[] = {
+	{-1, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, sizeof(struct open_how), EBADF},
+	{AT_FDCWD, NULL, O_RDONLY | O_CREAT, S_IRUSR, 0, sizeof(struct open_how), EFAULT},
+	{AT_FDCWD, TEST_FILE, O_RDONLY, S_IWUSR, 0, sizeof(struct open_how), EINVAL},
+	{AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, -1, 0, sizeof(struct open_how), EINVAL},
+	{AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, -1, sizeof(struct open_how), EINVAL},
+	{AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, 0, EINVAL},
+	{AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, 2 * sizeof(struct open_how), E2BIG},
+};
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	struct open_how how = {
+		.flags = tc->flags,
+		.mode = tc->mode,
+		.resolve = tc->resolve
+	};
+
+	TEST(openat2(tc->dfd, tc->pathname, &how, tc->size));
+
+	if (TST_RET != -1) {
+		SAFE_CLOSE(TST_RET);
+		tst_res(TFAIL, "openat2() passed unexpectedly (%d)", n);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "openat2() should fail with %s (%d)",
+			tst_strerrno(tc->exp_errno), n);
+		return;
+	}
+
+	tst_res(TPASS | TTERRNO, "openat2() failed as expected (%d)", n);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = openat2_supported_by_kernel,
+	.needs_tmpdir = 1,
+};
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
