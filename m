Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A99D3FDE4C
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 17:14:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF92A3C2BD6
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 17:14:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 397903C29D7
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 17:14:12 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5451F600C7F
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 17:14:11 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A81423F322
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630509250;
 bh=yqwCJPrPpQ3hNXihWNwrVXsS1+LRj5gld0uzfK8x15U=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=OEKQcsKsYLrqM7fxDD7CNwXeZoN7MqCp129kD+kdVgwPUdhMSNCtIgmiQfY8RKHah
 J3NdJwgJj1c060KFVA/HcI56FwvSHTpnDB5aYMmm9/m8GpmouZKfUYSRMLL/f34jNW
 HNMkZEJ4HqLZQ7bya4kF5CIlLkKeY11bl+t8FmDsrU1tXSfZegnG+YipRDVYirVikO
 S6xutDrqqmQxup+2rSFb6bd1Z4KCUAQdpPCpSPPrPjvLb7AlvVSFOz3uGK+FFz+y2Z
 K/kDfm/Y+UCsNuVlyyuFDdjygsxFymN3DhdPtaYaZZhErRNPIxa3XUKrMUkAn+uS12
 9tgaFyprnSClg==
Received: by mail-wm1-f70.google.com with SMTP id
 p11-20020a05600c204b00b002f05aff1663so1162262wmg.2
 for <ltp@lists.linux.it>; Wed, 01 Sep 2021 08:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yqwCJPrPpQ3hNXihWNwrVXsS1+LRj5gld0uzfK8x15U=;
 b=f0bD53J4pvXLF8lDeLbSIgw9N8bO0epjHqkgwEmIhuP68cv8/oHckSeWPnXTuxvlfA
 RTrq9tlFPFVIkLQV9A4sItQXX1GLbh4gUTh/uTZCWcMWkj7lJ+2NM4/4mLwkj5a1jhJ0
 PBA8bArelNeihoHZRLbqknsQpzYFjT+WV96pvXDfb0FjHRRazoTmtgZ0dTtb4Hql4rRs
 fwNezcNupmXCTl0CK7GUEb4htSUwAN0V2zYmsMrQKSNy9Rr2dwGNd1YLPEV1WgdekYsC
 F6Zh6P1NeOggwheeCeLkSWlMVKYnyCrbdnAmuFg13oocB0zzQGuMxrbGNnrkRyBZ0Z6q
 GmwQ==
X-Gm-Message-State: AOAM532eu3u3PGOvu7DR1W7Miw3lO/ElRRgCLvSL6k6IrKsUljmASa9h
 mIQfz9sNxgEsnIlDu+1wxwAbRx4YbU9j6NQyn0jDMfVWPGZZKfa17OgP92CNEMcDqFUr7D4+Ydw
 6GtDKNNLHrK36npnUIYNyAtI8ItWB
X-Received: by 2002:a5d:6909:: with SMTP id t9mr36533931wru.44.1630509249768; 
 Wed, 01 Sep 2021 08:14:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBQyRy2M5VzG9CI1omdZ/v/SF4M0xhgjacuLqfYSBtLbjwqITxfpIMVpPJYOF2VKJSwS6Hjw==
X-Received: by 2002:a5d:6909:: with SMTP id t9mr36533916wru.44.1630509249618; 
 Wed, 01 Sep 2021 08:14:09 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.112.211])
 by smtp.gmail.com with ESMTPSA id d145sm5521659wmd.3.2021.09.01.08.14.07
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 08:14:08 -0700 (PDT)
To: ltp@lists.linux.it
References: <20210901145127.92315-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <096999da-3b87-8c2b-4640-e36e8809e8c5@canonical.com>
Date: Wed, 1 Sep 2021 17:14:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901145127.92315-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] lib: add tst_get_free_pids helper program
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

On 01/09/2021 16:51, Krzysztof Kozlowski wrote:
> Add a tst_get_free_pids helper program so shell code can get limit of
> tasks/PIDs in the system without duplicating that code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  testcases/lib/.gitignore          |  1 +
>  testcases/lib/Makefile            |  2 +-
>  testcases/lib/tst_get_free_pids.c | 19 +++++++++++++++++++
>  3 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 testcases/lib/tst_get_free_pids.c
> 
> diff --git a/testcases/lib/.gitignore b/testcases/lib/.gitignore
> index a2e9f1ef0c08..5a0e8cba2ee7 100644
> --- a/testcases/lib/.gitignore
> +++ b/testcases/lib/.gitignore
> @@ -2,6 +2,7 @@
>  /tst_checkpoint
>  /tst_device
>  /tst_getconf
> +/tst_get_free_pids
>  /tst_get_median
>  /tst_get_unused_port
>  /tst_kvcmp
> diff --git a/testcases/lib/Makefile b/testcases/lib/Makefile
> index 38813e640ab1..179b474795d3 100644
> --- a/testcases/lib/Makefile
> +++ b/testcases/lib/Makefile
> @@ -11,6 +11,6 @@ INSTALL_TARGETS		:= *.sh
>  MAKE_TARGETS		:= tst_sleep tst_random tst_checkpoint tst_rod tst_kvcmp\
>  			   tst_device tst_net_iface_prefix tst_net_ip_prefix tst_net_vars\
>  			   tst_getconf tst_supported_fs tst_check_drivers tst_get_unused_port\
> -			   tst_get_median tst_hexdump
> +			   tst_get_median tst_hexdump tst_get_free_pids
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/lib/tst_get_free_pids.c b/testcases/lib/tst_get_free_pids.c
> new file mode 100644
> index 000000000000..276ce994b67a
> --- /dev/null
> +++ b/testcases/lib/tst_get_free_pids.c
> @@ -0,0 +1,19 @@
> +

It's missing SPDX. I'll send a v5.


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
