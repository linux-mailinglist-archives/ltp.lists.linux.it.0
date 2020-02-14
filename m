Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A4A15D69D
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:36:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C06C33C2382
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:36:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D2F243C2557
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:17 +0100 (CET)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EE11A14044BB
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:16 +0100 (CET)
Received: by mail-pg1-x532.google.com with SMTP id 70so4827243pgf.8
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 03:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hhd+B5e1VJpRkHa9DaGM6QOmNpL5F/qeXU+UEIKINJI=;
 b=MrV5+MCkcR9PxaWlvVIvwLanQVTS57Idd8ZmZfZBMyprZZHTFWQvbQ7YfLawvQVKd2
 fuQRFs5a5x2g+zJFNsQ+jf56EqBSmaResLUpxXzt7+dkplrrT8EaJ9bjGfDa45eCHRum
 YnchIxrN4GNkl6x+HXikp2TRDCnasAuPa/Om2sKMtFjq5afYfuWCmbMvKk7lEuTQ14aU
 efGGrDr+7+ku5nMMtxO0Uc3yRs2Bxo1SoDfcCjatfBQseRVROh2yzwxuXKRbifCOAgsh
 oqO98LUTNHW+uqhIWWpnxpP2I1jJy+G7fTCoplf70z5016G22EIelfyAGQffyrhWlXwe
 OkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hhd+B5e1VJpRkHa9DaGM6QOmNpL5F/qeXU+UEIKINJI=;
 b=UR6m7QWXp8N7e3gIRINA0x8x3vlttCRAQTQQCzgQKNcfR7g8/kc5mg7DGMa0T8d71e
 BIZU2dt91dLKyp4rwHK2fPv5NVgAj/kCVknjIyem78bMIgdgFcj+ivojV3F9zMhzQmjb
 LTFR0eTf9IxIrAamQGOU+LAsvAKMmrlIv5708t9WyHHaROQbOsMvZrfZ4nyUlFBnCZ3r
 0f+JUQtseKF1dKoo5xezhSV9i9Q2/gDbJ5h/kerDwzgoInHBqaYsXfdihOgUgzz/GIj0
 RZmBJiIveqD1fpGwmqS8pY5A49bWxHVyErA3k4TkhMjrEWh8zI9vNa+gmtn1kyrFc02F
 tBKQ==
X-Gm-Message-State: APjAAAUWC5rbefIKS9a5ssQ7lV7DZ/GZvg8mExfp72398O4rmNDSkC58
 B/axZDybSOFG9AYqAlk9l0QLnA==
X-Google-Smtp-Source: APXvYqzGs8D4dh231H+DffyAdN0ZOynuZ4++68YH4Kd489R97/gHZIv8dKJhUJlAGijLyp+lPr4jMg==
X-Received: by 2002:aa7:8717:: with SMTP id b23mr3056340pfo.53.1581680175427; 
 Fri, 14 Feb 2020 03:36:15 -0800 (PST)
Received: from localhost ([122.167.210.63])
 by smtp.gmail.com with ESMTPSA id s7sm6512101pjk.22.2020.02.14.03.36.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Feb 2020 03:36:14 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 14 Feb 2020 17:05:53 +0530
Message-Id: <1c61c673a02152c30edac0e25438257c23c3322e.1581680021.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1581680021.git.viresh.kumar@linaro.org>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 4/7] syscalls/fsmount: New tests
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

Add tests to check working of fsmount() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac                                  |  1 +
 runtest/syscalls                              |  3 +
 testcases/kernel/syscalls/fsmount/.gitignore  |  2 +
 testcases/kernel/syscalls/fsmount/Makefile    |  6 ++
 testcases/kernel/syscalls/fsmount/fsmount01.c | 71 ++++++++++++++++
 testcases/kernel/syscalls/fsmount/fsmount02.c | 83 +++++++++++++++++++
 6 files changed, 166 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fsmount/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsmount/Makefile
 create mode 100644 testcases/kernel/syscalls/fsmount/fsmount01.c
 create mode 100644 testcases/kernel/syscalls/fsmount/fsmount02.c

diff --git a/configure.ac b/configure.ac
index f006c53e7df1..734fb10c4b31 100644
--- a/configure.ac
+++ b/configure.ac
@@ -81,6 +81,7 @@ AC_CHECK_FUNCS([ \
     fallocate \
     fchownat \
     fsconfig \
+    fsmount \
     fsopen \
     fstatat \
     getdents \
diff --git a/runtest/syscalls b/runtest/syscalls
index e27e94d5d17f..0b1def7d4659 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -545,6 +545,9 @@ fanotify15 fanotify15
 fsconfig01 fsconfig01
 fsconfig02 fsconfig02
 
+fsmount01 fsmount01
+fsmount02 fsmount02
+
 fsopen01 fsopen01
 fsopen02 fsopen02
 
diff --git a/testcases/kernel/syscalls/fsmount/.gitignore b/testcases/kernel/syscalls/fsmount/.gitignore
new file mode 100644
index 000000000000..aaa66d57f417
--- /dev/null
+++ b/testcases/kernel/syscalls/fsmount/.gitignore
@@ -0,0 +1,2 @@
+fsmount01
+fsmount02
diff --git a/testcases/kernel/syscalls/fsmount/Makefile b/testcases/kernel/syscalls/fsmount/Makefile
new file mode 100644
index 000000000000..5ea7d67db123
--- /dev/null
+++ b/testcases/kernel/syscalls/fsmount/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
new file mode 100644
index 000000000000..83fcf0d51f47
--- /dev/null
+++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic fsmount() test.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+#define MNTPOINT	"mntpoint"
+
+static int fd, fsmfd;
+
+static void setup(void)
+{
+	TEST(fsopen(tst_device->fs_type, 0));
+	fd = TST_RET;
+
+	if (fd == -1)
+		tst_brk(TBROK | TERRNO, "fsopen() failed");
+}
+
+static void cleanup(void)
+{
+	SAFE_CLOSE(fd);
+}
+
+static void run(void)
+{
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_SET_FLAG, "rw", NULL, 0));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+
+	TEST(fsmount(fd, 0, 0));
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TERRNO, "fsmount() failed");
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
+	SAFE_CLOSE(TST_RET);
+	TEST(umount(MNTPOINT));
+
+	tst_res(TPASS, "fsmount() passed");
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
diff --git a/testcases/kernel/syscalls/fsmount/fsmount02.c b/testcases/kernel/syscalls/fsmount/fsmount02.c
new file mode 100644
index 000000000000..cbe99bf99c1f
--- /dev/null
+++ b/testcases/kernel/syscalls/fsmount/fsmount02.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic fsmount() failure tests.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+int fd, invalid_fd = -1;
+
+static struct tcase {
+	char *name;
+	int *fd;
+	unsigned int flags;
+	unsigned int mount_attrs;
+	int exp_errno;
+} tcases[] = {
+	{"invalid-fd", &invalid_fd, FSMOUNT_CLOEXEC, 0, EBADF},
+	{"invalid-flags", &fd, 0x02, 0, EINVAL},
+	{"invalid-attrs", &fd, FSMOUNT_CLOEXEC, 0x100, EINVAL},
+};
+
+static void cleanup(void)
+{
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
+	if (TST_RET != -1)
+		return;
+
+out:
+	cleanup();
+	tst_brk(TBROK | TERRNO, "fsconfig() failed");
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(fsmount(*tc->fd, tc->flags, tc->mount_attrs));
+	if (TST_RET != -1) {
+		SAFE_CLOSE(TST_RET);
+		tst_brk(TFAIL, "%s: fsmount() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_brk(TFAIL | TTERRNO, "%s: fsmount() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: fsmount() failed as expected", tc->name);
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
+};
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
