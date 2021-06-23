Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C51CA3B1BC8
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:58:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B1243C6FDB
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:58:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 620563C2307
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:58:21 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B0B301401191
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:58:20 +0200 (CEST)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw3OW-0000eY-3i
 for ltp@lists.linux.it; Wed, 23 Jun 2021 13:58:20 +0000
Received: by mail-ed1-f71.google.com with SMTP id
 cb4-20020a0564020b64b02903947455afa5so1360992edb.9
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 06:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xlF0mcGdwH7ByNTmRz1PYqJADCky8XHYLifUt/Eo6iw=;
 b=rWUyt/lEwq5f/12lDOJUp0XUIIcM8z9fCjr7xnoG45q8eIISmvy7zR/pQUHlDfXzXX
 PuvxfL2IlAIUpQv/mUtbkfp+K2ytacajq8dPvmB6gaq5bfK/mi8iGYr7YDR8TZsbC6Z3
 3yuxJvXW1qy7GQmf90xRWsST/Fp2rnZa2/JmTNSEnsCvcJWDRiMZbkMids40/x3JNG51
 899OIMGrZCAKOjYBjBzuF9KSY67OsQk3LLEH4UA4uV9P3n4GKT4ucvmv759YsQ3QE5+K
 3Vi0vSOWwmTx+RlbG+09ymT7eCEohi8ibTl3hEoCwuULgnqNnrUzALW/81pcQ8reenXS
 EGqQ==
X-Gm-Message-State: AOAM5302WZJ9WCUV/7dlAgZMpk+ipxI9hQnsH9wZ5g60PkG2F6uKgPB3
 L1teuo+jPSHbLdLvFo24FLGy5FDgP4WDfIJYteVDFdrGm4YH0wpZjuz+ompYyO6faM+X0orva4e
 +3zLybDzPm2l+AVtecg4DMkaUVUQa
X-Received: by 2002:a17:906:fad5:: with SMTP id
 lu21mr108379ejb.469.1624456699538; 
 Wed, 23 Jun 2021 06:58:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR5SpMJRhgDmlzhhQnbvGN5NJ74qKgiOWp98soIeS2GErsha+FskUj8fKU827JzNUWL/8Iug==
X-Received: by 2002:a17:906:fad5:: with SMTP id
 lu21mr108369ejb.469.1624456699399; 
 Wed, 23 Jun 2021 06:58:19 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id dj24sm82124edb.21.2021.06.23.06.58.18
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 06:58:18 -0700 (PDT)
To: ltp@lists.linux.it
References: <20210623135524.80663-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fa241120-da74-618b-b708-9f113031c127@canonical.com>
Date: Wed, 23 Jun 2021 15:58:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623135524.80663-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/4] syscalls/msgstress: fixes for small systems
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

On 23/06/2021 15:55, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v1:
> 1. Move the code reading cgroups session limit to lib/tst_pid.c to
>    existing tst_get_free_pids_().
> 2. Allow reading session limits from cgroups v2.
> 3. Add patch 1/4 - typo fix.
> 4. Add patch 4/4 with the buffer/reserve of pids.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (4):
>   include/tst_pid.h: fix language typo (subtraction)
>   syscalls/msgstress04: fix fork failure on small memory systems
>   syscalls/msgstress03: fix fork failure on small memory systems
>   syscalls/msgstress: tune limit of processes for small machines

Ah, I messed up and sent v2 with duplicated patches. Sorry for the
noise, I will send a v3 to make it organized...


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
