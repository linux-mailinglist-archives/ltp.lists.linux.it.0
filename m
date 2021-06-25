Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F02803B401A
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 11:13:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E83B3C6F19
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 11:13:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7060C3C1D46
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 11:13:33 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A3B3A1A002E6
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 11:13:32 +0200 (CEST)
Received: from mail-ej1-f71.google.com ([209.85.218.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwhtz-0002E0-GK
 for ltp@lists.linux.it; Fri, 25 Jun 2021 09:13:31 +0000
Received: by mail-ej1-f71.google.com with SMTP id
 p20-20020a1709064994b02903cd421d7803so2872249eju.22
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 02:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ADLw22D3hqiqUaVZh49iBpDgksUQX2hHX3uu/AE4sHc=;
 b=jtrqmZh5frrNx5cUIeBuZZtW3LNlLCa7fv1V0DAdEdiUfssUjX4gCKvtZIh0jQcOyK
 7PDDshxXaSRBDW6P6+OZ3bS+zpP4x3LdQ80ag7fbAVxx7qvolqyMlIpgIVeEGVOlPhPk
 di3vsALt0kpRQGR7ZO2y9MJHamiDLChVBJinV5doxYbpSQy7ysUznauYXYOxG7Xm07/E
 GGeW+lcHRw9ihXQDGovx+Wt08LsezS13SpX79UtSqYswLCmJxUwgvdtyIhpY/h87Aua9
 BdVLQvLV3dw/7cs0ikNkNZhsXW/Q87IbC0S6m1W0JqZ4iJTMFc8wC9BhMDiW6bNwSpkL
 gUyQ==
X-Gm-Message-State: AOAM533k+vQRPTuxvIa2zFvtM8sI33OXxjZsYyxJG8Yx1MsEXhpGa3MH
 Lj0RgoMaiFdBPOwyV9DC91xAN0MO2uFydGekIbnC5xmkGrVZs4PptK3g4icuPV6CMlP9GB+Ssly
 uDq5D9XOpF4rbGMpZhE5mqFd0nmPd
X-Received: by 2002:a17:906:110b:: with SMTP id
 h11mr9961481eja.356.1624612410800; 
 Fri, 25 Jun 2021 02:13:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaThnKQLVxODtbCfBw00INl1DX2bNKpP0/cNJVIQpUhWIbmORxeN6IAiAiOkSz/BNOfQE0EQ==
X-Received: by 2002:a17:906:110b:: with SMTP id
 h11mr9961465eja.356.1624612410600; 
 Fri, 25 Jun 2021 02:13:30 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id e13sm842119ejl.98.2021.06.25.02.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 02:13:30 -0700 (PDT)
To: Li Wang <liwang@redhat.com>
References: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
 <bd56facc-55a3-4e8a-4e9d-304d5177462d@canonical.com>
 <CAEemH2dqM29Y5s5U2QbeONH30h6aR1B4DZxSnSdowWKSXzfgYQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <56f9de88-92dd-a005-4248-107bf60083e2@canonical.com>
Date: Fri, 25 Jun 2021 11:13:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2dqM29Y5s5U2QbeONH30h6aR1B4DZxSnSdowWKSXzfgYQ@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 25/06/2021 10:21, Li Wang wrote:
> 
> 
> On Fri, Jun 25, 2021 at 3:31 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com
> <mailto:krzysztof.kozlowski@canonical.com>> wrote:
> 
>     Hi everyone,
> 
>     The patchset got positive LGTM on the Github. Any further comments for
>     it or can it be applied?
> 
> 
> I slightly agree with Richard that we need an explanation/investigation
> on where the 32*PAGE_SIZE comes from. Otherwise, we are very possible
> to mask a counter bug if only to make the test happy.

I don't know where 32*PAGE_SIZE comes from and investigation would
require effort/time which I don't have.

I don't think we mask current bug as this appears in multiple kernels -
I tested from v5.4 up to 5.13.0-rc5-next-20210608.

It is possible this will mask future bugs but that's life of a project
depending on kernel internals, not on API or ABI. The kernel is allowed
to change such details any moment because it is neither part of API nor
ABI. Therefore you just have to live with inaccurate limits or keep
investigating every x-months.

For now the test is simply unreliable.

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
