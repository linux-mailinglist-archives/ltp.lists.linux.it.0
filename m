Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA07B2A70B7
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 23:42:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F64E3C3010
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 23:42:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 6B54E3C24CF
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 23:42:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 02646140075F
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 23:42:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2035FABAE;
 Wed,  4 Nov 2020 22:42:23 +0000 (UTC)
Date: Wed, 4 Nov 2020 23:42:21 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20201104224221.GA20360@pevik>
References: <20201104070405.24044-1-po-hsu.lin@canonical.com>
 <5FA25444.1080008@cn.fujitsu.com>
 <CAMy_GT-wq+=oYMgyZsVgpZxJ4vU-6PJR2OfWoPx2L=9jDjRo3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMy_GT-wq+=oYMgyZsVgpZxJ4vU-6PJR2OfWoPx2L=9jDjRo3g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> On Wed, Nov 4, 2020 at 3:12 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> > Hi Po-Hsu
> > > The project quota feature was added in e2fsprogs 1.43 [1]:
> > >    E2fsprogs 1.43 (May 17, 2016)
> > >      Add support for the ext4 metadata checksum, checksum seed, inline
> > >      data, encryption, project quota, and read-only features.

> > > The test should be skipped when running with older package, otherwise
> > > it will fail with:
> > >    Invalid filesystem option set: quota,project

> > > Use popen and fscanf to get mkfs.ext4 -V output for version
> > > comparison. This version checking by adding digits together does not
> > > work with alphabets in the number like rc1, but in that case the test
> > > will still be tested.

> > > It will now be skipped with (Tested with Ubuntu Xenial + 4.15 kernel):
> > >    quotactl04.c:118: TCONF: Test needs mkfs.ext4>= 1.43 for encrypt
> > >    option, test skipped
> > Commit message is also wrong. But I think maintainer will correct this
> > and don't need to send a v3.
> My apology for this.
> That would be great.
> Thanks!

Fixed commit message and merged.
Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
