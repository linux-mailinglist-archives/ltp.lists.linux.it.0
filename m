Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82140592AF7
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Aug 2022 10:26:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D52DD3C9613
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Aug 2022 10:26:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3AB463C972D
 for <ltp@lists.linux.it>; Mon, 15 Aug 2022 10:26:38 +0200 (CEST)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 71533680E37
 for <ltp@lists.linux.it>; Mon, 15 Aug 2022 10:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1660551996; i=@fujitsu.com;
 bh=U3h2xBi8CiCTZJZ6se4QW9Mf0RZ3i92h/nYj/jG7ApA=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=C7bHWsklDYggZzEkfiHfvneBVwYzTzlPYbCnFelLOniN6UiAMCvDl3Qs6i2evrVek
 esRldzldO+cALoTwjbwxHAbXLPtPbGSrvdFkemE9cyqjlWQegxV9wk6IIUvMcLFI7g
 zgfg/r2iPmhgS7fPqdsNWSNm4m+dObg38NGatWyiVru8LJjZaa0AKZbB4PHxmoW/8I
 AwsLjg40Au0QGcARkIgL7reVHYRBt+RRhh4EIVlfEGteUy4zUK3iYQtFLFYnP704YW
 soE0V/zaNVmGA/wNtpwxr7cfGv62cTUSZumKwHWYBaP1BIEaMdVI53Iy6Sfs3hDIbG
 +Ak34VH9B8rKA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8MxSdea+Ve
 Swdr1ChavD39itFjxfQejxbMjq5gsfty6weLA4rFpVSebx77f61g9ziw4wh7AHMWamZeUX5HA
 mvFpyjnWgn79igVXjrM0MH5V72Lk4hAS2MIocetiDyuEs5xJYs/nHSxdjJxAzh5GiWkv6kBsN
 gFNiWedC5hBbBEBCYmOhrfsXYwcHMwCyRJNXxxBwsIC6RKvH+9iBbFZBFQlFjf/BrN5BTwkVk
 99CjZSQkBBYsrD92BjOAU8JfoWdbBDrKqQ6H92nQWiXlDi5MwnYDYz0KqDL14wQ/QqSlzq+MY
 IYVdIvD58CSquJnH13CbmCYyCs5C0z0LSvoCRaRWjTVJRZnpGSW5iZo6uoYGBrqGhKZA21rUw
 0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgM/JTi9JAdjGf2/dI7xCjJw
 aQkynvt4s8kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8nxh+JQkJFqWmp1akZeYAoxAmLcHBoy
 TCm/ELqJW3uCAxtzgzHSJ1ilFRSpz3B0ifAEgiozQPrg0W+ZcYZaWEeRkZGBiEeApSi3IzS1D
 lXzGKczAqCfNaMQFN4cnMK4Gb/gpoMRPQYr2730EWlyQipKQamKYyXyy6O/9chVx6D0vlkqBP
 NwNWG/R4MnNvnKvTEXRvxrI5V9kX2XYG/2Cws5DV5Hy5ekLQw/nNOpGv5WT4dRLuWq1ib23XO
 lFyao2VTdn+/QzrDZe+cPadYZP+U7Bqh39J7sGNdxQvmQulLlvW3RDf98P/0v4v9gvPnTl2Ja
 /p2s6P3B7tfTIW71JmLJT427ZqadfNwJTgg/eUIvV+582yS3ij0rfTtsXQViDlRK1Y9uLrN6d
 8ZJDZop7O7Scd+DTD00X+uh+TaM6CqEeSHP1nH691N6j93fRkUUiqpfs2ze6+W65TFhzqXXxv
 elj1c8HK1BS+0ILgrWFpMndLAuI3e5gbL34ZIBjNd6lJiaU4I9FQi7moOBEA7pqGIncDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1660551995!144506!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15937 invoked from network); 15 Aug 2022 08:26:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
 by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 08:26:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
 by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E24FC1000CE;
 Mon, 15 Aug 2022 09:26:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D5070100077;
 Mon, 15 Aug 2022 09:26:34 +0100 (BST)
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 09:26:32 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 15 Aug 2022 17:27:07 +0800
Message-ID: <1660555627-2269-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660555627-2269-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <c266e389-c6f4-502f-523d-6d51fbf3ed58@suse.cz>
 <1660555627-2269-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/2] syscalls/openat: Add new regression test when
 using open(O_TMPFILE) under umask
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
Cc: brauner@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/syscalls                            |   2 +-
 testcases/kernel/syscalls/openat/.gitignore |   1 +
 testcases/kernel/syscalls/openat/openat04.c | 188 ++++++++++++++++++++
 3 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 testcases/kernel/syscalls/openat/openat04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 9d58e0aa1..cd38a4ddf 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -919,10 +919,10 @@ open12 open12
 open13 open13
 open14 open14
 
-#openat test cases
 openat01 openat01
 openat02 openat02
 openat03 openat03
+openat04 openat04
 
 openat201 openat201
 openat202 openat202
diff --git a/testcases/kernel/syscalls/openat/.gitignore b/testcases/kernel/syscalls/openat/.gitignore
index 2928dae22..2d15872ab 100644
--- a/testcases/kernel/syscalls/openat/.gitignore
+++ b/testcases/kernel/syscalls/openat/.gitignore
@@ -2,3 +2,4 @@
 /openat02
 /openat02_child
 /openat03
+/openat04
diff --git a/testcases/kernel/syscalls/openat/openat04.c b/testcases/kernel/syscalls/openat/openat04.c
new file mode 100644
index 000000000..78deaa6f0
--- /dev/null
+++ b/testcases/kernel/syscalls/openat/openat04.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2022 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Check setgid strip logic whether works correctly when creating tmpfile under
+ * filesystem without posix acl supported(by using noacl mount option). Test it
+ * with umask S_IXGRP and also check file mode whether has filtered S_IXGRP.
+ *
+ * Fixed in:
+ *
+ *  commit ac6800e279a22b28f4fc21439843025a0d5bf03e
+ *  Author: Yang Xu <xuyang2018.jy@fujitsu.com>
+ *  Date:   Thu July 14 14:11:26 2022 +0800
+ *
+ *  fs: Add missing umask strip in vfs_tmpfile
+ *
+ * The most code is pasted form creat09.c.
+ */
+
+#define _GNU_SOURCE
+#include <stdlib.h>
+#include <sys/types.h>
+#include <pwd.h>
+#include <sys/mount.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <stdio.h>
+#include "tst_test.h"
+#include "tst_uid.h"
+#include "tst_safe_file_at.h"
+
+#define MODE_RWX        0777
+#define MODE_SGID       (S_ISGID|0777)
+#define MNTPOINT	"mntpoint"
+#define WORKDIR		MNTPOINT "/testdir"
+#define OPEN_FILE	"open.tmp"
+
+static gid_t free_gid;
+static int tmpfile_fd = -1, dir_fd = -1, mount_flag;
+static struct passwd *ltpuser;
+
+static void do_mount(const char *source, const char *target,
+	const char *filesystemtype, unsigned long mountflags,
+	const void *data)
+{
+	TEST(mount(source, target, filesystemtype, mountflags, data));
+
+	if (TST_RET == -1 && TST_ERR == EINVAL)
+		tst_brk(TCONF, "Kernel does not support noacl feature");
+
+	if (TST_RET == -1) {
+		tst_brk(TBROK | TTERRNO, "mount(%s, %s, %s, %lu, %p) failed",
+			source, target, filesystemtype, mountflags, data);
+	} else if (TST_RET) {
+		tst_brk(TBROK, "Invalid return value %ld", TST_RET);
+	}
+
+	mount_flag = 1;
+}
+
+static void open_tmpfile_supported(int dirfd)
+{
+	TEST(openat(dirfd, ".", O_TMPFILE | O_RDWR, S_IXGRP | S_ISGID));
+
+	if (TST_RET == -1) {
+		if (errno == ENOTSUP)
+			tst_brk(TCONF, "fs doesn't support O_TMPFILE");
+		else
+			tst_brk(TBROK | TTERRNO, "open(%d, O_TMPFILE) failed", dirfd);
+	} else if (TST_RET < 0) {
+		tst_brk(TBROK, "Invalid return value %ld", TST_RET);
+	}
+
+	SAFE_CLOSE(TST_RET);
+}
+
+static void setup(void)
+{
+	struct stat buf;
+
+	ltpuser = SAFE_GETPWNAM("nobody");
+
+	do_mount(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "noacl");
+
+	tst_res(TINFO, "User nobody: uid = %d, gid = %d", (int)ltpuser->pw_uid,
+		(int)ltpuser->pw_gid);
+	free_gid = tst_get_free_gid(ltpuser->pw_gid);
+
+	/* Create directories and set permissions */
+	SAFE_MKDIR(WORKDIR, MODE_RWX);
+	dir_fd = SAFE_OPEN(WORKDIR, O_RDONLY, O_DIRECTORY);
+	open_tmpfile_supported(dir_fd);
+
+	SAFE_CHOWN(WORKDIR, ltpuser->pw_uid, free_gid);
+	SAFE_CHMOD(WORKDIR, MODE_SGID);
+	SAFE_STAT(WORKDIR, &buf);
+
+	if (!(buf.st_mode & S_ISGID))
+		tst_brk(TBROK, "%s: Setgid bit not set", WORKDIR);
+
+	if (buf.st_gid != free_gid) {
+		tst_brk(TBROK, "%s: Incorrect group, %u != %u", WORKDIR,
+			buf.st_gid, free_gid);
+	}
+
+	/* Switch user */
+	SAFE_SETGID(ltpuser->pw_gid);
+	SAFE_SETREUID(-1, ltpuser->pw_uid);
+}
+
+static void file_test(int dfd, const char *path, int flags)
+{
+	struct stat buf;
+
+	TST_EXP_PASS_SILENT(fstatat(dfd, path, &buf, flags));
+	if (!TST_PASS) {
+		tst_res(TFAIL, "fstat failed");
+		return;
+	}
+
+	if (buf.st_gid != free_gid) {
+		tst_res(TFAIL, "%s: Incorrect group, %u != %u", path,
+			buf.st_gid, free_gid);
+	} else {
+		tst_res(TPASS, "%s: Owned by correct group", path);
+	}
+
+	if (buf.st_mode & S_ISGID)
+		tst_res(TFAIL, "%s: Setgid bit is set", path);
+	else
+		tst_res(TPASS, "%s: Setgid bit not set", path);
+
+	if (buf.st_mode & S_IXGRP)
+		tst_res(TFAIL, "%s: S_IXGRP bit is set", path);
+	else
+		tst_res(TPASS, "%s: S_IXGRP bit is not set", path);
+}
+
+static void run(void)
+{
+	char path[PATH_MAX];
+
+	umask(S_IXGRP);
+	tmpfile_fd = SAFE_OPENAT(dir_fd, ".", O_TMPFILE | O_RDWR, MODE_SGID);
+	snprintf(path, PATH_MAX, "/proc/self/fd/%d", tmpfile_fd);
+	SAFE_LINKAT(AT_FDCWD, path, dir_fd, OPEN_FILE, AT_SYMLINK_FOLLOW);
+	file_test(dir_fd, OPEN_FILE, 0);
+	SAFE_CLOSE(tmpfile_fd);
+	/* Cleanup between loops */
+	tst_purge_dir(WORKDIR);
+}
+
+static void cleanup(void)
+{
+	SAFE_SETREUID(-1, 0);
+
+	if (tmpfile_fd >= 0)
+		SAFE_CLOSE(tmpfile_fd);
+	if (dir_fd >= 0)
+		SAFE_CLOSE(dir_fd);
+	if (mount_flag && tst_umount(MNTPOINT))
+		tst_res(TWARN | TERRNO, "umount(%s)", MNTPOINT);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.all_filesystems = 1,
+	.format_device = 1,
+	.mntpoint = MNTPOINT,
+	.skip_filesystems = (const char*[]) {
+		"exfat",
+		"ntfs",
+		"vfat",
+		NULL
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "ac6800e279a2"},
+		{}
+	},
+};
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
