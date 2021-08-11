Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E15743E8E38
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:12:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A0C73C6FEF
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:12:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 82E943C701C
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:12:15 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 103F61A008BF
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:12:13 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 6F2D73F370
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628676733;
 bh=yoaS1aVrGfA6WPJqduXecav7/IuE5WNsUd3cFxr7d0o=;
 h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=rl6eMxqbKDGbtWwaaPKqgVTlX1SqvmZu9aoWT5DSsISDyc0MmpRsUhIZ8DJtqK9Kx
 ZNF/CM/x+0foNpHpVvY+gOOP49ya8XQ2heHbQukutOG6dzAFWO5RsxwxfJDrDSGHzn
 Ibjo6gbQGNcBOY8vOfClwsdu+9o9CrfNRmArO60mzFwIkEbrAI1hrwY7v/boX53VQs
 c6GXzsJUR/Mf3TSRCSkExbdFRKqi24f8PLkWUMQDpS4zQVKp/RyzlmxYFdNbLRaeQr
 8CVDsJkCyloRNkSZEypwCVuvSHwLB5x9+FGcYPJSunghvRWnZx5g7t0hiw7UEGJXrl
 pynpR09AqcTGA==
Received: by mail-ed1-f71.google.com with SMTP id
 dh21-20020a0564021d35b02903be0aa37025so977105edb.7
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 03:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yoaS1aVrGfA6WPJqduXecav7/IuE5WNsUd3cFxr7d0o=;
 b=Vhzl8YQMj8e7cSFKB1mz0peu1xSPp4bffTXgF+H/WxuIXp9fkZFsyLw6XF1KC6aFBM
 guzkbtpmIygTGJd9DCWPaQcwWyPE+0Bg+sQuRtLqzBJTBECEHtRvO5N1NZmkTZBoSbY+
 y+LSixlX4JHuCQNaR0Oi3x24pf9NfwEWeJfW7WfIIjvnIdp1bNSP+/MzCBeRbxS6b55A
 2qk7wvCrS+WAbEwYugIIbPlN7Q+aeqyfa2PH95wqjCz+AjiD3kLsvtxO+JIXT0QoZQ4c
 5ybxJnfe+00aW2WF6XPPkKQpAsRTZvSoMbgHgVtlICJzuTfd8B3EzaAStiNL8sThM/mR
 Dt6w==
X-Gm-Message-State: AOAM5334cd8Q0LEVA7CespYj57o2wuTEcb4Bwsi57CjGKVdUJI5e+GGl
 aHY0RhRlKyViJIKPHNFWjm/h5aDk/Nw43HlFHSNQellzlwaUH2x7FZ1OFAhL8LxH2k9jBdr0btJ
 S+W7+Z2OLInw09cI/uXe+f60Qds+P
X-Received: by 2002:a05:6402:4d1:: with SMTP id
 n17mr10354586edw.337.1628676732961; 
 Wed, 11 Aug 2021 03:12:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWf66XijkNPilBTp+/MiRqtCIYGHYcPp/d+7/Pz3LCocdpCA76+n7QHGt0lMkrVdybikp5FQ==
X-Received: by 2002:a05:6402:4d1:: with SMTP id
 n17mr10354580edw.337.1628676732862; 
 Wed, 11 Aug 2021 03:12:12 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id u23sm6293434edr.42.2021.08.11.03.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 03:12:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210623080157.26424-1-krzysztof.kozlowski@canonical.com>
 <2a08d5c4-c002-7284-03d1-ff4441f8c9c5@canonical.com> <YNMdNqGiGXOgby6v@yuki>
 <aaf8acb9-f28f-b550-ccbc-8feb5aad17b0@canonical.com>
Message-ID: <34c93a03-ca56-1648-5db0-4f15d617b4d9@canonical.com>
Date: Wed, 11 Aug 2021 12:12:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <aaf8acb9-f28f-b550-ccbc-8feb5aad17b0@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] device-drivers/cpufreq_boost: skip test on
 virtual machines
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

On 23/06/2021 17:33, Krzysztof Kozlowski wrote:
> On 23/06/2021 13:38, Cyril Hrubis wrote:
>> Hi!
>>>> diff --git a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
>>>> index b9739db37cb7..67917b3fea25 100644
>>>> --- a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
>>>> +++ b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
>>>> @@ -90,6 +90,9 @@ static void setup(void)
>>>>  	unsigned int i;
>>>>  	tst_require_root();
>>>>  
>>>> +	if (tst_is_virt(VIRT_ANY))
>>>> +		tst_brkm(TCONF, NULL, "running in a virtual machine, overclock not reliably measureable");
>>>> +
>>>>  	for (i = 0; i < ARRAY_SIZE(cdrv); ++i) {
>>>>  		fd = open(cdrv[i].file, O_RDWR);
>>>>  		if (fd == -1)
>>>>
>>>
>>> Optionally, under virtual machine the test failure could be converted to
>>> accepted pass. This would still allow to test CPUfreq boosting
>>> interface. Any preferences?
>>
>> I wonder what is the likehood of actually dicovering a bug by writing to
>> the cpufreq boost file from within a VM, I guess that it's non-zero at
>> least.
> 
> It's a test of kernel interface and whether the driver accepts input via
> sysfs... so not much of a real cpufreq test. Indeed maybe better to skip
> the test explicitly instead of giving some false hopes that cpufreq is
> being tested.

Hi Cyril and all,

Anything stops this patch from being applied?

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
