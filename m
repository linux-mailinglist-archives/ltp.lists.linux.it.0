Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC0B182FC8
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:03:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A9143C6E53
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:03:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6CB733C5EA0
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:51 +0100 (CET)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9AD35600116
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:50 +0100 (CET)
Received: by mail-pg1-x52c.google.com with SMTP id m5so2994802pgg.0
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wpMV+08cYuOLLK4No5zEf1teQy4ybijo7coE48Ff3OM=;
 b=L7NsSf4i+emNAF+NZ4NAppas5N/0eCbjaUSDP7EZz08BAzBdl30dn7lynLlES4tYl1
 3kpJqUuoAU5bBOd+a8XNJdr0Y7LxmZTOOdJZ4OZI0dyHnj54HioBCtaAdQC03kt2j6s1
 ZtIJ3lQ8GnVNirp5lwAnmhqCYg5RQuheBsHgj3LsqVzJllAAqOOU/eLxf/dkVH+j6CA4
 ZkOQDIRL9+mTXgZiijQ00CRQ+VWBjkIM2BnpFHOHLKLOJUSDa7V+l0CjIZXU5Hf6v/ie
 Dp0KCW4SkuvbhbNjTKk7yK5sHuLjtUmD8LH+sDJt+yqOxcviMedqhgHYKxmZwZqwvQNw
 XP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wpMV+08cYuOLLK4No5zEf1teQy4ybijo7coE48Ff3OM=;
 b=raM8gQ1pti+4hOaUMOhmgwhTKB/4MlVf8dIZ5jyGR+MnaiYl9c6DVY7LXI6piIF4lk
 06e7J6cKBTwGwfR99cINc1yjZN16eTZ5yIGK+NEe7EFADibOuNIELY01cX6oZOf05FMJ
 z5ngGSjqnpPzEIo62A2dB/vY0d8p/ISiFrjKfevkOfcctuV+vxxmrNV9UNUJoo9Pq2vh
 UZMNwE0D9qVvHC/WCRv57I8nkJNQ5dgTXyrdBF95Ni7jQbzmEljNClZV5IkFsfrdKS6R
 Hcw3D35s1ck6CHfxrJpZBsTJsdR8lKJydKQblBf7hs92ikmMpcIw3gwYIo+EzFhWjIVq
 Ajxw==
X-Gm-Message-State: ANhLgQ3zfvpuJdZk41JWBeKnxNOpiEq7LLaEuAeDq5TOHZ4mee0pQO1h
 MM96tIiRzXQNEFGbR7fQow0OaqL62to=
X-Google-Smtp-Source: ADFU+vtjCJHSYlRbkOAlnxNPpvPMg+oDsL8ipYKlre0urRZzREkdl9gcL08P0JfSY3f2jNHDbV3Q2w==
X-Received: by 2002:a65:6383:: with SMTP id h3mr4135623pgv.42.1584014508191;
 Thu, 12 Mar 2020 05:01:48 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id c17sm13162704pfn.187.2020.03.12.05.01.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 05:01:47 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 17:31:10 +0530
Message-Id: <6648a9106e367d370012c8ee1d0d81c369779ba8.1584014172.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1584014172.git.viresh.kumar@linaro.org>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V6 10/10] syscalls/open_tree: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add tests to check working of open_tree() syscall.

Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                              |   3 +
 .../kernel/syscalls/open_tree/.gitignore      |   2 +
 testcases/kernel/syscalls/open_tree/Makefile  |   6 +
 .../kernel/syscalls/open_tree/open_tree01.c   | 109 ++++++++++++++++++
 .../kernel/syscalls/open_tree/open_tree02.c   | 105 +++++++++++++++++
 5 files changed, 225 insertions(+)
 create mode 100644 testcases/kernel/syscalls/open_tree/.gitignore
 create mode 100644 testcases/kernel/syscalls/open_tree/Makefile
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree01.c
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 32f11f4bc9ab..224de8c9b609 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -847,6 +847,9 @@ openat01 openat01
 openat02 openat02
 openat03 openat03
 
+open_tree01 open_tree01
+open_tree02 open_tree02
+
 mincore01 mincore01
 mincore02 mincore02
 
diff --git a/testcases/kernel/syscalls/open_tree/.gitignore b/testcases/kernel/syscalls/open_tree/.gitignore
new file mode 100644
index 000000000000..2f732b44518e
--- /dev/null
+++ b/testcases/kernel/syscalls/open_tree/.gitignore
@@ -0,0 +1,2 @@
+/open_tree01
+/open_tree02
diff --git a/testcases/kernel/syscalls/open_tree/Makefile b/testcases/kernel/syscalls/open_tree/Makefile
new file mode 100644
index 000000000000..5ea7d67db123
--- /dev/null
+++ b/testcases/kernel/syscalls/open_tree/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/open_tree/open_tree01.c b/testcases/kernel/syscalls/open_tree/open_tree01.c
new file mode 100644
index 000000000000..d52e8c26afae
--- /dev/null
+++ b/testcases/kernel/syscalls/open_tree/open_tree01.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic open_tree() test.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+#define MNTPOINT	"mntpoint"
+#define OT_MNTPOINT	"ot_mntpoint"
+
+#define TCASE_ENTRY(_flags)	{.name = "Flag " #_flags, .flags = _flags}
+
+static struct tcase {
+	char *name;
+	unsigned int flags;
+} tcases[] = {
+	TCASE_ENTRY(OPEN_TREE_CLONE),
+	TCASE_ENTRY(OPEN_TREE_CLOEXEC)
+};
+
+static void setup(void)
+{
+	fsopen_supported_by_kernel();
+	SAFE_MKDIR(OT_MNTPOINT, 0777);
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int fd, fsmfd, otfd;
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
+			MOVE_MOUNT_F_EMPTY_PATH));
+	SAFE_CLOSE(fsmfd);
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "move_mount() failed");
+		return;
+	}
+
+	if (!tst_is_mounted_at_tmpdir(MNTPOINT)) {
+		tst_res(TFAIL | TERRNO, "device not mounted");
+		return;
+	}
+
+	TEST(otfd = open_tree(AT_FDCWD, MNTPOINT, tc->flags | OPEN_TREE_CLONE));
+	if (otfd == -1) {
+		tst_res(TFAIL | TERRNO, "open_tree() failed");
+		goto out;
+	}
+
+	TEST(move_mount(otfd, "", AT_FDCWD, OT_MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	SAFE_CLOSE(otfd);
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "move_mount() failed");
+		goto out;
+	}
+
+	if (tst_is_mounted_at_tmpdir(OT_MNTPOINT)) {
+		SAFE_UMOUNT(OT_MNTPOINT);
+		tst_res(TPASS, "%s: open_tree() passed", tc->name);
+	}
+
+out:
+	SAFE_UMOUNT(MNTPOINT);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.needs_root = 1,
+	.format_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.dev_fs_flags = TST_FS_SKIP_FUSE,
+};
diff --git a/testcases/kernel/syscalls/open_tree/open_tree02.c b/testcases/kernel/syscalls/open_tree/open_tree02.c
new file mode 100644
index 000000000000..6911693837e9
--- /dev/null
+++ b/testcases/kernel/syscalls/open_tree/open_tree02.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic open_tree() failure tests.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+#define MNTPOINT	"mntpoint"
+
+static struct tcase {
+	char *name;
+	int dirfd;
+	const char *pathname;
+	unsigned int flags;
+	int exp_errno;
+} tcases[] = {
+	{"invalid-fd", -1, MNTPOINT, OPEN_TREE_CLONE, EBADF},
+	{"invalid-path", AT_FDCWD, "invalid", OPEN_TREE_CLONE, ENOENT},
+	{"invalid-flags", AT_FDCWD, MNTPOINT, 0xFFFFFFFF, EINVAL},
+};
+
+static int ismounted;
+
+static void cleanup(void)
+{
+	if (ismounted)
+		SAFE_UMOUNT(MNTPOINT);
+}
+
+static void setup(void)
+{
+	int fd, fsmfd;
+
+	fsopen_supported_by_kernel();
+
+	TEST(fd = fsopen(tst_device->fs_type, 0));
+	if (fd == -1)
+		tst_brk(TBROK | TERRNO, "fsopen() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+	}
+
+	TEST(fsmfd = fsmount(fd, 0, 0));
+	SAFE_CLOSE(fd);
+
+	if (fsmfd == -1)
+		tst_brk(TBROK | TERRNO, "fsmount() failed");
+
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	SAFE_CLOSE(fsmfd);
+
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "move_mount() failed");
+
+	if (!tst_is_mounted_at_tmpdir(MNTPOINT))
+		tst_brk(TBROK | TERRNO, "device not mounted");
+
+	ismounted = 1;
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(open_tree(tc->dirfd, tc->pathname, tc->flags));
+	if (TST_RET != -1) {
+		SAFE_CLOSE(TST_RET);
+		tst_res(TFAIL, "%s: open_tree() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: open_tree() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+		return;
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: open_tree() failed as expected",
+		tc->name);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
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
