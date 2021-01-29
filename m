Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CCE3089D7
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 16:22:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18CDA3C77E6
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 16:22:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id DC2D33C2F70
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 16:22:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3B6C01401174
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 16:22:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63D9FABDA;
 Fri, 29 Jan 2021 15:22:35 +0000 (UTC)
Date: Fri, 29 Jan 2021 16:22:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <YBQoOX2FLtig8rYQ@pevik>
References: <20210128171052.6025-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128171052.6025-1-kory.maincent@bootlin.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] quota_remount_test01: update to new API
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
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Kory,

> Update to new API
> Add test on quota_v2 driver to avoid the above error:
>   quotaon: Quota format not supported in kernel.
+1

...
> +TST_NEEDS_CMDS=3D"quotacheck quotaon mkfs.ext3"
TST_NEEDS_CMDS=3D"dd mkfs.ext3 mount quota quotacheck quotaon sed tail"
sed and tail are a bit paranoic but it helps to run everywhere.

> +TST_NEEDS_DRIVERS=3D"quota_v2"
> +TST_NEEDS_TMPDIR=3D1
> +TST_SETUP=3Ddo_setup
> +TST_CLEANUP=3Ddo_clean
> +TST_TESTFUNC=3Ddo_test

TST_NEEDS_ROOT=3D1
mount requires root.

...
> +do_setup()
> +{
> +	if tst_kvcmp -lt "2.6.25"; then
> +	        tst_res TCONF "Remounting with quotas enabled is not supported!"
> +	        tst_brk TCONF "You should have kernel 2.6.26 and above running.=
...."
Please when using TCONF, use it only once (tst_brk TCONF "test require 2.6.=
26")
But new API has TST_MIN_KVER=3D"2.6.26" which is better for this test, tst_=
kvcmp
is needed for some special cases (skipping only single test etc).

> +	fi
> +
> +	if [ ! -d /proc/sys/fs/quota ]; then
> +	        tst_brk TCONF "Quota not supported in kernel!"
> +	        exit 0
> +	fi
> +	MNTDIR=3D$TMPDIR/mnt
> +	IMAGE=3Dltp-$$-fs-image
> +	dd if=3D/dev/zero of=3D$IMAGE bs=3D4096 count=3D8000 2>/dev/null
> +	mkfs.ext3 -q -F -b 4096 $IMAGE
> +	mkdir $MNTDIR
> +}

> +do_clean()
>  {
>  	umount 2>/dev/null $MNTDIR
>  	rm 2>/dev/null $IMAGE

Cleanup should use tst_umount, removing file is not necessary.
And there should be guarded with flag to try umount only when mounted:

do_clean()
{
	[ "$mounted" ] || return
	tst_umount $MNTDIR
}

And in do_test():

ROD mount -t ext3 -o loop,usrquota,grpquota $IMAGE $MNTDIR
mounted=3D1

> +do_test()
> +{
> +	EXPECT_PASS mount -t ext3 -o loop,usrquota,grpquota $IMAGE $MNTDIR
> +	tst_res TINFO "Successfully mounted the File System"
Here I'd use just ROD instead of EXPECT_PASS. ROD is used on preparation
commands, on failure ($? -ne 0) prints the command and quit testing,
which is required here (there is no point to continue if mount fails.
If this were subject of testing EXPECT_PASS_BRK could be used
(EXPECT_PASS just TFAIL, but continue testing).

But I'd use ROD for most of the commands, IMHO only $BLOCKS -eq $NEWBLOCKS =
check
is the test case. Or am I wrong?

tst_res TINFO messages are definitely useless (regardless whether ROD or
EXPECT_PASS* is used) + we don't use that camel case.

NOTE mount is here and not in setup to allow running test more than once
with -iN (N is a positive number).

	ROD mount -t ext3 -o loop,usrquota,grpquota $IMAGE $MNTDIR
	mounted=3D1

> +
> +	# some distros (CentOS 6.x, for example) doesn't permit creating
> +	# of quota files in a directory with SELinux file_t type
> +	if [ -x /usr/sbin/selinuxenabled ] && /usr/sbin/selinuxenabled; then
> +		chcon -t tmp_t $MNTDIR || tst_brk TFAIL "Could not change SELinux file=
 type"
Not sure if "Could not change SELinux file type" is bug or configuration is=
sue.
I'd personally consider it as config issue and use TCONF here. But maybe I'm
wrong.

> +		tst_res TINFO "Successfully changed SELinux file type"
> +	fi
> +
> +	EXPECT_PASS quotacheck -cug $MNTDIR
> +	tst_res TINFO "Successfully Created Quota Files"
> +
> +	EXPECT_PASS quotaon -ug $MNTDIR
> +	tst_res TINFO "Successfully Turned on Quota"
> +
> +	EXPECT_PASS echo "blah" />$MNTDIR/file
> +	tst_res TINFO "Successfully wrote to the filesystem"
> +
> +	# Get current quota usage
> +	BLOCKS=3D`quota  -f $MNTDIR -v -w | tail -n 1 | sed -e 's/ *[^ ]* *\([0=
-9]*\) .*/\1/'`
> +	EXPECT_PASS mount -o remount,ro $MNTDIR
> +	tst_res TINFO "Successfully Remounted Read-Only FS"
> +
> +	EXPECT_PASS mount -o remount,rw $MNTDIR
> +	tst_res TINFO "Successfully Remounted Read-Write FS"
> +
> +	rm $MNTDIR/file
> +	# Get quota usage after removing the file
> +	NEWBLOCKS=3D`quota  -f $MNTDIR -v -w | tail -n 1 | sed -e 's/ *[^ ]* *\=
([0-9]*\) .*/\1/'`
> +	# Has quota usage changed properly?
> +	if [ $BLOCKS -eq $NEWBLOCKS ]; then
> +	   tst_brk TWARN "Usage did not change after remount"
I consider this as an error.

On one of my VM I see
Error relocating /usr/bin/quota: reallocarray: symbol not found
quota_remount_test01 1 TWARN: usage did not change after remount
=3D> obviously quota needs some fix here :).

> +	fi
> +	tst_res TINFO "Usage successfully Changed after Remount"
> +	tst_res TPASS "Quota on Remount Successfull"
> +}
...

I suggest to merge this (adapting test for more runs, using ROD, adding
get_blocks(), ...).
Just waiting Jan and Li for info about SELinux.

Kind regards,
Petr

#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (c) Jan Kara <jack@suse.cz>, 2008
# Copyright (c) International Business Machines  Corp., 2009
# Copyright (c) K=F6ry Maincent <kory.maincent@bootlin.com> 2021
# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>

TST_NEEDS_CMDS=3D"dd mkfs.ext3 mount quota quotacheck quotaon sed tail"
TST_NEEDS_DRIVERS=3D"quota_v2"
TST_NEEDS_ROOT=3D1
TST_NEEDS_TMPDIR=3D1
TST_SETUP=3Ddo_setup
TST_CLEANUP=3Ddo_clean
TST_TESTFUNC=3Ddo_test
TST_MIN_KVER=3D"2.6.26"

. tst_test.sh

do_setup()
{
	if [ ! -d /proc/sys/fs/quota ]; then
		tst_brk TCONF "quota not supported in kernel"
	fi

	MNTDIR=3D"mnt.$$"
	IMAGE=3D"ltp-$$-fs-image"
	ROD dd if=3D/dev/zero of=3D$IMAGE bs=3D4096 count=3D8000 2>/dev/null
	ROD mkfs.ext3 -q -F -b 4096 $IMAGE
	mkdir $MNTDIR
}

do_clean()
{
	[ "$mounted" ] || return
	tst_umount $MNTDIR
	mounted=3D
}

get_blocks()
{
	quota -f $MNTDIR -v -w | tail -n 1 | sed -e 's/ *[^ ]* *\([0-9]*\) .*/\1/'
}

do_test()
{
	tst_res TINFO "testing quota on remount"

	local blocks newblocks

	ROD mount -t ext3 -o loop,usrquota,grpquota $IMAGE $MNTDIR
	mounted=3D1

	# some distros (CentOS 6.x, for example) doesn't permit creating
	# of quota files in a directory with SELinux file_t type
	if tst_selinux_enabled &&
		tst_cmd_available chcon && ! chcon -t tmp_t $MNTDIR; then
			tst_brk TCONF "could not change SELinux file type"
	fi

	ROD quotacheck -cug $MNTDIR
	ROD quotaon -ug $MNTDIR
	ROD echo "blah" />$MNTDIR/file

	blocks=3D$(get_blocks)
	ROD mount -o remount,ro $MNTDIR
	ROD mount -o remount,rw $MNTDIR

	ROD rm $MNTDIR/file
	newblocks=3D$(get_blocks)

	if [ $blocks -eq $newblocks ]; then
	   tst_brk TFAIL "usage did not change after remount"
	fi

	tst_res TPASS "quota on remount passed"

	do_clean
}

tst_run

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
