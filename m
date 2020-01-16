Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4288813D953
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 12:52:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F0143C2379
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 12:52:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C183C3C2284
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 12:52:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4BEF610009E4
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 12:52:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F1F4EB1B9;
 Thu, 16 Jan 2020 11:52:28 +0000 (UTC)
Date: Thu, 16 Jan 2020 12:52:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Zorro Lang <zlang@redhat.com>
Message-ID: <20200116115227.GA19435@dell5510>
References: <20200116075633.29752-1-zlang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116075633.29752-1-zlang@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Zorro,

> Linux supports new mount syscalls from 5.2, so add new test cases
> to cover these new API. This newmount01 case make sure new API -
> fsopen(), fsconfig(), fsmount() and move_mount() can mount a
> filesystem, then can be unmounted.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Hi,

> V4 made a few changes as https://patchwork.ozlabs.org/patch/1206389/#2341154

> And as I said in https://patchwork.ozlabs.org/comment/2342190, the
> TST_FS_SKIP_FUSE flag won't help to skip linux kernel internal ntfs and
> vfat test for this case.
+1

...
> --- /dev/null
> +++ b/m4/ltp-newmount.m4
> @@ -0,0 +1,10 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
> +
> +AC_DEFUN([LTP_CHECK_NEWMOUNT],[
> +AC_CHECK_FUNCS(fsopen,,)
> +AC_CHECK_FUNCS(fsconfig,,)
> +AC_CHECK_FUNCS(fsmount,,)
> +AC_CHECK_FUNCS(move_mount,,)
> +AC_CHECK_HEADER(sys/mount.h,,,)
> +])
This should have been in configure.ac as I reported, but that's ok
(can be fixed by person who merges this).

...
> +static struct tst_test test = {
> +	.test_all	= test_newmount,
> +	.cleanup	= cleanup,
> +	.needs_root	= 1,
> +	.mntpoint	= MNTPOINT,
> +	.format_device	= 1,
> +	.all_filesystems = 1,
> +	.dev_fs_flags	= TST_FS_SKIP_FUSE,
OK, I was wrong, as you found in [1], test shouldn't have .dev_fs_flags   = TST_FS_SKIP_FUSE
(again, can be removed during merge).

I'm just trying to find whether failure caused by CONFIG_NTFS_FS not set,
but mkfs.ntfs installed is a LTP issue or mkfs.ntfs or a kernel issue.

tst_supported_fs_types.c:60: INFO: Kernel supports vfat
tst_supported_fs_types.c:44: INFO: mkfs.vfat does exist
tst_supported_fs_types.c:85: INFO: Filesystem exfat is not supported
tst_supported_fs_types.c:95: INFO: FUSE does support ntfs
tst_supported_fs_types.c:44: INFO: mkfs.ntfs does exist
...
newmount01.c:60: PASS: fsopen vfat
newmount01.c:67: PASS: fsconfig set source to /dev/loop0
newmount01.c:75: PASS: fsconfig create superblock
newmount01.c:82: PASS: fsmount
newmount01.c:90: PASS: move_mount attach to mount point
newmount01.c:94: PASS: new mount works
tst_test.c:1278: INFO: Testing on ntfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ntfs opts='' extra opts=''
The partition start sector was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
The number of sectors per track was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
The number of heads was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
To boot from a device, Windows needs the 'partition start sector', the 'sectors per track' and the 'number of heads' to be set.
Windows will not be able to boot from this device.
tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s
newmount01.c:56: FAIL: fsopen ntfs: ENODEV (19)

Kind regards,
Petr

[1] https://lists.linux.it/pipermail/ltp/2020-January/015046.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
