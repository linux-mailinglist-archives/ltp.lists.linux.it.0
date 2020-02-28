Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F8817365C
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 12:48:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2439B3C6AC0
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 12:48:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 296F33C2377
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 12:48:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7796E201DBB
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 12:48:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C2CD9B393;
 Fri, 28 Feb 2020 11:48:02 +0000 (UTC)
Date: Fri, 28 Feb 2020 12:48:01 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200228114801.GA8324@rei>
References: <CAKohponuu3zpsQCv0v1_Yqb_tmqy5yyUejMoS1_M_UFf5FU2Mw@mail.gmail.com>
 <20200228085859.GA31181@rei>
 <20200228102432.3kdhl4aqkla4akss@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228102432.3kdhl4aqkla4akss@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] Query: Adding support for clone3()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > One of the challenges with the implementation of clone3() is that
> > > there is no glibc wrapper available. And in case of clone() glibc
> > > wrapper isn't ordinary as it takes care of calling fn() and handling
> > > few stack related things, apart from calling the real syscall.
> > > 
> > > I am confused now on how should I write support for clone3().
> > > 
> > > Any suggestions will be appreciated. Thanks.
> > 
> > Let's just add the code into lapi/clone.h, would that work for you?
> 
> Which code are you talking about ?
> 
> Here is some stuff about the glibc wrapper for clone() from an stackoverflow
> page [1]:
> 
> clone(void (*fn)(void *), void *stack_pointer)
> {
>     push fn onto stack_pointer
>     syscall_clone()
>     if (child) {
>         pop fn off of stack
>         fn();
>         exit();
>     }
> }
> 
> This takes care of calling fn() and doing some stack related stuff.
> The kernel syscall doesn't expect the fn() argument but only the
> userspace calls do. How should I handle the extra stuff that userspace
> expects for a clone() call ?

That depends I guess mostly on the clone() flags, right? Unless we pass
CLONE_VM the child lives in a separate copy of the memory space and we
do not have to do anything about the stack.

So for the most clone3() tests we can just need the struct clone_args
and the syscall number and we can treat it mostly like more complex
version of fork(), i.e. pass NULL and 0 for the stack and stack_size
parameters.

So I would start by adding the kernel version of the clone3() syscall,
the structure, and the V0 structure size into the lapi header and use
that for a basic testcases.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
