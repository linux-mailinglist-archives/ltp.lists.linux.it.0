Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36732160DBD
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:47:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A8353C25C6
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:47:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0753C3C25BA
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:47:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3E019600BA9
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:47:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AFFB6B317;
 Mon, 17 Feb 2020 08:47:01 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 17 Feb 2020 09:46:21 +0100
Message-Id: <20200217084622.11199-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217084622.11199-1-pvorel@suse.cz>
References: <20200217084622.11199-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v7 3/4] lapi/fsmount: Add definitions for fsmount
 related syscalls
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Viresh Kumar <viresh.kumar@linaro.org>

This adds definitions for all fsmount related syscalls which will be
used by multiple syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Li Wang <liwang@redhat.com>
[ pvorel: add autotools checks + sort kcmp ]
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 configure.ac           |   8 ++-
 include/lapi/fsmount.h | 134 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 include/lapi/fsmount.h

diff --git a/configure.ac b/configure.ac
index df4e8c832..df407ce35 100644
--- a/configure.ac
+++ b/configure.ac
@@ -80,15 +80,21 @@ AC_CHECK_FUNCS([ \
     execveat \
     fallocate \
     fchownat \
+    fsconfig \
+    fsmount \
+    fsopen \
+    fspick \
     fstatat \
     getdents \
     getdents64 \
-    kcmp \
     io_pgetevents \
+    kcmp \
     mkdirat \
     mknodat \
     modify_ldt \
+    move_mount \
     name_to_handle_at \
+    open_tree \
     openat \
     pidfd_open \
     pidfd_send_signal \
diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
new file mode 100644
index 000000000..87f2f229c
--- /dev/null
+++ b/include/lapi/fsmount.h
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef FSMOUNT_H__
+#define FSMOUNT_H__
+
+#include <fcntl.h>
+#include <sys/mount.h>
+#include <sys/syscall.h>
+#include <sys/types.h>
+
+#include "config.h"
+#include "lapi/syscalls.h"
+
+#ifndef HAVE_FSOPEN
+int fsopen(const char *fsname, unsigned int flags)
+{
+	return tst_syscall(__NR_fsopen, fsname, flags);
+}
+#endif /* HAVE_FSOPEN */
+
+#ifndef HAVE_FSCONFIG
+int fsconfig(int fd, unsigned int cmd, const char *key,
+	     const void *value, int aux)
+{
+	return tst_syscall(__NR_fsconfig, fd, cmd, key, value, aux);
+}
+#endif /* HAVE_FSCONFIG */
+
+#ifndef HAVE_FSMOUNT
+int fsmount(int fd, unsigned int flags, unsigned int mount_attrs)
+{
+	return tst_syscall(__NR_fsmount, fd, flags, mount_attrs);
+}
+#endif /* HAVE_FSMOUNT */
+
+#ifndef HAVE_FSPICK
+int fspick(int dirfd, const char *pathname, unsigned int flags)
+{
+	return tst_syscall(__NR_fspick, dirfd, pathname, flags);
+}
+#endif /* HAVE_FSPICK */
+
+#ifndef HAVE_MOVE_MOUNT
+int move_mount(int from_dirfd, const char *from_pathname, int to_dirfd,
+	       const char *to_pathname, unsigned int flags)
+{
+	return tst_syscall(__NR_move_mount, from_dirfd, from_pathname, to_dirfd,
+			   to_pathname, flags);
+}
+#endif /* HAVE_MOVE_MOUNT */
+
+#ifndef HAVE_OPEN_TREE
+int open_tree(int dirfd, const char *pathname, unsigned int flags)
+{
+	return tst_syscall(__NR_open_tree, dirfd, pathname, flags);
+}
+#endif /* HAVE_OPEN_TREE */
+
+/*
+ * New headers added in kernel after 5.2 release, create them for old userspace.
+*/
+
+#ifndef OPEN_TREE_CLONE
+
+/*
+ * open_tree() flags.
+ */
+#define OPEN_TREE_CLONE		1		/* Clone the target tree and attach the clone */
+#define OPEN_TREE_CLOEXEC	O_CLOEXEC	/* Close the file on execve() */
+
+/*
+ * move_mount() flags.
+ */
+#define MOVE_MOUNT_F_SYMLINKS		0x00000001 /* Follow symlinks on from path */
+#define MOVE_MOUNT_F_AUTOMOUNTS		0x00000002 /* Follow automounts on from path */
+#define MOVE_MOUNT_F_EMPTY_PATH		0x00000004 /* Empty from path permitted */
+#define MOVE_MOUNT_T_SYMLINKS		0x00000010 /* Follow symlinks on to path */
+#define MOVE_MOUNT_T_AUTOMOUNTS		0x00000020 /* Follow automounts on to path */
+#define MOVE_MOUNT_T_EMPTY_PATH		0x00000040 /* Empty to path permitted */
+#define MOVE_MOUNT__MASK		0x00000077
+
+/*
+ * fsopen() flags.
+ */
+#define FSOPEN_CLOEXEC		0x00000001
+
+/*
+ * fspick() flags.
+ */
+#define FSPICK_CLOEXEC		0x00000001
+#define FSPICK_SYMLINK_NOFOLLOW	0x00000002
+#define FSPICK_NO_AUTOMOUNT	0x00000004
+#define FSPICK_EMPTY_PATH	0x00000008
+
+/*
+ * The type of fsconfig() call made.
+ */
+enum fsconfig_command {
+	FSCONFIG_SET_FLAG	= 0,	/* Set parameter, supplying no value */
+	FSCONFIG_SET_STRING	= 1,	/* Set parameter, supplying a string value */
+	FSCONFIG_SET_BINARY	= 2,	/* Set parameter, supplying a binary blob value */
+	FSCONFIG_SET_PATH	= 3,	/* Set parameter, supplying an object by path */
+	FSCONFIG_SET_PATH_EMPTY	= 4,	/* Set parameter, supplying an object by (empty) path */
+	FSCONFIG_SET_FD		= 5,	/* Set parameter, supplying an object by fd */
+	FSCONFIG_CMD_CREATE	= 6,	/* Invoke superblock creation */
+	FSCONFIG_CMD_RECONFIGURE = 7,	/* Invoke superblock reconfiguration */
+};
+
+/*
+ * fsmount() flags.
+ */
+#define FSMOUNT_CLOEXEC		0x00000001
+
+/*
+ * Mount attributes.
+ */
+#define MOUNT_ATTR_RDONLY	0x00000001 /* Mount read-only */
+#define MOUNT_ATTR_NOSUID	0x00000002 /* Ignore suid and sgid bits */
+#define MOUNT_ATTR_NODEV	0x00000004 /* Disallow access to device special files */
+#define MOUNT_ATTR_NOEXEC	0x00000008 /* Disallow program execution */
+#define MOUNT_ATTR__ATIME	0x00000070 /* Setting on how atime should be updated */
+#define MOUNT_ATTR_RELATIME	0x00000000 /* - Update atime relative to mtime/ctime. */
+#define MOUNT_ATTR_NOATIME	0x00000010 /* - Do not update access times. */
+#define MOUNT_ATTR_STRICTATIME	0x00000020 /* - Always perform atime updates */
+#define MOUNT_ATTR_NODIRATIME	0x00000080 /* Do not update directory access times */
+
+#endif /* OPEN_TREE_CLONE */
+
+
+#endif /* FSMOUNT_H__ */
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
