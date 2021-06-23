Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB163B170F
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 11:39:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34D2A3C8E3B
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 11:39:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2E22E3C6FD2
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 11:39:07 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 80C61600662
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 11:39:06 +0200 (CEST)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lvzLd-0004IV-Pe
 for ltp@lists.linux.it; Wed, 23 Jun 2021 09:39:05 +0000
Received: by mail-wr1-f69.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso844188wrh.12
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 02:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QidmOyzahHlpXR6Cez/GcQtERBSw3KhCi1rjJw6yO3A=;
 b=OwKe3PQ5Q19/ARQzgHucFbIqyDBJZPWeC7vxWF8fn3409aSCkOmoQvp0XaadEpoLLt
 PT6rjigb/etu6qv19DkpgSjRFFi4qxlm0MJC01EkK+pcShTI0Nr7VOMPexWggB67Cbr7
 WA4tvKYzwag05/Pk2apdClNSqYqMBlHLUQR7ExOI2I0L0Tpw8Tewr091m6T9/Ycowe/y
 cFw8dRHsLHer6T+AvE17AedA4IUZAmbpG0q2c8spwGj+5SJ2VtUEkdGQdNHxUd9cMFoH
 w7qE2yqlCkKGiV6nJEb42FGIh0LkBHvlprZ4N7z1jZyAoDlB/Dvtujd7C71sIbxY+HoG
 djUQ==
X-Gm-Message-State: AOAM5336FFI2dVEV2eu0TseWtWUqknRT71dIXwgcLk4jrA7n/jrFAKa1
 hx0tn0YYNqTaMRCAGu+vCTxv6aWhQbhODAPiW0GrUinMWOPj5MowPxD01Nl1zAuD3f0P0PnWfz+
 AvEy3dqoGJgnvxFynQWaEjTWopXPl
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr9731036wmk.3.1624441145215;
 Wed, 23 Jun 2021 02:39:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkL0124mkDAIWCw7iVdyTAHZpPSc53bAp2/nLw8FZRztAvi2hZdR4ahxKhebzi5hDyNmO1JA==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr9731027wmk.3.1624441145075;
 Wed, 23 Jun 2021 02:39:05 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id w8sm2187755wre.70.2021.06.23.02.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 02:39:04 -0700 (PDT)
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
References: <20210622111440.74722-1-krzysztof.kozlowski@canonical.com>
 <60D2FEFC.8030706@fujitsu.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8dd7fb6b-c1d4-819c-9013-f19589f89eb3@canonical.com>
Date: Wed, 23 Jun 2021 11:39:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <60D2FEFC.8030706@fujitsu.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/msgstress03: fix fork failure on
 small memory systems
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 23/06/2021 11:28, xuyang2018.jy@fujitsu.com wrote:
> Hi Krzysztof
>> Running syscalls/msgstress03 on a system with less than ~4 GB of RAM fails:
>>
>>      msgstress03    1  TFAIL  :  msgstress03.c:155: 	Fork failed (may be OK if under stress)
>>
>> In dmesg:
>>
>>      LTP: starting msgstress03
>>      cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-1.scope
>>
>> The reason is cgroups pid limit set by systemd user.slice.  The limit is
>> set for login session, also for root user.  For example on 2 GB RAM
>> machine it is set as:
>>      /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max:5207
> This file only exists on cgroupv1 and cgroupv2 should use
> /sys/fs/cgroup/user.slice/user-0.slice/pids.max.

I can use both paths.

> 
> Also if some embedded system doesn't have systemd, do we have a generic 
> way or fallback way to calculate the pid max?

This slice is set by systemd, so no-systemd systems are out of scope
because:
1. They will not be affected by this.
2. The limits there might be set by other init manager so other patch
should come in. Making a generic solution for unknown-init-managers is a
much bigger task and not necessarily needed,


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
