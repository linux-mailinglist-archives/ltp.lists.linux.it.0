Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7067F140877
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 11:57:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 175803C2215
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 11:57:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E3AF53C201C
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 11:57:02 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id B366460106D
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 11:56:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579258613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHK4D/NfPaie/NMq6eQ/qhaujEivHOkQ8zwSzlxKRDA=;
 b=EVBkp53sA327XVUsKqwGzXF+q8WAFwevaq9W6L9C2NFzQS+V8J8ijV36KK0ANPITTetUui
 54+39RB0XwAeZsWhz1o6erpaI7FQI2QSv+tD2fae/G8imIRBnC1qOj7fc9m6yC7QaxBK9M
 pfcGOIe9HRTStgSwkNGnvOHUYw5GSpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-t_U6_7qoPjm-YXVg-tsZLg-1; Fri, 17 Jan 2020 05:56:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEA8910054E3;
 Fri, 17 Jan 2020 10:56:41 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AFA4845AB;
 Fri, 17 Jan 2020 10:56:40 +0000 (UTC)
Date: Fri, 17 Jan 2020 19:05:54 +0800
From: Zorro Lang <zlang@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200117110554.GG14282@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: Petr Vorel <pvorel@suse.cz>,
 Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
References: <20200116075633.29752-1-zlang@redhat.com>
 <20200116114900.GA4897@rei>
 <20200116150849.GF14282@dhcp-12-102.nay.redhat.com>
 <20200117074828.GA3979@dell5510>
MIME-Version: 1.0
In-Reply-To: <20200117074828.GA3979@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: t_U6_7qoPjm-YXVg-tsZLg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/newmount: new test case for new mount
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jan 17, 2020 at 08:48:28AM +0100, Petr Vorel wrote:
> Hi,
> 
> ...
> > Yeah.. Although this case uses fsmount(), my later cases about new mount API
> > might not use it. I don't like the name "newmount0*" either, but I don't have
> > a better one for now. If anyone has a better name, please feel free to tell
> > me :)
> I slightly prefer fsmount01.c as it's based on real name, but no strong opinion.

I'd like to follow the choice of LTP maintainers on this kind of problem :)

> 
> > > Also this will likely fail on older kernels that does not support the
> > > syscall. I guess that you will get einval here if the fsopen() is not
> > > implemented in kernel. You have to at least set the min_kver in the
> > > tst_test structure so that the test is skipped on older kernels.
> 
> > If an older downstream kernel (e.g. rhel8/centos kernel-4.18.0-xxx.el8)
> > merges new mount API features, this case will think the kernel version
> > is too low to do this test.
> 
> > I just tested on an old kernel which doesn't support new mount feature.
> > Then I get this:
> 
> >   ...
> >   ...
> >   tst_test.c:1278: INFO: Testing on xfs
> >   tst_mkfs.c:90: INFO: Formatting /dev/loop1 with xfs opts='' extra opts=''
> >   tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
> >   ../../../../include/lapi/newmount.h:18: CONF: syscall(430) __NR_fsopen not supported
> 
> > I think it's fine, due to generally we ignore CONF. What do you think?
> 
> I tested it on several distros (old and new kernels) with fixed issues (all but
> rename, see following diff) and confirm it TCONF on older kernels
> ../../../../include/lapi/newmount.h:18: CONF: syscall(430) __NR_fsopen not supported

Actually I'm not so familiar with the automake things of LTP, just tried to
follow how other patches deal with that, and try my best to make it work. So
I'd like to agree the opinions from expert(like you) on this part :)

> 
> The only thing with bothers me is is that NTFS related failure
> on CONFIG_NTFS_FS is not set and mkfs.ntfs installed.
> I'd prefer at least to have a warning, but but better to fix it.
> I guess it's LTP problem, see code at safe_mount() in lib/safe_macros.c
> 
> 	/*
> 	 * Don't try using the kernel's NTFS driver when mounting NTFS, since
> 	 * the kernel's NTFS driver doesn't have proper write support.
> 	 */
> 	if (!filesystemtype || strcmp(filesystemtype, "ntfs")) {
> 		rval = mount(source, target, filesystemtype, mountflags, data);
> 		if (!rval)
> 			return 0;
> 	}
> 
> But obviously we don't use it as we do mount in the test, not in the library.
> So I propose (and can implement) to add flag TST_FS_SKIP_NTFS 0x02 into include/tst_fs.h
> and use it in test.

Maybe LTP should do more check to decide a fs list will be tested, not only check
mkfs.$FSTPE tools. For example, check:
1) mkfs.$FSTYPE is exist
2) ${FSTYPE}.ko is loaded, or can be loaded.

Or check:
1) mkfs.$FSTYPE $tmpdev run passed
2) mount $tmpdev $tmpmnt passed
3) umount $tmpdev
4) remove $tmpdev and $tmpmnt

For FUSE, I think we'd better to not test FUSE by default. Then let the case decide if
it would like to support a FUSE fs test. Change the TST_FS_SKIP_FUSE to TST_FS_SUP_FUSE,
if someone case wants to test a FUSE fs (likes ntfs), it should do special steps to mount
it, or it'll test linux internal ntfs.ko.

Due to LTP doesn't like fstests, LTP always tests the syscall itself. If we use bash
command, we can run `mount -t $FSTYPE ....`, don't need to care which program helps
to mount the fs. But if we use old/new mount API, that might totally different to mount
different filesystems. So let's only support those fs which can be mounted generally,
if someone want to write a case to test a special one fs, let the case author write
special steps in the case, and add TST_FS_SUP_*. That's only my tentative opinion :)

Do you need to I send a V5 patch?

Thanks,
Zorro

> 
> Kind regards,
> Petr
> 
> diff --git configure.ac configure.ac
> index 28f840c51..02d5b8c87 100644
> --- configure.ac
> +++ configure.ac
> @@ -71,12 +71,16 @@ AC_CHECK_FUNCS([ \
>      execveat \
>      fallocate \
>      fchownat \
> +    fsconfig \
> +    fsmount \
> +    fsopen \
>      fstatat \
>      getdents \
>      getdents64 \
>      kcmp \
>      mkdirat \
>      mknodat \
> +    move_mount \
>      name_to_handle_at \
>      openat \
>      pidfd_send_signal \
> @@ -229,7 +233,6 @@ LTP_CHECK_MADVISE
>  LTP_CHECK_MKDTEMP
>  LTP_CHECK_MMSGHDR
>  LTP_CHECK_MREMAP_FIXED
> -LTP_CHECK_NEWMOUNT
>  LTP_CHECK_NOMMU_LINUX
>  LTP_CHECK_PERF_EVENT
>  LTP_CHECK_PRCTL_SUPPORT
> diff --git m4/ltp-newmount.m4 m4/ltp-newmount.m4
> deleted file mode 100644
> index e13a6f0b1..000000000
> --- m4/ltp-newmount.m4
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -dnl SPDX-License-Identifier: GPL-2.0-or-later
> -dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> -
> -AC_DEFUN([LTP_CHECK_NEWMOUNT],[
> -AC_CHECK_FUNCS(fsopen,,)
> -AC_CHECK_FUNCS(fsconfig,,)
> -AC_CHECK_FUNCS(fsmount,,)
> -AC_CHECK_FUNCS(move_mount,,)
> -AC_CHECK_HEADER(sys/mount.h,,,)
> -])
> diff --git testcases/kernel/syscalls/newmount/newmount01.c testcases/kernel/syscalls/newmount/newmount01.c
> index 1e1ff4a78..4fe6b350c 100644
> --- testcases/kernel/syscalls/newmount/newmount01.c
> +++ testcases/kernel/syscalls/newmount/newmount01.c
> @@ -28,7 +28,7 @@ static int ismount(char *mntpoint)
>  
>  	file = fopen("/proc/mounts", "r");
>  	if (file == NULL)
> -		tst_brk(TFAIL | TTERRNO, "Open /proc/mounts failed");
> +		tst_brk(TBROK | TTERRNO, "Open /proc/mounts failed");
>  
>  	while (fgets(line, LINELENGTH, file) != NULL) {
>  		if (strstr(line, mntpoint) != NULL) {
> @@ -45,7 +45,7 @@ static void cleanup(void)
>  	if (is_mounted) {
>  		TEST(tst_umount(MNTPOINT));
>  		if (TST_RET != 0)
> -			tst_brk(TFAIL | TTERRNO, "umount failed in cleanup");
> +			tst_brk(TBROK | TTERRNO, "umount failed in cleanup");
>  	}
>  }
>  
> @@ -53,7 +53,7 @@ static void test_newmount(void)
>  {
>  	TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
>  	if (TST_RET < 0) {
> -		tst_brk(TFAIL | TTERRNO,
> +		tst_brk(TBROK | TTERRNO,
>  		        "fsopen %s", tst_device->fs_type);
>  	}
>  	sfd = TST_RET;
> @@ -61,7 +61,7 @@ static void test_newmount(void)
>  
>  	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
>  	if (TST_RET < 0) {
> -		tst_brk(TFAIL | TTERRNO,
> +		tst_brk(TBROK | TTERRNO,
>  		        "fsconfig set source to %s", tst_device->dev);
>  	}
>  	tst_res(TPASS, "fsconfig set source to %s", tst_device->dev);
> @@ -69,14 +69,14 @@ static void test_newmount(void)
>  
>  	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
>  	if (TST_RET < 0) {
> -		tst_brk(TFAIL | TTERRNO,
> +		tst_brk(TBROK | TTERRNO,
>  		        "fsconfig create superblock");
>  	}
>  	tst_res(TPASS, "fsconfig create superblock");
>  
>  	TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
>  	if (TST_RET < 0) {
> -		tst_brk(TFAIL | TTERRNO, "fsmount");
> +		tst_brk(TBROK | TTERRNO, "fsmount");
>  	}
>  	mfd = TST_RET;
>  	tst_res(TPASS, "fsmount");
> @@ -84,7 +84,7 @@ static void test_newmount(void)
>  
>  	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
>  	if (TST_RET < 0) {
> -		tst_brk(TFAIL | TTERRNO, "move_mount attach to mount point");
> +		tst_brk(TBROK | TTERRNO, "move_mount attach to mount point");
>  	}
>  	is_mounted = 1;
>  	tst_res(TPASS, "move_mount attach to mount point");
> @@ -94,7 +94,7 @@ static void test_newmount(void)
>  		tst_res(TPASS, "new mount works");
>  		TEST(tst_umount(MNTPOINT));
>  		if (TST_RET != 0)
> -			tst_brk(TFAIL | TTERRNO, "umount failed");
> +			tst_brk(TBROK | TTERRNO, "umount failed");
>  		is_mounted = 0;
>  	} else {
>  		tst_res(TFAIL, "new mount fails");
> @@ -108,5 +108,4 @@ static struct tst_test test = {
>  	.mntpoint	= MNTPOINT,
>  	.format_device	= 1,
>  	.all_filesystems = 1,
> -	.dev_fs_flags	= TST_FS_SKIP_FUSE,
>  };
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
