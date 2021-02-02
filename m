Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C452530B87B
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 08:17:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C9623C7452
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 08:17:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4058F3C2EEA
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 08:17:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B6526600909
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 08:17:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDCACAC41;
 Tue,  2 Feb 2021 07:17:01 +0000 (UTC)
Date: Tue, 2 Feb 2021 08:17:00 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YBj8bMKfxqvQ6lYt@pevik>
References: <20210129194144.31299-1-pvorel@suse.cz>
 <20210129194144.31299-3-pvorel@suse.cz>
 <CAEemH2ffReVSE_210nyRZVZHOwoMMy-F4Cye08RwPa5bh7PZ0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2ffReVSE_210nyRZVZHOwoMMy-F4Cye08RwPa5bh7PZ0w@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/6] zram01.sh: Generate test setup variables
 in setup
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

> Hi Petr,

> Petr Vorel <pvorel@suse.cz> wrote:

> > ...

> > diff --git a/testcases/kernel/device-drivers/zram/zram01.sh
> > b/testcases/kernel/device-drivers/zram/zram01.sh
> > index a795ff89f..c5d4a3e51 100755
> > --- a/testcases/kernel/device-drivers/zram/zram01.sh
> > +++ b/testcases/kernel/device-drivers/zram/zram01.sh
> > @@ -8,23 +8,25 @@

> >  TST_CNT=7
> >  TST_TESTFUNC="do_test"
> > -TST_NEEDS_CMDS="awk bc dd"
> > +TST_NEEDS_CMDS="awk bc dd grep"
> >  . zram_lib.sh
> > +TST_SETUP="setup"

> > -# List of parameters for zram devices.
> > -# For each number the test creates own zram device.
> > -zram_max_streams="2 3 5 8"
> > -
> > -FS_SIZE="402653184"
> > -FS_TYPE="btrfs"
> > +get_btrfs_size()


> What about renaming at_least_1G_mem() or check_space_for_btrfs()?
Good point. I'm slightly for check_space_for_btrfs().

at_least_1G_mem() is also good, but for that I'd also move tst_res TINFO "not
enough space for Btrfs" out of the function and put it into generate_vars(). But
since it's used only for btrfs I slightly prefer check_space_for_btrfs(). But no
strong opinion about it.

Thanks for your review!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
