Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7529F37AAB0
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 17:28:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A5533C8BE4
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 17:28:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B885D3C26FF
 for <ltp@lists.linux.it>; Tue, 11 May 2021 17:28:17 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E63A41A01072
 for <ltp@lists.linux.it>; Tue, 11 May 2021 17:28:16 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=mussarela)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <cascardo@canonical.com>)
 id 1lgUIx-0008Nn-EY; Tue, 11 May 2021 15:28:15 +0000
Date: Tue, 11 May 2021 12:28:10 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20210511152810.GF12149@mussarela>
References: <20210510134739.37512-1-cascardo@canonical.com>
 <YJoh1f4EWtQWlroC@pevik> <20210511103622.GC12149@mussarela>
 <YJqSZ56ua/Ky0BmY@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJqSZ56ua/Ky0BmY@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, May 11, 2021 at 04:19:19PM +0200, Petr Vorel wrote:
> Hi,
> 
> > On Tue, May 11, 2021 at 08:19:01AM +0200, Petr Vorel wrote:
> > > Hi,
> 
> > > > ext3 and ext4 filesystems will reserve at least 1024 blocks for the
> > > > journal.  With a blocksize of 4096, this will be 25% of the filesystem size
> > > > without accounting for any other overhead.
> > > Is that any actual problem?
> 
> > It causes the test to fail.
> >      mkfs01 2 TFAIL: 'mkfs -t ext4  /dev/loop0 16000' failed, unexpected size.
> 
> > The filesystem size is very small, 16K 1k blocks, and we test that there are at
> > least 80% of that available. As I said, the journal takes at least 1024 blocks,
> > and with 4k blocks, that is too much overhead.
> 
> Have you checked if d44387457 ("mkfs: relax size check") fixes the issue?
> 
> https://github.com/linux-test-project/ltp/commit/d4438745751dc4b0faa50063f9a0d9542f0ceaac
> 
> Kind regards,
> Petr
> 

It does not. That would have to move to something below 80%.

Cascardo.

> > > > /etc/mke2fs.conf will use 1024 block size for small filesystems, which are
> > > > between 3M and 512M. However, on recent versions of Ubuntu, this
> > > > configuration has changed and thet default blocksize is 4096 even for small
> > > > filesystems.
> 
> > > > Force the blocksize to 1024 on ext3 and ext4 filesystems, which will lead
> > > > to the expected results, as journals will take only 1M.
> 
> > > IMHO it'd be better to keep the default, because that covers what end users
> > > actually use.
> 
> > One alternative to forcing the block size is accouting for the journal blocks,
> > but, then, that needs to consider the block size. I think my approach is more
> > simple. We could restrict it to the smaller 16M filesystem, though.
> 
> > What do you think?
> 
> > Thanks.
> > Cascardo.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
