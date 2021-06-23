Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1333B196D
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:57:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 125AD3C6FDC
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:57:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8FBB23C2E72
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:57:52 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 006B81401146
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:57:50 +0200 (CEST)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw1Vu-00014B-4Z
 for ltp@lists.linux.it; Wed, 23 Jun 2021 11:57:50 +0000
Received: by mail-wm1-f71.google.com with SMTP id
 v2-20020a7bcb420000b0290146b609814dso518742wmj.0
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 04:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0J/+87pTnpvVBr1kfZ+SN+LaF9POvnM5vYgndcSPAhM=;
 b=cpbCg7p13ajtUx4tOEttkS7uo7F3J7JlfBwsLal/h9rcmP+yjjUf/Ig5QbUaL60l+w
 7STMd3SSxSW2D7IYVqlrRkxIudTRl4Aw3ls9NUjcewGXoHX+sly7dmPAtHkQCmNgDN9l
 tGcosY1i9GtK4JvK/wV0Qm5Oo022BpqDUOHm/ecfLuaxbkO/mm4asgzstrBoleA4QErg
 U65pCKMi+KZmbHZbUJR5hWDneYaeZIkwJbf1BmzGHNcCufymgMTtoMyhkyZWBDFsNA05
 pNrt+FkoTa+vzqUiVwrGH9ZX70QCH3pZDjmGWX4SG16tQZn6gR2roXgFdJBi+THh+dDI
 gdXQ==
X-Gm-Message-State: AOAM531nyXD+xSxUAUJrHezxq0vGkC4JO6t7fwGVQeLJrOgSpAOgHxo1
 1fQfXgw6eU7ucgPtIZIymHtXHJuNtU3ve4kf0+My3OKDFmZRPy+R6Mf6dv+Cocol+LxKEHLLpjr
 niDIBespcZHwzKTMUxsZ7QW1mROpD
X-Received: by 2002:a5d:6485:: with SMTP id o5mr11003084wri.91.1624449469537; 
 Wed, 23 Jun 2021 04:57:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIo3cIdMM77axzbNC2seeqQt7yKqHuR6IIF1fnq0ONZesNwCr/Fklnw6hnotyHCeu1vBHTGw==
X-Received: by 2002:a5d:6485:: with SMTP id o5mr11003076wri.91.1624449469384; 
 Wed, 23 Jun 2021 04:57:49 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id o2sm2678212wrp.53.2021.06.23.04.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 04:57:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Petr Vorel <pvorel@suse.cz>
References: <20210622145938.106477-1-krzysztof.kozlowski@canonical.com>
 <YNL9/k1iRralo/fj@pevik> <a7dd74e2-858f-19e4-d2bf-21cb77a3705e@canonical.com>
Message-ID: <c015b22b-5775-7301-a8b8-13cdd7000fb6@canonical.com>
Date: Wed, 23 Jun 2021 13:57:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a7dd74e2-858f-19e4-d2bf-21cb77a3705e@canonical.com>
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

On 23/06/2021 11:35, Krzysztof Kozlowski wrote:
> On 23/06/2021 11:25, Petr Vorel wrote:
>> Hi Krzysztof,
>>
>>> Microsoft Hyper-V with Linux guests does not support CPU hotplug, even
>>> if enabled in kernel configuration.  Quoting Ubuntu bug report from
>>> June 2018: "While Hyper-V may present all potential CPUs via ACPI MADT,
>>> CPU add/remove is not supported.". [1]
>>
>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>>
>> LGTM. How many of tests will need tst_virt_hyperv? Although we don't touch
>> legacy API, I'd make an exception and add it to both test.sh and tst_test.sh
>> (ideally with an API extension, i.e. test could use SKIP_VIRT="hyperv", but that
>> can wait till tests are converted).
> 
> Around CPU hotplug that would be the last one I did not spot so far
> other failures but I also do not track all failures in nice way. Rather
> fixing them ad-hoc...

I just checked more and there are additional failures on Azure/HyperV
with more nodes: cpuset_load_balance, cpuset_memory_pressure,
cpuset_memory_spread and cpuset_sched_domains. These did not appear on
smaller instances (e.g. 4 CPUs).

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
