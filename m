Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C1F2F7327
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 07:59:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B52893C3122
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 07:58:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6EC883C2365
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 07:58:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9EDA160128A
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 07:58:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C55A1AA6F;
 Fri, 15 Jan 2021 06:58:55 +0000 (UTC)
Date: Fri, 15 Jan 2021 07:58:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YAE9Lkgj09qVupsN@pevik>
References: <20210114183226.794-1-pvorel@suse.cz>
 <CAEemH2cQRNQ3_sko-rBSNf4hgR0p3a5sp1qXgpyXoY1T4aOf7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cQRNQ3_sko-rBSNf4hgR0p3a5sp1qXgpyXoY1T4aOf7Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] zram: Check properly command dependencies
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

...
> > diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh
> > b/testcases/kernel/device-drivers/zram/zram_lib.sh
> > index 3f4d1d55f..1a611b974 100755
> > --- a/testcases/kernel/device-drivers/zram/zram_lib.sh
> > +++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
> > @@ -178,13 +178,30 @@ zram_swapoff()
> >  zram_makefs()
> >  {
> >         tst_require_cmds mkfs
> > +
> > +       local default_fs fs
> >         local i=0

> > +       for fs in $zram_filesystems ext2; do
> > +               if tst_supported_fs $fs 2> /dev/null; then
> > +                       default_fs="$fs"
> > +                       break
> > +               fi
> > +       done


> This workaround makes some sense but a bit overlap to traverse
>  $zram_filesystems.
Not sure if I understand you.

> Maybe we can remove the unsupported filesystems from $zram_filesystems
> list via tst_supported_fs and tst_cmd_available, to avoid involving that
> additional
> variable 'default_fs', then in following test if $zram_filesystems is a
> null string
> just exit with TCONF directly?

I understood, that there must be 4 runs, because 4 /dev/zram* has been used
(dev_num=4). Do you mean to check supported systems in the setup (it'd be safer
to move the calculation to the setup) and lower dev_num if needed?

And tst_cmd_available is not needed, because tst_supported_fs checks also for
mkfs.foo presence.

Also further cleanup after release: it'd make sense to move zram_makefs and
zram_mount to zram01.sh, which is the only test which use them. And zram_makefs
uses $zram_filesystems.
Or keep them in zram_lib.sh, but pass $zram_filesystems to zram_makefs as a
parameter. Current state is confusing a bit.

Kind regards,
Petr

> > +
> > +       if [ -z "$default_fs" ]; then
> > +               tst_res TINFO "supported filesystems"
> > +               tst_supported_fs > /dev/null
> > +               tst_brk TCONF "missing kernel support or mkfs for all of
> > these filesystems: $zram_filesystems"
> > +       fi
> > +
> >         for fs in $zram_filesystems; do
> > -               # if requested fs not supported default it to ext2
> > -               tst_supported_fs $fs 2> /dev/null || fs=ext2
> > +               # use default if requested fs not supported or missing mkfs
> > +               tst_supported_fs $fs 2> /dev/null && tst_cmd_available
> > mkfs.$fs \
> > +                       || fs=$default_fs

> >                 tst_res TINFO "make $fs filesystem on /dev/zram$i"
> > +
> >                 mkfs.$fs /dev/zram$i > err.log 2>&1
> >                 if [ $? -ne 0 ]; then
> >                         cat err.log
> > --
> > 2.29.2

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
