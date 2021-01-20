Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DD52FD151
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 14:32:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37C443C63FD
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 14:32:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D1DF23C2863
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 14:32:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 63549600CEF
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 14:32:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCABEAD6A;
 Wed, 20 Jan 2021 13:32:10 +0000 (UTC)
Date: Wed, 20 Jan 2021 14:33:14 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <YAgxGvg/FXcUq8R6@yuki.lan>
References: <X9tMlNxJbwCWIRnO@yuki.lan> <X/Wq28noppvB5MGw@yuki.lan>
 <20210113095724.214c904a@kmaincent-XPS-13-7390>
 <CA+G9fYv1UFr+7ePC7tLjCY4JPsoQdBdf-6Jpr40zmsoYRWVrdQ@mail.gmail.com>
 <db866679-a5e8-35d6-f57a-18a202c7937b@suse.cz>
 <CA+G9fYvRqOH7D04NHwPQNXKyMzak5bDo=GN3k13tcwV3bwN5Yw@mail.gmail.com>
 <YAgFQnIazPBpkWwL@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAgFQnIazPBpkWwL@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Holidays and LTP release
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
Cc: LTP List <ltp@lists.linux.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > do you mean something like this ?
> > But this change did not solve the problem (ioctl_sg01) i have reported.
> > 
> > diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
> > index f134d90c9..00bf45e9c 100644
> > --- a/lib/tst_memutils.c
> > +++ b/lib/tst_memutils.c
> > @@ -20,7 +20,7 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
> >         struct sysinfo info;
> > 
> >         SAFE_SYSINFO(&info);
> > -       safety = 4096 * SAFE_SYSCONF(_SC_PAGESIZE) / info.mem_unit;
> > +       safety = 8192 * SAFE_SYSCONF(_SC_PAGESIZE) / info.mem_unit;
> 
> Actually Martin sugessted a different patch that chooses the margin to
> be the greater of 4096 pages or 64MB, which would effectivelly set the
> safety to "16384 * SAFE_SYSCONF(_SC_PAGESIZE) / info.mem_unit" on most
> systems.
> 
> Also I've been playing with a VM and I've been able to reproduce
> occasional failures with swap turned off and memory_overcommit set to 1
> that Martin's patch fixed for me.

And it looks like the patch for tst_memutils.c is the last one that
should be taken care of before the release.

It would be nice if you could check if that fixes your failures as well.

However it made the situation better, at least for me, so I will push it
tomorrow morning and proceed with the release.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
