Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F815D69F
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:37:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51D173C245E
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:37:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E16623C25F1
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:22 +0100 (CET)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1B3436022CF
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:22 +0100 (CET)
Received: by mail-pf1-x42d.google.com with SMTP id s1so4763701pfh.10
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 03:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3IJBUtj+LDuFieIZHszekWQoDmDI88nQrFwi21YaaFQ=;
 b=ZgZsRZZcN4/FGzoeAurhxA6WFJknis+FFWBJwQGtGpjUReB4hxg/lWsprI+KIoT74q
 q+OUdbSPcPf0IGOVUQlmsfFZBxquaBN0m0QEgSbIWru2aYQi6i7dtoeYudLRgzlW42Go
 Jq5/i96JW5W7RZYD3pfnVyOYmzdIV5huKoAkN/Kw3mhDLBZBMqPJYAbTiYIaC1RZZW8n
 lx1SM1R6qoUdHLplWCyyiEK0PJNhyS9/80BgmCQ5z1Q1/j3ikWKcN3bTCFIoFd3NcxMv
 gAPiMC9ibMWYeCNBS56+2+wxl2dXrdib/qwinXwMFMluD+eNBLcf2NBfLnIYgil886bS
 zeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3IJBUtj+LDuFieIZHszekWQoDmDI88nQrFwi21YaaFQ=;
 b=M0j0PTHLiNsM2i2o6eX0Al+1XMyJ4LBBDrmJlh9GxOLW8UKpNRXeKmfmpCm2HIK7WX
 cVsf2VtEAIA42uSwhIvVPMUykNyaRrslKxcNFqiUC1QOOKX4tBnwL8W5z05jN2sXwOo/
 NKXnf6f/Uieu54Epv48/bDIZioL0IQCTZ2V0rjzEWqKHRcV9DrNDEfax8TfsnC7rNhb1
 X5pp4Qok3RXYPkp9Z70BLkt3D7BP5eHsDkwR3CF9IYqZ4O1CfNKwxIZ06KVLKbirAZ/U
 jAvm8cvsQzHa4h/036BTKYXrZ86vxIvfj2ldeNnxfay4Jv0XfkA6p7QI1OVVR7iPMn65
 sVHQ==
X-Gm-Message-State: APjAAAXoudGANsU4vlC7pwqdn3qEqzAHbd7Xt2lh0f/GbJh6EWKNbR7p
 JtiKRE8RuzRa2T3tTGKEwKlBDg==
X-Google-Smtp-Source: APXvYqwetPGhNSer2JOFK08wMHTEBEnuSmGRsAVgqOqDpn6vjoM+g1B/znW5SR2DKs86dHCHPOlbhw==
X-Received: by 2002:a63:e54b:: with SMTP id z11mr3088259pgj.160.1581680180492; 
 Fri, 14 Feb 2020 03:36:20 -0800 (PST)
Received: from localhost ([122.167.210.63])
 by smtp.gmail.com with ESMTPSA id c11sm6767063pfo.170.2020.02.14.03.36.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Feb 2020 03:36:20 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 14 Feb 2020 17:05:55 +0530
Message-Id: <6db1879832ebda6620a76acf3666280e87d79253.1581680021.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1581680021.git.viresh.kumar@linaro.org>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 6/7] syscalls/fspick: New tests
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

Add tests to check working of fspick() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac                                |   1 +
 runtest/syscalls                            |   3 +
 testcases/kernel/syscalls/fspick/.gitignore |   2 +
 testcases/kernel/syscalls/fspick/Makefile   |   6 ++
 testcases/kernel/syscalls/fspick/fspick01.c | 104 ++++++++++++++++++
 testcases/kernel/syscalls/fspick/fspick02.c | 110 ++++++++++++++++++++
 6 files changed, 226 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fspick/.gitignore
 create mode 100644 testcases/kernel/syscalls/fspick/Makefile
 create mode 100644 testcases/kernel/syscalls/fspick/fspick01.c
 create mode 100644 testcases/kernel/syscalls/fspick/fspick02.c

diff --git a/configure.ac b/configure.ac
index 05b7d0a72c0a..de767b1413bb 100644
--- a/configure.ac
+++ b/configure.ac
@@ -81,6 +81,7 @@ AC_CHECK_FUNCS([ \
     fallocate \
     fchownat \
     fsconfig \
+    fspick \
     fsmount \
     fsopen \
     fstatat \
diff --git a/runtest/syscalls b/runtest/syscalls
index 04e11ef4f9d2..d90e212748a2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -545,6 +545,9 @@ fanotify15 fanotify15
 fsconfig01 fsconfig01
 fsconfig02 fsconfig02
 
+fspick01 fspick01
+fspick02 fspick02
+
 fsmount01 fsmount01
 fsmount02 fsmount02
 
diff --git a/testcases/kernel/syscalls/fspick/.gitignore b/testcases/kernel/syscalls/fspick/.gitignore
new file mode 100644
index 000000000000..ddcb2231e58c
--- /dev/null
+++ b/testcases/kernel/syscalls/fspick/.gitignore
@@ -0,0 +1,2 @@
+fspick01
+fspick02
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
index 000000000000..927435f8741f
--- /dev/null
+++ b/testcases/kernel/syscalls/fspick/fspick01.c
@@ -0,0 +1,104 @@
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
+static int fd, fsmfd, mmfd;
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
+	TEST(move_mount(TST_RET, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	if (TST_RET != -1) {
+		mmfd = TST_RET;
+		return;
+	}
+
+	SAFE_CLOSE(fsmfd);
+
+	err = "move_mount()";
+
+out:
+	SAFE_CLOSE(fd);
+	tst_brk(TBROK | TERRNO, "%s failed", err);
+}
+
+static void run(void)
+{
+	int fspick_fd;
+
+	TEST(fspick(AT_FDCWD, MNTPOINT, FSPICK_NO_AUTOMOUNT | FSPICK_CLOEXEC));
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
+	tst_res(TPASS, "fspick() passed");
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
diff --git a/testcases/kernel/syscalls/fspick/fspick02.c b/testcases/kernel/syscalls/fspick/fspick02.c
new file mode 100644
index 000000000000..4e271aa47d0a
--- /dev/null
+++ b/testcases/kernel/syscalls/fspick/fspick02.c
@@ -0,0 +1,110 @@
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
+int fd, fsmfd, mmfd;
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
+static void cleanup(void)
+{
+	SAFE_CLOSE(mmfd);
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
+	TEST(move_mount(TST_RET, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	if (TST_RET != -1) {
+		mmfd = TST_RET;
+		return;
+	}
+
+	SAFE_CLOSE(fsmfd);
+
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
