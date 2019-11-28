Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B7510CDFB
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 18:35:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F198E3C220D
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 18:35:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B4CE03C0EAF
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 18:35:49 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 8C8481400B7F
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 18:35:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574962543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CbRmUtJWirT2qui5wovpHwsGGioEnHtdLzpjLUCDKBU=;
 b=JmuCXibPSLF8cjkuQ8Y/UNlKbgqPL7Kl6HfPAcPkdV9MkRLfsInBKGqhS59UNJ7ImX8wJB
 2WYBI9t6Cv5uxj8kEKHZgNBQ64YmUaYvWpqTOeWT7dafIaeRT/XfhSNAmNwRlZAsxnqLMz
 k/uIoUrvSB7jfJLQx1p7ZYj9us5PmeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-uARu1Yx8PgOhewfXXR5TXQ-1; Thu, 28 Nov 2019 12:35:41 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C48A780183C;
 Thu, 28 Nov 2019 17:35:39 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-12-58.pek2.redhat.com
 [10.72.12.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2174A60BE1;
 Thu, 28 Nov 2019 17:35:37 +0000 (UTC)
From: Zorro Lang <zlang@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 29 Nov 2019 01:35:32 +0800
Message-Id: <20191128173532.6468-1-zlang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uARu1Yx8PgOhewfXXR5TXQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/newmount: new test case for new mount API
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
Cc: linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Linux supports new mount syscalls from 5.2, so add new test cases
to cover these new API. This newmount01 case make sure new API -
fsopen(), fsconfig(), fsmount() and move_mount() can mount a
filesystem, then can be unmounted.

Signed-off-by: Zorro Lang <zlang@redhat.com>
---

Hi,

This's the 1st case for LTP to test current new mount API. So I have to add
lots of new things to include/lapi/* and m4/ltp-*(as below), I'm not familiar
with LTP code, so please help to review. There might be lot of things need to
be improved.

I'll try to add more test if this 1st case can be merged. I've tested this
patch on latest upstream xfs-linux for-next branch, due to xfs supports
the new mount API now.

# ./runltp -B xfs -f newmount
...
...
Running tests.......
<<<test_start>>>
tag=newmount01 stime=1574961655
cmdline="newmount01"
contacts=""
analysis=exit
<<<test_output>>>
incrementing stop
tst_device.c:238: INFO: Using test device LTP_DEV='/dev/loop1'
tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with xfs opts='' extra opts=''
newmount01.c:87: PASS: fsopen xfs
newmount01.c:96: PASS: fsconfig set source to /dev/loop1
newmount01.c:105: PASS: fsconfig create superblock
newmount01.c:113: PASS: fsmount
newmount01.c:121: PASS: move_mount attach to mount point
newmount01.c:124: PASS: new mount works

Summary:
passed   6
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=4 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=8
<<<test_end>>>

Thanks,
Zorro

 configure.ac                                  |   4 +
 include/lapi/newmount.h                       | 106 +++++++++++++
 include/lapi/syscalls/aarch64.in              |   4 +
 include/lapi/syscalls/powerpc64.in            |   4 +
 include/lapi/syscalls/s390x.in                |   4 +
 include/lapi/syscalls/x86_64.in               |   4 +
 m4/ltp-fsconfig.m4                            |   7 +
 m4/ltp-fsmount.m4                             |   7 +
 m4/ltp-fsopen.m4                              |   7 +
 m4/ltp-move_mount.m4                          |   7 +
 runtest/syscalls                              |   2 +
 testcases/kernel/syscalls/newmount/.gitignore |   1 +
 testcases/kernel/syscalls/newmount/Makefile   |  29 ++++
 .../kernel/syscalls/newmount/newmount01.c     | 150 ++++++++++++++++++
 14 files changed, 336 insertions(+)
 create mode 100644 include/lapi/newmount.h
 create mode 100644 m4/ltp-fsconfig.m4
 create mode 100644 m4/ltp-fsmount.m4
 create mode 100644 m4/ltp-fsopen.m4
 create mode 100644 m4/ltp-move_mount.m4
 create mode 100644 testcases/kernel/syscalls/newmount/.gitignore
 create mode 100644 testcases/kernel/syscalls/newmount/Makefile
 create mode 100644 testcases/kernel/syscalls/newmount/newmount01.c

diff --git a/configure.ac b/configure.ac
index 50d14967d..f17ab2e96 100644
--- a/configure.ac
+++ b/configure.ac
@@ -217,6 +217,9 @@ LTP_CHECK_CRYPTO
 LTP_CHECK_FANOTIFY
 LTP_CHECK_FIDEDUPE
 LTP_CHECK_FORTIFY_SOURCE
+LTP_CHECK_FSOPEN
+LTP_CHECK_FSCONFIG
+LTP_CHECK_FSMOUNT
 LTP_CHECK_FTS_H
 LTP_CHECK_IF_LINK
 LTP_CHECK_IOVEC
@@ -228,6 +231,7 @@ LTP_CHECK_LINUXRANDOM
 LTP_CHECK_MADVISE
 LTP_CHECK_MKDTEMP
 LTP_CHECK_MMSGHDR
+LTP_CHECK_MOVE_MOUNT
 LTP_CHECK_MREMAP_FIXED
 LTP_CHECK_NOMMU_LINUX
 LTP_CHECK_PERF_EVENT
diff --git a/include/lapi/newmount.h b/include/lapi/newmount.h
new file mode 100644
index 000000000..07d57ff96
--- /dev/null
+++ b/include/lapi/newmount.h
@@ -0,0 +1,106 @@
+/*
+ * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it would be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write the Free Software Foundation,
+ * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ */
+
+#ifndef __NEWMOUNT_H__
+#define __NEWMOUNT_H__
+
+#include <stdint.h>
+#include <unistd.h>
+#include "lapi/syscalls.h"
+
+#if !defined(HAVE_FSOPEN)
+static inline int fsopen(const char *fs_name, unsigned int flags)
+{
+	return tst_syscall(__NR_fsopen, fs_name, flags);
+}
+
+/*
+ * fsopen() flags.
+ */
+#define FSOPEN_CLOEXEC		0x00000001
+#endif
+
+#if !defined(HAVE_FSCONFIG)
+static inline int fsconfig(int fsfd, unsigned int cmd,
+                           const char *key, const void *val, int aux)
+{
+	return tst_syscall(__NR_fsconfig, fsfd, cmd, key, val, aux);
+}
+
+/*
+ * The type of fsconfig() call made.
+ */
+enum fsconfig_command {
+	FSCONFIG_SET_FLAG	= 0,    /* Set parameter, supplying no value */
+	FSCONFIG_SET_STRING	= 1,    /* Set parameter, supplying a string value */
+	FSCONFIG_SET_BINARY	= 2,    /* Set parameter, supplying a binary blob value */
+	FSCONFIG_SET_PATH	= 3,    /* Set parameter, supplying an object by path */
+	FSCONFIG_SET_PATH_EMPTY	= 4,    /* Set parameter, supplying an object by (empty) path */
+	FSCONFIG_SET_FD		= 5,    /* Set parameter, supplying an object by fd */
+	FSCONFIG_CMD_CREATE	= 6,    /* Invoke superblock creation */
+	FSCONFIG_CMD_RECONFIGURE = 7,   /* Invoke superblock reconfiguration */
+};
+#endif
+
+#if !defined(HAVE_FSMOUNT)
+static inline int fsmount(int fsfd, unsigned int flags, unsigned int ms_flags)
+{
+	return tst_syscall(__NR_fsmount, fsfd, flags, ms_flags);
+}
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
+#endif
+
+#if !defined(HAVE_MOVE_MOUNT)
+static inline int move_mount(int from_dfd, const char *from_pathname,
+                             int to_dfd, const char *to_pathname,
+                             unsigned int flags)
+{
+	return tst_syscall(__NR_move_mount, from_dfd, from_pathname, to_dfd,
+	                   to_pathname, flags);
+}
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
+#endif
+
+#endif /* __NEWMOUNT_H__ */
diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index 0e00641bc..5b9e1d9a4 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -270,4 +270,8 @@ pkey_mprotect 288
 pkey_alloc 289
 pkey_free 290
 pidfd_send_signal 424
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
 _sysctl 1078
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index 660165d7a..3aaed64e0 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -359,3 +359,7 @@ pidfd_send_signal 424
 pkey_mprotect 386
 pkey_alloc 384
 pkey_free 385
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index 7d632d1dc..bd427555a 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -341,3 +341,7 @@ pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
 pidfd_send_signal 424
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index b1cbd4f2f..94f0b562e 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -320,3 +320,7 @@ pkey_alloc 330
 pkey_free 331
 statx 332
 pidfd_send_signal 424
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
diff --git a/m4/ltp-fsconfig.m4 b/m4/ltp-fsconfig.m4
new file mode 100644
index 000000000..397027f1b
--- /dev/null
+++ b/m4/ltp-fsconfig.m4
@@ -0,0 +1,7 @@
+dnl SPDX-License-Identifier: GPL-2.0-or-later
+dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
+
+AC_DEFUN([LTP_CHECK_FSCONFIG],[
+AC_CHECK_FUNCS(fsconfig,,)
+AC_CHECK_HEADER(sys/mount.h,,,)
+])
diff --git a/m4/ltp-fsmount.m4 b/m4/ltp-fsmount.m4
new file mode 100644
index 000000000..ee32ef713
--- /dev/null
+++ b/m4/ltp-fsmount.m4
@@ -0,0 +1,7 @@
+dnl SPDX-License-Identifier: GPL-2.0-or-later
+dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
+
+AC_DEFUN([LTP_CHECK_FSMOUNT],[
+AC_CHECK_FUNCS(fsmount,,)
+AC_CHECK_HEADER(sys/mount.h,,,)
+])
diff --git a/m4/ltp-fsopen.m4 b/m4/ltp-fsopen.m4
new file mode 100644
index 000000000..6e23d437d
--- /dev/null
+++ b/m4/ltp-fsopen.m4
@@ -0,0 +1,7 @@
+dnl SPDX-License-Identifier: GPL-2.0-or-later
+dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
+
+AC_DEFUN([LTP_CHECK_FSOPEN],[
+AC_CHECK_FUNCS(fsopen,,)
+AC_CHECK_HEADER(sys/mount.h,,,)
+])
diff --git a/m4/ltp-move_mount.m4 b/m4/ltp-move_mount.m4
new file mode 100644
index 000000000..d6bfd82e9
--- /dev/null
+++ b/m4/ltp-move_mount.m4
@@ -0,0 +1,7 @@
+dnl SPDX-License-Identifier: GPL-2.0-or-later
+dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
+
+AC_DEFUN([LTP_CHECK_MOVE_MOUNT],[
+AC_CHECK_FUNCS(move_mount,,)
+AC_CHECK_HEADER(sys/mount.h,,,)
+])
diff --git a/runtest/syscalls b/runtest/syscalls
index 15dbd9971..d11a87dd9 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -716,6 +716,8 @@ mount04 mount04
 mount05 mount05
 mount06 mount06
 
+newmount01 newmount01
+
 move_pages01 move_pages01
 move_pages02 move_pages02
 move_pages03 move_pages03
diff --git a/testcases/kernel/syscalls/newmount/.gitignore b/testcases/kernel/syscalls/newmount/.gitignore
new file mode 100644
index 000000000..dc78edd5b
--- /dev/null
+++ b/testcases/kernel/syscalls/newmount/.gitignore
@@ -0,0 +1 @@
+/newmount01
diff --git a/testcases/kernel/syscalls/newmount/Makefile b/testcases/kernel/syscalls/newmount/Makefile
new file mode 100644
index 000000000..8b0a60332
--- /dev/null
+++ b/testcases/kernel/syscalls/newmount/Makefile
@@ -0,0 +1,29 @@
+#
+#  Copyright (C) 2017 Red Hat, Inc.  All rights reserved.
+#
+#  This program is free software;  you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation; either version 2 of the License, or
+#  (at your option) any later version.
+#
+#  This program is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY;  without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+#  the GNU General Public License for more details.
+#
+#  You should have received a copy of the GNU General Public License
+#  along with this program;  if not, write to the Free Software
+#  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+#
+# HISTORY:
+#  27/11/2019 zlang@redhat.com  Create newmount01.c
+#
+#############################################################################
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+CFLAGS			+= -D_GNU_SOURCE
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/newmount/newmount01.c b/testcases/kernel/syscalls/newmount/newmount01.c
new file mode 100644
index 000000000..35e355506
--- /dev/null
+++ b/testcases/kernel/syscalls/newmount/newmount01.c
@@ -0,0 +1,150 @@
+/*
+ * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
+ * Author: Zorro Lang <zlang@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it would be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, write the Free Software Foundation, Inc.,
+ * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ *
+ */
+
+/*
+ *  DESCRIPTION
+ *	Use new mount API (fsopen, fsconfig, fsmount, move_mount) to mount
+ *	a filesystem.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <sys/prctl.h>
+#include <sys/wait.h>
+#include <sys/mount.h>
+
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+#include "lapi/newmount.h"
+
+#define LINELENGTH 256
+#define MNTPOINT "newmount_point"
+static int sfd, mfd;
+static int mount_flag = 0;
+
+static int ismount(char *mntpoint)
+{
+	int ret = 0;
+	FILE *file;
+	char line[LINELENGTH];
+
+	file = fopen("/proc/mounts", "r");
+	if (file == NULL)
+		tst_brk(TFAIL | TTERRNO, "Open /proc/mounts failed");
+
+	while (fgets(line, LINELENGTH, file) != NULL) {
+		if (strstr(line, mntpoint) != NULL) {
+			ret = 1;
+			break;
+		}
+	}
+	fclose(file);
+	return ret;
+}
+
+static void setup(void)
+{
+	SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, NULL);
+}
+
+static void cleanup(void)
+{
+	if (mount_flag == 1) {
+		TEST(tst_umount(MNTPOINT));
+		if (TST_RET != 0)
+			tst_brk(TBROK | TTERRNO, "umount failed");
+	}
+}
+
+
+static void test_newmount(void)
+{
+	TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
+	if (TST_RET < 0) {
+		tst_brk(TFAIL | TTERRNO,
+		        "fsopen %s", tst_device->fs_type);
+	} else {
+		sfd = TST_RET;
+		tst_res(TPASS,
+			"fsopen %s", tst_device->fs_type);
+	}
+
+	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET < 0) {
+		tst_brk(TFAIL | TTERRNO,
+		        "fsconfig set source to %s", tst_device->dev);
+	} else {
+		tst_res(TPASS,
+			"fsconfig set source to %s", tst_device->dev);
+	}
+
+	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET < 0) {
+		tst_brk(TFAIL | TTERRNO,
+		        "fsconfig create superblock");
+	} else {
+		tst_res(TPASS,
+			"fsconfig create superblock");
+	}
+
+	TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
+	if (TST_RET < 0) {
+		tst_brk(TFAIL | TTERRNO, "fsmount");
+	} else {
+		mfd = TST_RET;
+		tst_res(TPASS, "fsmount");
+		SAFE_CLOSE(sfd);
+	}
+
+	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
+	if (TST_RET < 0) {
+		tst_brk(TFAIL | TTERRNO, "move_mount attach to mount point");
+	} else {
+		tst_res(TPASS, "move_mount attach to mount point");
+		mount_flag = 1;
+		if (ismount(MNTPOINT))
+			tst_res(TPASS, "new mount works");
+		else
+			tst_res(TFAIL, "new mount fails");
+	}
+	SAFE_CLOSE(mfd);
+}
+
+struct test_cases {
+	void (*tfunc)(void);
+} tcases[] = {
+	{&test_newmount},
+};
+
+static void run(unsigned int i)
+{
+	tcases[i].tfunc();
+}
+
+static struct tst_test test = {
+	.test		= run,
+	.tcnt		= ARRAY_SIZE(tcases),
+	.setup		= setup,
+	.cleanup	= cleanup,
+	.needs_root	= 1,
+	.mntpoint	= MNTPOINT,
+	.needs_device	= 1,
+};
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
