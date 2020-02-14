Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05D15D69B
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:36:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE4CB3C2447
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:36:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 28D753C241C
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:15 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 15954200D2A
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:14 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id d9so3637874plo.11
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 03:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PRPsV1TkI8I5v2ubHnZYQO3I0MGM2DGVa8AT6Bra/B8=;
 b=Lqml/5URzmV2GG1fWKUiEl8x/bC+muWba+0oTEnTa6J8Gtvag3IzXjR0Ou6+/kN0Qh
 iq4LlDPjmlEytEMCDAemxaxgqul0SUUQh56GzV1/miQunYl4+490sZ5A+fmmCJoJ7TP8
 p9spA31NOIlW2XrykNA8ltq2nzLwdtIm8N1gaJJnM/ChKjzJ21SwdpcXgJSzjYCskRnq
 CNggi/qB0AWc9HeufoFQYy6F0V3D4CWbA4tBBKl19C1JMmjeEbANFkG918BpjpZf1t/F
 5A56adwLM1XmAQqu/ulBrgcqIjIA455Y8O2ma3RsNpEdfC0+5g7Cnkqf3E8lx2l8FfAA
 ml2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PRPsV1TkI8I5v2ubHnZYQO3I0MGM2DGVa8AT6Bra/B8=;
 b=qXMaZaMizuonITk5/oWfNKVyK2g7yXmvZBCxViSGeqeItKVO7Ne9krG8THdzy6SvQo
 UQYwi4exC9axf6XtSKIop3N2I85LJgD+ELC5QeiwuThGvNSRqhGBv1mp8YTli4037PWW
 aaa3nYT/35hXBJmV8TNrakblEWG4WCopRUIDaCYKMvkStEEBCw/vLEqOcJR/vsG1uDp5
 6orhGmmBl0yeFPmyYihmfVO8+YC0RivJjj0aq55pu4+JI0ysAcUn1z52DLOEf3E1tLZK
 Qe+49k9zoKk9qzXQtSOJWSrzAp9ABInJ/iaeDEzawuHoVMsLzKNPLKOJ1AoTkEOSF12B
 TWBA==
X-Gm-Message-State: APjAAAUevGfH7Hhwm3y62kSqrjfYqDY57x3trpWJCKoAW4imNsg3r5p2
 JWsBhf0PcRMaiLc/Yic0oEphEA==
X-Google-Smtp-Source: APXvYqzcDAcrKKaU7tZivBsEnRFdgl3iHbM3Qggg5++X5LebCFMh3gq1FM73uGpdWTMONZO/mMRAwA==
X-Received: by 2002:a17:902:222:: with SMTP id
 31mr2908768plc.108.1581680172480; 
 Fri, 14 Feb 2020 03:36:12 -0800 (PST)
Received: from localhost ([122.167.210.63])
 by smtp.gmail.com with ESMTPSA id t23sm7055889pfq.6.2020.02.14.03.36.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Feb 2020 03:36:11 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 14 Feb 2020 17:05:52 +0530
Message-Id: <1f818d6f1ea57a4521aae1829c294526fdf7d832.1581680021.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1581680021.git.viresh.kumar@linaro.org>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/7] syscalls/fsconfig: New tests
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

Add tests to check working of fsconfig() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac                                  |  1 +
 runtest/syscalls                              |  3 +
 testcases/kernel/syscalls/fsconfig/.gitignore |  2 +
 testcases/kernel/syscalls/fsconfig/Makefile   |  6 ++
 .../kernel/syscalls/fsconfig/fsconfig01.c     | 77 +++++++++++++++
 .../kernel/syscalls/fsconfig/fsconfig02.c     | 97 +++++++++++++++++++
 6 files changed, 186 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fsconfig/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsconfig/Makefile
 create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig01.c
 create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig02.c

diff --git a/configure.ac b/configure.ac
index 4125160a19bb..f006c53e7df1 100644
--- a/configure.ac
+++ b/configure.ac
@@ -80,6 +80,7 @@ AC_CHECK_FUNCS([ \
     execveat \
     fallocate \
     fchownat \
+    fsconfig \
     fsopen \
     fstatat \
     getdents \
diff --git a/runtest/syscalls b/runtest/syscalls
index 0a56599ebad9..e27e94d5d17f 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -542,6 +542,9 @@ fanotify13 fanotify13
 fanotify14 fanotify14
 fanotify15 fanotify15
 
+fsconfig01 fsconfig01
+fsconfig02 fsconfig02
+
 fsopen01 fsopen01
 fsopen02 fsopen02
 
diff --git a/testcases/kernel/syscalls/fsconfig/.gitignore b/testcases/kernel/syscalls/fsconfig/.gitignore
new file mode 100644
index 000000000000..8fbb3360f0bb
--- /dev/null
+++ b/testcases/kernel/syscalls/fsconfig/.gitignore
@@ -0,0 +1,2 @@
+fsconfig01
+fsconfig02
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
index 000000000000..c6c95f32cb05
--- /dev/null
+++ b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
@@ -0,0 +1,77 @@
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
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
+		goto out;
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_SET_FLAG, "rw", NULL, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
+		goto out;
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
+
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+
+	SAFE_CLOSE(fsmfd);
+
+	if (TST_RET == -1) {
+		tst_res(TBROK | TERRNO, "move_mount() failed");
+		goto out;
+	}
+
+	SAFE_CLOSE(TST_RET);
+
+	TEST(umount(MNTPOINT));
+
+	tst_res(TPASS, "fsconfig() passed");
+
+out:
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.min_kver = "5.2",
+	.test_all = run,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.format_device = 1,
+	.mntpoint = MNTPOINT,
+};
diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig02.c b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
new file mode 100644
index 000000000000..45a60cc231fb
--- /dev/null
+++ b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
@@ -0,0 +1,97 @@
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
+int fd, temp_fd, invalid_fd = -1;
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
+	SAFE_CLOSE(temp_fd);
+	SAFE_CLOSE(fd);
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
+	.min_kver = "5.2",
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
