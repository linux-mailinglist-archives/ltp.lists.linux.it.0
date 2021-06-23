Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C433B16FE
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 11:35:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DCF63C8A4E
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 11:35:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 724FD3C6FD2
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 11:35:41 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 69BA710005FA
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 11:35:40 +0200 (CEST)
Received: from mail-wm1-f70.google.com ([209.85.128.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lvzIJ-0003kk-Do
 for ltp@lists.linux.it; Wed, 23 Jun 2021 09:35:39 +0000
Received: by mail-wm1-f70.google.com with SMTP id
 f11-20020a05600c154bb02901e0210617aaso1129623wmg.1
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 02:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OTBgxSVGukiRoI0RnO7jlRLbneqTcN6I4aUtyhV6gIg=;
 b=KW6Z6wO3oj8567L3U85vv7CQl6KdK3JiPdvZMhTHjKBrY+PotFxOJyfLovRsOkiFxk
 LB+fXiPnp4fXq5wzWb6UFqg4kHcGR/CmgtvC/AlgOCBpr7L2lpQCccrv+WHRz6RB1Wcf
 kW+N9ZdluDyMoeVVzwVoAmyZCg5Q+q46oCyYyzvhXCGTvoohPeFz23UtCxiZ4Xwd7Nvd
 y7nOnci66TFWwbk2Gvx9uGRQ8qGJcShFiDi0ZsHu6kJHrMM4RVex4zFEa6MTHDUEWSUe
 TaqakLwG/8XxpU90pppx0Ie8ubMQ6c4wE1+E10SMYZxO/745pBJFaNpIyPs4LAMSPFxr
 g5iA==
X-Gm-Message-State: AOAM5301qb/4COcGmHPBPAOFuYERkAH56s/nR6vNpUG55mzntWyRybDQ
 yD7XUZWrtjyW8e6yZiBTLA9MviEUD9tdsJ6QuIbTY9q/M02zwUWzUyVoxTGO6OmyLzj8N1n2wYR
 xYtlDQBkmAzhMYHdDTFUWioR2gWmt
X-Received: by 2002:a7b:c005:: with SMTP id c5mr9642504wmb.113.1624440938811; 
 Wed, 23 Jun 2021 02:35:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfteYOXol4SXCikix+rTHKneaAgiMrojLGnLOP61wII4WteapK8DTGvyGSZelmRfKeMF8kHw==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr9642494wmb.113.1624440938681; 
 Wed, 23 Jun 2021 02:35:38 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id b15sm2647558wrr.27.2021.06.23.02.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 02:35:38 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210622145938.106477-1-krzysztof.kozlowski@canonical.com>
 <YNL9/k1iRralo/fj@pevik>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a7dd74e2-858f-19e4-d2bf-21cb77a3705e@canonical.com>
Date: Wed, 23 Jun 2021 11:35:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNL9/k1iRralo/fj@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

On 23/06/2021 11:25, Petr Vorel wrote:
> Hi Krzysztof,
> 
>> Microsoft Hyper-V with Linux guests does not support CPU hotplug, even
>> if enabled in kernel configuration.  Quoting Ubuntu bug report from
>> June 2018: "While Hyper-V may present all potential CPUs via ACPI MADT,
>> CPU add/remove is not supported.". [1]
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> LGTM. How many of tests will need tst_virt_hyperv? Although we don't touch
> legacy API, I'd make an exception and add it to both test.sh and tst_test.sh
> (ideally with an API extension, i.e. test could use SKIP_VIRT="hyperv", but that
> can wait till tests are converted).

Around CPU hotplug that would be the last one I did not spot so far
other failures but I also do not track all failures in nice way. Rather
fixing them ad-hoc...


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
