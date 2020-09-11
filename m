Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800F26619E
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 16:57:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A6423C4FE8
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 16:57:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 053E33C224B
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 16:57:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 699ED60068A
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 16:57:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4024EAC37;
 Fri, 11 Sep 2020 14:57:16 +0000 (UTC)
Date: Fri, 11 Sep 2020 16:57:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200911145730.GA6157@yuki.lan>
References: <20200911035533.30538-1-liwang@redhat.com>
 <20200911130836.GA2582@yuki.lan>
 <CAEemH2fPRTh6drs=h=U7OG07SZDgpDfEB0xRadF8Y1FbaHR8Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fPRTh6drs=h=U7OG07SZDgpDfEB0xRadF8Y1FbaHR8Nw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
> > Well it's not wrong per se but as it is we do not use the pre-allocated
> > part of the stack at all, we directly jump for the guard page as we use
> >
> 
> Really? But I think the pthread_attr_setstack(&attr, stack, stack_size) will
> take use of the whole stack memory in function recursive performing.
> How can we say NOT use the pre-allocated stack? I fell a bit confused
> about your words here.

I've been confused as well I looked at pthread_attr_setstack() function
manual and it's expecting to get the lowest pointer of the stack. So I
suppose that the stack really started at the stack + stack_size address.
But still the code wasn't exactly right, because the lowest address of
the stack in the previous code was stack - stack_size, which would be
start of the unmapped region and the size of the stack would be 2 *
stack_size, as we expected the mapping to grow.

> > There is no point in adding size * 2 here. We can as well reserve 256 *
> > page_size + size. Then map() a single page at the end, which would be at
> > start + total_size - page_size and finally return start + total_size
> > from this function and pass that to pthread_attr_setstack().
> >
> 
> I guess that will be work, but sounds a bit stingy. Since the modern system
> does not short of such memory for testing:). And if we decide to go with
> this, the code design comments above should be all rewrite.

I do find this layout to be a bit more straighforward.

> >
> > That way it would look like:
> >
> > | 256 pages | unmapped | 1 mapped page |
> >
> >             | - - -  stack_size  - - - |
> >
> >
> > > +     /* Test 2 */
> > > +     child_pid = SAFE_FORK();
> > > +     if (!child_pid) {
> > > +             tst_no_corefile(0);
> >                   ^
> >                  This should go to the test setup.
> >
> 
> Only the child_2 will get SIGSEGV, why should we move it to affect the
> whole test?

It's not like we do expect any part of the test to produce core-dump so
there is no point in disabling them on each iteration only for the
child. But I guess that it's fine either way.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
