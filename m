Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F6A3E8E3E
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:14:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 804143C701D
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:14:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F18EC3C31A3
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:14:42 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 61EBD1400185
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:14:42 +0200 (CEST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 9BF463F240
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628676881;
 bh=ODW8H8bJPGzz4PEV0eme5qflLILLU+Jd4Zv95zp+RFo=;
 h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=jjosGi+DcmQZhDgRBla3fa2j+0sa82R84N4g+7joKXlRmQVfJay0aTqWnjB/1I8pw
 2iO5a83JN2YdBXIMtDPlOJQBaBEjDOPAWcAdSC010UHJI+DrOOQCM2bZG71KYEZ63u
 8qNiV9QdrDPeUB8TeRAfvyxWQWHtquHfsuCnLTAH1qVqdT4ii0r/hcNJcLhNfcBAvr
 /EUGwxLYbqU8q4kqxah9Ps5PwzdnTvxViYrtGvMvOFbkkJYa4QbX9/VVPMHXOJ/46t
 2F1b1hNxHJNAJTPs7Fk0k/goZdlrDeGX9MsvnqbRddG8aFBTxi1P7M84uNCt1hQpRP
 S6vzx8468qxeg==
Received: by mail-ej1-f70.google.com with SMTP id
 e1-20020a170906c001b02905b53c2f6542so493270ejz.7
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 03:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ODW8H8bJPGzz4PEV0eme5qflLILLU+Jd4Zv95zp+RFo=;
 b=AtHXYWj4nut8uf0AFgkgVCcM+4j+eI3J5lI9Rinf3uANV5aSzTYH3ScS4BYhwxWMwh
 X2FhLpWeM1asOf2GtpLHRmY1KfCQE/BCi1bn9iWcFe500K3bN5d5/eyPAnNwtDsBXYpp
 LUmCNJJV7SGC3RskAucUPspahtUwcOOfcu0QGu3cbW9wS0BeSAb4C/sA8p4JDTP5tjYO
 b2iP58RK6JKhNFLxmb6JrOKGburnLhAIvB9mXqFsB6eCAE8B945a7gGOktfWC1dMPFZn
 7gu/m2SDHa6HhLOZm68LEQJOZTJyQtWTXNMS2FJWdbZcrcIiAiOvzHQf3i6aYffVg4KV
 UVsg==
X-Gm-Message-State: AOAM531pjeG1euXctmmhGlEt8uw73dfGH+ilRUFdvcuLFJOKIK+v5V2p
 IjhTowD+vfoAXa/FrX4Yldt2a8CfKVSP2qJpprUqAzDvxESsSCFzhPJFFuFDu9vh6RtjrEqUsuL
 DcYr0PYGq/90deJFX6EOCkOoPQFle
X-Received: by 2002:a17:906:8047:: with SMTP id
 x7mr2925276ejw.453.1628676881414; 
 Wed, 11 Aug 2021 03:14:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfqU3sWLUROmhpIYG9dstwObNCTjIykvuFpiQEVWAlcI122S15dLMseRfiG7uvV6XUzaxb7g==
X-Received: by 2002:a17:906:8047:: with SMTP id
 x7mr2925262ejw.453.1628676881246; 
 Wed, 11 Aug 2021 03:14:41 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id cb6sm3332085ejb.60.2021.08.11.03.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 03:14:40 -0700 (PDT)
To: ltp@lists.linux.it
References: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <dfe1bdd0-3131-ca3f-5a06-6ba427681f65@canonical.com>
Date: Wed, 11 Aug 2021 12:14:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 0/4] syscalls/msgstress: fixes for small systems
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

On 29/06/2021 14:10, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v3:
> 1. Adjust subject of patch 2/4.
> 2. Don't use TEST() macro in 2/4.
> 3. Remove debug messages in 2/4.
> 4. Return unsigned int in get_session_uid() as it cannot fail in 2/4.
> 
> Changes since v2:
> 1. Resend due to messed up previous submission.
> 
> Changes since v1:
> 1. Move the code reading cgroups session limit to lib/tst_pid.c to
>    existing tst_get_free_pids_().
> 2. Allow reading session limits from cgroups v2.
> 3. Add patch 1/4 - typo fix.
> 4. Add patch 4/4 with the buffer/reserve of pids.


Any comments on this set?

> 
> Krzysztof Kozlowski (4):
>   include/tst_pid.h: fix language typo (subtraction)
>   tst_pid.c: fix fork failure on small memory systems
>   syscalls/msgstress03: fix fork failure on small memory systems
>   syscalls/msgstress: tune limit of processes for small machines
> 
>  include/tst_pid.h                             |  6 +-
>  lib/tst_pid.c                                 | 72 ++++++++++++++++++-
>  .../syscalls/ipc/msgstress/msgstress03.c      | 15 +++-
>  3 files changed, 89 insertions(+), 4 deletions(-)
> 


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
