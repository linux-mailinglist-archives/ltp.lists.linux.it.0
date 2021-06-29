Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 754093B77CE
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 20:28:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C07BA3C939F
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 20:28:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7698C3C0234
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 20:28:05 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2DA81200241
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 20:28:04 +0200 (CEST)
Received: from mail-ej1-f71.google.com ([209.85.218.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyISq-00072U-9W
 for ltp@lists.linux.it; Tue, 29 Jun 2021 18:28:04 +0000
Received: by mail-ej1-f71.google.com with SMTP id
 d21-20020a1709063455b02904c609ed19f1so1907101ejb.11
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 11:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fYgcjWPuVQQkM+ld3lTDa/zt5ky7hqz4IgAOmjoJRPQ=;
 b=bRziPKmv6+qB+xBFXLRKd4ymFMoXHTg2DBaw9DNrjSOguNiaJHoBXX8P3PV4OxosTi
 ZQ0CWtopl7mUruo56O+dh/lLXg4Q+wh0w+yR/5+XYmLUaofWZ5ekA4OFkrPwd6hadQ2s
 fSaoOYqQypMvThyEfmpRNISQBupfg6T2Gg3dx8rGy3FNOLQ/IkkoPEn2OQKaDRPBotXS
 HRuZpxhxYqxLwmMt8SxUbuycbw3UnZuj7DLnST2KCDPzBp4V0/YdutO7L8n/gTeR/g86
 68eUSPKmxmw67HY3FSb0QvaZ2t8da79YxrApbhvgBEU0fnT1LFU5xbuZ7FGWyW584PYn
 OTcQ==
X-Gm-Message-State: AOAM532lEqxDxrF8dkysevHg52mOrcDn8Zen7ZKgl+7+XemlT1pC0Gjf
 NcgcRKkO8Cp9VDwa/zHBnU1h9mkpEow6/uGrYLQUrpMIdZSplL+/utxIg3Kjy6R63Uinw3/I3pw
 wH+EQkhjUYCB3QMxi8xc7Qz5nkPXk
X-Received: by 2002:a17:906:3e15:: with SMTP id
 k21mr5923600eji.423.1624991283445; 
 Tue, 29 Jun 2021 11:28:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGLqw1AwUxKpu6bhggUbVqYJuFIfNL6mC+UNE1sLGRBFc9Q0iOasyqzGrIJbdWtKTmTRhc+w==
X-Received: by 2002:a17:906:3e15:: with SMTP id
 k21mr5923594eji.423.1624991283312; 
 Tue, 29 Jun 2021 11:28:03 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n13sm8598198ejk.97.2021.06.29.11.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 11:28:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Josef Bacik <josef@toxicpanda.com>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "kernel-team@lists.ubuntu.com" <kernel-team@lists.ubuntu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>, Qu Wenruo <wqu@suse.com>,
 Filipe Manana <fdmanana@suse.com>
References: <a3b42abc-6996-ab06-ea9f-238e7c6f08d7@canonical.com>
 <124d7ead-6600-f369-7af1-a1bc27df135c@toxicpanda.com>
 <667133e5-44cb-8d95-c40a-12ac82f186f0@canonical.com>
 <0b6a502a-8db8-ef27-f48e-5001f351ef24@toxicpanda.com>
 <2576a472-1c99-889a-685c-a12bbfb08052@canonical.com>
Message-ID: <9e2214b1-999d-90cf-a5c2-2dbb5a2eadd4@canonical.com>
Date: Tue, 29 Jun 2021 20:28:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2576a472-1c99-889a-685c-a12bbfb08052@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [BUG] btrfs potential failure on 32 core LTP test
 (fallocate05)
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

On 29/06/2021 20:06, Krzysztof Kozlowski wrote:
> Minor update - it's not only Azure's. AWS m5.8xlarge and m5.16xlarge (32
> and 64 cores) fail similarly. I'll try later also QEMU machines with
> different amount of CPUs.
> 

Test on QEMU machine with 31 CPUs passes. With 32 CPUs - failure as
reported.

dmesg is empty - no error around this.

Maybe something with per-cpu variables?

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
