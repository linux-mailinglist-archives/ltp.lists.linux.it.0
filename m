Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B30C18432D
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 10:03:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2C1D3C5900
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 10:03:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C35403C58F1
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 10:03:29 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D0E1920166E
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 10:03:28 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id a32so3763502pga.4
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 02:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TihD/ZAjuxeNbeIyGFZUu2UmfMVKCcCSwIAWjGgG+oM=;
 b=bkqXXl37MVkjveyOsslWFvZk5B57hxXLFkgy8X/iHIec6UZ4I2hzZLcwKTSu9iHZrO
 JqDWJMblsVOFeEbBG2bNkMeZKARlDbeaSNVyQ6qIAPaasSB92OvsDKwft3qeunZbWlgJ
 jyN6OfBEjLeUcRz1XtdNWuMGcVqig0F/yMSsYRhrYx30ymkeK+3VcLbSHuaO+aGNRkXA
 swu4r7IBRdzi3ue2ypGhAAKR6SYdg1CPgFE2jqHYPeEesMWxeo7sLan2H3T//vtlodYH
 kTqlbgaV8dBLMLVk+OAQg3tuMROYgpUQLbYojA2lN2Ri2Fsqk4UPtcfdWFW6qLsM/0Gs
 dIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TihD/ZAjuxeNbeIyGFZUu2UmfMVKCcCSwIAWjGgG+oM=;
 b=qcrQuBbf/WGb1flvpfP4oPvdYBNzj1E6Q/H11PQK3Gq3Mln4k7U09kjPA24Nf12ywG
 47RDCQNZiiDeEWQDHnu1WfckHW9YJFqWqDoXy7Z4gOR7mtDRvZk3TfstvQ+PSmrIUe3e
 rXSB+jgiJcOX+s1/NQPEkel+iEnYx68maYF8sbm7pUtekescH8ZosIc9tsd7CrjsrnFN
 VLT3skPetRLhWpct3gHY+tj/ic+47TE6KBl2NiifzxvVHPVkfzkDmvX8qKlA9SoC7Mul
 kEuB1KS2qJ/ebCvWFBuJL+DY2gDaOFK113C+r1SRTxrSfCHmT8LfB8t6kE657NNwz3CU
 4bEw==
X-Gm-Message-State: ANhLgQ3h9kyavE5gRIVF/+KQQ0Plw75k4MSDEqGWGuvGpzCd870QAegy
 8KUpKUAdsLfiWvJw6DXu5ai8a4jhh/U=
X-Google-Smtp-Source: ADFU+vutxuSyzt7ShL+d0mNmnoEmwLchjLCNeh27F1eOEM3sTj+AFANRvIuKPp0fNgkJX6VBTC+CeA==
X-Received: by 2002:a63:617:: with SMTP id 23mr12097809pgg.208.1584090206727; 
 Fri, 13 Mar 2020 02:03:26 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id f8sm57129763pfn.2.2020.03.13.02.03.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Mar 2020 02:03:26 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 13 Mar 2020 14:33:21 +0530
Message-Id: <928553e5fd3518fccb363fb8b6ad079ac3c75fd2.1584090119.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <6648a9106e367d370012c8ee1d0d81c369779ba8.1584014172.git.viresh.kumar@linaro.org>
References: <6648a9106e367d370012c8ee1d0d81c369779ba8.1584014172.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V7 10/10] syscalls/open_tree: New tests
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
V6->V7:
- Remove the temporary directory from cleanup routine to avoid test
  failure.

 runtest/syscalls                              |   3 +
 .../kernel/syscalls/open_tree/.gitignore      |   2 +
 testcases/kernel/syscalls/open_tree/Makefile  |   6 +
 .../kernel/syscalls/open_tree/open_tree01.c   | 119 ++++++++++++++++++
 .../kernel/syscalls/open_tree/open_tree02.c   | 105 ++++++++++++++++
 5 files changed, 235 insertions(+)
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
index 000000000000..5fd8b9b7c438
--- /dev/null
+++ b/testcases/kernel/syscalls/open_tree/open_tree01.c
@@ -0,0 +1,119 @@
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
+static int dir_created;
+
+static void cleanup(void)
+{
+	if (dir_created)
+		SAFE_RMDIR(OT_MNTPOINT);
+}
+
+static void setup(void)
+{
+	fsopen_supported_by_kernel();
+	SAFE_MKDIR(OT_MNTPOINT, 0777);
+	dir_created = 1;
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
+	.cleanup = cleanup,
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
