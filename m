Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3B15441F
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2020 13:36:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4CB83C257B
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2020 13:36:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0EFB63C1421
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 13:36:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 70B2F1A016CA
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 13:36:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AF66DACC6
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 12:36:26 +0000 (UTC)
References: <20200203113956.13176-1-mdoucha@suse.cz>
 <20200203113956.13176-2-mdoucha@suse.cz> <20200205143107.GC30186@rei>
 <fda46288-1850-8ac9-1c56-7641aaeb8759@suse.cz> <20200205155012.GA4920@rei>
 <2c7e9545-93e3-3460-6006-5e57b982ecc7@suse.cz> <20200205191006.GA18877@rei>
 <87lfpgges0.fsf@our.domain.is.not.set>
 <f50e75f0-5575-0753-5b3e-dc1e6d66e2b7@suse.cz>
 <87imkjhq6m.fsf@our.domain.is.not.set>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: rpalethorpe@suse.de
In-reply-to: <87imkjhq6m.fsf@our.domain.is.not.set>
Date: Thu, 06 Feb 2020 13:36:26 +0100
Message-ID: <87h803hoz9.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Richard Palethorpe <rpalethorpe@suse.de> writes:

> Hi,
>
> Martin Doucha <mdoucha@suse.cz> writes:
>
>> On 2/6/20 12:02 PM, Richard Palethorpe wrote:
>>> Hello,
>>>
>>> Cyril Hrubis <chrubis@suse.cz> writes:
>>>> Can we please discuss things calmly and rationally? If you want to give
>>>> up on your patch that's fine, however if you want to continue to discuss
>>>> technical details, let's do it without emotions, okay?
>>>
>>> Honestly this is a style issue, so we can exchange one or two opinions,
>>> but then just decide Cyril is right (because he has survived as
>>> maintainer for X years with similar ideas about style) and move on to
>>> things where the universe proves you right or wrong in the time it takes
>>> to compile and run your code.
>>
>> Do I really need to remind you all that we've had a bug caused by this
>> exact lack of basic code hygiene right before the last release?
>>
>> http://lists.linux.it/pipermail/ltp/2020-January/015099.html
>
> Yes, how is this the exact same issue?
>
> There is a big difference between showing a concrete example and
> simply asserting something.

OK, I see why it is, it prevents a class of bugs by avoiding "namespace
pollution". This is a concrete argument which has a history of causing
problems.

OTOH, At least with compilers which don't have link time optimisation
(everything except Clang?), there is an advantage to including stuff
inline. Hence why fzsync is entirely in the header, although I don't
think it matters much either way for LTP.

So perhaps it should be the default to seperate headers from
implementation...

I still just defer to Cyril though. He deals with most of these
problems...

--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
