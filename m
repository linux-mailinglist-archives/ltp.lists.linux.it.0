Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF65182FC5
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:03:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 498693C5F94
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:03:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9C7693C5EC7
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:48 +0100 (CET)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AB43E201523
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:47 +0100 (CET)
Received: by mail-pf1-x436.google.com with SMTP id b72so3155726pfb.11
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 05:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0mS0Do6Zl6m72vHeWk2PBvZSKxmHBPDsZenxK3zL4Ok=;
 b=nvur//cLz4Z81FkVqSBozYk8gY7+N8bk0Ybqc19tGjfc6uLNlAfT7pZhtXadPfqjx1
 B5TrEFZptSDJ96CnpX0Rh1eV7gO3QE1F4McK1hWfmBpc9ITQDbFuU9m+1lwqQ5kkAizY
 YxaEV0vlGa4Gb3tjcNsfTtETm++QHTe737GTF0SR6Kt0nuSWfbf9z6j3G8oh3fgdIg+9
 wvx+dNHlPIXGQXuAlV9x9t8jK8FKOR9c/Uir5WOQFI6VSD+dqCj/TYD1COvdaxtOcB/f
 zT4CV9pJIVZ9bqAYNNdmxXFRHXrbYNflzxGVF7rXQTJFuqAhoE1m1I9zoNdH4/OdrJcg
 ccQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mS0Do6Zl6m72vHeWk2PBvZSKxmHBPDsZenxK3zL4Ok=;
 b=LoKuxofJVp4/0PR3TF1Ikdvb/LHZgjoEpiO8b3dF4e/9MVoWKRfBkb2QgJAEP0/uYv
 /mTPTgmrWNiD8OKwOmshZ+iUlqmwgRpoUFVM10/P0rhj4SanK58nkozwWqkVJ6TbQFBr
 elw6f+TOTgBlEzC2L6MQZ3XF4+s4wyXdyeP3P0onaiaCKyI3F35EQ6bi1dA37nv5EOUR
 V4jqMPxro/4ASqWcwxrGiMv8SNrCiQ87UT1MgFXlRdrYmXNFfX1jsHkazs9vC2dJZXrm
 y9c5+QcUqoUm0T1I3cOzRNdVhAfJ3yeCcknqCoWe7nLogJ0pS/YiDIzXK4UK20K0gHNb
 90Xg==
X-Gm-Message-State: ANhLgQ2x6csVaqywATJ4oyHZeTwaiy5Ne/4SovgwIfqVgmQflTe/4cMp
 GBwg0ewhahVnTxQteZ5PXBiFp4QJ998=
X-Google-Smtp-Source: ADFU+vtqFTqWRq3M4XuFuO7g7wa8SHvNY08zj0yVsS4WErv9fjBOwJsAmdDgZpqhsPJfvr3bYqGz0w==
X-Received: by 2002:a63:4b07:: with SMTP id y7mr7377097pga.272.1584014505323; 
 Thu, 12 Mar 2020 05:01:45 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id u13sm8626702pjn.29.2020.03.12.05.01.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 05:01:44 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 17:31:09 +0530
Message-Id: <105dcaba496248a8e2b4a93bd61d90d3ee88f6af.1584014172.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1584014172.git.viresh.kumar@linaro.org>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V6 09/10] syscalls/fspick: New tests
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
index 077e724b62e4..32f11f4bc9ab 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -351,6 +351,9 @@ fsmount02 fsmount02
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
index 000000000000..ca84269ee7a9
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
+	if (!tst_is_mounted_at_tmpdir(MNTPOINT))
+		tst_brk(TBROK | TERRNO, "device not mounted");
+
+	ismounted = 1;
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
