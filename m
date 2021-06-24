Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F653B370E
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 21:32:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19DC23C8A49
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 21:32:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C3E4D3C5863
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 21:32:44 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 55DFE200DE5
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 21:32:44 +0200 (CEST)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwV5f-0002Xb-Iv
 for ltp@lists.linux.it; Thu, 24 Jun 2021 19:32:43 +0000
Received: by mail-wr1-f69.google.com with SMTP id
 g4-20020a5d64e40000b029012469ad3be8so2302742wri.1
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 12:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+LJY3YfhGe9zpwEaBHEzjEjQ0q5mLxo5xTdZezhTJzY=;
 b=eg0DUXdlZtTe18QguBBHoM2gkz3CCsaKkhxT2IunrkUwN/ZY06CqJ5wT6QgiPBu3zA
 g/0gJ7g0RPvQGjdYw2OYuSuot92S/DrZ/gZRkg2OYMMJgHSM5FS8pQu9N8Q5Pobb9jCF
 ex2loqnZ2caNo+p+8VZfsSm5fGXMfMOr/+oIg+4dlr8bRKrVRGVLBpgwpIA1s52WJF5U
 v6drEYJ3hDADHfxqa56QZbXBMpraJ2T6uUrqy0n/FkkfBywEfthSPbqaPkWemRHF4Zo4
 52RXMM6BRXLQBaHW317praDZ8guWztTCk6IqTvE40K7QrpLpnva2Rbvtg8dp0jzQs0/8
 Fsdw==
X-Gm-Message-State: AOAM532ymFtFb+7pUEw7imFVLFr4Y/sBUu8I2nfR6/LDcinlDSULmbkW
 vrANdNnqxqEGIq+Xb17+//NRtI/GcaN+6lj4LEjn8ZISVAeuKrDXHTStyhT7fRW36gUJ5wQ+UCX
 Yl5mMOUx8m4aCWY2DGrJ3QRvEQwqV
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr6293013wrz.127.1624563163155; 
 Thu, 24 Jun 2021 12:32:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbZTInFnqp4pN67Yd60AtwkrBdxRhVvNSgOtphWDV3mYiclmRlQJSTVMc1cBoPDSftr+bStg==
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr6293001wrz.127.1624563163019; 
 Thu, 24 Jun 2021 12:32:43 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id f5sm4825931wrf.22.2021.06.24.12.32.42
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 12:32:42 -0700 (PDT)
To: ltp@lists.linux.it
References: <20210618130536.54806-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8753cbfb-01ac-34f9-57d6-afa33629ac78@canonical.com>
Date: Thu, 24 Jun 2021 21:32:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618130536.54806-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] tpci: fix NULL pointer dereference on wrong
 test invocation
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

On 18/06/2021 15:05, Krzysztof Kozlowski wrote:
> Fix NULL pointer dereference when a ltp_tpci test case is started before
> choosing the device:
> 
>     ltp_tpci: test-case 12
>     ltp_tpci: assign resources
>     ltp_tpci: assign resource #0
>     BUG: kernel NULL pointer dereference, address: 00000000000003b8
>     ...
>      Call Trace:
>       dev_attr_store+0x17/0x30
>       sysfs_kf_write+0x3e/0x50
>       kernfs_fop_write_iter+0x13c/0x1d0
>       new_sync_write+0x113/0x1a0
>       vfs_write+0x1c5/0x200
>       ksys_write+0x67/0xe0
>       __x64_sys_write+0x1a/0x20
>       do_syscall_64+0x49/0xc0
>       entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Hi everyone,

Any comments on these two tpci patches? Do they look reasonable?

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
