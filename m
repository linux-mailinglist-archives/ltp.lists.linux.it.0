Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTP id 26141164066
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:29:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 124433C2532
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:29:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1BDF63C250E
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:41 +0100 (CET)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 51E321001569
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:27:56 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id e8so9318019plt.9
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 01:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0fVcKBwrDC8rlY63i8a4GfxbvnrR2OGYvxES4s3S/hw=;
 b=EZnAlw957NemVq+T/ZrXkZtkAOO4xdjWcD9eI6qFcBXLkYYHsycb/SBuegImNDoGTq
 do0xw4tw53HaXRhh7suktj2fGE5PoUbxT7s2dNJOolqMW/uf60hmwELwYtDeVDvFKVjq
 g3AMj5FfhC/Hxhp2hkGGfz/AkVm0Jzd2617aYGL8xAZEicN5fQuOJ0RnaDxDX9aEuZVl
 LCavMlvXQES4/8GklFZW8WI2pw+pRDSkVfnfLjQjhSunaAdrH2mBXmgaif/RcMcPCPIW
 zvoMg8TrpNhV2qCy9jDBRALZx/3Ahjyirew2CnUwB3y3q9/jJTL/K4p4OFg7kJONffvy
 4a8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fVcKBwrDC8rlY63i8a4GfxbvnrR2OGYvxES4s3S/hw=;
 b=uTXWQSq1wcr4n5v1enZBuefpl8+iGKQAlKUzCflLxrIMDY6/d6WFjouaDzP19/PV5Z
 bpnupqBCgB3k/JN31acXH9uknMqkkYTl+sGMX/QoH+VZyOMa9zUp2QpCSzeL4K31u/Yc
 2CmGfdT2bCrkvWVpkwdg3ZiKdQ1WpefHLPFarlTyDBf6ca/R8j6JSJf3MWMUw3gpVUx4
 GG2pfy6Ps/+ZE5cPaNSacrA1K7FSPRnAFfsr+4j5fal/+BoxKC7Tis2q3KJjXvPHiz5n
 UY1gSZka+yhpc0BJDPxoJfeWbwK8VDyIuvq1CiouTdCLQbQ2Nv5XT20YOdByxeRxXXud
 njiw==
X-Gm-Message-State: APjAAAXTF2n9ESuhfr4m/Ywr4lOjtBejXOPTDh5vBSqWoDGvAA8k8f7/
 oQBGgD2gKa4vNFPyEst5kMOPDc7+J2A=
X-Google-Smtp-Source: APXvYqxQ7rtBuwmvtOOQVSFRJ5h6bp8c+XL2dpEgo9/6xMWCamGzPTYPOv4uUQpGdi27+iCRlc9/hA==
X-Received: by 2002:a17:902:8d94:: with SMTP id
 v20mr26088782plo.259.1582104518194; 
 Wed, 19 Feb 2020 01:28:38 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id v5sm1857963pgc.11.2020.02.19.01.28.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 01:28:37 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 14:58:05 +0530
Message-Id: <7195b2e7ffcda3ba70715b9094cff450568d9298.1582104018.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582104018.git.viresh.kumar@linaro.org>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 09/10] syscalls/fspick: New tests
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

Add tests to check working of fspick() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                            |   3 +
 testcases/kernel/syscalls/fspick/.gitignore |   2 +
 testcases/kernel/syscalls/fspick/Makefile   |   6 ++
 testcases/kernel/syscalls/fspick/fspick01.c | 112 ++++++++++++++++++++
 testcases/kernel/syscalls/fspick/fspick02.c | 107 +++++++++++++++++++
 5 files changed, 230 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fspick/.gitignore
 create mode 100644 testcases/kernel/syscalls/fspick/Makefile
 create mode 100644 testcases/kernel/syscalls/fspick/fspick01.c
 create mode 100644 testcases/kernel/syscalls/fspick/fspick02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index f207a73c3e6d..b73df9a7cbec 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -350,6 +350,9 @@ fsmount02 fsmount02
 fsopen01 fsopen01
 fsopen02 fsopen02
 
+fspick01 fspick01
+fspick02 fspick02
+
 fstat02 fstat02
 fstat02_64 fstat02_64
 fstat03 fstat03
diff --git a/testcases/kernel/syscalls/fspick/.gitignore b/testcases/kernel/syscalls/fspick/.gitignore
new file mode 100644
index 000000000000..a8aa61dce18b
--- /dev/null
+++ b/testcases/kernel/syscalls/fspick/.gitignore
@@ -0,0 +1,2 @@
+/fspick01
+/fspick02
diff --git a/testcases/kernel/syscalls/fspick/Makefile b/testcases/kernel/syscalls/fspick/Makefile
new file mode 100644
index 000000000000..5ea7d67db123
--- /dev/null
+++ b/testcases/kernel/syscalls/fspick/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/fspick/fspick01.c b/testcases/kernel/syscalls/fspick/fspick01.c
new file mode 100644
index 000000000000..ac0b12195102
--- /dev/null
+++ b/testcases/kernel/syscalls/fspick/fspick01.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic fspick() test.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+#define MNTPOINT	"mntpoint"
+
+static struct tcase {
+	char *name;
+	unsigned int flags;
+} tcases[] = {
+	{"Flag FSPICK_CLOEXEC", FSPICK_CLOEXEC},
+	{"Flag FSPICK_SYMLINK_NOFOLLOW", FSPICK_SYMLINK_NOFOLLOW},
+	{"Flag FSPICK_NO_AUTOMOUNT", FSPICK_NO_AUTOMOUNT},
+	{"Flag FSPICK_EMPTY_PATH", FSPICK_EMPTY_PATH},
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
+	TEST(fsopen(tst_device->fs_type, 0));
+	fd = TST_RET;
+
+	if (fd == -1)
+		tst_brk(TBROK | TERRNO, "fsopen() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsconfig failed");
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsconfig failed");
+	}
+
+	TEST(fsmount(fd, 0, 0));
+	SAFE_CLOSE(fd);
+
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "fsmount() failed");
+
+	fsmfd = TST_RET;
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	SAFE_CLOSE(fsmfd);
+
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "move_mount() failed");
+
+	ismounted = 1;
+
+	if (tst_ismount(MNTPOINT))
+		tst_brk(TBROK | TERRNO, "device not mounted");
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int fspick_fd;
+
+	TEST(fspick(AT_FDCWD, MNTPOINT, tc->flags));
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TERRNO, "fspick() failed");
+
+	fspick_fd = TST_RET;
+
+	TEST(fsconfig(fspick_fd, FSCONFIG_SET_STRING, "user_xattr", "false", 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fspick_fd);
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+	}
+
+	TEST(fsconfig(fspick_fd, FSCONFIG_SET_FLAG, "ro", NULL, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fspick_fd);
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+	}
+
+	SAFE_CLOSE(fspick_fd);
+	tst_res(TPASS, "%s: fspick() passed", tc->name);
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
diff --git a/testcases/kernel/syscalls/fspick/fspick02.c b/testcases/kernel/syscalls/fspick/fspick02.c
new file mode 100644
index 000000000000..b5949177ee23
--- /dev/null
+++ b/testcases/kernel/syscalls/fspick/fspick02.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic fspick() failure tests.
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
+	{"invalid-fd", -1, MNTPOINT, FSPICK_NO_AUTOMOUNT | FSPICK_CLOEXEC, EBADF},
+	{"invalid-path", AT_FDCWD, "invalid", FSPICK_NO_AUTOMOUNT | FSPICK_CLOEXEC, ENOENT},
+	{"invalid-flags", AT_FDCWD, MNTPOINT, 0x10, EINVAL},
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
+	TEST(fsopen(tst_device->fs_type, 0));
+	fd = TST_RET;
+
+	if (fd == -1)
+		tst_brk(TBROK | TERRNO, "fsopen() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsconfig failed");
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsconfig failed");
+	}
+
+	TEST(fsmount(fd, 0, 0));
+	SAFE_CLOSE(fd);
+
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "fsmount() failed");
+
+	fsmfd = TST_RET;
+
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	SAFE_CLOSE(fsmfd);
+
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "move_mount() failed");
+
+	ismounted = 1;
+
+	if (tst_ismount(MNTPOINT))
+		tst_brk(TBROK | TERRNO, "device not mounted");
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(fspick(tc->dirfd, tc->pathname, tc->flags));
+	if (TST_RET != -1) {
+		SAFE_CLOSE(TST_RET);
+		tst_brk(TFAIL, "%s: fspick() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_brk(TFAIL | TTERRNO, "%s: fspick() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: fspick() failed as expected", tc->name);
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
