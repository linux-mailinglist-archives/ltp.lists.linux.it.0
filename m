Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 851B015D69E
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:37:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 385983C251E
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:37:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 45A263C23C8
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:20 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 73C82605642
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:19 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id j15so4836070pgm.6
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 03:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V9fDgOkwPQPkHXR1r1Hue3vsP7stP/bxtibrk/BSJRM=;
 b=SoJgYNq3AivHq/hxMUbjcmm/rP9ciQkRII2bqeJOIM4nVY5AisbLUj+Zn4jkHdlm6N
 cmgdgPHwCgNVRm1keuox0BJFKNIjAURmWBFE1sAIGNiWEiojimCgH6KqATG++gGZ0JPX
 fzF3UlrALvFRsF+Z0T7Un21AByK1AlXi3NJbYJYhxARLUliEY6guVyKwrT4kUNIB4Ll2
 vqvtY0w+QJVlUBggP0gO0167kReVhuyhynN+1KnPfSCNVMp32vwuxGuXGU6jQIeSy8y3
 sOeYXqxgh3YmNJqUuTYCWRIeiaj3syQRh9MgJQWX+emToixMM+b2nLR4Ejnzu2Nv13r2
 CUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V9fDgOkwPQPkHXR1r1Hue3vsP7stP/bxtibrk/BSJRM=;
 b=fU9OFRnitt6Xrzw/QlmF+F0sCKw+90UF+HQpZ+xCS7xN5wiua9XTHC7lagCA7ydBnz
 zUfrpuHOOHIYKAYh2Z+N2joScJEs7YOqEMLWk8g1DmPpV7gc772SFQwH7Z6N4TY39ANM
 1X+Y0Q24tzFVS5lHFr9hvhk9laQ2wh6UbQm87jLCemYYcjwfxLDxQGonI9FSm5NT1acB
 1zoOK1/FTrHU2b7NS5XLyuvRYGFmt2w9eWcZxQ66ytEeoAm4rtPKWEgpqTNeMNkzRc6k
 SOh6wey6HwnnRkhMlX9D64/aMwzHvcgfk+Ace4HmNgx7/S5MV2geFG6XvmXkw2AD7o2n
 zlSg==
X-Gm-Message-State: APjAAAXtHSUlMvt17UBE1IDuHLBUxkY6jxPvxwX1lbOSIvNUtNAqbrzD
 +rb3WHts5DKCCzwIEUdmgyLKIQ==
X-Google-Smtp-Source: APXvYqx80bSnrzOGH/LUhMzdxMI3un5i/gEDEXm99vq3IXqKKatJAgKLf1L1obEpFLdUfYVYjmsmMg==
X-Received: by 2002:a63:5423:: with SMTP id i35mr2992190pgb.179.1581680177959; 
 Fri, 14 Feb 2020 03:36:17 -0800 (PST)
Received: from localhost ([122.167.210.63])
 by smtp.gmail.com with ESMTPSA id f8sm6700909pfn.2.2020.02.14.03.36.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Feb 2020 03:36:17 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 14 Feb 2020 17:05:54 +0530
Message-Id: <dc526a3e1bfb7835860f381192babee33766340d.1581680021.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1581680021.git.viresh.kumar@linaro.org>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 5/7] syscalls/move_mount: New tests
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

Add tests to check working of move_mount() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac                                  |   1 +
 runtest/syscalls                              |   3 +
 .../kernel/syscalls/move_mount/.gitignore     |   2 +
 testcases/kernel/syscalls/move_mount/Makefile |   6 ++
 .../kernel/syscalls/move_mount/move_mount01.c |  82 ++++++++++++++
 .../kernel/syscalls/move_mount/move_mount02.c | 102 ++++++++++++++++++
 6 files changed, 196 insertions(+)
 create mode 100644 testcases/kernel/syscalls/move_mount/.gitignore
 create mode 100644 testcases/kernel/syscalls/move_mount/Makefile
 create mode 100644 testcases/kernel/syscalls/move_mount/move_mount01.c
 create mode 100644 testcases/kernel/syscalls/move_mount/move_mount02.c

diff --git a/configure.ac b/configure.ac
index 734fb10c4b31..05b7d0a72c0a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -91,6 +91,7 @@ AC_CHECK_FUNCS([ \
     mkdirat \
     mknodat \
     modify_ldt \
+    move_mount \
     name_to_handle_at \
     openat \
     pidfd_open \
diff --git a/runtest/syscalls b/runtest/syscalls
index 0b1def7d4659..04e11ef4f9d2 100644
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
index 000000000000..8e2f4aaf497b
--- /dev/null
+++ b/testcases/kernel/syscalls/move_mount/.gitignore
@@ -0,0 +1,2 @@
+move_mount01
+move_mount02
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
index 000000000000..5b719013fed2
--- /dev/null
+++ b/testcases/kernel/syscalls/move_mount/move_mount01.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic move_mount() test.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+#define MNTPOINT	"mntpoint"
+
+static int fd, fsmfd, mmfd = -1;
+
+static void cleanup(void)
+{
+	SAFE_CLOSE(fsmfd);
+
+	if (mmfd != -1) {
+		SAFE_CLOSE(mmfd);
+		TEST(umount(MNTPOINT));
+	}
+
+	SAFE_CLOSE(fd);
+}
+
+static void setup(void)
+{
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
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsmount() failed");
+	}
+
+	fsmfd = TST_RET;
+	return;
+
+out:
+	SAFE_CLOSE(fd);
+	tst_brk(TBROK | TERRNO, "fsconfig() failed");
+}
+
+static void run(void)
+{
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TERRNO, "move_mount() failed");
+
+	mmfd = TST_RET;
+
+	tst_res(TPASS, "move_mount() passed");
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
diff --git a/testcases/kernel/syscalls/move_mount/move_mount02.c b/testcases/kernel/syscalls/move_mount/move_mount02.c
new file mode 100644
index 000000000000..8cff7e82069a
--- /dev/null
+++ b/testcases/kernel/syscalls/move_mount/move_mount02.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic move_mount() failure tests.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+#define MNTPOINT	"mntpoint"
+
+int fd, invalid_fd = -1, fsmfd;
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
+static void cleanup(void)
+{
+	SAFE_CLOSE(fsmfd);
+	SAFE_CLOSE(fd);
+}
+
+static void setup(void)
+{
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
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsmount() failed");
+	}
+
+	fsmfd = TST_RET;
+	return;
+
+out:
+	SAFE_CLOSE(fd);
+	tst_brk(TBROK | TERRNO, "fsconfig() failed");
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(move_mount(*tc->from_dirfd, tc->from_pathname, tc->to_dirfd,
+			tc->to_pathname, tc->flags));
+	if (TST_RET != -1) {
+		SAFE_CLOSE(TST_RET);
+		TEST(umount(MNTPOINT));
+		tst_brk(TFAIL, "%s: move_mount() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_brk(TFAIL | TTERRNO, "%s: move_mount() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: move_mount() failed as expected", tc->name);
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
