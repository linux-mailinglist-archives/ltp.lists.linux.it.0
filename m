Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B36154281
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2020 12:02:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD70F3C2545
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2020 12:02:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 990EE3C2533
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 12:02:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2DC451001DAD
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 12:02:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DDEC0AC9A
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 11:02:07 +0000 (UTC)
References: <20200203113956.13176-1-mdoucha@suse.cz>
 <20200203113956.13176-2-mdoucha@suse.cz> <20200205143107.GC30186@rei>
 <fda46288-1850-8ac9-1c56-7641aaeb8759@suse.cz> <20200205155012.GA4920@rei>
 <2c7e9545-93e3-3460-6006-5e57b982ecc7@suse.cz> <20200205191006.GA18877@rei>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20200205191006.GA18877@rei>
Date: Thu, 06 Feb 2020 12:02:07 +0100
Message-ID: <87lfpgges0.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Fix BPF test program loading issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> > That's only true if we are building and external interface for a
>> > library, here we are just avoiding copy&paste by the simpliest means
>> > available.
>>
>> I am building external interface for a library. The library is called
>> bpf_common. But if you still disagree with splitting the executable code
>> into a separate file to make the header more readable for developers of
>> future BPF tests, I'll gladly unassign myself from this task and go work
>> on something else.
>
> Can we please discuss things calmly and rationally? If you want to give
> up on your patch that's fine, however if you want to continue to discuss
> technical details, let's do it without emotions, okay?

Honestly this is a style issue, so we can exchange one or two opinions,
but then just decide Cyril is right (because he has survived as
maintainer for X years with similar ideas about style) and move on to
things where the universe proves you right or wrong in the time it takes
to compile and run your code.

>
> Getting back to the technical point of the discussion, I still do not
> consider that these three functions are complex enough to be split into
> header and C source, but I do not have such strong opinion about that.
>
> So if you really think that it should be separated like that at least
> put the change that moves the code into a separate patch, since that is
> unrelated change to introduction of the new function.
>
> --
> Cyril Hrubis
> chrubis@suse.cz


--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
