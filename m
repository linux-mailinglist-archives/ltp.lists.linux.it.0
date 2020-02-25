Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5755516B9E8
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:42:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6A173C25F5
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:42:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BD09D3C25F3
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:41:23 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 47E661A01493
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:41:22 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id g6so5087164plt.2
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 22:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u1GG3UfsHw5ylNs3cp0oMD5LUDr2typsbdYZMnePxZY=;
 b=VKjszRLG8WeEzsXVb0RgNATi7bs3ZdM/RgQMSEsYEt5BH/V9wrJEI/Z6kv2aaYwAyC
 EjQ2JD0cMC1l+6gsHx4YSjMeMmolRSdwRWO07/rXK5Mkj9vAoXXcfEfVklfS6+nLybke
 oW3upuqjcibXVVrdRU11W41fE8SwAuBWlwQXq4MoGTp/aU4CqeRiumpU+FJBfmjndcY5
 gxE/UP/qhouzuqW5oApPV5ySDaSz7+HnFlBkyY960rVGGfoLk5XhvnKIZ9faZhZNPWrk
 fHZswSf6x+FGjpz/Q3NXGmLVKzfMobIhcEfd/h4oXtlaBYHAkQqIpFM35+UEI7rZJWAX
 vjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u1GG3UfsHw5ylNs3cp0oMD5LUDr2typsbdYZMnePxZY=;
 b=r/yPS/8P4VmgmRPxP9coEOTv+AZwMPEL47+1sVvfzpEy8kM01S218dJ7A+P5nFIgnQ
 QREtOqq0ROkrkLc8El9aMMKGiCMIXXp33ibyhH2X2PdiarNAxSpzB8zeHQJNtRplCCJ4
 j6Qkf70uV7bNWXPg8g0+m0XJ/gk6WQAjhD0TxnN9kHX5Im+84a6WiaSjQsoIhxOuZW6a
 kDS85FBNgVey8qalwqIJZcLucA1EKtki5+1bJfbOA5+pLtJ6WY43Sqar9miK1f802WHA
 mniS1UHpvTq3uED7xMMU6ZPuj4y+ZOFVZydqxyBISHmiolFfsKApVzM4pdGndW5b1xpl
 7e3g==
X-Gm-Message-State: APjAAAVoc0uMqjOi8Fat3LTZNpYfnI9hei2bi7b7b8pGyd7oyxFtNiy6
 MJ6b8aKgwXfBy/1UZIgHYLcPMMhy4iY=
X-Google-Smtp-Source: APXvYqzHVIJU6hm3b3forXfxE3EYFm597qxTJoiSmnR04ZzT2A6HBKQr/Q0guvPVoyw8g4GAik7K0w==
X-Received: by 2002:a17:902:a616:: with SMTP id
 u22mr53580483plq.173.1582612880269; 
 Mon, 24 Feb 2020 22:41:20 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id b3sm16132196pfr.88.2020.02.24.22.41.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 22:41:19 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 25 Feb 2020 12:10:48 +0530
Message-Id: <04fc7b57299c4b7f30551840f782c5fb8a424bcd.1582612624.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582612624.git.viresh.kumar@linaro.org>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V3 10/10] syscalls/open_tree: New tests
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

Add tests to check working of open_tree() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                              |   3 +
 .../kernel/syscalls/open_tree/.gitignore      |   2 +
 testcases/kernel/syscalls/open_tree/Makefile  |   6 +
 .../kernel/syscalls/open_tree/open_tree01.c   | 124 ++++++++++++++++++
 .../kernel/syscalls/open_tree/open_tree02.c   | 104 +++++++++++++++
 5 files changed, 239 insertions(+)
 create mode 100644 testcases/kernel/syscalls/open_tree/.gitignore
 create mode 100644 testcases/kernel/syscalls/open_tree/Makefile
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree01.c
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index b899cc76542d..2bbbcc9ce0c3 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -844,6 +844,9 @@ openat01 openat01
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
index 000000000000..ef603cc270a0
--- /dev/null
+++ b/testcases/kernel/syscalls/open_tree/open_tree01.c
@@ -0,0 +1,124 @@
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
+static void setup(void)
+{
+	fsopen_supported_by_kernel();
+
+	SAFE_MKDIR(OT_MNTPOINT, 0777);
+	dir_created = 1;
+}
+
+static void cleanup(void)
+{
+	if (dir_created)
+		SAFE_RMDIR(OT_MNTPOINT);
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int fd, fsmfd, otfd;
+
+	TEST(fsopen(tst_device->fs_type, 0));
+	fd = TST_RET;
+
+	if (fd == -1) {
+		tst_res(TBROK | TERRNO, "fsopen() failed");
+		return;
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_res(TBROK | TERRNO, "fsconfig failed");
+		return;
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_res(TBROK | TERRNO, "fsconfig failed");
+		return;
+	}
+
+	TEST(fsmount(fd, 0, 0));
+	SAFE_CLOSE(fd);
+
+	if (TST_RET == -1) {
+		tst_res(TBROK | TERRNO, "fsmount() failed");
+		return;
+	}
+
+	fsmfd = TST_RET;
+
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	SAFE_CLOSE(fsmfd);
+
+	if (TST_RET == -1) {
+		tst_res(TBROK | TERRNO, "move_mount() failed");
+		return;
+	}
+
+	if (!tst_is_mounted(MNTPOINT)) {
+		tst_res(TBROK | TERRNO, "device not mounted");
+		goto out;
+	}
+
+	TEST(open_tree(AT_FDCWD, MNTPOINT, tc->flags | OPEN_TREE_CLONE));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "open_tree() failed");
+		goto out;
+	}
+
+	otfd = TST_RET;
+	TEST(move_mount(otfd, "", AT_FDCWD, OT_MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	SAFE_CLOSE(otfd);
+
+	if (TST_RET == -1) {
+		tst_res(TBROK | TERRNO, "move_mount() failed");
+		goto out;
+	}
+
+	if (tst_is_mounted(OT_MNTPOINT))
+		tst_res(TPASS, "%s: open_tree() passed", tc->name);
+
+	SAFE_UMOUNT(OT_MNTPOINT);
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
index 000000000000..5d0ffcf4eb09
--- /dev/null
+++ b/testcases/kernel/syscalls/open_tree/open_tree02.c
@@ -0,0 +1,104 @@
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
+	if (!tst_is_mounted(MNTPOINT))
+		tst_brk(TBROK | TERRNO, "device not mounted");
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
+	} else if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: open_tree() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+	} else {
+		tst_res(TPASS | TTERRNO, "%s: open_tree() failed as expected",
+			tc->name);
+	}
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
