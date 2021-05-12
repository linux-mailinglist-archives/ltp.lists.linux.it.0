Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBBB37BEF9
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 15:55:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7A233C8AA3
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 15:55:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F03FF3C56A4
 for <ltp@lists.linux.it>; Wed, 12 May 2021 15:55:47 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 146841000F60
 for <ltp@lists.linux.it>; Wed, 12 May 2021 15:55:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 782CEAFD2;
 Wed, 12 May 2021 13:55:46 +0000 (UTC)
Date: Wed, 12 May 2021 15:55:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJveYWhSPvzd9Ehj@pevik>
References: <20210510134739.37512-1-cascardo@canonical.com>
 <YJoh1f4EWtQWlroC@pevik> <20210511103622.GC12149@mussarela>
 <YJvVeOpV2Zt6B31X@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJvVeOpV2Zt6B31X@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkfs: force block size to 1024 for ext3 and ext4
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

Hi,

[Cc Jan]

> Hi!
> > > > /etc/mke2fs.conf will use 1024 block size for small filesystems, which are
> > > > between 3M and 512M. However, on recent versions of Ubuntu, this
> > > > configuration has changed and thet default blocksize is 4096 even for small
> > > > filesystems.

> > > > Force the blocksize to 1024 on ext3 and ext4 filesystems, which will lead
> > > > to the expected results, as journals will take only 1M.

> > > IMHO it'd be better to keep the default, because that covers what end users
> > > actually use.

> > One alternative to forcing the block size is accouting for the journal blocks,
> > but, then, that needs to consider the block size. I think my approach is more
> > simple. We could restrict it to the smaller 16M filesystem, though.

> > What do you think?

> I guess that we should merge your fix in order to have the test working
> for the upcomming release. Then we can discuss if this should be fixed
> differently or not.
Acked-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
