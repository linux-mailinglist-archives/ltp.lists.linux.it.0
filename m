Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A2C310A20
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 12:21:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E28FA3C70E4
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 12:21:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2F9193C4F3B
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 12:21:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CD13C1001277
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 12:21:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 069E3AD29;
 Fri,  5 Feb 2021 11:21:29 +0000 (UTC)
Date: Fri, 5 Feb 2021 12:21:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YB0qN81cEWoViy9l@pevik>
References: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
 <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2f_mvjt4couA++RcOf9bAMO8fnqapkgG59Qvs9Ud-2SHw@mail.gmail.com>
 <601CF76D.8020705@cn.fujitsu.com>
 <CAEemH2dwK-mabPKHKboFePgrABHDNe35XD-8ed4cjgp3yr7cLg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dwK-mabPKHKboFePgrABHDNe35XD-8ed4cjgp3yr7cLg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/5] tst_mallinfo.c: Add a common print helper
 for mallinfo
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

Hi Xu, Li,

> > >     --- /dev/null
> > >     +++ b/include/tst_mallinfo.h

> > > Do we really need to export this function into the LTP library?
> > > (I assumed no other tests will using this lib function anymore)
> > Maybe we can add tst_print_mallinfo2 in the future and mallinfo2() case
> > can use this header.


> Or put it into the tst_memutils.h, I guess this header file is a
> general-purpose for providing kinds of memory helpers.

Either ways are ok for me. tst_memutils.h is a bit cleaner approach,
but given the fact that not many tests will use it having it in
into testcases/kernel/syscalls/mallinfo/ and source it with relative path in
mallopt01.c is also ok for me.

Kind regards,
Petr

> > > So I prefer to create a common header file as:
> > > ../syscalls/mallinfo/mallinfo_common.h,
> > > and just use it locally.

> > > If you're hoping mallopt01.c also benefits from it, only need to
> > > build something like mallinfo_commo.o via Makefile and include
> > > it in mallopt01.c by "../mallinfo/mallinfo_common.h".
> > Just want to avoid random makefile. I am not sure which way is better.
> > Let's listen advise from other maintainers.


> Sure, my pleasure to hear more voice~

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
