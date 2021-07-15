Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 637F53C9811
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 07:08:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DBF33C65E8
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 07:08:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 100033C4DF6
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 07:08:23 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2FDFE6019AD
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 07:08:22 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 6875C9F920;
 Thu, 15 Jul 2021 05:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1626325700; bh=e6VbiOWAInWYKV6VMZU/1iqq3CePlHWEEGZx8ay2zb0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Sz/A3UfdFaA4vFjXXgIgejDm9kqn9uwP741Bh0wBi38v2bmvdEdG7tQIRQqVIyc3N
 /xuOq6TwTiOiWNNKHPirwwsM4ZbI//tv2M2jE1YqzIWiJRX47nDaEwSDE6vIjsov4B
 JqNJUtc9yY3CRHQACS8Ow1ASVzztPyquSZhvC2rQ=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	chrubis@suse.cz,
	rpalethorpe@suse.de
Date: Thu, 15 Jul 2021 07:08:12 +0200
Message-Id: <20210715050812.1950884-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3] squashfs: Add regression test for sanity check bug
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

Adds a regression test for the fixes
c1b2028315 ("squashfs: fix inode lookup sanity checks")
and
8b44ca2b62 ("squashfs: fix xattr id and id lookup sanity checks")

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---

Changes to v2:
 - Rename to squashfs01
 - Add mksquashfs to needs_cmds
 - Use needs_device and mount syscall instead of mount tool
 - Moved test file creation to setup
 - Use tst_cmd instead of tst_system
 - Use flag to call umount conditionally in cleanup

Changes to v1:
 - Implement whole test in c
 - Fixed whitespaces...

 runtest/fs                                |   2 +
 testcases/kernel/fs/squashfs/.gitignore   |   1 +
 testcases/kernel/fs/squashfs/Makefile     |   9 ++
 testcases/kernel/fs/squashfs/squashfs01.c | 121 ++++++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 testcases/kernel/fs/squashfs/.gitignore
 create mode 100644 testcases/kernel/fs/squashfs/Makefile
 create mode 100644 testcases/kernel/fs/squashfs/squashfs01.c

diff --git a/runtest/fs b/runtest/fs
index 17b1415eb..1d753e0dd 100644
--- a/runtest/fs
+++ b/runtest/fs
@@ -85,3 +85,5 @@ fs_fill fs_fill
 
 binfmt_misc01 binfmt_misc01.sh
 binfmt_misc02 binfmt_misc02.sh
+
+squashfs01 squashfs01
diff --git a/testcases/kernel/fs/squashfs/.gitignore b/testcases/kernel/fs/squashfs/.gitignore
new file mode 100644
index 000000000..d28920fe8
--- /dev/null
+++ b/testcases/kernel/fs/squashfs/.gitignore
@@ -0,0 +1 @@
+squashfs01
diff --git a/testcases/kernel/fs/squashfs/Makefile b/testcases/kernel/fs/squashfs/Makefile
new file mode 100644
index 000000000..67021139c
--- /dev/null
+++ b/testcases/kernel/fs/squashfs/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2009, Cisco Systems Inc.
+# Ngie Cooper, July 2009
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/fs/squashfs/squashfs01.c b/testcases/kernel/fs/squashfs/squashfs01.c
new file mode 100644
index 000000000..f02c91f83
--- /dev/null
+++ b/testcases/kernel/fs/squashfs/squashfs01.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+ */
+
+/*\
+ * [Description]
+ *
+ * Kernel commits
+ *
+ * - f37aa4c7366 (squashfs: add more sanity checks in id lookup)
+ * - eabac19e40c (squashfs: add more sanity checks in inode lookup)
+ * - 506220d2ba2 (squashfs: add more sanity checks in xattr id lookup)
+ *
+ * added some sanity checks, that verify the size of
+ * inode lookup, id (uid/gid) and xattr blocks in the squashfs,
+ * but broke mounting filesystems with completely filled blocks.
+ * A block has a max size of 8192.
+ * An inode lookup entry has an uncompressed size of 8 bytes,
+ * an id block 4 bytes and an xattr block 16 bytes.
+ *
+ *
+ * To fill up at least one block for each of the three tables,
+ * 2048 files with unique uid/gid and xattr are created.
+ *
+ *
+ * The bugs are fixed in kernel commits
+ *
+ * - c1b2028315c (squashfs: fix inode lookup sanity checks)
+ * - 8b44ca2b634 (squashfs: fix xattr id and id lookup sanity checks)
+ */
+
+#include <stdio.h>
+#include <sys/mount.h>
+
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+
+static const char *MOUNT_DIR = "mnt";
+static const char *DATA_DIR = "data";
+
+static int mounted;
+
+static void cleanup(void)
+{
+	if (mounted)
+		SAFE_UMOUNT("mnt");
+}
+
+static void setup(void)
+{
+	int i;
+
+	SAFE_MKDIR(DATA_DIR, 0777);
+
+	for (i = 0; i < 2048; ++i) {
+		int fd;
+		char name[20];
+
+		sprintf(name, "%s/%d", DATA_DIR, i);
+		fd = SAFE_OPEN(name, O_CREAT | O_EXCL, 0666);
+		SAFE_FCHOWN(fd, i, i);
+
+		/* This must be either "security", "user" or "trusted" namespace,
+		 * because squashfs cannot store other namespaces.
+		 * Since the files are most likely created on a tmpfs,
+		 * "user" namespace is not possible, because it is not allowed.
+		 */
+		SAFE_FSETXATTR(fd, "security.x", &i, sizeof(i), 0);
+		close(fd);
+	}
+
+	/* Create squashfs without any compression.
+	 * This allows reasoning about block sizes.
+	 * Redirect stdout, to get rid of undefined uid messages
+	 */
+	const char *argv[] = {
+		"mksquashfs", DATA_DIR, tst_device->dev,
+		"-noappend", "-noI", "-noD", "-noX", "-noF", NULL
+	};
+	tst_cmd(argv, "/dev/null", NULL, 0);
+
+	SAFE_MKDIR(MOUNT_DIR, 0777);
+}
+
+static void run(void)
+{
+	tst_res(TINFO, "Test squashfs sanity check regressions");
+
+	if (mount(tst_device->dev, MOUNT_DIR, "squashfs", 0, NULL) != 0)
+		tst_brk(TFAIL | TERRNO, "Mount failed");
+	mounted = 1;
+
+	SAFE_UMOUNT("mnt");
+	mounted = 0;
+
+	tst_res(TPASS, "Test passed");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.cleanup = cleanup,
+	.setup = setup,
+	.needs_root = 1,
+	.needs_device = 1,
+	.dev_min_size = 1,
+	.needs_cmds = (const char *const []) {
+		"mksquashfs",
+		NULL
+	},
+	.needs_drivers = (const char *const []) {
+		"squashfs",
+		NULL
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "c1b2028315c"},
+		{"linux-git", "8b44ca2b634"},
+		{}
+	},
+	.needs_tmpdir = 1,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
