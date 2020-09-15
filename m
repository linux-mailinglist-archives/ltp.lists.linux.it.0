Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5E426A667
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 15:40:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6755E3C4EF8
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 15:40:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 755083C14F7
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 15:39:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 72533200D33
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 15:39:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28E31B21A;
 Tue, 15 Sep 2020 13:40:12 +0000 (UTC)
Date: Tue, 15 Sep 2020 15:40:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200915134023.GA18311@yuki.lan>
References: <20200911035533.30538-1-liwang@redhat.com>
 <20200911130836.GA2582@yuki.lan>
 <CAEemH2fPRTh6drs=h=U7OG07SZDgpDfEB0xRadF8Y1FbaHR8Nw@mail.gmail.com>
 <20200911145730.GA6157@yuki.lan>
 <CAEemH2cXY+-Dgq8PB-ZunzRnjM1iH0KiB5gK5=CLnFDSEiKLdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cXY+-Dgq8PB-ZunzRnjM1iH0KiB5gK5=CLnFDSEiKLdQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] Add a test case for mmap MAP_GROWSDOWN flag
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
Cc: pravin <pravinraghul@zilogic.com>, LTP List <ltp@lists.linux.it>,
 "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > But still the code wasn't exactly right, because the lowest address of
> > the stack in the previous code was stack - stack_size, which would be
> > start of the unmapped region and the size of the stack would be 2 *
> > stack_size, as we expected the mapping to grow.
> >
> 
> No, I don't think so, the lowest address of the stack in the previous code
> is:
>     stack = start + total_size - size;
> and we pass this stack pointer to ptrehad_attr_setstack() is correct here,
> indeed the stack really starts at stack + stack_size, that's internal steps.
> 
> If we go with 'stack + stack_size' as you suggested, that will easily get
> segmental fault. So I stand by myself understanding unless someone can
> give enough explanation/demo :).

No I mean to pass stack - stack_size as a stack lowest addres since that
is the real end of the stack, i.e. the thread touches the memory close
to that address and technically we overflow the stack when we pass stack
as an address to pthread_attr_setstack().

Or we can change the memory layout so that only first page of the stack
is mapped as I proposed which is much less confusing that this.

> PTHREAD_ATTR_SETSTACK(3) manual says:
>   "stackaddr should point to the lowest addressable byte of a buffer of
> stacksize bytes that was allocated by the caller.  The pages of the
> allocated buffer should be both readable and writable."

I would say that what we actually do here is in the gray zone, nobody
really expected that growable stack would be used with pthreads and
hence the manual page does not take growable mappings into an account.

It works because libc does really use the stack size only to calculate
start of the stack, i.e. highest address of the stack, but still I do
find the code a bit confusing, since the real test starts after we
overflow the stack we passed to the pthread_attr_setstack().

I.e. regardless if we pass addr=stack size=stack_size or
addr=stack-stack_size and size=2*stack_size the glibc will end up with
the same address which is stack + stack_size. But the second one is a
bit more clear in where the real end of the stack is supposed to be.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
