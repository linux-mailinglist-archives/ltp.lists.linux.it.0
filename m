Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0B2A5E7C
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 08:01:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 417CF3C5452
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 08:01:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 647B23C2507
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 08:01:21 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 22A751A01440
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 08:01:20 +0100 (CET)
Received: from mail-lf1-f71.google.com ([209.85.167.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kaCnH-0002dP-U3
 for ltp@lists.linux.it; Wed, 04 Nov 2020 07:01:20 +0000
Received: by mail-lf1-f71.google.com with SMTP id j22so1828153lfh.3
 for <ltp@lists.linux.it>; Tue, 03 Nov 2020 23:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RokDy90Xn0fYgFUzZjkqOiHxuSbOTr11iDHV6vk4ccM=;
 b=tKn6QYK0k1iK/bGCSLC5kdM+46R9/aaW9RPcpFPR+fbPLQ4atbsqwVBczHz2bPX2NF
 QzUJQpdCdjIZpw1aashhQE+O7YwGHJplazzep46C9G5WZSOKHxH4/ClAQpvwF6dMzR9h
 Uy2DB+m+JEQXl2NDi8Dgt41KK45qvkrxUMUWVMewAw42/hPiditp56AWasG/S/Rc3ajR
 ld9cZ0/763j26EXuQ3BoGGeHohEvsmUpkWXE6X6ATl/Ior4xPcTqDc8h9Zf44mEpxaoC
 BcoIBdI00LNeVPvy2wrv6tx/2IHnkPE4V5nMYSZ3lMPTndo3aYVycmMK+XCwA09+bb/+
 Ewhg==
X-Gm-Message-State: AOAM532THX0qe/+5n8tmrta+XpLioe8AUv6mnhoCneJhGuJFZe7vDEuU
 HSl0ClyjlHQRkP9Bgf6Iv8qX0uygdskzJtJm0AkRD2GQY74k1TC57XA5aFmcNmEyC3ZsyTHRlo7
 HKQn27vTJ2SrubBdP5k0xS9hSCelkg+xfGATczEvqr3w=
X-Received: by 2002:ac2:5931:: with SMTP id v17mr793802lfi.52.1604473279215;
 Tue, 03 Nov 2020 23:01:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdM1w/GhMlhJGGzwbuioiNssclYF+8MtUFKfrwRqmerSzjvFf/r/q/TAMpfJ5Sjvz9mFnvqkxnT9fMvWaBmnw=
X-Received: by 2002:ac2:5931:: with SMTP id v17mr793791lfi.52.1604473278855;
 Tue, 03 Nov 2020 23:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20201104041544.17048-1-po-hsu.lin@canonical.com>
 <5FA2321D.30907@cn.fujitsu.com>
In-Reply-To: <5FA2321D.30907@cn.fujitsu.com>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Wed, 4 Nov 2020 15:01:07 +0800
Message-ID: <CAMy_GT8uVNzP=Q9aXS0nxXnMiZJhKQuB3RiRuqDNuYgwOrUKxQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/quotactl04: add mkfs.ext4 package
 version check
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

On Wed, Nov 4, 2020 at 12:46 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> Hi Po-hsu
>
> > The project quota feature was added in e2fsprogs 1.43 [1]:
> >    E2fsprogs 1.43 (May 17, 2016)
> >      Add support for the ext4 metadata checksum, checksum seed, inline
> >      data, encryption, project quota, and read-only features.
> >
> > The test should be skipped when running with older package, otherwise
> > it will fail with:
> >    Invalid filesystem option set: quota,project
> >
> > Use popen and fscanf to get mkfs.ext4 -V output for version
> > comparison. This version checking by adding digits together does not
> > work with alphabets in the number like rc1, but in that case the test
> > will still be tested.
> >
> > It will now be skipped with (Tested with Ubuntu Xenial + 4.15 kernel):
> >    quotactl04.c:118: TCONF: Test needs mkfs.ext4>= 1.43 for encrypt
> >    option, test skipped
> >
> > [1] http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.42.13
> >
> > Signed-off-by: Po-Hsu Lin<po-hsu.lin@canonical.com>
> > ---
> >   testcases/kernel/syscalls/quotactl/quotactl04.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
> > index 73980d7e9..1cef8fcf3 100644
> > --- a/testcases/kernel/syscalls/quotactl/quotactl04.c
> > +++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
> > @@ -19,6 +19,8 @@
> >    * 7) quotactl(2) succeeds to get disk quota limit greater than or equal to
> >    *    ID with Q_GETNEXTQUOTA flag for project.
> >    * 8) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for project.
> > + *
> > + * Minimum e2fsprogs version required is 1.43.
> >    */
> >
> >   #include<errno.h>
> > @@ -28,6 +30,7 @@
> >   #include<sys/stat.h>
> >   #include "config.h"
> >   #include "lapi/quotactl.h"
> > +#include "tst_safe_stdio.h"
> >   #include "tst_test.h"
> >
> >   #ifndef QFMT_VFS_V1
> > @@ -102,9 +105,18 @@ static struct tcase {
> >
> >   static void setup(void)
> >   {
> > +     FILE *f;
> >       const char *const fs_opts[] = {"-I 256", "-O quota,project", NULL};
> > +     int rc, major, minor, patch;
> >
> >       test_id = geteuid();
> > +     f = SAFE_POPEN("mkfs.ext4 -V 2>&1", "r");
> > +     rc = fscanf(f, "mke2fs %d.%d.%d",&major,&minor,&patch);
> > +     if (rc != 3)
> > +             tst_res(TWARN, "Unable parse version number");
> > +     else if (major * 10000 + minor * 100 + patch<  14300)
> > +             tst_brk(TCONF, "Test needs mkfs.ext4>= 1.43 for encrypt option, test skipped");
>
> Test needs quota,project instead of encrypt option,
> other than this, it looks good to me
Ah sorry, it's a copy from another patch, I will resend this one.
Thanks!

>
> Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>
> > +     pclose(f);
> >       SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
> >       SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
> >       mount_flag = 1;
>
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
