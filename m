Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF2F326C85
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Feb 2021 10:34:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE1EA3C582C
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Feb 2021 10:34:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0C8B33C4CB1
 for <ltp@lists.linux.it>; Sat, 27 Feb 2021 10:34:07 +0100 (CET)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4864B1A007AB
 for <ltp@lists.linux.it>; Sat, 27 Feb 2021 10:34:03 +0100 (CET)
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DnhBh59N2zRJnc
 for <ltp@lists.linux.it>; Sat, 27 Feb 2021 17:32:28 +0800 (CST)
Received: from DGGEML422-HUB.china.huawei.com (10.1.199.39) by
 DGGEML401-HUB.china.huawei.com (10.3.17.32) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Sat, 27 Feb 2021 17:33:58 +0800
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.151]) by
 dggeml422-hub.china.huawei.com ([10.1.199.39]) with mapi id 14.03.0509.000;
 Sat, 27 Feb 2021 17:33:48 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] lib/tst_supported_fs_types.c: Add tmpfs to
 filesystem whitelist
Thread-Index: AdcM6pE6xRSZF98nRKWZYBH1b4S5aQ==
Date: Sat, 27 Feb 2021 09:33:48 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB40387BFA9@dggeml511-mbs.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_supported_fs_types.c: Add tmpfs to
 filesystem whitelist
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> 
> But there is another problem there, since the code still mounts tmpfs on
> tmpdir for a short while, which is temporary directory used by all LTP tests,
> which may potentially break tests that runs in parallel.

	In general, when all_filesystems has been set to 1,  the needs_tmpdir would be set to 1 and the mntpoint must has been set to some path, so the test run in /tmp/tmpxxxxxx/mntpoint and
	other LTP tests would run in another tmpdir. So it has no problem for running in parallel.

	I don't know if I understand it right.
> 
> So we will have to prepare a temporary directory with mkdtemp() under
> the tmpdir as well and pass that to the mount() syscall instead.
>

Thanks so much!

-------------------------------------------------------------------------------------------------------
> 
> Hi!
> > diff --git a/lib/tst_supported_fs_types.c
> > b/lib/tst_supported_fs_types.c index 00ede549d..696b6731e 100644
> > --- a/lib/tst_supported_fs_types.c
> > +++ b/lib/tst_supported_fs_types.c
> > @@ -22,6 +22,7 @@ static const char *const fs_type_whitelist[] = {
> >  	"vfat",
> >  	"exfat",
> >  	"ntfs",
> > +	"tmpfs",
> >  	NULL
> >  };
> >
> > @@ -34,6 +35,10 @@ static int has_mkfs(const char *fs_type)
> >
> >  	sprintf(buf, "mkfs.%s >/dev/null 2>&1", fs_type);
> >
> > +	if (strstr(buf, "mkfs.tmpfs")) {
> > +		return 1;
> > +	}
> > +
> >  	ret = tst_system(buf);
> >
> >  	if (WEXITSTATUS(ret) == 127) {
> > @@ -55,8 +60,8 @@ static int has_kernel_support(const char *fs_type,
> int flags)
> >  	if (!tmpdir)
> >  		tmpdir = "/tmp";
> >
> > -	mount("/dev/zero", tmpdir, fs_type, 0, NULL);
> > -	if (errno != ENODEV) {
> > +	ret = mount("/dev/zero", tmpdir, fs_type, 0, NULL);
> 
> The manual page explicitly says that errno is set to ENODEV if filesystem is
> not supported by kernel. So the check for errno should stay, since the
> statement above will fail to mount any real filesystem since we pass
> "/dev/zero" instead of valid filesystem image there.
> 
> I.e. if we pass a real filesystem there it will either fail with EINVAL (since
> /dev/zero does not have a valid superblock) or ENODEV if there is no
> kernel driver for the filesystem.
> 
> > +	if (!ret) {
> 
> I guess that tmpfs succeeds to mount there. So I guess that we should
> change the condition to:
> 
> 	if ((ret && errno != ENODEV) || !ret) {
> 		if (!ret)
> 			tst_umount(tmpdir);
> 
> 		tst_res(TINFO, "Kernel supports %s", fs_type);
> 		return 1;
> 	}
> 
> 
> But there is another problem there, since the code still mounts tmpfs on
> tmpdir for a short while, which is temporary directory used by all LTP tests,
> which may potentially break tests that runs in parallel.
> 
> So we will have to prepare a temporary directory with mkdtemp() under
> the tmpdir as well and pass that to the mount() syscall instead.
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
