Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8BD3B32A0
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 17:34:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2769C3C8703
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 17:34:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 093B43C6F37
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 17:34:11 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 563E2200208
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 17:34:10 +0200 (CEST)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwRMo-00035L-9M
 for ltp@lists.linux.it; Thu, 24 Jun 2021 15:34:10 +0000
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc3100000b02901d849b41038so3204144wmj.7
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 08:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n+0V9JpKBUCA8ct1HzRBJvx1kiLIOdTltS9K8fo3jd8=;
 b=ilXZCSyv7sIJbg12zf3s5TbyhEit880oiuhNrc/A0k2CH7p3s3+CZPJ40YOtNB64WZ
 t96IigyLVMeVJE4+fiDrcHHigdMsZT210ZyBs59fQtVT2b0N3sv+m6hqbOCtMPq9gsWQ
 l56qvPf5Am+TvMkxQLHnyzeaWhrASagjILahHIlmwhOYzEyVH4DnRZMz15DF/2v9F9Pc
 J/cQhh+EsU7K2bdgThcV4Pve9WAQ5cRnETy24ZUfN9aPcT/wXoW2S/Ke+yheu1EFNgbO
 MIFOcQRiwhhg9gGv8PgzRmyVOG4S9pIB3ceRFag+39sBl+uGVwzZjUe8trSPrNo8SNFB
 AyfQ==
X-Gm-Message-State: AOAM533Z3S3a1stpREqNrTWKNQK+KIweGk41cQPtGAqtcEw6Wk/NyTcQ
 sFnL8cydGXkRE4ljeIgql9QtGwHBzuTybAzhnB4L8hYld2566hVVDukt+PYHTNVagUPO5uDDADT
 gSgBF5M/oz8yge91nVQf55ps6wXek
X-Received: by 2002:adf:f743:: with SMTP id z3mr5113157wrp.329.1624548849575; 
 Thu, 24 Jun 2021 08:34:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOa3fjgVPynTOfmL8S0pr3ibJ9doB7f/poHD6hkzqnVL9LZDvG/bML9SUzxP/4ElCRHUzifQ==
X-Received: by 2002:adf:f743:: with SMTP id z3mr5113148wrp.329.1624548849476; 
 Thu, 24 Jun 2021 08:34:09 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id o2sm3445932wrx.59.2021.06.24.08.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:34:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Martin Doucha <mdoucha@suse.cz>, ltp@lists.linux.it
References: <20210624132226.84611-1-krzysztof.kozlowski@canonical.com>
 <018a369f-473b-524d-f81b-eb8be4df49bb@suse.cz>
 <b39dd931-5f3d-51c3-dd0f-3181b2035037@canonical.com>
Message-ID: <f25e99fb-de57-1929-e206-586dbc5a7290@canonical.com>
Date: Thu, 24 Jun 2021 17:34:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b39dd931-5f3d-51c3-dd0f-3181b2035037@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: memutils: don't pollute entire system memory
 to avoid OoM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 24/06/2021 17:07, Krzysztof Kozlowski wrote:
> 
> On 24/06/2021 15:33, Martin Doucha wrote:
>> On 24. 06. 21 15:22, Krzysztof Kozlowski wrote:
>>> On big memory systems, e.g. 196 GB RAM machine, the ioctl_sg01 test was
>>> failing because of OoM killer during memory pollution:
>>>
>>> ...
>>>
>>> It seems leaving hard-coded 128 MB free memory works for small or medium
>>> systems, but for such bigger machine it creates significant memory
>>> pressure triggering the out of memory reaper.
>>>
>>> The memory pressure usually is defined by ratio between free and total
>>> memory, so adjust the safety/spare memory similarly to keep always 0.5%
>>> of memory free.
>>
>> Hi,
>> I've sent a similar patch for the same issue a while ago. It covers a
>> few more edge cases. See [1] for the discussion about it.
>>
> 
> Thanks for the pointer. I see partially we used similar solution -
> always leave some percentage of free memory.
> 
> Different kernels might have different limits here, for example v5.11
> where this happened has two additional restrictions:
> 
> 1. vm.min_free_kbytes = 90112
> The min_free_kbytes will grow non-linearly up to 256 MB (still for v5.11).
> 
> 2. vm.lowmem_reserve_ratio = 256	256	32	0	0
> Which is a ratio 1/X for specific zones and since it was highmem
> allocation, it does not matter here (machine has plenty of normal zone
> memory).
> 
> Therefore it OoM seems to be caused by min_free_kbytes. The machine has
> two nodes and the limit looks like to be spread between them:
> 
> [76578.062366] Node 0 Normal free:44536kB min:44600kB ...
> [76578.062373] Node 1 Normal free:44824kB min:45060kB ...
> 
> The rest of free memory is in other zones (11 MB DMA and 380 MB in
> DMA32), which were not used for this allocation.  Therefore to be
> accurate, the safety limit should process /proc/zoneinfo and count
> amount of free memory in Normal zone. This 128 MB safety limit should
> not be counted from total memory, but from Normal zone.
> 
> But this is much more complex task and simple limit of 0.5% usually does
> the trick.
> 
> P.S. For 32-bit systems the Highmem zone should also be included in Normal.

Just to backup this with some numbers:
MemTotal:       198067420 kB
MemFree:        109125196 kB => 27 281 299 pages
MemAvailable:   108425900 kB

Node 1 free pages: 2732177
Node 0 free pages: 24305662
                 2732177+24305662 = 27037839
DMA32 free pages: 240511
DMA free pages: 2949

You can see that MemFree, which is returned by sysinfo, includes DMA32
and DMA zones which is not valid. Under low memory pressure user-space
(allocating highmem page) cannot allocate memory from DMA zones and
normal zones counters are in reality lower and hitting minimal level.

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
