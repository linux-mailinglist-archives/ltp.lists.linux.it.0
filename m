Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF7169E5E
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 07:27:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 366BC3C223C
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 07:27:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C739A3C20BC
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 07:27:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 05C691000D3D
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 07:27:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D452AAE3C;
 Mon, 24 Feb 2020 06:27:26 +0000 (UTC)
Date: Mon, 24 Feb 2020 07:27:24 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200224062724.GA2436981@x230>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <aab7ae7e324c40e8e995ff381384a402d2aba8f5.1582104018.git.viresh.kumar@linaro.org>
 <20200220170425.GB15699@gacrux.arch.suse.de>
 <20200224031847.4nbao5too3vuyfqx@vireshk-i7>
 <f203c3d7-cfc3-3be8-f6d1-01010e9391e3@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f203c3d7-cfc3-3be8-f6d1-01010e9391e3@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 04/10] syscalls/fsopen: New tests
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 Vikas.Kumar2@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > On 20-02-20, 18:04, Petr Vorel wrote:
> > > However I have problem on fsopen01 and fsmount02.
> > > mkfs.vfat: Partitions or virtual mappings on device '/dev/loop0', not making
> > > filesystem (use -I to override)
> > > tst_mkfs.c:100: BROK: tst_test.c:830: mkfs.vfat failed with 1

> > > .dev_fs_flags = TST_FS_SKIP_FUSE helps with exfat and ntfs, but this also fails
> > > on vfat.

> > > This is tested on system with CONFIG_VFAT_FS=m and CONFIG_FAT_FS=m, vfat and fat
> > > are loaded by mkfs.vfat. IMHO we need something like TST_FS_SKIP_EXFAT | TST_FS_SKIP_FAT | TST_FS_SKIP_NTFS | TST_FS_SKIP_FUSE
> > > i.e. explicitly say what FS is not wanted no matter whether it's fuse or not.

> > > Or maybe just TST_FS_SKIP_FAT | TST_FS_SKIP_FUSE would be enough.

> > > NOTE: flags TST_FS_SKIP_EXFAT, TST_FS_SKIP_FAT, TST_FS_SKIP_NTFS do not exists yet.

> > I am not sure what should be done here.
> I guess petr may want to let you add TST_FS_SKIP_FAT flag like  adding
> TST_FS_SKIP_FUSE flag in commit dbe56e52bc50("ib: Add flags to
> tst_get_supported_fs_types()").
Yes, that's what I meant.
This was meant as a question whether there is simpler solution than this
(it's easy to implement it, but I might have overlook something - it might be
fixed even without it).

> Best Regards
> Yang Xu

> > @Cyril ?




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
