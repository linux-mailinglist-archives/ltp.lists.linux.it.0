Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTP id CAFFB164060
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AED2B3C265F
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id AA9B03C2668
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:30 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7DBE56011A8
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:29 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id 12so2290125pjb.5
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 01:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WyhU0Fk6k8uSFFfLaeUrCc3dEwENzX1SqNeXJOac3pg=;
 b=Pkk7kNdXm7PRGkzP6rQSPhFiMHB4H3MOHcLmbBdlNebS7oDln6p0LS+ixDpJHLdKSg
 pkZRans5HzQtunGABu8Um38blw4Z+cFn2q7krPXCWgN+2k38GvORiFdOXaP3PwTInNQJ
 I9GAFv1ZT/iEj7gUQbPjf1BZhw64NQQ5FXHmwu8u9igntR25cenArevnTZFhQsLC3p05
 A2okVJ8CED1+tGdGEMzKC+FFhew2SJBT8CFOAiqj5tkMt6hrJpJgODTGrOgHyyKiNp51
 YWaTZnhuWCD/pfwfBfCuCNj64SzELWnvUINrLfzFWx3Uekf3lYv7B0NPPqrtOaRaADAt
 jYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WyhU0Fk6k8uSFFfLaeUrCc3dEwENzX1SqNeXJOac3pg=;
 b=GCc+T1vFbe/hWis9V/q2b5ohyQYMJ7ecJi7oBEv6y8TF3CBu+7iaNfhnxnLPzEPcta
 u1aaqPdYvOkWQ92B/YFOHzYojFLSfvBQQ4JsLv2Pmd2tC6/7CciIscGA7wDkxrv8y/9i
 ortwgzILeGOix5c5usncLxuWFKp6yNnB7QEqCUfsfvSeYMIosClOKePE0nWf4E9OvNx5
 VI3G3XDVynViI0ULN5XCX1fdCLpiyOAIQ7IcmjV3eFg+7UgAJEnHBq9GtTktQyYEPJOH
 yIdYWREs6qWzxJ7F5fMxgdR0Y1izXAKfZtMPpE+U+8rMufXDw7gmM8tbmJO9IKop+qHP
 Fq8w==
X-Gm-Message-State: APjAAAWfL6lw//6JekUilUiWIJjEW62YDfDIS9KaxtjsBNAD88lR7GTR
 zcURIoDQ11RjtHkGh4r2fuJ5k7GA/sc=
X-Google-Smtp-Source: APXvYqyGoCYUxocJzF/NzYMUNuULxvgfXBagslT7TnIXpz+Zj80aE4vOFd1+7LXpj+aG0E9OtVGoqw==
X-Received: by 2002:a17:90a:8043:: with SMTP id
 e3mr7744833pjw.24.1582104507754; 
 Wed, 19 Feb 2020 01:28:27 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id f13sm1907388pgk.12.2020.02.19.01.28.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 01:28:26 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 14:58:01 +0530
Message-Id: <6ac7573e8ea5ab6f0ab9256b73802126d72b5156.1582104018.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582104018.git.viresh.kumar@linaro.org>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V2 05/10] syscalls/fsconfig: New tests
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

Add tests to check working of fsconfig() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/fsconfig/.gitignore |   2 +
 testcases/kernel/syscalls/fsconfig/Makefile   |   6 +
 .../kernel/syscalls/fsconfig/fsconfig01.c     | 110 ++++++++++++++++++
 .../kernel/syscalls/fsconfig/fsconfig02.c     | 100 ++++++++++++++++
 5 files changed, 221 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fsconfig/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsconfig/Makefile
 create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig01.c
 create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index f113342f0ded..4fcbd5f710eb 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -341,6 +341,9 @@ fpathconf01 fpathconf01
 fremovexattr01 fremovexattr01
 fremovexattr02 fremovexattr02
 
+fsconfig01 fsconfig01
+fsconfig02 fsconfig02
+
 fsmount01 fsmount01
 
 fsopen01 fsopen01
diff --git a/testcases/kernel/syscalls/fsconfig/.gitignore b/testcases/kernel/syscalls/fsconfig/.gitignore
new file mode 100644
index 000000000000..2bc54b82751b
--- /dev/null
+++ b/testcases/kernel/syscalls/fsconfig/.gitignore
@@ -0,0 +1,2 @@
+/fsconfig01
+/fsconfig02
diff --git a/testcases/kernel/syscalls/fsconfig/Makefile b/testcases/kernel/syscalls/fsconfig/Makefile
new file mode 100644
index 000000000000..5ea7d67db123
--- /dev/null
+++ b/testcases/kernel/syscalls/fsconfig/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig01.c b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
new file mode 100644
index 000000000000..96bf8eef8e4b
--- /dev/null
+++ b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic fsconfig() test which tries to configure and mount the filesystem as
+ * well.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+#define MNTPOINT	"mntpoint"
+
+static void setup(void)
+{
+	fsopen_supported_by_kernel();
+}
+
+static void run(void)
+{
+	int fd, fsmfd;
+
+	TEST(fsopen(tst_device->fs_type, 0));
+	fd = TST_RET;
+
+	if (fd == -1)
+		tst_brk(TBROK | TERRNO, "fsopen() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_SET_FLAG, "rw", NULL, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
+		goto out;
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
+		goto out;
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_SET_PATH, "foo", tst_device->dev, AT_FDCWD));
+	if (TST_RET == -1) {
+		if (TST_ERR == EOPNOTSUPP) {
+			tst_res(TINFO, "fsconfig(): FSCONFIG_SET_PATH not supported");
+		} else {
+			tst_res(TFAIL | TERRNO, "fsconfig() failed");
+			goto out;
+		}
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_SET_PATH_EMPTY, "foo", tst_device->dev, AT_FDCWD));
+	if (TST_RET == -1) {
+		if (TST_ERR == EOPNOTSUPP) {
+			tst_res(TINFO, "fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported");
+		} else {
+			tst_res(TFAIL | TERRNO, "fsconfig() failed");
+			goto out;
+		}
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_SET_FD, "foo", NULL, 0));
+	if (TST_RET == -1) {
+		if (TST_ERR == EOPNOTSUPP) {
+			tst_res(TINFO, "fsconfig(): FSCONFIG_SET_FD not supported");
+		} else {
+			tst_res(TFAIL | TERRNO, "fsconfig() failed");
+			goto out;
+		}
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
+		goto out;
+	}
+
+	TEST(fsmount(fd, 0, 0));
+	if (TST_RET == -1) {
+		tst_res(TBROK | TERRNO, "fsmount() failed");
+		goto out;
+	}
+
+	fsmfd = TST_RET;
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	SAFE_CLOSE(fsmfd);
+
+	if (TST_RET == -1) {
+		tst_res(TBROK | TERRNO, "move_mount() failed");
+		goto out;
+	}
+
+	if (!tst_ismount(MNTPOINT))
+		tst_res(TPASS, "fsconfig() passed");
+
+	SAFE_UMOUNT(MNTPOINT);
+
+out:
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.needs_root = 1,
+	.format_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.dev_fs_flags = TST_FS_SKIP_FUSE,
+};
diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig02.c b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
new file mode 100644
index 000000000000..b892f303690b
--- /dev/null
+++ b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic fsconfig() failure tests.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+int fd = -1, temp_fd = -1, invalid_fd = -1;
+int aux_0 = 0, aux_1 = 1, aux_fdcwd = AT_FDCWD, aux_minus1 = -1;
+
+static struct tcase {
+	char *name;
+	int *fd;
+	unsigned int cmd;
+	const char *key;
+	const void *value;
+	int *aux;
+	int exp_errno;
+} tcases[] = {
+	{"invalid-fd", &invalid_fd, FSCONFIG_SET_FLAG, "user_xattr", NULL, &aux_0, EINVAL},
+	{"invalid-cmd", &fd, 100, "rw", NULL, &aux_0, EOPNOTSUPP},
+	{"set-flag-key", &fd, FSCONFIG_SET_FLAG, NULL, NULL, &aux_0, EINVAL},
+	{"set-flag-value", &fd, FSCONFIG_SET_FLAG, "rw", "foo", &aux_0, EINVAL},
+	{"set-flag-aux", &fd, FSCONFIG_SET_FLAG, "rw", NULL, &aux_1, EINVAL},
+	{"set-string-key", &fd, FSCONFIG_SET_STRING, NULL, "#grand.central.org:root.cell.", &aux_0, EINVAL},
+	{"set-string-value", &fd, FSCONFIG_SET_STRING, "source", NULL, &aux_0, EINVAL},
+	{"set-string-aux", &fd, FSCONFIG_SET_STRING, "source", "#grand.central.org:root.cell.", &aux_1, EINVAL},
+	{"set-binary-key", &fd, FSCONFIG_SET_BINARY, NULL, "foo", &aux_1, EINVAL},
+	{"set-binary-value", &fd, FSCONFIG_SET_BINARY, "sync", NULL, &aux_1, EINVAL},
+	{"set-binary-aux", &fd, FSCONFIG_SET_BINARY, "sync", "foo", &aux_0, EINVAL},
+	{"set-path-key", &fd, FSCONFIG_SET_PATH, NULL, "/dev/sda1", &aux_fdcwd, EINVAL},
+	{"set-path-value", &fd, FSCONFIG_SET_PATH, "sync", NULL, &aux_fdcwd, EINVAL},
+	{"set-path-aux", &fd, FSCONFIG_SET_PATH, "sync", "/dev/sda1", &aux_minus1, EINVAL},
+	{"set-path-empty-key", &fd, FSCONFIG_SET_PATH_EMPTY, NULL, "/dev/foo", &aux_fdcwd, EINVAL},
+	{"set-path-empty-value", &fd, FSCONFIG_SET_PATH_EMPTY, "sync", NULL, &aux_fdcwd, EINVAL},
+	{"set-path-empty-aux", &fd, FSCONFIG_SET_PATH_EMPTY, "sync", "/dev/foo", &aux_minus1, EINVAL},
+	{"set-fd-key", &fd, FSCONFIG_SET_FD, NULL, NULL, &temp_fd, EINVAL},
+	{"set-fd-value", &fd, FSCONFIG_SET_FD, "sync", "foo", &temp_fd, EINVAL},
+	{"set-fd-aux", &fd, FSCONFIG_SET_FD, "sync", NULL, &aux_minus1, EINVAL},
+	{"cmd-create-key", &fd, FSCONFIG_CMD_CREATE, "foo", NULL, &aux_0, EINVAL},
+	{"cmd-create-value", &fd, FSCONFIG_CMD_CREATE, NULL, "foo", &aux_0, EINVAL},
+	{"cmd-create-aux", &fd, FSCONFIG_CMD_CREATE, NULL, NULL, &aux_1, EINVAL},
+	{"cmd-reconfigure-key", &fd, FSCONFIG_CMD_RECONFIGURE, "foo", NULL, &aux_0, EINVAL},
+	{"cmd-reconfigure-value", &fd, FSCONFIG_CMD_RECONFIGURE, NULL, "foo", &aux_0, EINVAL},
+	{"cmd-reconfigure-aux", &fd, FSCONFIG_CMD_RECONFIGURE, NULL, NULL, &aux_1, EINVAL},
+};
+
+static void setup(void)
+{
+	fsopen_supported_by_kernel();
+
+	TEST(fsopen(tst_device->fs_type, 0));
+	fd = TST_RET;
+
+	if (fd == -1)
+		tst_brk(TBROK | TERRNO, "fsopen() failed");
+
+	temp_fd = open("testfile", O_RDWR | O_CREAT, 01444);
+	if (temp_fd == -1)
+		tst_res(TBROK, "Can't obtain temp_fd, open() failed");
+}
+
+static void cleanup(void)
+{
+	if (temp_fd != -1)
+		SAFE_CLOSE(temp_fd);
+	if (fd != -1)
+		SAFE_CLOSE(fd);
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(fsconfig(*tc->fd, tc->cmd, tc->key, tc->value, *tc->aux));
+
+	if (TST_RET != -1) {
+		tst_brk(TFAIL, "%s: fsconfig() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_brk(TFAIL | TTERRNO, "%s: fsconfig() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: fsconfig() failed as expected", tc->name);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.needs_device = 1,
+};
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
