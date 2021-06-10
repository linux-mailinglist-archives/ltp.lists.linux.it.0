Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4573A2501
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 09:05:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C83F93C31BB
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 09:04:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 58A423C1D75
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 09:04:56 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AC4072011AE
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 09:04:55 +0200 (CEST)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrEkI-00072u-PI
 for ltp@lists.linux.it; Thu, 10 Jun 2021 07:04:54 +0000
Received: by mail-wr1-f72.google.com with SMTP id
 g14-20020a5d698e0000b0290117735bd4d3so433491wru.13
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 00:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=31RVS1FaoR7HrfN66YGlI0dxKd+vHUQBouoAqRm3xZo=;
 b=r+7gByVjKL2GSXZ2SK370akesjAVnoZO+87i9Hu8M1rdpBJQk2hkhEvYY1DqaCV+UW
 fAYmSYrtPxqPFTmHrpW2KSVJiRumxE9RYplxEmrWCmb2R1XEJIk3FOfRxsssGvVMaGHJ
 eJN4rR3c/9avx5cO3cjwGGEDuuSGpykW7rUycq2J6/LPJLo80b/Lf1xp3Si5i46Lrbnd
 51nIlPjNLSe+BE1Oj0wERONWc2QbKJcNUKJDpihgiB+2C68wE0RNz0kNTUhl7TeOC7Nm
 zQXBi/CQT3oVZe+8Uaze1GxjxMsQwe4H1BfQrx7wtKOVllVQ1YpbjNsV3hJrA0okYqx1
 dlGw==
X-Gm-Message-State: AOAM532TGakRjFwH4mGa7AUitQiWZXKY6WnW3BCD96a4Ka3ryeJbMw5G
 qpK0aEMyD8TO55OEIei8Q3xqgh7l9cC9YuF7u/kyMvQEu65S28KhpwJZefWceDFeJI/V0KiFrTj
 4yF979aGMTICaH6lM3mapizms+wvq
X-Received: by 2002:adf:8b9a:: with SMTP id o26mr3580751wra.96.1623308694012; 
 Thu, 10 Jun 2021 00:04:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3EfPZ12pZ/PJEZK+/wucO3i/mhDAUJDU34tVk8YtCYHtYN3HyrAIfVKLW/TRhU4hY8oCywA==
X-Received: by 2002:adf:8b9a:: with SMTP id o26mr3580726wra.96.1623308693792; 
 Thu, 10 Jun 2021 00:04:53 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id p187sm1937088wmp.28.2021.06.10.00.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 00:04:53 -0700 (PDT)
To: Yang Xu <xuyang2018.jy@fujitsu.com>, ltp@lists.linux.it
References: <1623297725-3296-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <121d371d-baca-fc43-9938-8d83e360d97b@canonical.com>
Date: Thu, 10 Jun 2021 09:04:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1623297725-3296-1-git-send-email-xuyang2018.jy@fujitsu.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_virt.c: Add fallback when not using
 Microsoft Hyper-V hypervisor
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

On 10/06/2021 06:02, Yang Xu wrote:
> If we don't use Microsoft Hyper-V hypervisorm, getrusage04 will report the

s/hypervisorm/hypervisor/

> following error:
> getrusage04    1  TBROK  :  tst_virt.c:175: invalid virt_type flag: 6
> getrusage04    2  TBROK  :  tst_virt.c:175: Remaining cases broken
> 
> We should add is_hyperv() function when try_systemd_detect_virt returns -1.
> But it is a bit complexd according to systemd-detect-virt implementation[1].

s/complexd/complex/

> Microsoft Hyper-V hypervisor detection has been introduced since long time ago,
> most system should support it.
> 
> [1]https://github.com/systemd/systemd/blob/main/src/basic/virt.c
> 
> Reported-by: Jinhui Huang <huangjh.jy@cn.fujitsu.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>

Thanks for fixing this.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof

> ---
>  lib/tst_virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/tst_virt.c b/lib/tst_virt.c
> index 14c4d526c..d23d7f564 100644
> --- a/lib/tst_virt.c
> +++ b/lib/tst_virt.c
> @@ -166,6 +166,7 @@ int tst_is_virt(int virt_type)
>  	case VIRT_IBMZ_LPAR:
>  	case VIRT_IBMZ_ZVM:
>  		return is_ibmz(virt_type);
> +	case VIRT_HYPERV:
>  	case VIRT_OTHER:
>  		return 0;
>  	}
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
