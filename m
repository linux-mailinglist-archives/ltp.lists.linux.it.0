Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E60B836AB
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 18:27:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10CFD3C1CDE
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 18:27:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A237B3C18F7
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 18:27:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5D6D6600724
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 18:27:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C7B56AE6D;
 Tue,  6 Aug 2019 16:27:04 +0000 (UTC)
Date: Tue, 6 Aug 2019 18:27:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <jencce.kernel@gmail.com>
Message-ID: <20190806162703.GA1333@dell5510>
References: <20190730110555.GB7528@rei.lan>
 <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564569629-2358-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190805065832.ti6vpoviykfaxcj7@XZHOUW.usersys.redhat.com>
 <5D47D6B9.9090306@cn.fujitsu.com>
 <20190805102211.pvyufepn6xywi7vm@XZHOUW.usersys.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805102211.pvyufepn6xywi7vm@XZHOUW.usersys.redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 3/3] syscalls/copy_file_range02: increase
 coverage and remove EXDEV test
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

Hi Murphy,

> On Mon, Aug 05, 2019 at 03:11:53PM +0800, Yang Xu wrote:
> > on 2019/08/05 14:58, Murphy Zhou  wrote:

> > > > + * 13) Try to copy contents to a file with target file range
> > > > >  + *     beyond maximum supported file size ->EFBIG
> > > Test 13) fails on latest Linus tree. Is there any report or working on this?
> > Hi Murphy

> >    Test 13)  passed on my system(64bit, 5.2.0+, ext4,vfat,btrfs,xfs ).
> >    Do you provide more infomation(filesystem, 32bit or 64bit)?

> All of them, ext234 xfs and vfat. 64bit
Hi, I can confirm that. Also fails on btrfs.

> copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
I got this one as well. I tested it today again with 5.3.0-rc3+ 0eb0ce0 ("Merge
tag 'spi-fix-v5.3-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi")
and got this error:

copy_file_range02.c:130: FAIL: copy_file_range failed unexpectedly; expected EFBIG, but got: EINVAL

But that is caused by tmpfs used as TMPDIR, going to send a patch fixing it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
