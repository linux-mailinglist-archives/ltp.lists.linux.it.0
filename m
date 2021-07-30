Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA163DB8DF
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 14:50:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E10E3C625B
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 14:50:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 099453C2B15
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 14:49:58 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E7BA010011CB
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 14:49:57 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2C0C320243
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627649397;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1vlO8xJm7tnjvfBXZlbtw1w7BOGBauloCyGYlP8dM50=;
 b=J5dlkzmPdhXuV2Z8Q0L2z3WcvscBn7muu0t/E71+JctE0AEzN9TMrNv3dO5GURb9VB+cXz
 U2E9NYMy3Np6RKIW65uLmGQxfaPedCB6egfNho8V0ZGENcOEX+bMk8F/xeF4Nsmodug/oM
 vnIp6nxj+3+Esg9mmk02YFIWp5nyD1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627649397;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1vlO8xJm7tnjvfBXZlbtw1w7BOGBauloCyGYlP8dM50=;
 b=fR2/rDL3QB717fUdduocVbl+HvW5ArfDKBfltqmCxBngA716uf8cU+4UGuJk0NnQzgg54c
 3n2nl7iIOpmSe0AA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id EAF3AA3B87;
 Fri, 30 Jul 2021 12:49:56 +0000 (UTC)
References: <20210726154605.7828-1-rpalethorpe@suse.com>
 <YQALVdEAGOVa+g4H@yuki> <878s1rlqa6.fsf@suse.de> <YQPTkYcAFcsmp+UV@yuki>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YQPTkYcAFcsmp+UV@yuki>
Date: Fri, 30 Jul 2021 13:49:50 +0100
Message-ID: <875ywsrmoh.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add set_mempolicy05, CVE-2017-7616
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Cyril,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> > I guess that we are doing this so that a call to a syscall() does not
>> > clobber the stack we have initialized to the pattern. I guess that if
>> > more tests that need this arise we may as well add the magic macros
>> > glibc uses to generate these into lapi/ somewhere...
>> 
>> Sort of the opposite, we want the syscall to allocate in the area where
>> the pattern is. Usually syscalls do not push anything onto the user
>> stack AFAICT.
>
> The glibc syscall() is a function, so I suppose that if we called that
> instead of the inline assembly we will end up with a return address on
> the stack, but thinking of it again a function call would move the stack
> pointer after the end of the area we have allocated and the syscall will
> modify stack after the array we have carefuly prepared.
>
>> The stack segment is changed by the interrupt. It seems the kernel may
>> then change the stack segment again on entry to a per CPU/thread
>> kernel stack. At any rate, nothing is written after the stack pointer
>> unless the bug is present. At least on newer kernels and CPUS of
>> course.
>
> Well that's not important here, since a few of the compat syscalls
> explicitly allocate userspace stack with compat_alloc_user_space()

It's important that we only have to consider compat_alloc_user_space. If
the interrupt did not change the stack segment, then some registers
would be pushed to the user stack.

>
>> > Also it may make sense to write a more generic test that calls different
>> > syscalls and scans stack for any data leakage, which should be far more
>> > useful than this.
>> 
>> The problem is identifying sensitive data. Compat syscalls will write to
>> the user stack. I suppose it will usually be the same data passed in,
>> but marshalled to 64-bit. However if they wrote something else to the
>> stack, that would not necessarily be a bug.
>
> Looks like there were even more serious bugs in there see:
>
> https://www.cvedetails.com/cve/CVE-2010-3081/
> https://seclists.org/fulldisclosure/2010/Sep/268
>
> So it may make sense to add another test that would check that the data
> are written in rigth part of the stack as well when ty syscall actuall
> succeeds for the few syscalls...

I suppose that compat syscalls seem to have a lot of CVEs. So reviewing
them and trying to come up with general tests is probably worth it. I'm
not sure if the user stack is the right place to look though.

>
>> I suppose for an ordinary systemcall you would not expect the user stack
>> to be modified... I'm not sure this is a useful thing to invest time in
>> though. Apart from to educate us on how kernel entry code works on
>> various architectures.
>
> Indeed.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
