Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF2160C28
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:04:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEB043C23C8
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:04:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 5BCD53C2387
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:04:30 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AAE591400E05
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:04:25 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id b35so8485103pgm.13
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 00:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0eEmEnTX+bexLIskOIEURFn3DFq6XZ83RI3dyKwdmqE=;
 b=GYHgHbRDpTt1OrO3p/MOsYFKPvwBUq0Gpfp6JbQJB+RH3/W4vdNo+VY7+zRST/qw4i
 yIB1ChfQFv1Nis5f8zF2uDO26LOK9VgUjaqpgtzHRpOtEQlu8W/S4R4OMf5RdvemdEBJ
 2DbJbRwLTXcBr0+zZZ5jomV4uv4tQunvNrOvq5P1rJjmo+Jk57Q+HUqcabl7ks4r4a9H
 2EyzyK37ogtuvbYkpbzbIMinUz8RM1OfXTNXBhiUtJk2DgJAoCq7gbTc/gEndYgd0HqG
 9vvbQkN9Vpwv8pHHe2kSRkUfqiHX9HADryz2CGDiAzLxQUY1Pbyo/i2KZics2svu9eN/
 dzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0eEmEnTX+bexLIskOIEURFn3DFq6XZ83RI3dyKwdmqE=;
 b=GptuSnsHQzGFv4Kq6kJMFXNLP+GSOGj1HsxUBjcS4ie/SeV7cDc0h3Q6cDJ7oqJL7F
 1jR0nQLUVn5vmnl5hTlHHzbPzzs8nh8Um/kdGp5PIF8x/N25Iz4kz8GWN3nsF9OFmBFT
 K+2ym6JaVcSl8fYBuSETiUE87ELhy+aSL0djLj5n9KfONuu2nnpIr5LNMMK+E3IAcdQH
 5FNhBMEeSLgxp99Vq0g9nPkV/lBg3HR3JCM00Xwftgf186yhLVOP5aGeBYrigxaxMmwf
 QgXnPS6JiaMetS/srDBOXum4SYRt3yB0X5ns23ksPJ8OjKfFf101QBZpvnu8PUP+v+4V
 x2YQ==
X-Gm-Message-State: APjAAAWm81IqMOa98aQMif9HcNyeR3ZzvsaysqMoN6UFBNZCoHL1Jb6G
 3BFm8JAr0F3ZxPPW/9sRuX7pfw==
X-Google-Smtp-Source: APXvYqzJdMhQFBRj5nrKuLui3Gk0tdgqCo3VDE9Dl5+tP0cBccWv7T+oD5M7u/E0dBqkoaKm7L5kpw==
X-Received: by 2002:aa7:9354:: with SMTP id 20mr15220277pfn.1.1581926663657;
 Mon, 17 Feb 2020 00:04:23 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id a69sm15752052pfa.129.2020.02.17.00.04.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Feb 2020 00:04:22 -0800 (PST)
Date: Mon, 17 Feb 2020 13:34:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
Message-ID: <20200217080418.r5zbd5zgslkveztp@vireshk-i7>
References: <20200207144105.19947-1-pvorel@suse.cz>
 <20200207144105.19947-2-pvorel@suse.cz>
 <CAEemH2f0db1i7Tpg-4jqa5h5j9KZpH+d4aRg-M3Xn3Mw9NU1eA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f0db1i7Tpg-4jqa5h5j9KZpH+d4aRg-M3Xn3Mw9NU1eA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/2] syscalls/fsmount01: Add test for new mount
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Fri, Feb 7, 2020 at 10:41 PM Petr Vorel <pvorel@suse.cz> wrote:
> Add basic tests tests for new mount API from kernel v5.2.
> Testing mount and umount filesystems with fsopen(), fsconfig(),
> fsmount() and move_mount().
> 
> Signed-off-by: Zorro Lang <zlang@redhat.com>
> Reported-by: Cyril Hrubis <chrubis@suse.cz>
> [ pvorel: cleanup autotools and other fixes ]
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  configure.ac                                  |  4 +
>  include/lapi/newmount.h                       | 95 +++++++++++++++++++
>  include/lapi/syscalls/powerpc64.in            |  4 +
>  runtest/syscalls                              |  2 +
>  testcases/kernel/syscalls/fsmount/.gitignore  |  1 +
>  testcases/kernel/syscalls/fsmount/Makefile    |  8 ++
>  testcases/kernel/syscalls/fsmount/fsmount01.c | 94 ++++++++++++++++++
>  7 files changed, 208 insertions(+)
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

newmount doesn't look correct to me, what if there is another mount API in future :)

fsmount sounds okay to me..

> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.

Should be 2020 now ?

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

I have already sent a patch for this earlier and it got merged then. Please
rebase on the latest code.

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
> index 000000000..99e7a1720
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.

2020 ?

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
> +	while (fgets(line, sizeof(line), file)) {
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
> +	if (is_mounted)
> +		SAFE_UMOUNT(MNTPOINT);
> +}
> +
> +static void test_newmount(void)

What exactly are we trying to test here? fsmount or all of them ? Asking because
we may need to use TFAIL for the API we are testing and TBROK for others, if my
understanding is correct.

> +{
> +	TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
> +	if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO, "fsopen %s", tst_device->fs_type);

May be write explicitly so it is readable without reading the code as well. Like
"fsopen() failed for %s filesystem"

> +	sfd = TST_RET;
> +	tst_res(TPASS, "fsopen %s", tst_device->fs_type);

Okay, so looks like we are testing all syscalls here. Then it should have been
TFAIL earlier.

> +
> +	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
> +	if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO,
> +		        "fsconfig set source to %s", tst_device->dev);
> +	tst_res(TPASS, "fsconfig set source to %s", tst_device->dev);

same thing with error messages here and below as well.

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
> +		SAFE_UMOUNT(MNTPOINT);
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

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
