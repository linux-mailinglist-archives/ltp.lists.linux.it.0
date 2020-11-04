Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 903922A64AC
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 13:52:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F22533C5451
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 13:52:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 985B43C2FF3
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 13:52:16 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F104D600967
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 13:52:15 +0100 (CET)
Received: from mail-lj1-f200.google.com ([209.85.208.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kaIGs-00071M-Oh
 for ltp@lists.linux.it; Wed, 04 Nov 2020 12:52:14 +0000
Received: by mail-lj1-f200.google.com with SMTP id p6so7089740ljj.20
 for <ltp@lists.linux.it>; Wed, 04 Nov 2020 04:52:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8CCTh2IrrbwhdP4YjXSTTsOSF01rpEUNIGHn7FlrGxY=;
 b=OWnPwDuWUDXDyUdogBwPomIMpjKQbxB1MiUSgKV5zHyXbLcX4AqhMhLhLD8dt0JZbh
 ByWSkUm/nT14hIAfQryEhSIrHyetLQUHgexBM82VISbxuzyjZABVoToIHH+K22t3+dxV
 AuxiWHFfRiQ5enCM9F5UYGlh58PWawGAQZq/BKxnJlM8aUqJdrRSIr87v8tHgfe9mTzJ
 hhHEJgPnFwta/k5lqc7sJ2Y9ZURBt+08Ji58YxXgcgjbUsF700Ej6HLLzKZD+Grr+ete
 JnawRjaLeJ852SwI8OqfjZBQ4Dc8SNYfYqvs6QpCvfRmtICDnWb4DWrlRSnbflV43pif
 SyQA==
X-Gm-Message-State: AOAM53198tA6JzVA8bp6Wpwc2J4DeGj8r9ph9M1IdIVJqRgGYQ7FrUaR
 nID3n/5iX3HYk3QGKMz6/xS61NQZdmDCy4dlfYAVisFD0QgAP2iigBhivMCEc1Rmpw6lcCNEd4p
 T1RyVTft0NdvwGmzD/scYjiFqssK64OiD+RYDOTMk1T4=
X-Received: by 2002:a2e:61a:: with SMTP id 26mr1452990ljg.35.1604494334040;
 Wed, 04 Nov 2020 04:52:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbv5H1Z5FOgnwcviXCSLTj4HKpWT2V1SC3UV8xKnhWZz7TpO+smCfNtSjnQeiIQMJuO7pJ2+MpVk28meXWuLw=
X-Received: by 2002:a2e:61a:: with SMTP id 26mr1452982ljg.35.1604494333772;
 Wed, 04 Nov 2020 04:52:13 -0800 (PST)
MIME-Version: 1.0
References: <20201104070405.24044-1-po-hsu.lin@canonical.com>
 <5FA25444.1080008@cn.fujitsu.com>
In-Reply-To: <5FA25444.1080008@cn.fujitsu.com>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Wed, 4 Nov 2020 20:52:02 +0800
Message-ID: <CAMy_GT-wq+=oYMgyZsVgpZxJ4vU-6PJR2OfWoPx2L=9jDjRo3g@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCHv2] syscalls/quotactl04: add mkfs.ext4 package
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

On Wed, Nov 4, 2020 at 3:12 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> Hi Po-Hsu
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
> Commit message is also wrong. But I think maintainer will correct this
> and don't need to send a v3.
My apology for this.
That would be great.
Thanks!

> >
> > [1] http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.42.13
> >
> > Signed-off-by: Po-Hsu Lin<po-hsu.lin@canonical.com>
> > Reviewed-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> > ---
> >   testcases/kernel/syscalls/quotactl/quotactl04.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
> > index 73980d7e9..3cc2b974f 100644
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
> > +             tst_brk(TCONF, "Test needs mkfs.ext4>= 1.43 for quota,project option, test skipped");
> > +     pclose(f);
> >       SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
> >       SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
> >       mount_flag = 1;
>
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
