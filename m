Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D03BE618
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 12:01:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEDFA3C89DE
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 12:01:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4FB043C687D
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 12:01:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D4EB36009A4
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 12:01:53 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3E24120052;
 Wed,  7 Jul 2021 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625652113;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rTzhMtMfQLs38DRkJ17OR7btJyv5WupvddDguUml9Ds=;
 b=JzQpK1Km2etPzTNoCWf+b2YvUdgaItCUWoSIhT1rH/3l7ZTc9diA2ntZBoGyen3yD1tTEv
 QSlxRu5vhD3W3UeYD1kUeDtMTp2bxsXzTXTyU0FBoRWSNzP5e4IMPu9gxDVjqMyOB84gV3
 ID3afPir1+ll1nyLMxTbLoUfR03zatI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625652113;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rTzhMtMfQLs38DRkJ17OR7btJyv5WupvddDguUml9Ds=;
 b=QVjbMzClPHbeDq65CfhKgdqCKKq3UNWw9p4B03z77rMovhdD4YBJnZgBg/g0HuWXZVLTfA
 Pt0q7oHwgoN7D2AA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B0BA8A3B99;
 Wed,  7 Jul 2021 10:01:50 +0000 (UTC)
References: <20210707071838.27834-1-rpalethorpe@suse.com>
 <43e8b66b-04df-9c4f-c47b-aba13347b6d8@jv-coder.de>
 <6c665478-d831-9e3f-470c-8538a399e4f7@jv-coder.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <6c665478-d831-9e3f-470c-8538a399e4f7@jv-coder.de>
Date: Wed, 07 Jul 2021 11:01:45 +0100
Message-ID: <87a6my788m.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kill13, CVE-2018-10124: Reproduce INT_MIN negation
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

Hello Joerg,

Joerg Vehlow <lkml@jv-coder.de> writes:

> Hi,
>
> On 7/7/2021 10:35 AM, Joerg Vehlow wrote:
>> Hi Richard,
>>
>> On 7/7/2021 9:18 AM, Richard Palethorpe via ltp wrote:
>>>
>> Results in INT_MIN? What does this mean or did you meant to write
>> results in ESRCH?
>> Default negating int min in two's complement yields 0 (INT_MIN =
>> b1000... and negating means inverting the first bit -> thus 0).
> Nevermind... Just checked. Looks like somehow x86 keeps -INT_MIN.
> Now I know what you mean with "results in INT_MIN"
>
> Joerg

Actually this seems to be expected unless the CPU takes action to prvent
it. As you invert all the bits then add one in two's complement. So
inverting results in INT_MAX then we add one and overflow back to
INT_MIN.

It is undefined though so the CPU could decide to do something
else. OTOH it seems quite unlikely we will get anything other than
INT_MIN or INT_MAX. So I will set sig number to zero as you suggested
and we will just have to rely on UBSAN.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
