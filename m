Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A03FB1F63D3
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:42:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 670643C2DFD
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:42:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5FE623C094D
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 19:20:08 +0200 (CEST)
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 90B86200754
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 19:20:07 +0200 (CEST)
Received: by mail-oi1-x243.google.com with SMTP id 25so18545367oiy.13
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 10:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XD9678y8KVglR53I0mW+wjq6EHndGSTpTp3pBzXAaC4=;
 b=NDQRCAa1DriPIs8zAUp59+1BmpLQWY+P0z5eR09Z47JS1m68SBGVCAbzTIJIyefIKf
 MeHo52ClATyEVrln/DYl4jCO7wlrMl4fj1gYosVR9hgaNR4jHJ/2pF/Y2+SVfdSLR/tl
 rwOA2CdRLeZwycnygrZQPsEtHZlZE4ciTDTkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XD9678y8KVglR53I0mW+wjq6EHndGSTpTp3pBzXAaC4=;
 b=scL+mU+RR8sM1yDhTv3f3mqQW0qyulp6AQuhXktKSZz27zOyK5XlZp7UNxkNanZHmb
 jOR9vDcpSZ+cibPV+e02HDOrTtuWHCVeuTsfjAVnmDVKVqWFpQSXubU30U+n9zljqTk1
 adcQzpTu7AW1i3kUFO2hXC0YED33F+gq7ejcfpuFX0T/t6v9UhUmtRhq1YI/kbMa1s4e
 NUSgEHkWgvclj/A6JTazfbinaA+srmV39UJejPQn4DxfKEv2emGUMv9o4y2VcpqiDtvU
 +yPGBCfxTYgvzSB3r9zjwz3Sv8RM5hLgXSe7UZSOBBIK7wOGTcYJuD1WJtOsKSEwTE0T
 7HEA==
X-Gm-Message-State: AOAM531gJBdQhi4Xu1s24fpxECORjqZa1S3qD+iPH8A7R4yOd2HLHJEA
 VCV8kK0MGLgjyJnMrzMYHrueKA==
X-Google-Smtp-Source: ABdhPJwQ2OwSg6M8EcqnViL7jvPrT5ZicCrAhYnG52WKtn2uLfgpja44uDllhEURpUJ7DeEoB2LuIw==
X-Received: by 2002:aca:7554:: with SMTP id q81mr4386241oic.61.1591723206268; 
 Tue, 09 Jun 2020 10:20:06 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id o2sm2291805oti.80.2020.06.09.10.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 10:20:05 -0700 (PDT)
To: Dmitry Vyukov <dvyukov@google.com>
References: <20200609113421.10936-1-rpalethorpe@suse.com>
 <20200609165921.GA28805@dell5510>
 <fa3b9d86-84f7-be61-f06f-c32f3ab60d3a@linuxfoundation.org>
 <CACT4Y+bYdmD7vdNUayT86oiW8yVLUBdFLOZRJ1nTi9AE99KzSg@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ce8bd6c0-0abb-e09e-b21f-5e769ffd3ab3@linuxfoundation.org>
Date: Tue, 9 Jun 2020 11:20:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bYdmD7vdNUayT86oiW8yVLUBdFLOZRJ1nTi9AE99KzSg@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it,
 Shuah Khan <skhan@linuxfoundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 6/9/20 11:15 AM, Dmitry Vyukov wrote:
> On Tue, Jun 9, 2020 at 7:10 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 6/9/20 10:59 AM, Petr Vorel wrote:
>>> Hi Richard,
>>>
>>>> So this has now being floating in limbo for some time. My preference is to
>>>> merge it to make it easy for users to try out with plenty of time before the
>>>> next LTP release. It shouldn't break anything because it is hidden behind a
>>>> configure switch.
>>> +1
>>>
>>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>>>
>>> I plan to test it a bit and appreciate if somebody else also test it,
>>> but I see no problem to include this patchset.
>>>>> V3:
>>>> + Updated linux-arts commit (thanks Dmitry and Shuah for updating those!)
>>>> + Fixed AC macro
>>>
>>
>> You can send patch to me against linux-arts for this and I will pull
>> it in.
>>
>> Dmitry, is that okay with you. This could make it easier for you and
>> reduce your work.
> 
> Hi,
> 
> I don't have any particular comments.
> I assume Richard tested it and it works. if so, it's fine with me :)
> I don't have any concrete plans to use this at the moment. We have a
> corpus of reproducers in syzkaller format and we can run these. This
> should be more useful for kernel continuous integration systems and
> distro testing.
> 

Right. That is what I was thinking that this is more relevant for kernel
developers, CI and distros.

Richard, Please send the patch for linux-arts to me once Petr gives it a
try and I will apply it.

thanks,
-- Shuah


thanks,
-- Shuah

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
