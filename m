Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FFF187BB3
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 10:04:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F8EE3C55C7
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 10:04:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A03953C03B2
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 10:04:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 00FFA10011C3
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 10:04:14 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F0966AC62;
 Tue, 17 Mar 2020 09:04:13 +0000 (UTC)
Date: Tue, 17 Mar 2020 10:04:12 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200317090412.GA31467@dell5510>
References: <20200313141458.GB21248@dell5510>
 <CAEemH2cNc7pCc-wB=4hGVquJT1Y5NCeZ_z8nH6D9V+J_5o_TWw@mail.gmail.com>
 <20200317081547.GA15989@dell5510>
 <CAEemH2dCckuUw=x-yKpBe4FpjTdovytSqpOoRSTFiR96_ECeDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dCckuUw=x-yKpBe4FpjTdovytSqpOoRSTFiR96_ECeDA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Define minimal supported kernel and (g)libc version
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

> > The oldest system in travis we have CentOS 6: kernel-2.6.32 / glibc-2.12 /
> > gcc-4.4.7 (clang-3.4.2, but we don't test it with clang). I'm ok to have
> > this
> > older dependency, just to make sure it builds.  But code would be cleaner
> > for
> > sure if we drop it.

> +1
> Sounds good to me.
I'm sorry, are you for removing CentOS 6 from Travis or not?


> > BTW I also occasionally test build on SLES 11-SP3 (kernel 3.0 /
> > glibc-2.11.3 /
> > gcc-4.3.4 - older glibc and gcc), but this is not even in travis.
> > But for testing these distros we use older releases (the same mentioned
> > Jan [1]).


> Agreed, we can explicitly declare that(in some place of Doc) from a
> specific LTP(e.g ltp-full-20200120) version, we don't provide code
> supporting for the older kernel/glibc/gcc package anymore. If people who
> are going to test old distros, they can just pick up an old released LTP
> version and hack it by themself. The latest branch of LTP doesn't accept
> that patch for old things.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
