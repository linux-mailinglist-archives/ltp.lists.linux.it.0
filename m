Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC5A182FBC
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:02:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7D4F3C5E83
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:02:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3AA043C5EC8
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:33 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2CC9D60218B
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:32 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id z65so3164567pfz.8
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 05:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RAyXv52gN5tlvwxtljhvEf7iLzo838P0rTbLKV8BMbQ=;
 b=NxYuBLzlIyl7OP+8vca+RBBSjTMfCQainPwvMmt3gO8SQxQJVzi4TWRrYSyQu2NJdh
 DSthwVT8jpROfDc8134raMPQt0NKcUHwXwhv1RGVdqwnkjYbW/4YAqOLqGIBmuJaL0qQ
 Z2AlUoK2MdxbaXgrCR7nBTo7i6zVJXpo5J7hDZFHFQblNoaJth+RkWIXEQPunplzd7Em
 o6VSkNyspVZ/Q1nnD1efPwrL/69N4uWkQQnZaX1n7ZwwC4FacyVXgObalAyHXe0tLyAp
 +1W7LnQirL5t/+CrffkgPNmO5fcve46Y+A5GhP/XLcv/sEQUnLILPnOxv65St9+8KUxp
 nAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RAyXv52gN5tlvwxtljhvEf7iLzo838P0rTbLKV8BMbQ=;
 b=R9uxkEBwHRInc5/F6AFy8/4aHl1FNBWzyO6yoE8+RI/q6F7FoDGQcJxv+ZkxSOSip7
 3sf7w4WELwRb/2yqZCaBo6g9WCFA9glxVGfR3jvKKiye8nBhuAadZaaTkYTWnymKNdRf
 PN8rdFYWQgNWK0wt4Hg5vD4FvRKKN2W2GJdWYoZPlUSbT1HdbxP4fjoGof1+6MUKaqvK
 ZMaUaMuP/A0qMxke5lbFmUAWZ9vuxJTVT9iUxJ7fMt8HutkL3WWkX6gzDhdg80I41Oyp
 3EKJ3kRqYeEdn922UhbCTqHUb/SQOGy1hH/vHOapWtPbSxqCA8L/R2NkD7gzLB6ZzS+1
 1p7A==
X-Gm-Message-State: ANhLgQ07UbKss86OfvVV7OmherKeLRjxITMaI0lzosE25NpwIFXuc29s
 6VYOAxbGcM+HYuWlORoH99ccnk7dlg4=
X-Google-Smtp-Source: ADFU+vsp5ybF5eF1ULcVI9tFbfyBgR4cS8cFIIs7sDDUZGAuahSF7GUfDecsgrcArqt8JfLD7sw2hA==
X-Received: by 2002:a63:1245:: with SMTP id 5mr7344502pgs.55.1584014490132;
 Thu, 12 Mar 2020 05:01:30 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id 184sm21462539pfe.11.2020.03.12.05.01.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 05:01:29 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 17:31:04 +0530
Message-Id: <294687a2f59234ba24ac31a276ab20b85c1fcd97.1584014172.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1584014172.git.viresh.kumar@linaro.org>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V6 04/10] syscalls/fsopen: New tests
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

Add tests to check working of fsopen() syscall.

Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                            |  3 +
 testcases/kernel/syscalls/fsopen/.gitignore |  2 +
 testcases/kernel/syscalls/fsopen/Makefile   |  6 ++
 testcases/kernel/syscalls/fsopen/fsopen01.c | 80 +++++++++++++++++++++
 testcases/kernel/syscalls/fsopen/fsopen02.c | 58 +++++++++++++++
 5 files changed, 149 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fsopen/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsopen/Makefile
 create mode 100644 testcases/kernel/syscalls/fsopen/fsopen01.c
 create mode 100644 testcases/kernel/syscalls/fsopen/fsopen02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 30ea8be21ec1..ce752f12ec55 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -344,6 +344,9 @@ fremovexattr02 fremovexattr02
 
 fsmount01 fsmount01
 
+fsopen01 fsopen01
+fsopen02 fsopen02
+
 fstat02 fstat02
 fstat02_64 fstat02_64
 fstat03 fstat03
diff --git a/testcases/kernel/syscalls/fsopen/.gitignore b/testcases/kernel/syscalls/fsopen/.gitignore
new file mode 100644
index 000000000000..5da868621883
--- /dev/null
+++ b/testcases/kernel/syscalls/fsopen/.gitignore
@@ -0,0 +1,2 @@
+/fsopen01
+/fsopen02
diff --git a/testcases/kernel/syscalls/fsopen/Makefile b/testcases/kernel/syscalls/fsopen/Makefile
new file mode 100644
index 000000000000..5ea7d67db123
--- /dev/null
+++ b/testcases/kernel/syscalls/fsopen/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/fsopen/fsopen01.c b/testcases/kernel/syscalls/fsopen/fsopen01.c
new file mode 100644
index 000000000000..d486361dcf01
--- /dev/null
+++ b/testcases/kernel/syscalls/fsopen/fsopen01.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic fsopen() test which tries to configure and mount the filesystem as
+ * well.
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
+	TCASE_ENTRY(0),
+	TCASE_ENTRY(FSOPEN_CLOEXEC),
+};
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int fd, fsmfd;
+
+	TEST(fd = fsopen(tst_device->fs_type, tc->flags));
+	if (fd == -1) {
+		tst_res(TFAIL | TERRNO, "fsopen() failed");
+		return;
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
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
+	TEST(fsmfd = fsmount(fd, 0, 0));
+	if (fsmfd == -1) {
+		tst_res(TFAIL | TERRNO, "fsmount() failed");
+		goto out;
+	}
+
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+
+	SAFE_CLOSE(fsmfd);
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "move_mount() failed");
+		goto out;
+	}
+
+	if (tst_is_mounted_at_tmpdir(MNTPOINT)) {
+		SAFE_UMOUNT(MNTPOINT);
+		tst_res(TPASS, "%s: fsopen() passed", tc->name);
+	}
+
+out:
+	SAFE_CLOSE(fd);
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
diff --git a/testcases/kernel/syscalls/fsopen/fsopen02.c b/testcases/kernel/syscalls/fsopen/fsopen02.c
new file mode 100644
index 000000000000..3f287bf2962b
--- /dev/null
+++ b/testcases/kernel/syscalls/fsopen/fsopen02.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic fsopen() failure tests.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+const char *invalid_fs = "invalid";
+const char *valid_fs;
+
+static struct tcase {
+	char *name;
+	const char **fs;
+	unsigned int flags;
+	int exp_errno;
+} tcases[] = {
+	{"invalid-fs", &invalid_fs, 0, ENODEV},
+	{"invalid-flags", &valid_fs, 0x10, EINVAL},
+};
+
+static void setup(void)
+{
+	fsopen_supported_by_kernel();
+
+	valid_fs = tst_device->fs_type;
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(fsopen(*tc->fs, tc->flags));
+
+	if (TST_RET != -1) {
+		SAFE_CLOSE(TST_RET);
+		tst_res(TFAIL, "%s: fsopen() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: fsopen() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+		return;
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: fsopen() failed as expected", tc->name);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.needs_root = 1,
+	.needs_device = 1,
+};
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
