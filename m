Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3403B1CFD
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 16:59:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C73E53C8E3B
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 16:59:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3780F3C2307
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 16:59:40 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E7A651401205
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 16:59:39 +0200 (CEST)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw4Lq-0000LT-V1
 for ltp@lists.linux.it; Wed, 23 Jun 2021 14:59:38 +0000
Received: by mail-wr1-f71.google.com with SMTP id
 d8-20020adfef880000b029011a9391927aso1148371wro.22
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 07:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lN+D5qvJw/vNi3S7qFYHyMdQXLRHnKtYd8gQ6VuRVAQ=;
 b=i6Okxj0roJ36191L1Inqoqa9EcYW+a0xubcDWbPQyEAfkbp0h4y0PZHAimaQKHJDuS
 qDATwyi6/V2FWiexw31zy7Dfi1Rq5ve8ovNaO2Fy87D6LMwxOoLqXy1Sfyp9KBiMbEfx
 xf4EHHUSBDITNTXHz/EAYcSNmBMWZWN1LpcNBqjdLwW1YLtfX7lPgTEu7SWSS8eyPdXE
 UEL8lyY4EKiSK9R54MLVGNjA+tTv04HJ8rQEA3SHrtTtwBYZmj6FElot1z6WZL5wzGiD
 XZ3HtTgHk7MLTiDMizmhTOtrT6Ur2jOBzaPqpR+Fl3hw3pru4IJfHeZ79gdUZl4fAOxe
 6Srw==
X-Gm-Message-State: AOAM53056vt9rFQrn4GbC8vJtgjvzbI0+TPl/QJwgdlomC0ZVAXRg6Aj
 fasp/xg9bt8FneObsDv+Lt5qADtoGRdFjAbZ+5GWD4zZIS3QO9qnjHYfp2aGDXkXcRpfoqxumrV
 jALBAiirWyP9imaZE5zt1NmiCdr8w
X-Received: by 2002:adf:9084:: with SMTP id i4mr508275wri.23.1624460378429;
 Wed, 23 Jun 2021 07:59:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6OutHTEJGjL8VN53EAVo481MvVqgro/fdLXogwiPOpVVsfWLXGV7e2Kwl2GyHrx8c/AqIQw==
X-Received: by 2002:adf:9084:: with SMTP id i4mr508267wri.23.1624460378276;
 Wed, 23 Jun 2021 07:59:38 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id b7sm297903wrw.20.2021.06.23.07.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 07:59:37 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210622145938.106477-1-krzysztof.kozlowski@canonical.com>
 <YNL9/k1iRralo/fj@pevik> <a7dd74e2-858f-19e4-d2bf-21cb77a3705e@canonical.com>
 <c015b22b-5775-7301-a8b8-13cdd7000fb6@canonical.com> <YNM4VFC0pgygzNJz@pevik>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <5cf60851-9d1a-33db-b0b6-979191eee873@canonical.com>
Date: Wed, 23 Jun 2021 16:59:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNM4VFC0pgygzNJz@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cpuset_hotplug: skip unsupported
 Microsoft Hyper-V
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 23/06/2021 15:34, Petr Vorel wrote:
> Hi Krzysztof,
> 
>> On 23/06/2021 11:35, Krzysztof Kozlowski wrote:
>>> On 23/06/2021 11:25, Petr Vorel wrote:
>>>> Hi Krzysztof,
> 
>>>>> Microsoft Hyper-V with Linux guests does not support CPU hotplug, even
>>>>> if enabled in kernel configuration.  Quoting Ubuntu bug report from
>>>>> June 2018: "While Hyper-V may present all potential CPUs via ACPI MADT,
>>>>> CPU add/remove is not supported.". [1]
> 
>>>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
>>>> LGTM. How many of tests will need tst_virt_hyperv? Although we don't touch
>>>> legacy API, I'd make an exception and add it to both test.sh and tst_test.sh
>>>> (ideally with an API extension, i.e. test could use SKIP_VIRT="hyperv", but that
>>>> can wait till tests are converted).
> 
>>> Around CPU hotplug that would be the last one I did not spot so far
>>> other failures but I also do not track all failures in nice way. Rather
>>> fixing them ad-hoc...
> 
>> I just checked more and there are additional failures on Azure/HyperV
>> with more nodes: cpuset_load_balance, cpuset_memory_pressure,
>> cpuset_memory_spread and cpuset_sched_domains. These did not appear on
>> smaller instances (e.g. 4 CPUs).
> 
> Good to know. Does it mean we should check number of processors?

No, it should be the same case as here, I just did not hit that test on
some of cloud instances (the tests are for CPU nodes > 1). I'll just
find a proper instance to try to reproduce it there.

> But even there were just these two and no additional change to
> tst_virt_hyperv(), we'd prefer to have them in test.sh and tst_test.sh.
> Could you please send v2, where you implement that?

I'll take a look.


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
