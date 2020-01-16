Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4672913DE33
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 15:59:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F40D83C23A7
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 15:59:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CDCA63C237A
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 15:59:53 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 652531401A4B
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 15:59:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579186789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/9823RxfewgcaLD5zlXF2na4dDHsP2p6hahlxrLJqBs=;
 b=B6C/MV0hvuB15ysfKJj/x5xmfuCfG2Gxoe/9HHkXVqOylMVLscJOh8DVhUI3RuXoVoNxWC
 ro6hl0QLezi7imQnltm8HH8x2MrKsyNtfeNrerVxN62Oj+lPFhUYXx8JEJ5aN6jyorDcJy
 eidu2iU5yhK482e8roRjS/lp5mffTHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-aMzdP0UENuOMqUTjF8uNrw-1; Thu, 16 Jan 2020 09:59:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62352DBA9;
 Thu, 16 Jan 2020 14:59:39 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE7771001281;
 Thu, 16 Jan 2020 14:59:38 +0000 (UTC)
Date: Thu, 16 Jan 2020 23:08:49 +0800
From: Zorro Lang <zlang@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200116150849.GF14282@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
References: <20200116075633.29752-1-zlang@redhat.com>
 <20200116114900.GA4897@rei>
MIME-Version: 1.0
In-Reply-To: <20200116114900.GA4897@rei>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: aMzdP0UENuOMqUTjF8uNrw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

On Thu, Jan 16, 2020 at 12:49:00PM +0100, Cyril Hrubis wrote:
> Hi!
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
> >  .../kernel/syscalls/newmount/newmount01.c     | 112 ++++++++++++++++++
> >  11 files changed, 246 insertions(+)
> >  create mode 100644 include/lapi/newmount.h
> >  create mode 100644 m4/ltp-newmount.m4
> >  create mode 100644 testcases/kernel/syscalls/newmount/.gitignore
> >  create mode 100644 testcases/kernel/syscalls/newmount/Makefile
> >  create mode 100644 testcases/kernel/syscalls/newmount/newmount01.c

[snip]

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
> 
> There is no point in checking if the sys/mount.h exits, it has been
> there for years. You are not using the HAVE_SYS_MOUNT_H macro anywhere in
> the code either.

Hi,

Thanks so much for your review:)

Sure. I don't include <sys/mount.h> in case, due to I don't know how
glibc will deal with these new syscalls, glibc isn't working on that
yet. I'd like to add includes file in the future after we see the glibc
update:)

> 
> > +])
> > diff --git a/runtest/syscalls b/runtest/syscalls
> > index fa87ef63f..bd0725977 100644
> > --- a/runtest/syscalls
> > +++ b/runtest/syscalls
> > @@ -794,6 +794,8 @@ nanosleep01 nanosleep01
> >  nanosleep02 nanosleep02
> >  nanosleep04 nanosleep04
> >  
> > +newmount01 newmount01
> 
> I'm not sure if we shouldn't call the test fsmount01.c since the main
> syscall we are testing here is fsmount().

Yeah.. Although this case uses fsmount(), my later cases about new mount API
might not use it. I don't like the name "newmount0*" either, but I don't have
a better one for now. If anyone has a better name, please feel free to tell
me :)

> 
> >  nftw01 nftw01
> >  nftw6401 nftw6401
> >  
> > diff --git a/testcases/kernel/syscalls/newmount/.gitignore b/testcases/kernel/syscalls/newmount/.gitignore
> > new file mode 100644
> > index 000000000..dc78edd5b
> > --- /dev/null

[snip]

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
> 
> You can't use tst_brk() with TFAIL at the moment. You should either do
> tst_res() followed by return or change the TFAIL to TBROK.

OK, I'll use tst_brk(TBROK | TTERRNO, ...), and change all "tst_brk(TFAIL ...".

> 
> See:
> 
> https://github.com/linux-test-project/ltp/issues/462
> 
> Also this will likely fail on older kernels that does not support the
> syscall. I guess that you will get einval here if the fsopen() is not
> implemented in kernel. You have to at least set the min_kver in the
> tst_test structure so that the test is skipped on older kernels.

If an older downstream kernel (e.g. rhel8/centos kernel-4.18.0-xxx.el8)
merges new mount API features, this case will think the kernel version
is too low to do this test.

I just tested on an old kernel which doesn't support new mount feature.
Then I get this:

  ...
  ...
  tst_test.c:1278: INFO: Testing on xfs
  tst_mkfs.c:90: INFO: Formatting /dev/loop1 with xfs opts='' extra opts=''
  tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
  ../../../../include/lapi/newmount.h:18: CONF: syscall(430) __NR_fsopen not supported

I think it's fine, due to generally we ignore CONF. What do you think?

Thanks,
Zorro

> 
> > +	}
> > +	sfd = TST_RET;
> > +	tst_res(TPASS, "fsopen %s", tst_device->fs_type);
> > +
> > +	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO,
> > +		        "fsconfig set source to %s", tst_device->dev);
> 
> Here as well.
> 
> > +	}
> > +	tst_res(TPASS, "fsconfig set source to %s", tst_device->dev);
> > +
> > +
> > +	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO,
> > +		        "fsconfig create superblock");
> 
> And here as well.
> 
> > +	}
> > +	tst_res(TPASS, "fsconfig create superblock");
> > +
> > +	TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO, "fsmount");
> > +	}
> 
> And here as well.
> 
> Also LKML prefers not to have curly braces around single line blocks.
> 
> See:
> https://www.kernel.org/doc/html/v4.10/process/coding-style.html#placing-braces-and-spaces
> 
> > +	mfd = TST_RET;
> > +	tst_res(TPASS, "fsmount");
> > +	SAFE_CLOSE(sfd);
> > +
> > +	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO, "move_mount attach to mount point");
> > +	}
> 
> Here as well.
> 
> > +	is_mounted = 1;
> > +	tst_res(TPASS, "move_mount attach to mount point");
> > +	SAFE_CLOSE(mfd);
> > +
> > +	if (ismount(MNTPOINT)) {
> > +		tst_res(TPASS, "new mount works");
> > +		TEST(tst_umount(MNTPOINT));
> > +		if (TST_RET != 0)
> > +			tst_brk(TFAIL | TTERRNO, "umount failed");
> 
> Here as well.
> 
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
> > +	.format_device	= 1,
> > +	.all_filesystems = 1,
> > +	.dev_fs_flags	= TST_FS_SKIP_FUSE,
> > +};
> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
