Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1273B324B
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 17:07:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2E1E3C8703
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 17:07:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B334B3C2025
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 17:07:49 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C5BCA140033E
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 17:07:48 +0200 (CEST)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwQxH-0000YT-TZ
 for ltp@lists.linux.it; Thu, 24 Jun 2021 15:07:47 +0000
Received: by mail-wr1-f72.google.com with SMTP id
 h17-20020adff4d10000b029011a7b7961dbso2304113wrp.15
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 08:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JJaQ3OkN3YJyBn/EiO/eh669Rb3dViPrWFUynuDU+QQ=;
 b=lELfSiH10h7YxN0ioWLSdiM9EV0T8SFbffZFAVEq0RY/E7oHDJ4+bBbkoZdMiXWXm4
 eYfvGuLCerfVLi0EfiKlp9P1Grc4Xku48XUtUIM/dLMA6ftg1uBumJ+uoKpU9ziXJkMX
 fZovPoecU2E84v6wbt5IDpWUvuPoJYX/xwFRdTcW726Bzm2B8LQs6JjpI5q2M1dmcWNM
 pExW0GfAwbTYA1dCfJm4F0yCME+byxXOXFWaritM/jZHXhXUVoTA1dy8xdj19nb6wmDe
 3+ggg/nCqIBmY9VUlHDH1OP7vToEzzEkedMQDgWWcXekcV8lH61Hl281VxeCuGmxvfyU
 MAsA==
X-Gm-Message-State: AOAM530fM9Yj89NE4oOR2xiOHHgCQD4ZdG/QZ1tzHH28NWMuA60krsAA
 1TfskTL4Vn1FkXvqDOJ7O6/GX9y/E53hNZxjp9laX/oavttzw9n/gCpWmMghl3ML8aB3whCg9qW
 p65kFFrJBNPQslGztSE9Eea96Xznx
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr5087288wrx.137.1624547267395; 
 Thu, 24 Jun 2021 08:07:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSrWq9GjDJxWnFtiCqosdKmVap0tknLFwHRmxFUdEwIK37ehCbyIsxmI9bWUMcjd817WrDlw==
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr5087255wrx.137.1624547267160; 
 Thu, 24 Jun 2021 08:07:47 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id l22sm4032590wrz.54.2021.06.24.08.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:07:46 -0700 (PDT)
To: Martin Doucha <mdoucha@suse.cz>, ltp@lists.linux.it
References: <20210624132226.84611-1-krzysztof.kozlowski@canonical.com>
 <018a369f-473b-524d-f81b-eb8be4df49bb@suse.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b39dd931-5f3d-51c3-dd0f-3181b2035037@canonical.com>
Date: Thu, 24 Jun 2021 17:07:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <018a369f-473b-524d-f81b-eb8be4df49bb@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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


On 24/06/2021 15:33, Martin Doucha wrote:
> On 24. 06. 21 15:22, Krzysztof Kozlowski wrote:
>> On big memory systems, e.g. 196 GB RAM machine, the ioctl_sg01 test was
>> failing because of OoM killer during memory pollution:
>>
>> ...
>>
>> It seems leaving hard-coded 128 MB free memory works for small or medium
>> systems, but for such bigger machine it creates significant memory
>> pressure triggering the out of memory reaper.
>>
>> The memory pressure usually is defined by ratio between free and total
>> memory, so adjust the safety/spare memory similarly to keep always 0.5%
>> of memory free.
> 
> Hi,
> I've sent a similar patch for the same issue a while ago. It covers a
> few more edge cases. See [1] for the discussion about it.
> 

Thanks for the pointer. I see partially we used similar solution -
always leave some percentage of free memory.

Different kernels might have different limits here, for example v5.11
where this happened has two additional restrictions:

1. vm.min_free_kbytes = 90112
The min_free_kbytes will grow non-linearly up to 256 MB (still for v5.11).

2. vm.lowmem_reserve_ratio = 256	256	32	0	0
Which is a ratio 1/X for specific zones and since it was highmem
allocation, it does not matter here (machine has plenty of normal zone
memory).

Therefore it OoM seems to be caused by min_free_kbytes. The machine has
two nodes and the limit looks like to be spread between them:

[76578.062366] Node 0 Normal free:44536kB min:44600kB ...
[76578.062373] Node 1 Normal free:44824kB min:45060kB ...

The rest of free memory is in other zones (11 MB DMA and 380 MB in
DMA32), which were not used for this allocation.  Therefore to be
accurate, the safety limit should process /proc/zoneinfo and count
amount of free memory in Normal zone. This 128 MB safety limit should
not be counted from total memory, but from Normal zone.

But this is much more complex task and simple limit of 0.5% usually does
the trick.

P.S. For 32-bit systems the Highmem zone should also be included in Normal.

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
