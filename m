Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAFA1F63D2
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:42:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F4DD3C2DF6
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:42:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2F96F3C2E4A
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 19:10:26 +0200 (CEST)
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8184B1401441
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 19:10:25 +0200 (CEST)
Received: by mail-oi1-x244.google.com with SMTP id a21so19424865oic.8
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 10:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vSpcV5NCeaB5MlZ+sfmu5A4IQGd0mFPxrsH/U96tG2I=;
 b=GjpdYBB43hZhUpogMCOgmrx9Dzhym7pmfo3xXOayXoVkXjUUO1GnEPiJZxtJOKQx7Q
 vVObmwJkRT/znN+aIYbgeEl2oImR0Xe+bF75FPhCEV0DWIkCV4VUJkZ4/iUmiHOq2IWz
 BRZeVN69o7Fu2ldYl829Rhk1HoXo5GQVm0cOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vSpcV5NCeaB5MlZ+sfmu5A4IQGd0mFPxrsH/U96tG2I=;
 b=n/phmkHGbEFEQsdkclINONHNz7gRPYTelZZ7Q/BRoRXMc4N1Ksy1/OeIsmoaK3k/6H
 Mt4YbWF4oKY/zdbxkwz/pIrJhCQ/DNMuidHUGWtauzpFIoPbXQyJyRwgIK4ZrziKjSKz
 9v/gXg1a/9DT0L25l1aWwYmw+QVZjQsbqxKHemFIsdOEi3ixPP/0CQotKI/NYyuZGbyc
 FqlF4gyR4Vdl5HqABBoelQ91K+IGa6V5vF4gI8hVcAJKC6TcM+8jnPET2jlbZe5vl7te
 JLkq/05Xtt7Bc2C08sUBoCI3K2XBvnKO5beMeqq9/m92ZBSGHjuiywhgGiCdtN61T83I
 icaw==
X-Gm-Message-State: AOAM5311eBHJ+D2yQXoU+KkQam4ZCqSq3lTEAyqs3EmV78XXdcAb/kmJ
 gMHhwHhTYjBQfVCvUob6h6Q7cw==
X-Google-Smtp-Source: ABdhPJy/5kxu3MNwbq6IqcwILvWeZlZCA417KxmKyGRh53gDL+KtGTkxM3y1IF3amaBE/BCD4HtYpg==
X-Received: by 2002:aca:498f:: with SMTP id w137mr4474307oia.28.1591722624200; 
 Tue, 09 Jun 2020 10:10:24 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id a3sm3055719ool.43.2020.06.09.10.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 10:10:23 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, Richard Palethorpe <rpalethorpe@suse.com>
References: <20200609113421.10936-1-rpalethorpe@suse.com>
 <20200609165921.GA28805@dell5510>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <fa3b9d86-84f7-be61-f06f-c32f3ab60d3a@linuxfoundation.org>
Date: Tue, 9 Jun 2020 11:10:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609165921.GA28805@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 11 Jun 2020 10:42:03 +0200
Subject: Re: [LTP] [PATCH v3] Wrapper for Syzkaller reproducers
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
Cc: Dmitry Vyukov <dvyukov@google.com>, ltp@lists.linux.it,
 Shuah Khan <skhan@linuxfoundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 6/9/20 10:59 AM, Petr Vorel wrote:
> Hi Richard,
> 
>> So this has now being floating in limbo for some time. My preference is to
>> merge it to make it easy for users to try out with plenty of time before the
>> next LTP release. It shouldn't break anything because it is hidden behind a
>> configure switch.
> +1
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> I plan to test it a bit and appreciate if somebody else also test it,
> but I see no problem to include this patchset.
> >> V3:
>> + Updated linux-arts commit (thanks Dmitry and Shuah for updating those!)
>> + Fixed AC macro
> 

You can send patch to me against linux-arts for this and I will pull
it in.

Dmitry, is that okay with you. This could make it easier for you and
reduce your work.

thanks,
-- Shuah

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
