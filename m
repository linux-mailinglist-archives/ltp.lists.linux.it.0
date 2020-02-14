Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5760915D6A0
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:37:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0EE93C245C
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:37:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 245183C255A
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:26 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1F48D14044B4
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:25 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id g3so4700318pgs.11
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 03:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FlY6CJHpb6sd8OjQxImEDcb6mS5v8RQZkbDlGYp55nE=;
 b=G7vTjJDCBzHcTOYHi+XYyl+FWOoub32404p6rHZZXSTepxMYgkf3bFlXokvtJrxy8o
 +oy+9FPnEl/ybax+bb86SjJ/w+ZPHT+NTlIJUikptwZWtr6KoScvPh9KUsZ48TlH/WSE
 F/B2ntY/8Fgsvg/psufJsdOL958966JWyEUtq52IfoZE6iGI9Ep+K3UPG8y0tTDvSCVz
 lqWCWpqkfpocaHPO2VWiJyOo6uAIMJ1L1px/fVGcTJvX45OjCtex0u8lXsgIDJASmKg6
 Az6rphYG9hYhvm7tyRaUw10a+ub2oH4Hsb+3rZQE2sGbQ8AIGAFj6EWusWHdZbqAewBj
 ltbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FlY6CJHpb6sd8OjQxImEDcb6mS5v8RQZkbDlGYp55nE=;
 b=fkHqM5Nv3d8HYpzUu+fot24+ycn4kvt+Amsr+cSwC1MoGy3nDuAdBczaWBiTUARYsj
 ee0eDpNMBtS6wEW9pyWKOtPorIEMUfrgaDVlJ8za0s3JHHcEAM/LZMkGLJoXPGWTIrqW
 c3dhYW/KAwI5rukba/XK5lQgztT41DqTJS3dLHHh2IeLkt6PTbAVtPL4QGnCj+FU6CmD
 aq0VZ1AMGShHurjrRhgc0K8U676U1bqBd7s1jJc+Ha64OVlu3BoeShCRz3Lu/NYj7Jjp
 QUl+8kMk5TGtFukCApVBt0JQgwxZKUWBevfIMY1ZupELfc2OCzPKnWZ4a+CorrC64j8D
 WvOA==
X-Gm-Message-State: APjAAAUGcu1c3dsj79QUR7K91Xaymn+aUYcX7IgGQ9TeCRZFA3TedeZS
 2xZqdycKTfoDXkTl/OI5wqqGxA==
X-Google-Smtp-Source: APXvYqyHg7Quh00RmNL+MoOi+UnghMHr+t7PN2Yg+IGh08L0EW/vf0AiN/TtZhEk9fOJMDhEAzGCTw==
X-Received: by 2002:a63:d0d:: with SMTP id c13mr2910615pgl.388.1581680183535; 
 Fri, 14 Feb 2020 03:36:23 -0800 (PST)
Received: from localhost ([122.167.210.63])
 by smtp.gmail.com with ESMTPSA id r13sm5927211pjp.14.2020.02.14.03.36.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Feb 2020 03:36:23 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 14 Feb 2020 17:05:56 +0530
Message-Id: <4f704460cf7087dd8710eeabbc452d4394d61c2d.1581680021.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1581680021.git.viresh.kumar@linaro.org>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 7/7] syscalls/open_tree: New tests
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
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 Vikas.Kumar2@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add tests to check working of open_tree() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac                                  |   1 +
 runtest/syscalls                              |   3 +
 .../kernel/syscalls/open_tree/.gitignore      |   2 +
 testcases/kernel/syscalls/open_tree/Makefile  |   6 +
 .../kernel/syscalls/open_tree/open_tree01.c   | 115 ++++++++++++++++++
 .../kernel/syscalls/open_tree/open_tree02.c   | 110 +++++++++++++++++
 6 files changed, 237 insertions(+)
 create mode 100644 testcases/kernel/syscalls/open_tree/.gitignore
 create mode 100644 testcases/kernel/syscalls/open_tree/Makefile
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree01.c
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree02.c

diff --git a/configure.ac b/configure.ac
index de767b1413bb..a6753d03b884 100644
--- a/configure.ac
+++ b/configure.ac
@@ -95,6 +95,7 @@ AC_CHECK_FUNCS([ \
     move_mount \
     name_to_handle_at \
     openat \
+    open_tree \
     pidfd_open \
     pidfd_send_signal \
     pkey_mprotect \
diff --git a/runtest/syscalls b/runtest/syscalls
index d90e212748a2..9cea13141b31 100644
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
index 000000000000..dc62a52b03b4
--- /dev/null
+++ b/testcases/kernel/syscalls/open_tree/.gitignore
@@ -0,0 +1,2 @@
+open_tree01
+open_tree02
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
index 000000000000..74feb9556478
--- /dev/null
+++ b/testcases/kernel/syscalls/open_tree/open_tree01.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic open_tree() test.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+#define MNTPOINT	"mntpoint"
+#define OT_MNTPOINT	"ot_mntpoint"
+
+static int fd, fsmfd, mmfd;
+
+static void cleanup(void)
+{
+	if (mmfd != -1)
+		SAFE_CLOSE(mmfd);
+
+	SAFE_CLOSE(fsmfd);
+	TEST(umount(MNTPOINT));
+	SAFE_CLOSE(fd);
+}
+
+static void setup(void)
+{
+	char *err = "fsconfig()";
+
+	TEST(fsopen(tst_device->fs_type, 0));
+	fd = TST_RET;
+
+	if (fd == -1)
+		tst_brk(TBROK | TERRNO, "fsopen() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1)
+		goto out;
+
+	TEST(fsconfig(fd, FSCONFIG_SET_FLAG, "rw", NULL, 0));
+	if (TST_RET == -1)
+		goto out;
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1)
+		goto out;
+
+	TEST(fsmount(fd, 0, 0));
+	if (TST_RET == -1) {
+		err = "fsmount()";
+		goto out;
+	}
+
+	fsmfd = TST_RET;
+
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	if (TST_RET != -1) {
+		mmfd = TST_RET;
+		return;
+	}
+
+	SAFE_CLOSE(fsmfd);
+	err = "move_mount()";
+
+out:
+	SAFE_CLOSE(fd);
+	tst_brk(TBROK | TERRNO, "%s failed", err);
+}
+
+static void run(void)
+{
+	int otfd;
+
+	SAFE_MKDIR(OT_MNTPOINT, 0777);
+
+	TEST(open_tree(AT_FDCWD, MNTPOINT, OPEN_TREE_CLONE));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "open_tree() failed");
+		goto out;
+	}
+
+	otfd = TST_RET;
+
+	/* Earlier file descriptor isn't valid anymore */
+	mmfd = -1;
+
+	TEST(move_mount(otfd, "", AT_FDCWD, OT_MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+
+	SAFE_CLOSE(otfd);
+
+	if (TST_RET == -1) {
+		tst_res(TBROK | TERRNO, "move_mount() failed");
+		goto out;
+	}
+
+	SAFE_CLOSE(TST_RET);
+	TEST(umount(OT_MNTPOINT));
+
+	tst_res(TPASS, "open_tree() passed");
+out:
+	SAFE_RMDIR(OT_MNTPOINT);
+}
+
+static struct tst_test test = {
+	.min_kver = "5.2",
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.format_device = 1,
+	.mntpoint = MNTPOINT,
+};
diff --git a/testcases/kernel/syscalls/open_tree/open_tree02.c b/testcases/kernel/syscalls/open_tree/open_tree02.c
new file mode 100644
index 000000000000..136c1b25a2b9
--- /dev/null
+++ b/testcases/kernel/syscalls/open_tree/open_tree02.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic open_tree() failure tests.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+#define MNTPOINT	"mntpoint"
+
+static int fd, fsmfd, mmfd;
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
+static void cleanup(void)
+{
+	SAFE_CLOSE(mmfd);
+	SAFE_CLOSE(fsmfd);
+	TEST(umount(MNTPOINT));
+	SAFE_CLOSE(fd);
+}
+
+static void setup(void)
+
+{
+	char *err = "fsconfig()";
+
+	TEST(fsopen(tst_device->fs_type, 0));
+	fd = TST_RET;
+
+	if (fd == -1)
+		tst_brk(TBROK | TERRNO, "fsopen() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1)
+		goto out;
+
+	TEST(fsconfig(fd, FSCONFIG_SET_FLAG, "rw", NULL, 0));
+	if (TST_RET == -1)
+		goto out;
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1)
+		goto out;
+
+	TEST(fsmount(fd, 0, 0));
+	if (TST_RET == -1) {
+		err = "fsmount()";
+		goto out;
+	}
+
+	fsmfd = TST_RET;
+
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	if (TST_RET != -1) {
+		mmfd = TST_RET;
+		return;
+	}
+
+	SAFE_CLOSE(fsmfd);
+	err = "move_mount()";
+
+out:
+	SAFE_CLOSE(fd);
+	tst_brk(TBROK | TERRNO, "%s failed", err);
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(open_tree(tc->dirfd, tc->pathname, tc->flags));
+	if (TST_RET != -1) {
+		SAFE_CLOSE(TST_RET);
+		tst_brk(TFAIL, "%s: open_tree() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_brk(TFAIL | TTERRNO, "%s: open_tree() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: open_tree() failed as expected", tc->name);
+}
+
+static struct tst_test test = {
+	.min_kver = "5.2",
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.format_device = 1,
+	.mntpoint = MNTPOINT,
+};
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
