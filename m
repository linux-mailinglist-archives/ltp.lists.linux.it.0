Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A531394B8
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jan 2020 16:22:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00CBB3C2493
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jan 2020 16:22:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 55F533C18F7
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 16:22:53 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 2E6BB600CE4
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 16:22:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578928967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xBfIQTsOnHZvtMkCmaqgABMw2Rphn/kjlxAtsXyNiU=;
 b=KC3gJLjz7Fv1Hv1H2VTqAtHKljiD2sbK4Ua/3vvK5KK7mYy4DO4TEgjuMoDvJVQCYaGzYS
 uSV7hd/7A835TRdKMbaGT2kfFwjXfvF239I61Hx50EZ8IURarH2Esyl2cKuiwVJhqIKcrr
 4MEdvttIZlZS7cpCpsxT/BE53EeBf5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-ymM_0LkNPPiRcB-0vmhLIA-1; Mon, 13 Jan 2020 10:22:39 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F450801E72
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 15:22:37 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9210260FC1
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 15:22:36 +0000 (UTC)
Date: Mon, 13 Jan 2020 23:31:41 +0800
From: Zorro Lang <zlang@redhat.com>
To: ltp@lists.linux.it
Message-ID: <20200113153141.GA14282@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: ltp@lists.linux.it
References: <20191209160227.16125-1-zlang@redhat.com>
 <20191226072338.GH14328@dhcp-12-102.nay.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191226072338.GH14328@dhcp-12-102.nay.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ymM_0LkNPPiRcB-0vmhLIA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/newmount: new test case for new mount
 API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Dec 26, 2019 at 03:23:38PM +0800, Zorro Lang wrote:
> On Tue, Dec 10, 2019 at 12:02:27AM +0800, Zorro Lang wrote:
> > Linux supports new mount syscalls from 5.2, so add new test cases
> > to cover these new API. This newmount01 case make sure new API -
> > fsopen(), fsconfig(), fsmount() and move_mount() can mount a
> > filesystem, then can be unmounted.
> > 
> > Signed-off-by: Zorro Lang <zlang@redhat.com>
> > ---
> > 
> > Hi,
> > 
> > V3 test passed on ext2/3/4 and xfs[1], on upstream mainline kernel. Thanks
> > all your review points:)
> > But I have a question, how to test other filesystems, likes nfs, cifs?
> 
> Ping.
> 
> It's been several weeks passed. Is there more review points?

ping again ... is there anything block this patch review?

Thanks,
Zorro

> 
> Thanks,
> Zorro
> 
> > 
> > Thanks,
> > Zorro
> > 
> >  configure.ac                                  |   1 +
> >  include/lapi/newmount.h                       |  95 +++++++++++++++
> >  include/lapi/syscalls/aarch64.in              |   4 +
> >  include/lapi/syscalls/powerpc64.in            |   4 +
> >  include/lapi/syscalls/s390x.in                |   4 +
> >  include/lapi/syscalls/x86_64.in               |   4 +
> >  m4/ltp-newmount.m4                            |  10 ++
> >  runtest/syscalls                              |   2 +
> >  testcases/kernel/syscalls/newmount/.gitignore |   1 +
> >  testcases/kernel/syscalls/newmount/Makefile   |   9 ++
> >  .../kernel/syscalls/newmount/newmount01.c     | 114 ++++++++++++++++++
> >  11 files changed, 248 insertions(+)
> >  create mode 100644 include/lapi/newmount.h
> >  create mode 100644 m4/ltp-newmount.m4
> >  create mode 100644 testcases/kernel/syscalls/newmount/.gitignore
> >  create mode 100644 testcases/kernel/syscalls/newmount/Makefile
> >  create mode 100644 testcases/kernel/syscalls/newmount/newmount01.c
> > 
> > diff --git a/configure.ac b/configure.ac
> > index 50d14967d..28f840c51 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -229,6 +229,7 @@ LTP_CHECK_MADVISE
> >  LTP_CHECK_MKDTEMP
> >  LTP_CHECK_MMSGHDR
> >  LTP_CHECK_MREMAP_FIXED
> > +LTP_CHECK_NEWMOUNT
> >  LTP_CHECK_NOMMU_LINUX
> >  LTP_CHECK_PERF_EVENT
> >  LTP_CHECK_PRCTL_SUPPORT
> > diff --git a/include/lapi/newmount.h b/include/lapi/newmount.h
> > new file mode 100644
> > index 000000000..13f9fbb9c
> > --- /dev/null
> > +++ b/include/lapi/newmount.h
> > @@ -0,0 +1,95 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> > + * Author: Zorro Lang <zlang@redhat.com>
> > + */
> > +
> > +#ifndef NEWMOUNT_H__
> > +#define NEWMOUNT_H__
> > +
> > +#include <stdint.h>
> > +#include <unistd.h>
> > +#include "config.h"
> > +#include "lapi/syscalls.h"
> > +
> > +#if !defined(HAVE_FSOPEN)
> > +static inline int fsopen(const char *fs_name, unsigned int flags)
> > +{
> > +	return tst_syscall(__NR_fsopen, fs_name, flags);
> > +}
> > +
> > +/*
> > + * fsopen() flags.
> > + */
> > +#define FSOPEN_CLOEXEC		0x00000001
> > +#endif	/* HAVE_FSOPEN */
> > +
> > +#if !defined(HAVE_FSCONFIG)
> > +static inline int fsconfig(int fsfd, unsigned int cmd,
> > +                           const char *key, const void *val, int aux)
> > +{
> > +	return tst_syscall(__NR_fsconfig, fsfd, cmd, key, val, aux);
> > +}
> > +
> > +/*
> > + * The type of fsconfig() call made.
> > + */
> > +enum fsconfig_command {
> > +	FSCONFIG_SET_FLAG	= 0,    /* Set parameter, supplying no value */
> > +	FSCONFIG_SET_STRING	= 1,    /* Set parameter, supplying a string value */
> > +	FSCONFIG_SET_BINARY	= 2,    /* Set parameter, supplying a binary blob value */
> > +	FSCONFIG_SET_PATH	= 3,    /* Set parameter, supplying an object by path */
> > +	FSCONFIG_SET_PATH_EMPTY	= 4,    /* Set parameter, supplying an object by (empty) path */
> > +	FSCONFIG_SET_FD		= 5,    /* Set parameter, supplying an object by fd */
> > +	FSCONFIG_CMD_CREATE	= 6,    /* Invoke superblock creation */
> > +	FSCONFIG_CMD_RECONFIGURE = 7,   /* Invoke superblock reconfiguration */
> > +};
> > +#endif	/* HAVE_FSCONFIG */
> > +
> > +#if !defined(HAVE_FSMOUNT)
> > +static inline int fsmount(int fsfd, unsigned int flags, unsigned int ms_flags)
> > +{
> > +	return tst_syscall(__NR_fsmount, fsfd, flags, ms_flags);
> > +}
> > +
> > +/*
> > + * fsmount() flags.
> > + */
> > +#define FSMOUNT_CLOEXEC		0x00000001
> > +
> > +/*
> > + * Mount attributes.
> > + */
> > +#define MOUNT_ATTR_RDONLY	0x00000001 /* Mount read-only */
> > +#define MOUNT_ATTR_NOSUID	0x00000002 /* Ignore suid and sgid bits */
> > +#define MOUNT_ATTR_NODEV	0x00000004 /* Disallow access to device special files */
> > +#define MOUNT_ATTR_NOEXEC	0x00000008 /* Disallow program execution */
> > +#define MOUNT_ATTR__ATIME	0x00000070 /* Setting on how atime should be updated */
> > +#define MOUNT_ATTR_RELATIME	0x00000000 /* - Update atime relative to mtime/ctime. */
> > +#define MOUNT_ATTR_NOATIME	0x00000010 /* - Do not update access times. */
> > +#define MOUNT_ATTR_STRICTATIME	0x00000020 /* - Always perform atime updates */
> > +#define MOUNT_ATTR_NODIRATIME	0x00000080 /* Do not update directory access times */
> > +#endif	/* HAVE_FSMOUNT */
> > +
> > +#if !defined(HAVE_MOVE_MOUNT)
> > +static inline int move_mount(int from_dfd, const char *from_pathname,
> > +                             int to_dfd, const char *to_pathname,
> > +                             unsigned int flags)
> > +{
> > +	return tst_syscall(__NR_move_mount, from_dfd, from_pathname, to_dfd,
> > +	                   to_pathname, flags);
> > +}
> > +
> > +/*
> > + * move_mount() flags.
> > + */
> > +#define MOVE_MOUNT_F_SYMLINKS		0x00000001 /* Follow symlinks on from path */
> > +#define MOVE_MOUNT_F_AUTOMOUNTS		0x00000002 /* Follow automounts on from path */
> > +#define MOVE_MOUNT_F_EMPTY_PATH		0x00000004 /* Empty from path permitted */
> > +#define MOVE_MOUNT_T_SYMLINKS		0x00000010 /* Follow symlinks on to path */
> > +#define MOVE_MOUNT_T_AUTOMOUNTS		0x00000020 /* Follow automounts on to path */
> > +#define MOVE_MOUNT_T_EMPTY_PATH		0x00000040 /* Empty to path permitted */
> > +#define MOVE_MOUNT__MASK		0x00000077
> > +#endif	/* HAVE_MOVE_MOUNT */
> > +
> > +#endif /* NEWMOUNT_H__ */
> > diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
> > index 0e00641bc..5b9e1d9a4 100644
> > --- a/include/lapi/syscalls/aarch64.in
> > +++ b/include/lapi/syscalls/aarch64.in
> > @@ -270,4 +270,8 @@ pkey_mprotect 288
> >  pkey_alloc 289
> >  pkey_free 290
> >  pidfd_send_signal 424
> > +move_mount 429
> > +fsopen 430
> > +fsconfig 431
> > +fsmount 432
> >  _sysctl 1078
> > diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
> > index 660165d7a..3aaed64e0 100644
> > --- a/include/lapi/syscalls/powerpc64.in
> > +++ b/include/lapi/syscalls/powerpc64.in
> > @@ -359,3 +359,7 @@ pidfd_send_signal 424
> >  pkey_mprotect 386
> >  pkey_alloc 384
> >  pkey_free 385
> > +move_mount 429
> > +fsopen 430
> > +fsconfig 431
> > +fsmount 432
> > diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
> > index 7d632d1dc..bd427555a 100644
> > --- a/include/lapi/syscalls/s390x.in
> > +++ b/include/lapi/syscalls/s390x.in
> > @@ -341,3 +341,7 @@ pkey_mprotect 384
> >  pkey_alloc 385
> >  pkey_free 386
> >  pidfd_send_signal 424
> > +move_mount 429
> > +fsopen 430
> > +fsconfig 431
> > +fsmount 432
> > diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
> > index b1cbd4f2f..94f0b562e 100644
> > --- a/include/lapi/syscalls/x86_64.in
> > +++ b/include/lapi/syscalls/x86_64.in
> > @@ -320,3 +320,7 @@ pkey_alloc 330
> >  pkey_free 331
> >  statx 332
> >  pidfd_send_signal 424
> > +move_mount 429
> > +fsopen 430
> > +fsconfig 431
> > +fsmount 432
> > diff --git a/m4/ltp-newmount.m4 b/m4/ltp-newmount.m4
> > new file mode 100644
> > index 000000000..e13a6f0b1
> > --- /dev/null
> > +++ b/m4/ltp-newmount.m4
> > @@ -0,0 +1,10 @@
> > +dnl SPDX-License-Identifier: GPL-2.0-or-later
> > +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> > +
> > +AC_DEFUN([LTP_CHECK_NEWMOUNT],[
> > +AC_CHECK_FUNCS(fsopen,,)
> > +AC_CHECK_FUNCS(fsconfig,,)
> > +AC_CHECK_FUNCS(fsmount,,)
> > +AC_CHECK_FUNCS(move_mount,,)
> > +AC_CHECK_HEADER(sys/mount.h,,,)
> > +])
> > diff --git a/runtest/syscalls b/runtest/syscalls
> > index 15dbd9971..fac1c62d2 100644
> > --- a/runtest/syscalls
> > +++ b/runtest/syscalls
> > @@ -794,6 +794,8 @@ nanosleep01 nanosleep01
> >  nanosleep02 nanosleep02
> >  nanosleep04 nanosleep04
> >  
> > +newmount01 newmount01
> > +
> >  nftw01 nftw01
> >  nftw6401 nftw6401
> >  
> > diff --git a/testcases/kernel/syscalls/newmount/.gitignore b/testcases/kernel/syscalls/newmount/.gitignore
> > new file mode 100644
> > index 000000000..dc78edd5b
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/newmount/.gitignore
> > @@ -0,0 +1 @@
> > +/newmount01
> > diff --git a/testcases/kernel/syscalls/newmount/Makefile b/testcases/kernel/syscalls/newmount/Makefile
> > new file mode 100644
> > index 000000000..7d0920df6
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/newmount/Makefile
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +#
> > +# Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> > +
> > +top_srcdir		?= ../../../..
> > +
> > +include $(top_srcdir)/include/mk/testcases.mk
> > +
> > +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> > diff --git a/testcases/kernel/syscalls/newmount/newmount01.c b/testcases/kernel/syscalls/newmount/newmount01.c
> > new file mode 100644
> > index 000000000..464ecb699
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/newmount/newmount01.c
> > @@ -0,0 +1,114 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> > + * Author: Zorro Lang <zlang@redhat.com>
> > + *
> > + * Use new mount API (fsopen, fsconfig, fsmount, move_mount) to mount
> > + * a filesystem without any specified mount options.
> > + */
> > +
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <unistd.h>
> > +#include <errno.h>
> > +#include <sys/mount.h>
> > +
> > +#include "tst_test.h"
> > +#include "tst_safe_macros.h"
> > +#include "lapi/newmount.h"
> > +
> > +#define LINELENGTH 256
> > +#define MNTPOINT "newmount_point"
> > +static int sfd, mfd;
> > +static int is_mounted = 0;
> > +
> > +static int ismount(char *mntpoint)
> > +{
> > +	int ret = 0;
> > +	FILE *file;
> > +	char line[LINELENGTH];
> > +
> > +	file = fopen("/proc/mounts", "r");
> > +	if (file == NULL)
> > +		tst_brk(TFAIL | TTERRNO, "Open /proc/mounts failed");
> > +
> > +	while (fgets(line, LINELENGTH, file) != NULL) {
> > +		if (strstr(line, mntpoint) != NULL) {
> > +			ret = 1;
> > +			break;
> > +		}
> > +	}
> > +	fclose(file);
> > +	return ret;
> > +}
> > +
> > +static void cleanup(void)
> > +{
> > +	if (is_mounted) {
> > +		TEST(tst_umount(MNTPOINT));
> > +		if (TST_RET != 0)
> > +			tst_brk(TFAIL | TTERRNO, "umount failed in cleanup");
> > +	}
> > +}
> > +
> > +static void test_newmount(void)
> > +{
> > +	TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO,
> > +		        "fsopen %s", tst_device->fs_type);
> > +	}
> > +	sfd = TST_RET;
> > +	tst_res(TPASS, "fsopen %s", tst_device->fs_type);
> > +
> > +	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO,
> > +		        "fsconfig set source to %s", tst_device->dev);
> > +	}
> > +	tst_res(TPASS, "fsconfig set source to %s", tst_device->dev);
> > +
> > +
> > +	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO,
> > +		        "fsconfig create superblock");
> > +	}
> > +	tst_res(TPASS, "fsconfig create superblock");
> > +
> > +	TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO, "fsmount");
> > +	}
> > +	mfd = TST_RET;
> > +	tst_res(TPASS, "fsmount");
> > +	SAFE_CLOSE(sfd);
> > +
> > +	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO, "move_mount attach to mount point");
> > +	}
> > +	is_mounted = 1;
> > +	tst_res(TPASS, "move_mount attach to mount point");
> > +	SAFE_CLOSE(mfd);
> > +
> > +	if (ismount(MNTPOINT)) {
> > +		tst_res(TPASS, "new mount works");
> > +		TEST(tst_umount(MNTPOINT));
> > +		if (TST_RET != 0)
> > +			tst_brk(TFAIL | TTERRNO, "umount failed");
> > +		is_mounted = 0;
> > +	} else {
> > +		tst_res(TFAIL, "new mount fails");
> > +	}
> > +}
> > +
> > +static struct tst_test test = {
> > +	.test_all	= test_newmount,
> > +	.cleanup	= cleanup,
> > +	.needs_root	= 1,
> > +	.mntpoint	= MNTPOINT,
> > +	.needs_device	= 1,
> > +	.format_device	= 1,
> > +	.all_filesystems = 1,
> > +};
> > -- 
> > 2.20.1
> > 
> > 
> > -- 
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> > 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
