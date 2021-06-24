Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5793B370D
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 21:31:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 570F13C6F78
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 21:31:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0813A3C5863
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 21:31:47 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 39BAF200DE7
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 21:31:47 +0200 (CEST)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwV4k-0002VK-Gr
 for ltp@lists.linux.it; Thu, 24 Jun 2021 19:31:46 +0000
Received: by mail-wm1-f71.google.com with SMTP id
 l9-20020a05600c1d09b02901dc060832e2so2037317wms.1
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 12:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wSjqwP2hOD06e20N/ezc7jCf8U2MXWKFCflU4tCrOQw=;
 b=fLglqb3IiT4Pk8O96OP356uQmmIwJHc2yA93bCbWSBMBNmkXcOue0IqnnSpgLTSYvC
 T3dYTUFjHqFmrI9jo+28y03YPh6KDJeUU1TK34YV8RuZSq41a0gF2S8gLUNtbEVFHLNa
 zUuQPirg7RwXRcQUK6wIy8IZ6sit0/gBPvia+hQjFKkqLxSJ/iMQ2waPRV1PVMbL90JB
 grt6dmVtVnh6uvkiTUxi6Ju1dYyBF0vngM/YoxfFLcADaMuEEyN04PZfzxw2hf+qjQDq
 v9NxIHBPO5QxjNrWilDyTgenznje1p9PCvn9tJTB4z6H0UryaKnXTCJfyb3ZDOozWZZz
 t5Vg==
X-Gm-Message-State: AOAM533VjTFXuMEZDKK5Iz0PoyCzAUsgX+O76ySODhh3lqJ2pzYXXocp
 73C3CIziOx091ZJqHH5g0hqt1NSboQxXZk+mpeu6FWXEvcysWraqWgPNcE9qT01gJyBDj+A8vkV
 psfRkXJyvZrkRwyd8SoYXn7GXRB0G
X-Received: by 2002:a5d:4642:: with SMTP id j2mr6525391wrs.348.1624563105985; 
 Thu, 24 Jun 2021 12:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG3XnFu3cFJ2hNgaM2pUy+lBJtoCn225uXQCkLLi9HMCuFPfmwF8xhOfjxx+34gy8pLPFQ4Q==
X-Received: by 2002:a5d:4642:: with SMTP id j2mr6525371wrs.348.1624563105829; 
 Thu, 24 Jun 2021 12:31:45 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id x3sm9092624wmi.42.2021.06.24.12.31.45
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 12:31:45 -0700 (PDT)
To: ltp@lists.linux.it
References: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <bd56facc-55a3-4e8a-4e9d-304d5177462d@canonical.com>
Date: Thu, 24 Jun 2021 21:31:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/3] controllers/memcg: fixes for newer kernels
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

On 17/06/2021 09:07, Krzysztof Kozlowski wrote:
> Hi,
> 
> This is a resend of previous Github pull:
> https://github.com/linux-test-project/ltp/pull/830
> 
> The patches fix several test failures we are hitting since months, see:
> https://bugs.launchpad.net/bugs/1829979
> https://bugs.launchpad.net/bugs/1829984
> 
> Best regards,
> Krzysztof
> 
> 
> Krzysztof Kozlowski (3):
>   controllers/memcg: accept range of max_usage_in_bytes
>   controllers/memcg: accept range of usage_in_bytes
>   controllers/memcg: accept non-zero max_usage_in_bytes after reset


Hi everyone,

The patchset got positive LGTM on the Github. Any further comments for
it or can it be applied?

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
