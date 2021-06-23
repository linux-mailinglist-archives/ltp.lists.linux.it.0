Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A7C3B1DA9
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:33:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F19E03C6FF3
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:33:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA44D3C1C4F
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:33:36 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4153E601A7D
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:33:36 +0200 (CEST)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw4sh-0004DA-GL
 for ltp@lists.linux.it; Wed, 23 Jun 2021 15:33:35 +0000
Received: by mail-wm1-f72.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so739578wmh.9
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 08:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FEQsPthrw5YGr+opLIsHxdz78fRrKLlvZNDKweS+L6Q=;
 b=L9KxYX+ArV05QQP6cGFUC0fIIfcYpPs+E8ekVxpoq4y4Xqzj36G5vq/9DY648CMjbq
 6P5dPfbBP3Z+wvlmYDsJooaygL2rmX0RIZ2sOrBtDIeJXmHmv96F+49DISQQalPma0d3
 tK4wuMS+b+hCUjDebbAiaEq3CRkwx1c/rIFS+lsfXjG0eL5U3U3ABlN1cRJ1sN5mx4g9
 433ilG9GI/JJSb9jUleYvtvtrUaaz4KaplUcBhcXdEsRv7wiE5ql0NcyF6cU7eKeBRLL
 KR6bKjKNu//BJQYYqa7dRCI20UHVyKGbpJCWv7bMnssvCvTHNy1LS4oks5xuWsLe1sDz
 Egsw==
X-Gm-Message-State: AOAM533RHAK6cQd80+IunCgQRfdYgZqEwj3SrLHKDBakmA+kKicO6TN7
 NTnkWZdu20eyaqo8lifv9+R+zaJ+HwK00vMxK4x+vUAKWy9RFqqDIfqO1CvnCRqCbXWyOfT3NE6
 /sJl2ud0BlN4EmwwK4LVQ6FFEGkGL
X-Received: by 2002:adf:f74c:: with SMTP id z12mr774404wrp.18.1624462414438;
 Wed, 23 Jun 2021 08:33:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysXr2qFXKqdqqiKhw822te2fn6U0mjC5UXVAdJTc4c480bX9G4RvzSxQJ15+pROMtDzoZ5Iw==
X-Received: by 2002:adf:f74c:: with SMTP id z12mr774395wrp.18.1624462414357;
 Wed, 23 Jun 2021 08:33:34 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id y20sm5868406wmi.31.2021.06.23.08.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 08:33:34 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210623080157.26424-1-krzysztof.kozlowski@canonical.com>
 <2a08d5c4-c002-7284-03d1-ff4441f8c9c5@canonical.com> <YNMdNqGiGXOgby6v@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <aaf8acb9-f28f-b550-ccbc-8feb5aad17b0@canonical.com>
Date: Wed, 23 Jun 2021 17:33:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNMdNqGiGXOgby6v@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

On 23/06/2021 13:38, Cyril Hrubis wrote:
> Hi!
>>> diff --git a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
>>> index b9739db37cb7..67917b3fea25 100644
>>> --- a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
>>> +++ b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
>>> @@ -90,6 +90,9 @@ static void setup(void)
>>>  	unsigned int i;
>>>  	tst_require_root();
>>>  
>>> +	if (tst_is_virt(VIRT_ANY))
>>> +		tst_brkm(TCONF, NULL, "running in a virtual machine, overclock not reliably measureable");
>>> +
>>>  	for (i = 0; i < ARRAY_SIZE(cdrv); ++i) {
>>>  		fd = open(cdrv[i].file, O_RDWR);
>>>  		if (fd == -1)
>>>
>>
>> Optionally, under virtual machine the test failure could be converted to
>> accepted pass. This would still allow to test CPUfreq boosting
>> interface. Any preferences?
> 
> I wonder what is the likehood of actually dicovering a bug by writing to
> the cpufreq boost file from within a VM, I guess that it's non-zero at
> least.

It's a test of kernel interface and whether the driver accepts input via
sysfs... so not much of a real cpufreq test. Indeed maybe better to skip
the test explicitly instead of giving some false hopes that cpufreq is
being tested.


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
