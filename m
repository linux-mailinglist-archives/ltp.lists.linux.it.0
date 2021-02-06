Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA926311FD1
	for <lists+linux-ltp@lfdr.de>; Sat,  6 Feb 2021 20:59:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 59FF13C70A8
	for <lists+linux-ltp@lfdr.de>; Sat,  6 Feb 2021 20:59:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 442543C70A1
 for <ltp@lists.linux.it>; Sat,  6 Feb 2021 20:59:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9CD6A200997
 for <ltp@lists.linux.it>; Sat,  6 Feb 2021 20:59:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC52DAEBA;
 Sat,  6 Feb 2021 19:59:33 +0000 (UTC)
Date: Sat, 6 Feb 2021 20:59:32 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YB71JBi757ong63Y@pevik>
References: <20210129194144.31299-1-pvorel@suse.cz>
 <20210129194144.31299-3-pvorel@suse.cz>
 <CAEemH2ffReVSE_210nyRZVZHOwoMMy-F4Cye08RwPa5bh7PZ0w@mail.gmail.com>
 <YBj8bMKfxqvQ6lYt@pevik>
 <CAEemH2f5tJtgcZG8WaAU1qpKwU7yHDdjzGahhL814goL5sAv-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f5tJtgcZG8WaAU1qpKwU7yHDdjzGahhL814goL5sAv-g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

...
> > > > +get_btrfs_size()


> > > What about renaming at_least_1G_mem() or check_space_for_btrfs()?
> > Good point. I'm slightly for check_space_for_btrfs().

> > at_least_1G_mem() is also good, but for that I'd also move tst_res TINFO
> > "not
> > enough space for Btrfs" out of the function and put it into
> > generate_vars(). But
> > since it's used only for btrfs I slightly prefer check_space_for_btrfs().
> > But no
> > strong opinion about it.


> Agree, thanks!

> Btw I suddenly think that we could have a nicer name initialize_vars()
> to replace generate_vars(), because we just use it once to initiate the
> test variables in the setup phase.
Good idea, thanks!

BTW I tested zram on all filesystems including fuse/*fat/ntfs:
zram01 4 TINFO: make ext2 filesystem on /dev/zram0
zram01 4 TINFO: make ext3 filesystem on /dev/zram1
zram01 4 TINFO: make ext4 filesystem on /dev/zram2
zram01 4 TINFO: make xfs filesystem on /dev/zram3
zram01 4 TINFO: make btrfs filesystem on /dev/zram4
zram01 4 TINFO: make vfat filesystem on /dev/zram5
zram01 4 TINFO: make exfat filesystem on /dev/zram6
zram01 4 TINFO: make ntfs filesystem on /dev/zram7

and it's working well, thus I suggest to test everything available:

-       for fs in $(tst_supported_fs | grep -v -e fat -e ntfs -e fuse); do
+       for fs in $(tst_supported_fs); do

Before sending v3 or just merge with fixes I'm also waiting for Cyril's (or
somebody else) review / suggestions on the timeout (whether simply use -1 for
timeout and drop patch "tst_test.sh: Run _tst_setup_timer after $TST_SETUP")

https://patchwork.ozlabs.org/project/ltp/patch/20210129194144.31299-6-pvorel@suse.cz/
https://patchwork.ozlabs.org/project/ltp/patch/20210129194144.31299-7-pvorel@suse.cz/

Kind regards,
Petr

> Anyway, it's only my feelings and also depends on your preference too.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
