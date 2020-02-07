Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FD15537A
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 09:09:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1386C3C23F2
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 09:09:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1284D3C2385
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 09:09:14 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A486A14149C8
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 09:09:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581062949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1l+pPYm+I38eGlOoQ0367M9IOiyQ51olzAOGsHLaTY=;
 b=dHu7GY+wdqTrq3K9ntQWDpx4O+HrZuPV1KeeI3YnQGV8imw49B1jDHnoD5lCr61Ysx3354
 /Rz0Aq7THPniRfne26EXoVylKen875iTVe3oywM5mzEMUCdyuNnDPqhzUByvRofPI65wJw
 90ZDh2lG++VvvrOqIFIGOQi/ZousNRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-37mW2q0cNPCSvAuXkjhiqw-1; Fri, 07 Feb 2020 03:09:00 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87F0E1005513;
 Fri,  7 Feb 2020 08:08:59 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C035B1001B08;
 Fri,  7 Feb 2020 08:08:58 +0000 (UTC)
Date: Fri, 7 Feb 2020 16:18:55 +0800
From: Zorro Lang <zlang@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200207081854.GU14282@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200206162722.18945-1-pvorel@suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200206162722.18945-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 37mW2q0cNPCSvAuXkjhiqw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/fsmount01: Add test for new mount
 API v5.2
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Feb 06, 2020 at 05:27:22PM +0100, Petr Vorel wrote:
> From: Zorro Lang <zlang@redhat.com>
> 
> Add basic tests tests for new mount API from kernel v5.2.
> Testing mount and umount filesystems with fsopen(), fsconfig(),
> fsmount() and move_mount().
> 
> Signed-off-by: Zorro Lang <zlang@redhat.com>
> Reported-by: Cyril Hrubis <chrubis@suse.cz>
> [ pvorel: cleanup autotools and other fixes ]
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
> 
> I implemented fixes for "newmount" Zorro's patch, hoping this is a final
> version. Changes are minor, asked by Cyril + rename test to fsmount01,

Thanks so much!

I think I shouldn't ack a patch from myself. So I just ask a small question.
I noticed that you decide to use the name as "syscalls/fsmount/fsmount01".
I hope the "fsmount" is a general name, which doesn't mean fsmount() itself.
Due to I might write other cases don't aim to test fsmount(). E.g.
open_tree() and move_tree(). But I will name the name as fsmount?? . I hope
that meets your expectation.

Thanks,
Zorro

> headers cleanup (but <sys/mount.h> kept + use SAFE_FOPEN()).
> 
> Kind regards,
> Petr
> 
>  configure.ac                                  |  4 +
>  include/lapi/newmount.h                       | 95 ++++++++++++++++++
>  include/lapi/syscalls/powerpc64.in            |  4 +
>  runtest/syscalls                              |  2 +
>  testcases/kernel/syscalls/fsmount/.gitignore  |  1 +
>  testcases/kernel/syscalls/fsmount/Makefile    |  8 ++
>  testcases/kernel/syscalls/fsmount/fsmount01.c | 99 +++++++++++++++++++
>  7 files changed, 213 insertions(+)
>  create mode 100644 include/lapi/newmount.h
>  create mode 100644 testcases/kernel/syscalls/fsmount/.gitignore
>  create mode 100644 testcases/kernel/syscalls/fsmount/Makefile
>  create mode 100644 testcases/kernel/syscalls/fsmount/fsmount01.c
> 
> diff --git a/configure.ac b/configure.ac
> index df4e8c832..05b7d0a72 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -80,6 +80,9 @@ AC_CHECK_FUNCS([ \
>      execveat \
>      fallocate \
>      fchownat \
> +    fsconfig \
> +    fsmount \
> +    fsopen \
>      fstatat \
>      getdents \
>      getdents64 \
> @@ -88,6 +91,7 @@ AC_CHECK_FUNCS([ \
>      mkdirat \
>      mknodat \
>      modify_ldt \
> +    move_mount \
>      name_to_handle_at \
>      openat \
>      pidfd_open \
> diff --git a/include/lapi/newmount.h b/include/lapi/newmount.h
> new file mode 100644
> index 000000000..d4efdb300
> --- /dev/null
> +++ b/include/lapi/newmount.h
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> + * Author: Zorro Lang <zlang@redhat.com>
> + */
> +
> +#ifndef NEWMOUNT_H__
> +#define NEWMOUNT_H__
> +
> +#include <stdint.h>
> +#include <unistd.h>
> +#include "config.h"
> +#include "lapi/syscalls.h"
> +
> +#ifndef HAVE_FSOPEN
> +static inline int fsopen(const char *fs_name, unsigned int flags)
> +{
> +	return tst_syscall(__NR_fsopen, fs_name, flags);
> +}
> +
> +/*
> + * fsopen() flags.
> + */
> +#define FSOPEN_CLOEXEC		0x00000001
> +#endif	/* HAVE_FSOPEN */
> +
> +#ifndef HAVE_FSCONFIG
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
> +#endif	/* HAVE_FSCONFIG */
> +
> +#ifndef HAVE_FSMOUNT
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
> +#endif	/* HAVE_FSMOUNT */
> +
> +#ifndef HAVE_MOVE_MOUNT
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
> +#endif	/* HAVE_MOVE_MOUNT */
> +
> +#endif /* NEWMOUNT_H__ */
> diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
> index 2c1f105c1..beb0e6812 100644
> --- a/include/lapi/syscalls/powerpc64.in
> +++ b/include/lapi/syscalls/powerpc64.in
> @@ -371,3 +371,7 @@ pidfd_open 434
>  pkey_mprotect 386
>  pkey_alloc 384
>  pkey_free 385
> +move_mount 429
> +fsopen 430
> +fsconfig 431
> +fsmount 432
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 0743cf4e3..72e729c1c 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -341,6 +341,8 @@ fpathconf01 fpathconf01
>  fremovexattr01 fremovexattr01
>  fremovexattr02 fremovexattr02
>  
> +fsmount01 fsmount01
> +
>  fstat02 fstat02
>  fstat02_64 fstat02_64
>  fstat03 fstat03
> diff --git a/testcases/kernel/syscalls/fsmount/.gitignore b/testcases/kernel/syscalls/fsmount/.gitignore
> new file mode 100644
> index 000000000..e2f01ea17
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsmount/.gitignore
> @@ -0,0 +1 @@
> +/fsmount01
> diff --git a/testcases/kernel/syscalls/fsmount/Makefile b/testcases/kernel/syscalls/fsmount/Makefile
> new file mode 100644
> index 000000000..cc80d2efd
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsmount/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
> new file mode 100644
> index 000000000..7ba50753f
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> + * Author: Zorro Lang <zlang@redhat.com>
> + *
> + * Use new mount API from v5.2 (fsopen(), fsconfig(), fsmount(), move_mount())
> + * to mount a filesystem without any specified mount options.
> + */
> +
> +#include <sys/mount.h>
> +
> +#include "tst_test.h"
> +#include "lapi/newmount.h"
> +#include "tst_safe_stdio.h"
> +
> +#define LINELENGTH 256
> +#define MNTPOINT "newmount_point"
> +static int sfd, mfd, is_mounted;
> +
> +static int ismount(char *mntpoint)
> +{
> +	int ret = 0;
> +	FILE *file;
> +	char line[LINELENGTH];
> +
> +	file = SAFE_FOPEN("/proc/mounts", "r");
> +
> +	while (fgets(line, LINELENGTH, file) != NULL) {
> +		if (strstr(line, mntpoint) != NULL) {
> +			ret = 1;
> +			break;
> +		}
> +	}
> +	SAFE_FCLOSE(file);
> +	return ret;
> +}
> +
> +static void cleanup(void)
> +{
> +	if (is_mounted) {
> +		TEST(tst_umount(MNTPOINT));
> +		if (TST_RET != 0)
> +			tst_brk(TBROK | TTERRNO, "umount failed in cleanup");
> +	}
> +}
> +
> +static void test_newmount(void)
> +{
> +	TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
> +	if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO, "fsopen %s", tst_device->fs_type);
> +	sfd = TST_RET;
> +	tst_res(TPASS, "fsopen %s", tst_device->fs_type);
> +
> +	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
> +	if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO,
> +		        "fsconfig set source to %s", tst_device->dev);
> +	tst_res(TPASS, "fsconfig set source to %s", tst_device->dev);
> +
> +
> +	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
> +	if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO, "fsconfig create superblock");
> +	tst_res(TPASS, "fsconfig create superblock");
> +
> +	TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
> +	if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO, "fsmount");
> +	mfd = TST_RET;
> +	tst_res(TPASS, "fsmount");
> +	SAFE_CLOSE(sfd);
> +
> +	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
> +	if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO, "move_mount attach to mount point");
> +	is_mounted = 1;
> +	tst_res(TPASS, "move_mount attach to mount point");
> +	SAFE_CLOSE(mfd);
> +
> +	if (ismount(MNTPOINT)) {
> +		tst_res(TPASS, "new mount API from v5.2 works");
> +		TEST(tst_umount(MNTPOINT));
> +		if (TST_RET != 0)
> +			tst_brk(TBROK | TTERRNO, "umount failed");
> +		is_mounted = 0;
> +	} else
> +		tst_res(TFAIL, "new mount API from v5.2 works");
> +}
> +
> +static struct tst_test test = {
> +	.test_all = test_newmount,
> +	.cleanup = cleanup,
> +	.needs_root = 1,
> +	.mntpoint = MNTPOINT,
> +	.format_device = 1,
> +	.all_filesystems = 1,
> +	.dev_fs_flags = TST_FS_SKIP_FUSE,
> +};
> -- 
> 2.24.1
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
