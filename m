Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A70710D0AF
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 04:39:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56D553C2270
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 04:39:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 52D843C1C93
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 04:39:48 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id AB898602295
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 04:39:39 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,255,1571673600"; d="scan'208,217";a="79249673"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Nov 2019 11:39:36 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6F1DE4CE14FC;
 Fri, 29 Nov 2019 11:31:11 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 29 Nov 2019 11:39:36 +0800
To: Zorro Lang <zlang@redhat.com>, <ltp@lists.linux.it>
References: <20191128173532.6468-1-zlang@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <9c487d75-0de0-af8f-a439-d3ce9d965808@cn.fujitsu.com>
Date: Fri, 29 Nov 2019 11:39:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191128173532.6468-1-zlang@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6F1DE4CE14FC.A3D3B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/newmount: new test case for new mount API
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
Content-Type: multipart/mixed; boundary="===============0350995614=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0350995614==
Content-Type: multipart/alternative;
	boundary="------------F288692E702F5050D9F7D8A1"

--------------F288692E702F5050D9F7D8A1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


on 2019/11/29 1:35, Zorro Lang wrote:

> Linux supports new mount syscalls from 5.2, so add new test cases
> to cover these new API. This newmount01 case make sure new API -
> fsopen(), fsconfig(), fsmount() and move_mount() can mount a
> filesystem, then can be unmounted.

Hi Zorro

  This patch looks good to me. Only a few comments as below:

>
> Signed-off-by: Zorro Lang <zlang@redhat.com>
> ---
>
> Hi,
>
> This's the 1st case for LTP to test current new mount API. So I have to add
> lots of new things to include/lapi/* and m4/ltp-*(as below), I'm not familiar
> with LTP code, so please help to review. There might be lot of things need to
> be improved.
>
> I'll try to add more test if this 1st case can be merged. I've tested this
> patch on latest upstream xfs-linux for-next branch, due to xfs supports
> the new mount API now.
>
>
> diff --git a/configure.ac b/configure.ac
> index 50d14967d..f17ab2e96 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -217,6 +217,9 @@ LTP_CHECK_CRYPTO
>   LTP_CHECK_FANOTIFY
>   LTP_CHECK_FIDEDUPE
>   LTP_CHECK_FORTIFY_SOURCE
> +LTP_CHECK_FSOPEN
> +LTP_CHECK_FSCONFIG
> +LTP_CHECK_FSMOUNT

sort alphabetically.
+LTP_CHECK_FSCONFIG
+LTP_CHECK_FSMOUNT
+LTP_CHECK_FSOPEN
  

>   LTP_CHECK_FTS_H
>   LTP_CHECK_IF_LINK
>   LTP_CHECK_IOVEC
> @@ -228,6 +231,7 @@ LTP_CHECK_LINUXRANDOM
>   LTP_CHECK_MADVISE
>   LTP_CHECK_MKDTEMP
>   LTP_CHECK_MMSGHDR
> +LTP_CHECK_MOVE_MOUNT
>   LTP_CHECK_MREMAP_FIXED
>   LTP_CHECK_NOMMU_LINUX
>   LTP_CHECK_PERF_EVENT
> diff --git a/include/lapi/newmount.h b/include/lapi/newmount.h
> new file mode 100644
> index 000000000..07d57ff96
> --- /dev/null
> +++ b/include/lapi/newmount.h
> @@ -0,0 +1,106 @@
> +/*
> + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it would be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write the Free Software Foundation,
> + * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> + */
> +
> +#ifndef __NEWMOUNT_H__
> +#define __NEWMOUNT_H__
> +
> +#include <stdint.h>
> +#include <unistd.h>
> +#include "lapi/syscalls.h"
> +
> +#if !defined(HAVE_FSOPEN)
> +static inline int fsopen(const char *fs_name, unsigned int flags)
> +{
> +	return tst_syscall(__NR_fsopen, fs_name, flags);
> +}
> +
> +/*
> + * fsopen() flags.
> + */
> +#define FSOPEN_CLOEXEC		0x00000001
> +#endif
> +
> +#if !defined(HAVE_FSCONFIG)
> +static inline int fsconfig(int fsfd, unsigned int cmd,
> +                           const char *key, const void *val, int aux)
> +{
> +	return tst_syscall(__NR_fsconfig, fsfd, cmd, key, val, aux);
> +}
> +
> +/*
> + * The type of fsconfig() call made.
> + */
> +enum fsconfig_command {
> +	FSCONFIG_SET_FLAG	= 0,    /* Set parameter, supplying no value */
> +	FSCONFIG_SET_STRING	= 1,    /* Set parameter, supplying a string value */
> +	FSCONFIG_SET_BINARY	= 2,    /* Set parameter, supplying a binary blob value */
> +	FSCONFIG_SET_PATH	= 3,    /* Set parameter, supplying an object by path */
> +	FSCONFIG_SET_PATH_EMPTY	= 4,    /* Set parameter, supplying an object by (empty) path */
> +	FSCONFIG_SET_FD		= 5,    /* Set parameter, supplying an object by fd */
> +	FSCONFIG_CMD_CREATE	= 6,    /* Invoke superblock creation */
> +	FSCONFIG_CMD_RECONFIGURE = 7,   /* Invoke superblock reconfiguration */
> +};
> +#endif
> +
> +#if !defined(HAVE_FSMOUNT)
> +static inline int fsmount(int fsfd, unsigned int flags, unsigned int ms_flags)
> +{
> +	return tst_syscall(__NR_fsmount, fsfd, flags, ms_flags);
> +}
> +
> +/*
> + * fsmount() flags.
> + */
> +#define FSMOUNT_CLOEXEC		0x00000001
> +
> +/*
> + * Mount attributes.
> + */
> +#define MOUNT_ATTR_RDONLY	0x00000001 /* Mount read-only */
> +#define MOUNT_ATTR_NOSUID	0x00000002 /* Ignore suid and sgid bits */
> +#define MOUNT_ATTR_NODEV	0x00000004 /* Disallow access to device special files */
> +#define MOUNT_ATTR_NOEXEC	0x00000008 /* Disallow program execution */
> +#define MOUNT_ATTR__ATIME	0x00000070 /* Setting on how atime should be updated */
> +#define MOUNT_ATTR_RELATIME	0x00000000 /* - Update atime relative to mtime/ctime. */
> +#define MOUNT_ATTR_NOATIME	0x00000010 /* - Do not update access times. */
> +#define MOUNT_ATTR_STRICTATIME	0x00000020 /* - Always perform atime updates */
> +#define MOUNT_ATTR_NODIRATIME	0x00000080 /* Do not update directory access times */
> +#endif
> +
> +#if !defined(HAVE_MOVE_MOUNT)
> +static inline int move_mount(int from_dfd, const char *from_pathname,
> +                             int to_dfd, const char *to_pathname,
> +                             unsigned int flags)
> +{
> +	return tst_syscall(__NR_move_mount, from_dfd, from_pathname, to_dfd,
> +	                   to_pathname, flags);
> +}
> +
> +/*
> + * move_mount() flags.
> + */
> +#define MOVE_MOUNT_F_SYMLINKS		0x00000001 /* Follow symlinks on from path */
> +#define MOVE_MOUNT_F_AUTOMOUNTS		0x00000002 /* Follow automounts on from path */
> +#define MOVE_MOUNT_F_EMPTY_PATH		0x00000004 /* Empty from path permitted */
> +#define MOVE_MOUNT_T_SYMLINKS		0x00000010 /* Follow symlinks on to path */
> +#define MOVE_MOUNT_T_AUTOMOUNTS		0x00000020 /* Follow automounts on to path */
> +#define MOVE_MOUNT_T_EMPTY_PATH		0x00000040 /* Empty to path permitted */
> +#define MOVE_MOUNT__MASK		0x00000077
> +#endif
> +
> +#endif /* __NEWMOUNT_H__ */
> diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
> index 0e00641bc..5b9e1d9a4 100644
> --- a/include/lapi/syscalls/aarch64.in
> +++ b/include/lapi/syscalls/aarch64.in
> @@ -270,4 +270,8 @@ pkey_mprotect 288
>   pkey_alloc 289
>   pkey_free 290
>   pidfd_send_signal 424
> +move_mount 429
> +fsopen 430
> +fsconfig 431
> +fsmount 432
>   _sysctl 1078
> diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
> index 660165d7a..3aaed64e0 100644
> --- a/include/lapi/syscalls/powerpc64.in
> +++ b/include/lapi/syscalls/powerpc64.in
> @@ -359,3 +359,7 @@ pidfd_send_signal 424
>   pkey_mprotect 386
>   pkey_alloc 384
>   pkey_free 385
> +move_mount 429
> +fsopen 430
> +fsconfig 431
> +fsmount 432
> diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
> index 7d632d1dc..bd427555a 100644
> --- a/include/lapi/syscalls/s390x.in
> +++ b/include/lapi/syscalls/s390x.in
> @@ -341,3 +341,7 @@ pkey_mprotect 384
>   pkey_alloc 385
>   pkey_free 386
>   pidfd_send_signal 424
> +move_mount 429
> +fsopen 430
> +fsconfig 431
> +fsmount 432
> diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
> index b1cbd4f2f..94f0b562e 100644
> --- a/include/lapi/syscalls/x86_64.in
> +++ b/include/lapi/syscalls/x86_64.in
> @@ -320,3 +320,7 @@ pkey_alloc 330
>   pkey_free 331
>   statx 332
>   pidfd_send_signal 424
> +move_mount 429
> +fsopen 430
> +fsconfig 431
> +fsmount 432
> diff --git a/m4/ltp-fsconfig.m4 b/m4/ltp-fsconfig.m4
> new file mode 100644
> index 000000000..397027f1b
> --- /dev/null
> +++ b/m4/ltp-fsconfig.m4
> @@ -0,0 +1,7 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> +
> +AC_DEFUN([LTP_CHECK_FSCONFIG],[
> +AC_CHECK_FUNCS(fsconfig,,)
> +AC_CHECK_HEADER(sys/mount.h,,,)
> +])
> diff --git a/m4/ltp-fsmount.m4 b/m4/ltp-fsmount.m4
> new file mode 100644
> index 000000000..ee32ef713
> --- /dev/null
> +++ b/m4/ltp-fsmount.m4
> @@ -0,0 +1,7 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> +
> +AC_DEFUN([LTP_CHECK_FSMOUNT],[
> +AC_CHECK_FUNCS(fsmount,,)
> +AC_CHECK_HEADER(sys/mount.h,,,)
> +])
> diff --git a/m4/ltp-fsopen.m4 b/m4/ltp-fsopen.m4
> new file mode 100644
> index 000000000..6e23d437d
> --- /dev/null
> +++ b/m4/ltp-fsopen.m4
> @@ -0,0 +1,7 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> +
> +AC_DEFUN([LTP_CHECK_FSOPEN],[
> +AC_CHECK_FUNCS(fsopen,,)
> +AC_CHECK_HEADER(sys/mount.h,,,)
> +])
> diff --git a/m4/ltp-move_mount.m4 b/m4/ltp-move_mount.m4
> new file mode 100644
> index 000000000..d6bfd82e9
> --- /dev/null
> +++ b/m4/ltp-move_mount.m4
> @@ -0,0 +1,7 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> +
> +AC_DEFUN([LTP_CHECK_MOVE_MOUNT],[
> +AC_CHECK_FUNCS(move_mount,,)
> +AC_CHECK_HEADER(sys/mount.h,,,)
> +])

IMHO, we don't need to add these m4 files. I think you can move fsopen,fsconfig,fsmount,move_mount , sys/mount.h into
configure.ac. We usually do it since commit 8fd49cebd5("configure.ac: Simplify the check for libc function implementations")

Or, you will add more info on the comming patches to test new mount api.
  

> diff --git a/runtest/syscalls b/runtest/syscalls
> index 15dbd9971..d11a87dd9 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -716,6 +716,8 @@ mount04 mount04
>   mount05 mount05
>   mount06 mount06
>   
> +newmount01 newmount01

In runtest/syscalls file, we should sort alphabetically. We should put it before newuname01.

> +
>   move_pages01 move_pages01
>   move_pages02 move_pages02
>   move_pages03 move_pages03
> diff --git a/testcases/kernel/syscalls/newmount/.gitignore b/testcases/kernel/syscalls/newmount/.gitignore
> new file mode 100644
> index 000000000..dc78edd5b
> --- /dev/null
> +++ b/testcases/kernel/syscalls/newmount/.gitignore
> @@ -0,0 +1 @@
> +/newmount01
> diff --git a/testcases/kernel/syscalls/newmount/Makefile b/testcases/kernel/syscalls/newmount/Makefile
> new file mode 100644
> index 000000000..8b0a60332
> --- /dev/null
> +++ b/testcases/kernel/syscalls/newmount/Makefile
> @@ -0,0 +1,29 @@
> +#
> +#  Copyright (C) 2017 Red Hat, Inc.  All rights reserved.
> +#
> +#  This program is free software;  you can redistribute it and/or modify
> +#  it under the terms of the GNU General Public License as published by
> +#  the Free Software Foundation; either version 2 of the License, or
> +#  (at your option) any later version.
> +#
> +#  This program is distributed in the hope that it will be useful,
> +#  but WITHOUT ANY WARRANTY;  without even the implied warranty of
> +#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> +#  the GNU General Public License for more details.
> +#
> +#  You should have received a copy of the GNU General Public License
> +#  along with this program;  if not, write to the Free Software
> +#  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> +#
> +# HISTORY:
> +#  27/11/2019 zlang@redhat.com  Create newmount01.c
> +#
> +#############################################################################
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +CFLAGS			+= -D_GNU_SOURCE
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/newmount/newmount01.c b/testcases/kernel/syscalls/newmount/newmount01.c
> new file mode 100644
> index 000000000..35e355506
> --- /dev/null
> +++ b/testcases/kernel/syscalls/newmount/newmount01.c
> @@ -0,0 +1,150 @@
> +/*
> + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> + * Author: Zorro Lang <zlang@redhat.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of version 2 of the GNU General Public License as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it would be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, write the Free Software Foundation, Inc.,
> + * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + *
> + */
> +
> +/*
> + *  DESCRIPTION
> + *	Use new mount API (fsopen, fsconfig, fsmount, move_mount) to mount
> + *	a filesystem.
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <sys/prctl.h>

I don't see you use prctl and fcntl . Remove it.

> +#include <sys/wait.h>

It also can be removed.

> +#include <sys/mount.h>
> +
> +#include "tst_test.h"
> +#include "tst_safe_macros.h"

"tst_test.h" has include this header filer. Remove it.

> +#include "lapi/newmount.h"
> +
> +#define LINELENGTH 256
> +#define MNTPOINT "newmount_point"
> +static int sfd, mfd;
> +static int mount_flag = 0;
> +
> +static int ismount(char *mntpoint)
> +{
> +	int ret = 0;
> +	FILE *file;
> +	char line[LINELENGTH];
> +
> +	file = fopen("/proc/mounts", "r");
> +	if (file == NULL)
> +		tst_brk(TFAIL | TTERRNO, "Open /proc/mounts failed");
> +
> +	while (fgets(line, LINELENGTH, file) != NULL) {
> +		if (strstr(line, mntpoint) != NULL) {
> +			ret = 1;
> +			break;
> +		}
> +	}
> +	fclose(file);
> +	return ret;
> +}

I think grep command is a simple way by using tst_run_cmd.

> +
> +static void setup(void)
> +{
> +	SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, NULL);
> +}
> +
> +static void cleanup(void)
> +{
> +	if (mount_flag == 1) {
> +		TEST(tst_umount(MNTPOINT));
> +		if (TST_RET != 0)
> +			tst_brk(TBROK | TTERRNO, "umount failed");
> +	}
> +}
> +
> +
> +static void test_newmount(void)
> +{
> +	TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
> +	if (TST_RET < 0) {
> +		tst_brk(TFAIL | TTERRNO,
> +		        "fsopen %s", tst_device->fs_type);
> +	} else {
> +		sfd = TST_RET;
> +		tst_res(TPASS,
> +			"fsopen %s", tst_device->fs_type);
> +	}
> +
> +	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
> +	if (TST_RET < 0) {
> +		tst_brk(TFAIL | TTERRNO,
> +		        "fsconfig set source to %s", tst_device->dev);
> +	} else {
> +		tst_res(TPASS,
> +			"fsconfig set source to %s", tst_device->dev);
> +	}
> +
> +	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
> +	if (TST_RET < 0) {
> +		tst_brk(TFAIL | TTERRNO,
> +		        "fsconfig create superblock");
> +	} else {
> +		tst_res(TPASS,
> +			"fsconfig create superblock");
> +	}
> +
> +	TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
> +	if (TST_RET < 0) {
> +		tst_brk(TFAIL | TTERRNO, "fsmount");
> +	} else {
> +		mfd = TST_RET;
> +		tst_res(TPASS, "fsmount");
> +		SAFE_CLOSE(sfd);
> +	}
> +
> +	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
> +	if (TST_RET < 0) {
> +		tst_brk(TFAIL | TTERRNO, "move_mount attach to mount point");
> +	} else {
> +		tst_res(TPASS, "move_mount attach to mount point");
> +		mount_flag = 1;
> +		if (ismount(MNTPOINT))
> +			tst_res(TPASS, "new mount works");
> +		else
> +			tst_res(TFAIL, "new mount fails");
> +	}
> +	SAFE_CLOSE(mfd);

Here,  I think you should umount. Otherwise, I will get an error when I run in a loop
fail as below:

[root@localhost newmount]# ./newmount01 -i 2
tst_device.c:87: INFO: Found free device 2 '/dev/loop2'
tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
tst_mkfs.c:90: INFO: Formatting /dev/loop2 with ext2 opts='' extra opts=''
mke2fs 1.44.6 (5-Mar-2019)
newmount01.c:87: PASS: fsopen ext2
newmount01.c:96: PASS: fsconfig set source to /dev/loop2
newmount01.c:105: PASS: fsconfig create superblock
newmount01.c:113: PASS: fsmount
newmount01.c:121: PASS: move_mount attach to mount point
newmount01.c:124: PASS: new mount works
newmount01.c:87: PASS: fsopen ext2
newmount01.c:96: PASS: fsconfig set source to /dev/loop2
newmount01.c:105: PASS: fsconfig create superblock
newmount01.c:113: PASS: fsmount
newmount01.c:121: PASS: move_mount attach to mount point
newmount01.c:124: PASS: new mount works

Summary:
passed   12
failed   0
skipped  0
warnings 0
tst_device.c:221: WARN: ioctl(/dev/loop2, LOOP_CLR_FD, 0) no ENXIO for too long
tst_tmpdir.c:330: WARN: tst_rmdir: rmobj(/tmp/RjSYWS) failed: remove(/tmp/RjSYWS/newmount_point) failed; errno=16: EBUSY

we can fix this by calling cleanup  and setting mount_flag to 0 when umount succeed

> +}
> +
> +struct test_cases {
> +	void (*tfunc)(void);
> +} tcases[] = {
> +	{&test_newmount},
> +};
> +
> +static void run(unsigned int i)
> +{
> +	tcases[i].tfunc();
> +}

Why not use test_newmount directly? You can use .test_all= test_newmount in struct tst_test
  and doesn't need tcnt [1].
[1]https://github.com/linux-test-project/ltp/blob/master/doc/test-writing-guidelines.txt

> +
> +static struct tst_test test = {

As Petr said, using .all_filesysystem is a better way. we can test more filesystems.

> +	.test		= run,
> +	.tcnt		= ARRAY_SIZE(tcases),
> +	.setup		= setup,
> +	.cleanup	= cleanup,
> +	 .needs_root	= 1,
> +	.mntpoint	= MNTPOINT,
> +	.needs_device	= 1,
> +};



--------------F288692E702F5050D9F7D8A1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/29 1:35, Zorro Lang wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">Linux supports new mount syscalls from 5.2, so add new test cases
to cover these new API. This newmount01 case make sure new API -
fsopen(), fsconfig(), fsmount() and move_mount() can mount a
filesystem, then can be unmounted.</pre>
    </blockquote>
    <pre>Hi Zorro</pre>
    <pre> This patch looks good to me. Only a few comments as below:
</pre>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Zorro Lang <a class="moz-txt-link-rfc2396E" href="mailto:zlang@redhat.com">&lt;zlang@redhat.com&gt;</a>
---

Hi,

This's the 1st case for LTP to test current new mount API. So I have to add
lots of new things to include/lapi/* and m4/ltp-*(as below), I'm not familiar
with LTP code, so please help to review. There might be lot of things need to
be improved.

I'll try to add more test if this 1st case can be merged. I've tested this
patch on latest upstream xfs-linux for-next branch, due to xfs supports
the new mount API now.


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
+LTP_CHECK_FSMOUNT</pre>
    </blockquote>
    <br>
    <pre>sort a<span class="tlid-translation translation" lang="en"><span title="" class="">lphabetically. </span></span>
+LTP_CHECK_FSCONFIG
+LTP_CHECK_FSMOUNT
+LTP_CHECK_FSOPEN
 
<span class="tlid-translation translation" lang="en"><span title="" class=""></span></span></pre>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">
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
+#include &lt;stdint.h&gt;
+#include &lt;unistd.h&gt;
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
+])</pre>
    </blockquote>
    <pre>IMHO, we don't need to add these m4 files. I think you can move fsopen,fsconfig,fsmount,move_mount , sys/mount.h into 
configure.ac. We usually do it since commit 8fd49cebd5("configure.ac: Simplify the check for libc function implementations")
</pre>
    <pre>Or, you will add more info on the comming patches to test new mount api.
 </pre>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">
diff --git a/runtest/syscalls b/runtest/syscalls
index 15dbd9971..d11a87dd9 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -716,6 +716,8 @@ mount04 mount04
 mount05 mount05
 mount06 mount06
 
+newmount01 newmount01</pre>
    </blockquote>
    <pre>In runtest/syscalls file, we should sort a<span class="tlid-translation translation" lang="en"><span title="" class="">lphabetically. We should put it before newuname01.</span></span></pre>
    <pre><span class="tlid-translation translation" lang="en"><span title="" class=""></span></span></pre>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">
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
+#  27/11/2019 <a class="moz-txt-link-abbreviated" href="mailto:zlang@redhat.com">zlang@redhat.com</a>  Create newmount01.c
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
+ * Author: Zorro Lang <a class="moz-txt-link-rfc2396E" href="mailto:zlang@redhat.com">&lt;zlang@redhat.com&gt;</a>
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
+#include &lt;stdio.h&gt;
+#include &lt;stdlib.h&gt;
+#include &lt;unistd.h&gt;
+#include &lt;errno.h&gt;
+#include &lt;fcntl.h&gt;
+#include &lt;sys/prctl.h&gt;</pre>
    </blockquote>
    <pre>I don't see you use prctl and fcntl . Remove it.</pre>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">
+#include &lt;sys/wait.h&gt;</pre>
    </blockquote>
    <pre>It also can be removed.</pre>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">
+#include &lt;sys/mount.h&gt;
+
+#include "tst_test.h"
+#include "tst_safe_macros.h"</pre>
    </blockquote>
    <pre>"tst_test.h" has include this header filer. Remove it.</pre>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">
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
+}</pre>
    </blockquote>
    <pre>I think grep command is a simple way by using tst_run_cmd.</pre>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">
+
+static void setup(void)
+{
+	SAFE_MKFS(tst_device-&gt;dev, tst_device-&gt;fs_type, NULL, NULL);
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
+	TEST(fsopen(tst_device-&gt;fs_type, FSOPEN_CLOEXEC));
+	if (TST_RET &lt; 0) {
+		tst_brk(TFAIL | TTERRNO,
+		        "fsopen %s", tst_device-&gt;fs_type);
+	} else {
+		sfd = TST_RET;
+		tst_res(TPASS,
+			"fsopen %s", tst_device-&gt;fs_type);
+	}
+
+	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device-&gt;dev, 0));
+	if (TST_RET &lt; 0) {
+		tst_brk(TFAIL | TTERRNO,
+		        "fsconfig set source to %s", tst_device-&gt;dev);
+	} else {
+		tst_res(TPASS,
+			"fsconfig set source to %s", tst_device-&gt;dev);
+	}
+
+	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET &lt; 0) {
+		tst_brk(TFAIL | TTERRNO,
+		        "fsconfig create superblock");
+	} else {
+		tst_res(TPASS,
+			"fsconfig create superblock");
+	}
+
+	TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
+	if (TST_RET &lt; 0) {
+		tst_brk(TFAIL | TTERRNO, "fsmount");
+	} else {
+		mfd = TST_RET;
+		tst_res(TPASS, "fsmount");
+		SAFE_CLOSE(sfd);
+	}
+
+	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
+	if (TST_RET &lt; 0) {
+		tst_brk(TFAIL | TTERRNO, "move_mount attach to mount point");
+	} else {
+		tst_res(TPASS, "move_mount attach to mount point");
+		mount_flag = 1;</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">
+		if (ismount(MNTPOINT))
+			tst_res(TPASS, "new mount works");
+		else
+			tst_res(TFAIL, "new mount fails");
+	}
+	SAFE_CLOSE(mfd);</pre>
    </blockquote>
    <pre>Here,  I think you should umount. Otherwise, I will get an error when I run in a loop
fail as below:

[root@localhost newmount]# ./newmount01 -i 2
tst_device.c:87: INFO: Found free device 2 '/dev/loop2'
tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
tst_mkfs.c:90: INFO: Formatting /dev/loop2 with ext2 opts='' extra opts=''
mke2fs 1.44.6 (5-Mar-2019)
newmount01.c:87: PASS: fsopen ext2
newmount01.c:96: PASS: fsconfig set source to /dev/loop2
newmount01.c:105: PASS: fsconfig create superblock
newmount01.c:113: PASS: fsmount
newmount01.c:121: PASS: move_mount attach to mount point
newmount01.c:124: PASS: new mount works
newmount01.c:87: PASS: fsopen ext2
newmount01.c:96: PASS: fsconfig set source to /dev/loop2
newmount01.c:105: PASS: fsconfig create superblock
newmount01.c:113: PASS: fsmount
newmount01.c:121: PASS: move_mount attach to mount point
newmount01.c:124: PASS: new mount works

Summary:
passed   12
failed   0
skipped  0
warnings 0
tst_device.c:221: WARN: ioctl(/dev/loop2, LOOP_CLR_FD, 0) no ENXIO for too long
tst_tmpdir.c:330: WARN: tst_rmdir: rmobj(/tmp/RjSYWS) failed: remove(/tmp/RjSYWS/newmount_point) failed; errno=16: EBUSY

we can fix this by calling cleanup  and setting mount_flag to 0 when umount succeed 

<span class="tlid-translation translation" lang="en"><span title="" class=""></span></span></pre>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">
+}
+
+struct test_cases {
+	void (*tfunc)(void);
+} tcases[] = {
+	{&amp;test_newmount},
+};
+
+static void run(unsigned int i)
+{
+	tcases[i].tfunc();
+}</pre>
    </blockquote>
    <pre>Why not use test_newmount directly? You can use .test_all= test_newmount in struct tst_test
 and doesn't need tcnt [1].
[1]<a class="moz-txt-link-freetext" href="https://github.com/linux-test-project/ltp/blob/master/doc/test-writing-guidelines.txt">https://github.com/linux-test-project/ltp/blob/master/doc/test-writing-guidelines.txt</a>

</pre>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">
+
+static struct tst_test test = {</pre>
    </blockquote>
    <pre>As Petr said, using .all_filesysystem is a better way. we can test more filesystems.</pre>
    <blockquote type="cite"
      cite="mid:20191128173532.6468-1-zlang@redhat.com">
      <pre class="moz-quote-pre" wrap="">
+	.test		= run,
+	.tcnt		= ARRAY_SIZE(tcases),
+	.setup		= setup,
+	.cleanup	= cleanup,
+	 .needs_root	= 1,
+	.mntpoint	= MNTPOINT,
+	.needs_device	= 1,
+};
</pre>
    </blockquote>
  </body>
</html>

--------------F288692E702F5050D9F7D8A1--

--===============0350995614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0350995614==--
