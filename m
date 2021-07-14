Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9B13C8549
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 15:26:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C7763C8650
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 15:26:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3490D3C245D
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 15:26:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 22C76200D42
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 15:26:49 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7273D205B6
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626269209;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RD53dHIavUT+AlrStwlGBAqplzxejHXl5vborKAaplk=;
 b=aCSq/w5WKoHPsE/sVX6ky7YvznuXBLYCMYL1lXFPmqJiYWcmaChlkD7uFDwcv7gPkkqfZw
 464oww0p5cHO/f+eIl2mA4SCiQG1Zc7pR4Q9Q0APQb9McovjVtIi+8on7CdGa2l+BbPw27
 4csJTUPUtIRcZoDxA2sp2ehHWbHXGiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626269209;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RD53dHIavUT+AlrStwlGBAqplzxejHXl5vborKAaplk=;
 b=uLrIutiVpkBcMf87fNIcw5V7jbODTnJrKYlTl7vXVVFE4651wTWO6C4wSIrPo7pxC59sAs
 YMPSSAcsVx77omDA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3E295A3B88;
 Wed, 14 Jul 2021 13:26:49 +0000 (UTC)
References: <20210714071158.15868-1-rpalethorpe@suse.com>
 <20210714071158.15868-4-rpalethorpe@suse.com> <YO7CU8UebcFN2VtY@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YO7CU8UebcFN2VtY@pevik>
Date: Wed, 14 Jul 2021 14:26:48 +0100
Message-ID: <87sg0hni07.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/8] doc: Add rules and recommendations list
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

Hello Petr,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
>> +++ b/doc/test-writing-guidelines.txt
>> @@ -10,6 +10,11 @@ NOTE: See also
>>        https://github.com/linux-test-project/ltp/wiki/Shell-Test-API[Shell Test API],
>>        https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines[LTP Library API Writing Guidelines].
>
>> +Rules and recommendations which are "machine checkable" should be
>> +tagged with an ID like +LTP-XXX+. There will be a corresponding entry
>> +in 'doc/rules.tsv'. When you run 'make check' or 'make check-test' it
>> +will display these IDs as a reference.
>> +
> Actually text is on the top. I suppose, you probably planned to put
> this into "2.1 C coding style".

I'm not sure where to put it. The coding style is mostly about syntax
and formatting. The rules file can state anything machine checkable, so
that can include shell, directory structure, what functions are used
etc.

>
> Kind regards,
> Petr
>
>>  1. Guide to clean and understandable code
>>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
