Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04412171007
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:15:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B28513C25D4
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:15:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id F28F13C25C8
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:14:59 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 170B61A00E17
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:14:59 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id m15so266440pgv.12
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 21:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cclDDoI7/i7jpYsZePA7DcXVHiD0HBovMZELbRnGimQ=;
 b=cZaP7Oj1VKZUxFKIW48ortEvJ5fIFLtt+Pb/WG7vIyBlYQiKV8UkuGf6xxrw4WPVSY
 YLOIMmyc4TDxMWEP0J4YGEbi3oMA44fc4TeCnz/+tbDYranRReQ/WqUTUfXhQxpeGXCb
 vzzWznreVKVkee5m0IDsS0QcolhGJ6l47+afDC1TTRSC3P78sAiw9demG1ZibW87Dhid
 fOA+vqARGvZdOILpio4HHgBgpl9OkQ/Xe5NLmGBj0kkkXwPOXa0MR2hKYCkNVddFSFyZ
 C7XeiJQJAjb8lbUDW5zCeUi5bFR/vlpcGVI0H1GGndmtATBGAlheLu4tg8SaRS1MbFOz
 bRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cclDDoI7/i7jpYsZePA7DcXVHiD0HBovMZELbRnGimQ=;
 b=frwdbQxhYArF7zYMsTxSb+EdCt8H4I+uMG+75eo8k0IOL7xGO1xFPOgfsE1K9IGYjR
 +fbzqN3Z4LyWrLB42lHeAauJiIYq5nh+LDCwCDaak7t7nXWVjk7TSj20v37UAIs9xz79
 5vY2/X+a1g0FEpVUfHnfpVU3knGkfZiOrGzK8EbmFugBsKldy6ks6IKXog2hs4dyrADB
 N8Ds8TsUEGRIlzOviQ+E8ePqWkbbk2nw4+hsPvCmutW+XhHVwzV9tMJvQyNIu4YKte1W
 t6C6vdvNLEdFZByqojG9PFX1XG4+ngig+GxstbLJilQCrbV+JbztQN1YJ1EEO6B/7qnY
 pi0Q==
X-Gm-Message-State: APjAAAV6E11qNBnktiGXoSixeVHXk5AGzZtLjY5hGP7Q5k1HlT8KV4Tf
 +moqmFrM7A3oVwG3SYz25fS6m6v5ih0=
X-Google-Smtp-Source: APXvYqyz7YxTJRrZTwf+fiNFcqyuIZisnVMkhSr2YkJ/rsZtQx2FPn8oMZ5ofHZele7EZ7JFN+Nyzg==
X-Received: by 2002:a63:6cc7:: with SMTP id h190mr2345265pgc.440.1582780496345; 
 Wed, 26 Feb 2020 21:14:56 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id f1sm4389118pjq.31.2020.02.26.21.14.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 21:14:55 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 10:44:32 +0530
Message-Id: <495a95969c63d67868b82d2b15bd663f19780d0e.1582779464.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582779464.git.viresh.kumar@linaro.org>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V5 04/10] syscalls/fsopen: New tests
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
index f51456b8fb53..1f21cc55bf2d 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -343,6 +343,9 @@ fremovexattr02 fremovexattr02
 
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
index 000000000000..abf5f15c4721
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
+	if (tst_is_mounted(MNTPOINT))
+		tst_res(TPASS, "%s: fsopen() passed", tc->name);
+
+	SAFE_UMOUNT(MNTPOINT);
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
