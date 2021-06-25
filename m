Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6623B42C2
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 13:55:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 262AC3C6EF1
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 13:55:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 854943C4D07
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 13:55:50 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5A125601064
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 13:55:49 +0200 (CEST)
Received: from mail-wm1-f69.google.com ([209.85.128.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwkR2-0003Uv-22
 for ltp@lists.linux.it; Fri, 25 Jun 2021 11:55:48 +0000
Received: by mail-wm1-f69.google.com with SMTP id
 m6-20020a7bce060000b02901d2a0c361bfso4100255wmc.4
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 04:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iiTnl00wUQLqsJsDfkR40rgHesDgv44AcsaIyJPYWns=;
 b=owlXvI7jixnLas7mSfv9rkXXjgrH0xP11u55Bof3yQvuOmcVu70MPmD/WdsY/YgcRK
 rN0F2i7sBgv/7kUrtKyYszd+FAU1VGP/BdBGkij7hlRJgSduzoQOaGmdotbWwY+G7/nY
 CH+CiYMPsz2713wEVDT9MKDxo766vPJL3azLuHKIllFhR8BYLiUeMX4SKZ0Cj6OyLBzw
 /RNVlryahj0ErCNu1gObUC5cH5H5vemGkIpgHQZVbhzdOqs7Hzqk89SHLKj5GpVWtxGF
 onSWakiJrk52+5rM51bmhKdclwyeTejhrfiq641dMcPBmBNtLKixqrhxOx1iF4aqW+0Q
 dLlQ==
X-Gm-Message-State: AOAM531sjoWVVaU3cEutYTMHJ1lqwP5wUwLPecw96toRALFJStgcq5al
 hiGA237vGj14UdWVwAUuhlRQsZF1JWC4MR4YbC9y+gduHLVSu0sPJothWihG/y44bWcCgpE4+o3
 0945FFW6q4cuDdkYqjDVo51HPW7n6
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr10483667wry.120.1624622147451; 
 Fri, 25 Jun 2021 04:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ/utV7Q7qTSGniBm+UotsfWrFyy9SPehBOLTNGSlQhxn+lQ3WFKwZB0YdAHuKJd85RbMkvQ==
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr10483654wry.120.1624622147276; 
 Fri, 25 Jun 2021 04:55:47 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id w8sm5675568wre.70.2021.06.25.04.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 04:55:46 -0700 (PDT)
To: Joerg Vehlow <lkml@jv-coder.de>, Li Wang <liwang@redhat.com>
References: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
 <bd56facc-55a3-4e8a-4e9d-304d5177462d@canonical.com>
 <CAEemH2dqM29Y5s5U2QbeONH30h6aR1B4DZxSnSdowWKSXzfgYQ@mail.gmail.com>
 <0042989e-08b8-88d8-75e5-00c09f6c25bb@jv-coder.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8377f0a7-43f9-831c-ffe5-6f10238815e7@canonical.com>
Date: Fri, 25 Jun 2021 13:55:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0042989e-08b8-88d8-75e5-00c09f6c25bb@jv-coder.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

On 25/06/2021 11:24, Joerg Vehlow wrote:
>> Forgive me pour cold water on the method though it looks good in coding:).
> I would just suggest to make 32 * PAGESIZE a constant calculated in 
> memcg_lib.sh, instead of calculating (and defining) it everywhere.

I understand that you want to define constant in memcg_lib for a
accepted higher bound of some specific memory limit checks? Won't that
be extra confusing? Trying to generalize some constant without actually
knowing what is it about and to which limits it applies?

Now it's this unknown part is quite local and documented in three
places. I can move it to bigger scope and pretend it's generic, if you want.

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
