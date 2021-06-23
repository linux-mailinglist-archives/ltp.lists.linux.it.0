Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDFB3B157C
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 10:11:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03ED53C8A4E
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 10:11:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5CB3E3C1819
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 10:11:22 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0324F200C8D
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 10:11:21 +0200 (CEST)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lvxyj-0000WW-95
 for ltp@lists.linux.it; Wed, 23 Jun 2021 08:11:21 +0000
Received: by mail-wr1-f69.google.com with SMTP id
 l13-20020adfe9cd0000b0290119a0645c8fso764253wrn.8
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 01:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A1lf+x1AhkiX7Eh/I17dT4vUIjHraWXTwSqel7ruHiU=;
 b=Kujop4E3hk36WftZMq3zxYYVEe8fb6qSR5PS9lgVEoPW17ROYY95vEw+TKKVgd7WOp
 LoCDCv5FOWoCoyLbxFKqb7TqhVT7DuEcE4sdVSr7FnNZFi9JH/hzHWv4SskH5XYFvMgh
 fd31AqJqx12EpO8rIG9L+rSt1sToaMZtewsf+37wgFTAHD4EK7qKcBXOlinVNOxiCzRp
 hiHRl5DMAmcWW75SW/RR2KAE+aNFAHXI0G3NoPOJRj68vQazcxuCL4xa0eb+jKT3JrEz
 DOMYfb6p0b5rUrA2K5cmLIpmjtpYwaAKNDrk/efmPtZkk6v0UHb3CI2kHZjr9X/IRxSm
 J4Wg==
X-Gm-Message-State: AOAM531ib87SMSJSzbFB4TBCRlzIcbz3VsXqFAZE8Pk71hdqTHt2RLbC
 Q2jzwPjz/1gAeElxm5IUAXCWZXHoqwl1FH/Uc1dGiHAiiKJMsHy6MPGXD+Wmc8GOtZiEXDsMHkw
 e6zMTVbOK2CZOJZniPqhf5dYieSCt
X-Received: by 2002:a1c:544e:: with SMTP id p14mr9572525wmi.152.1624435880723; 
 Wed, 23 Jun 2021 01:11:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1n+la37DLRsd0EoJ6jaBpq/tlGv9Lq8QEo6Odp+8iKqfC6UhV3PPCL/alw7dkidZFMJD/DQ==
X-Received: by 2002:a1c:544e:: with SMTP id p14mr9572509wmi.152.1624435880513; 
 Wed, 23 Jun 2021 01:11:20 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n18sm5088233wmq.41.2021.06.23.01.11.20
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 01:11:20 -0700 (PDT)
To: ltp@lists.linux.it
References: <20210623080157.26424-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2a08d5c4-c002-7284-03d1-ff4441f8c9c5@canonical.com>
Date: Wed, 23 Jun 2021 10:11:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623080157.26424-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 23/06/2021 10:01, Krzysztof Kozlowski wrote:
> Testing CPU frequency boost on a virtual machines is not reliable.  Even
> if cpufreq driver reports boost frequencies, the underlying hypervisor
> might decide otherwise.
> 
> For example on AWS x1e.xlarge instance (claimed to be running on Intel
> Xeon E7 8880) under Xen hypervisor the test always fails:
> 
>     cpufreq_boost    0  TINFO  :  found 'intel_pstate' driver, sysfs knob '/sys/devices/system/cpu/intel_pstate/no_turbo'
>     cpufreq_boost    0  TINFO  :  maximum speed is 3100000 KHz
>     cpufreq_boost    0  TINFO  :  load CPU0 with boost enabled
>     cpufreq_boost    0  TINFO  :  elapsed time is 1155 ms
>     cpufreq_boost    0  TINFO  :  load CPU0 with boost disabled
>     cpufreq_boost    0  TINFO  :  elapsed time is 1155 ms
>     cpufreq_boost    1  TFAIL  :  cpufreq_boost.c:186: compare time spent with and without boost (-2%)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
> index b9739db37cb7..67917b3fea25 100644
> --- a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
> +++ b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
> @@ -90,6 +90,9 @@ static void setup(void)
>  	unsigned int i;
>  	tst_require_root();
>  
> +	if (tst_is_virt(VIRT_ANY))
> +		tst_brkm(TCONF, NULL, "running in a virtual machine, overclock not reliably measureable");
> +
>  	for (i = 0; i < ARRAY_SIZE(cdrv); ++i) {
>  		fd = open(cdrv[i].file, O_RDWR);
>  		if (fd == -1)
> 

Optionally, under virtual machine the test failure could be converted to
accepted pass. This would still allow to test CPUfreq boosting
interface. Any preferences?

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
