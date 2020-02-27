Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAE017100B
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:16:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 622253C25CD
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:16:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B6B9B3C25A7
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:15:09 +0100 (CET)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C63591401A6D
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:15:08 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id y8so632859pll.13
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 21:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FnO25o3S0imdAucNgO0kjKssn7bsk0mZ2lR9dEMNOMM=;
 b=vXR7G1IMRGGztMYcMy8VDegO3IKyxdaABJR/106vdBDiwkbfoTWvZjY8wfHM66pWuI
 X2NLXTKaOEwZUvzowSc7zyTQoZcsmYNWbOuUczuETz+i9Hm5UvLpJCrv2yvwywTpUi0g
 zq/SrDH99yBB7YS6bQ7NUyeXvN2Iul8Y+EChX2x5FR1eidMBMYph9R0NfB4tHLUh5EJ1
 dcvkwX65Gto5dcZiaZL3TLXLyF4/d36vNddCx4a5sLkam7JhFGtg9qWBhBLqcNUwZ/Hb
 NpztUDr9lWLFCZ2MNgqp6tkVCFSQjAxFhtUPWdIvvR4JcJvUqkenFuiGWhUaVSOePFWi
 T+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnO25o3S0imdAucNgO0kjKssn7bsk0mZ2lR9dEMNOMM=;
 b=V3Jw2ZkJQkG8u61oUbQL7VE+l/tZqBm3WcNnMbF7fOM+K48cX2ocCk3BeJG2sOCv1n
 YoGw+HZagY1lJNDjT6RqFRP82R3DuPqxSznonbZKRPs+3UIPD7VfC2LNfWIKoIwCZuRs
 Ifr329avuf2/wiriBn73rm2SIumOFcBK/+Xkq387eDA4ZFfow+SaXWO1hXt45V/86fTC
 NfD7kdZGxXLxYfpSCM5CZJ9WjPvlSz6+G6rBBH7/keWMjj00vjP7pxdhJunMjk2I+DCY
 kLWus3rKUzWGctFKoSzYJLgByjZomsWJBKHUhiKxS1q4vSldIe99dYqFcEEoBE7yory+
 ShLA==
X-Gm-Message-State: APjAAAVTtcMlNI+89h1H5qVJmoHhbmwKcp8Yj6FeanrntOFsoLshPHoP
 jVvXQLvgXA6mYBDatewL8aIo9OhZYn4=
X-Google-Smtp-Source: APXvYqwzcKrdCEhjCJprt3T++f6lFEOwq1/Sp3WhE0jOQNEwJCpH86JX8E20oZjhvn2aICOAOROo6A==
X-Received: by 2002:a17:90a:332e:: with SMTP id
 m43mr2925371pjb.107.1582780506862; 
 Wed, 26 Feb 2020 21:15:06 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id r10sm1837879pgv.25.2020.02.26.21.15.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 21:15:06 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 10:44:36 +0530
Message-Id: <d7d2ad3ddc3c36bae9930524e902bb3fc0e17602.1582779464.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582779464.git.viresh.kumar@linaro.org>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V5 08/10] syscalls/move_mount: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add tests to check working of move_mount() syscall.

Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                              |  3 +
 .../kernel/syscalls/move_mount/.gitignore     |  2 +
 testcases/kernel/syscalls/move_mount/Makefile |  6 ++
 .../kernel/syscalls/move_mount/move_mount01.c | 83 +++++++++++++++++
 .../kernel/syscalls/move_mount/move_mount02.c | 92 +++++++++++++++++++
 5 files changed, 186 insertions(+)
 create mode 100644 testcases/kernel/syscalls/move_mount/.gitignore
 create mode 100644 testcases/kernel/syscalls/move_mount/Makefile
 create mode 100644 testcases/kernel/syscalls/move_mount/move_mount01.c
 create mode 100644 testcases/kernel/syscalls/move_mount/move_mount02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 1ac8c84d2567..32b3f36e4dcc 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -731,6 +731,9 @@ mount04 mount04
 mount05 mount05
 mount06 mount06
 
+move_mount01 move_mount01
+move_mount02 move_mount02
+
 move_pages01 move_pages01
 move_pages02 move_pages02
 move_pages03 move_pages03
diff --git a/testcases/kernel/syscalls/move_mount/.gitignore b/testcases/kernel/syscalls/move_mount/.gitignore
new file mode 100644
index 000000000000..83ae40145dff
--- /dev/null
+++ b/testcases/kernel/syscalls/move_mount/.gitignore
@@ -0,0 +1,2 @@
+/move_mount01
+/move_mount02
diff --git a/testcases/kernel/syscalls/move_mount/Makefile b/testcases/kernel/syscalls/move_mount/Makefile
new file mode 100644
index 000000000000..5ea7d67db123
--- /dev/null
+++ b/testcases/kernel/syscalls/move_mount/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/move_mount/move_mount01.c b/testcases/kernel/syscalls/move_mount/move_mount01.c
new file mode 100644
index 000000000000..7f561718764a
--- /dev/null
+++ b/testcases/kernel/syscalls/move_mount/move_mount01.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic move_mount() test.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+#define MNTPOINT	"mntpoint"
+
+#define TCASE_ENTRY(_flags)	{.name = "Flag " #_flags, .flags = _flags}
+
+static struct tcase {
+	char *name;
+	unsigned int flags;
+} tcases[] = {
+	TCASE_ENTRY(MOVE_MOUNT_F_SYMLINKS),
+	TCASE_ENTRY(MOVE_MOUNT_F_AUTOMOUNTS),
+	TCASE_ENTRY(MOVE_MOUNT_F_EMPTY_PATH),
+	TCASE_ENTRY(MOVE_MOUNT_T_SYMLINKS),
+	TCASE_ENTRY(MOVE_MOUNT_T_AUTOMOUNTS),
+	TCASE_ENTRY(MOVE_MOUNT_T_EMPTY_PATH),
+};
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int fsmfd, fd;
+
+	TEST(fd = fsopen(tst_device->fs_type, 0));
+	if (fd == -1) {
+		tst_res(TFAIL | TERRNO, "fsopen() failed");
+		return;
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
+		return;
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
+		return;
+	}
+
+	TEST(fsmfd = fsmount(fd, 0, 0));
+	SAFE_CLOSE(fd);
+
+	if (fsmfd == -1) {
+		tst_res(TFAIL | TERRNO, "fsmount() failed");
+		return;
+	}
+
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			tc->flags | MOVE_MOUNT_F_EMPTY_PATH));
+	SAFE_CLOSE(fsmfd);
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "move_mount() failed");
+		return;
+	}
+
+	if (tst_is_mounted(MNTPOINT))
+		tst_res(TPASS, "%s: move_mount() passed", tc->name);
+
+	SAFE_UMOUNT(MNTPOINT);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = fsopen_supported_by_kernel,
+	.needs_root = 1,
+	.format_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.dev_fs_flags = TST_FS_SKIP_FUSE,
+};
diff --git a/testcases/kernel/syscalls/move_mount/move_mount02.c b/testcases/kernel/syscalls/move_mount/move_mount02.c
new file mode 100644
index 000000000000..dfb48a1b3dc6
--- /dev/null
+++ b/testcases/kernel/syscalls/move_mount/move_mount02.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic move_mount() failure tests.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+#define MNTPOINT	"mntpoint"
+
+int invalid_fd = -1, fsmfd;
+
+static struct tcase {
+	char *name;
+	int *from_dirfd;
+	const char *from_pathname;
+	int to_dirfd;
+	const char *to_pathname;
+	unsigned int flags;
+	int exp_errno;
+} tcases[] = {
+	{"invalid-from-fd", &invalid_fd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH, EBADF},
+	{"invalid-from-path", &fsmfd, "invalid", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH, ENOENT},
+	{"invalid-to-fd", &fsmfd, "", -1, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH, EBADF},
+	{"invalid-to-path", &fsmfd, "", AT_FDCWD, "invalid", MOVE_MOUNT_F_EMPTY_PATH, ENOENT},
+	{"invalid-flags", &fsmfd, "", AT_FDCWD, MNTPOINT, 0x08, EINVAL},
+};
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int fd;
+
+	TEST(fd = fsopen(tst_device->fs_type, 0));
+	if (fd == -1) {
+		tst_res(TFAIL | TERRNO, "fsopen() failed");
+		return;
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
+		return;
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
+		return;
+	}
+
+	TEST(fsmfd = fsmount(fd, 0, 0));
+	SAFE_CLOSE(fd);
+
+	if (fsmfd == -1) {
+		tst_res(TFAIL | TERRNO, "fsmount() failed");
+		return;
+	}
+
+	TEST(move_mount(*tc->from_dirfd, tc->from_pathname, tc->to_dirfd,
+			tc->to_pathname, tc->flags));
+	SAFE_CLOSE(fsmfd);
+
+	if (TST_RET != -1) {
+		SAFE_UMOUNT(MNTPOINT);
+		tst_res(TFAIL, "%s: move_mount() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: move_mount() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+		return;
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: move_mount() failed as expected", tc->name);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = fsopen_supported_by_kernel,
+	.needs_root = 1,
+	.format_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.dev_fs_flags = TST_FS_SKIP_FUSE,
+};
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
