Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CB317100C
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:16:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 460F83C25C3
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:16:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 541A53C25D5
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:15:12 +0100 (CET)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 801721A00EE9
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:15:11 +0100 (CET)
Received: by mail-pg1-x536.google.com with SMTP id h8so818028pgs.9
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 21:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZTroJDjhYfx8UJ+i7amfx+h2T0rwIjicnC0mJv7l8Y=;
 b=WRiGtdU+aT1rZHcZAVHgtvoOCotHoqd5TFjYgw1Ra7yPw4jdWpjOLrbACuD0P0BM/J
 MV0gfsdRgDKrUOMdf5Io0W/Cwc5VlSTT9efGtnSBhGecfAm5u1kZx44gzmI35CClfD4e
 vuiXf+zS1OtVCnTEy1DExFdlErWXPbxsdioZML6uIonT9gEygDG3Eu3SIYR4bZYAS0xK
 ZPtxsqCUmwREOUfHB6M02aEFebsUMlbZE0h0T9GZiu7nyiI+QnKXTaRkdoPLKyYQ+Qk5
 yTMfZVQSa0t2C24rfWQw6li361oA1CGuRQ7kWnCIaa5X21DyVtzVV4fnhF8BEUGBQTzA
 nmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZTroJDjhYfx8UJ+i7amfx+h2T0rwIjicnC0mJv7l8Y=;
 b=bv6vfYz8LxpbPQUGXdCgbRMGXALa3zqlhIywgk86pbQu3OYLAoo85B5D82sTJ9M0t+
 Kjb1ju+3ikwpsIrlLXW9uLWYtjD5Wu2LR3VxaqwdjPsl8LKTt0sxb5cEjBW7gdWln0q0
 UDOjFqzrhvLvW4GBpD9YOc4oAMr3G4UWYraLeF2fKpcIqzGStmc/dvw/+vQMK3B2qFWq
 6PfHwe6fRoalWrvUKWfkEAqEUCpTulDMWPup2RiIYewTOUWB+K0FirGR3FfYC1mEmDoK
 NReP18vue803lzke0b9QQYaR93tQd0GJ2MfyxpNt8uP8MlJv1/D4coCmWL5dgGkzYqCN
 Qc/Q==
X-Gm-Message-State: APjAAAVDSdR7OEdcg3CTXg0N2Muqk/AgOF7hMRTKP4lXhZvYD+Jxujd/
 GRcVex1SZ60VexzXpasJJZLHXsPUcdw=
X-Google-Smtp-Source: APXvYqwEwteHXSAGjmpyAr25re/xTuwW+RiD334fJzMMFsHIb8tbdru2wipyylIlCbGdapXkJNqPIw==
X-Received: by 2002:aa7:95b0:: with SMTP id a16mr2157154pfk.253.1582780509536; 
 Wed, 26 Feb 2020 21:15:09 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id c19sm5395039pfc.144.2020.02.26.21.15.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 21:15:08 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 10:44:37 +0530
Message-Id: <b9210f3053b75a5d36ea827c0633eee0553780bf.1582779464.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582779464.git.viresh.kumar@linaro.org>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V5 09/10] syscalls/fspick: New tests
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

Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                            |  3 +
 testcases/kernel/syscalls/fspick/.gitignore |  2 +
 testcases/kernel/syscalls/fspick/Makefile   |  6 ++
 testcases/kernel/syscalls/fspick/fspick.h   | 60 ++++++++++++++++++++
 testcases/kernel/syscalls/fspick/fspick01.c | 62 +++++++++++++++++++++
 testcases/kernel/syscalls/fspick/fspick02.c | 54 ++++++++++++++++++
 6 files changed, 187 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fspick/.gitignore
 create mode 100644 testcases/kernel/syscalls/fspick/Makefile
 create mode 100644 testcases/kernel/syscalls/fspick/fspick.h
 create mode 100644 testcases/kernel/syscalls/fspick/fspick01.c
 create mode 100644 testcases/kernel/syscalls/fspick/fspick02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 32b3f36e4dcc..ce27f835c42e 100644
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
diff --git a/testcases/kernel/syscalls/fspick/fspick.h b/testcases/kernel/syscalls/fspick/fspick.h
new file mode 100644
index 000000000000..62864355da06
--- /dev/null
+++ b/testcases/kernel/syscalls/fspick/fspick.h
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef FSPICK_H__
+#define FSPICK_H__
+
+#define MNTPOINT	"mntpoint"
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
+	TEST(fd = fsopen(tst_device->fs_type, 0));
+	if (fd == -1)
+		tst_brk(TBROK | TERRNO, "fsopen() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+	}
+
+	TEST(fsmfd = fsmount(fd, 0, 0));
+	SAFE_CLOSE(fd);
+
+	if (fsmfd == -1)
+		tst_brk(TBROK | TERRNO, "fsmount() failed");
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
+	if (!tst_is_mounted(MNTPOINT))
+		tst_brk(TBROK | TERRNO, "device not mounted");
+}
+
+#endif /* FSPICK_H__ */
diff --git a/testcases/kernel/syscalls/fspick/fspick01.c b/testcases/kernel/syscalls/fspick/fspick01.c
new file mode 100644
index 000000000000..4e1daeaee14a
--- /dev/null
+++ b/testcases/kernel/syscalls/fspick/fspick01.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic fspick() test.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+#include "fspick.h"
+
+#define TCASE_ENTRY(_flags)	{.name = "Flag " #_flags, .flags = _flags}
+
+static struct tcase {
+	char *name;
+	unsigned int flags;
+} tcases[] = {
+	TCASE_ENTRY(FSPICK_CLOEXEC),
+	TCASE_ENTRY(FSPICK_SYMLINK_NOFOLLOW),
+	TCASE_ENTRY(FSPICK_NO_AUTOMOUNT),
+	TCASE_ENTRY(FSPICK_EMPTY_PATH),
+};
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int fspick_fd;
+
+	TEST(fspick_fd = fspick(AT_FDCWD, MNTPOINT, tc->flags));
+	if (fspick_fd == -1) {
+		tst_res(TFAIL | TERRNO, "fspick() failed");
+		return;
+	}
+
+	TEST(fsconfig(fspick_fd, FSCONFIG_SET_STRING, "sync", "false", 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
+		goto out;
+	}
+
+	TEST(fsconfig(fspick_fd, FSCONFIG_SET_FLAG, "ro", NULL, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
+		goto out;
+	}
+
+	tst_res(TPASS, "%s: fspick() passed", tc->name);
+
+out:
+	SAFE_CLOSE(fspick_fd);
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
index 000000000000..dc8f153ccc48
--- /dev/null
+++ b/testcases/kernel/syscalls/fspick/fspick02.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic fspick() failure tests.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+#include "fspick.h"
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
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(fspick(tc->dirfd, tc->pathname, tc->flags));
+	if (TST_RET != -1) {
+		SAFE_CLOSE(TST_RET);
+		tst_res(TFAIL, "%s: fspick() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: fspick() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+		return;
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
