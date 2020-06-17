Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 063B31FC562
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 06:51:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C4933C2CAB
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 06:51:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 80A0B3C02EF
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 06:51:53 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B44F1200C21
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 06:51:52 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id y18so373753plr.4
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 21:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5WOdpkgQxHzxKNDTyXC/r6TLR9jdyPoHbSLosbHSj2Y=;
 b=kwO3Rki2h14K8njUIOlNsHBQscKquVlprOVN2OdEf8u9ez8WUBcVr1iCc+WKS8sWuZ
 gXSgf+E9uniYbJIsfNDEGVkTTtuMD7WUgBlS6PPVqwGU1SGPhZMiUJmBNu80QPY4NJMa
 Qd7B41McttbOqeKs6iI5RvoCFqmSPf6G9RUBaOhN23is3OGyBMB99OyDd8uY9MEP9aw/
 I5vMn+gSuLZ/USsHEaz8ausKaqls48M/eIMeDY+d410fGxnNU+fx2xFLA1CIym5FteGU
 L/KODDPqJzOPh88h44YUa66n+plWxHbyKy3Z/YpJ7kbLTV5YiZCB2Hrr8Qz2X7JsAMtX
 /YIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5WOdpkgQxHzxKNDTyXC/r6TLR9jdyPoHbSLosbHSj2Y=;
 b=QjFFmj+VSCjwVO9c4AapcP59wHcFXLWPSqM2HA5bILmAs7iaP2tOQF9jxXwjG/kve6
 v9oNMwl8D1U8fWznhpwaDbeya/z+E8Gb9UyK52JEM4/D0bliAukfjnMsBMbxPL4+SrK8
 u5x2GP0WhdqKb7ZbIuDFRMy6bGmy5Jvi6xbnvAOv1Rn2KVpuUw+7OaUY5sXnYrdJsnxZ
 Lffh2wLC1V2uB2VowB6SXeekBpKmNAyQkjZKS3DNqOjoWmXxrne2+l60D85cUJ+3fjck
 tmowtXFqoBGmOL5LOaxIBWQD338mEjBHm4NXtt+FmWa/0UFxteyg+EWx5a1x1j0zMdAR
 HfFw==
X-Gm-Message-State: AOAM530qtyUXMDqHHMjSY0NBw3J8gB0TsnMt0VFEXD6B4f2TmSlovPpI
 lXzcChLQZwbieMGLmU0/PiWy8Q==
X-Google-Smtp-Source: ABdhPJx2TY5fxnjPcGAnrP8XS8jyghAuGeEfwyZsPmzFLFW/MumhyFSsxKzRzpF/97KyQj/w+GaRPQ==
X-Received: by 2002:a17:90a:240c:: with SMTP id
 h12mr6178881pje.42.1592369511156; 
 Tue, 16 Jun 2020 21:51:51 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id 6sm18764999pfi.170.2020.06.16.21.51.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 21:51:50 -0700 (PDT)
Date: Wed, 17 Jun 2020 10:21:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200617045148.vegbo3ufpjeqlrgz@vireshk-i7>
References: <20200616190918.24761-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616190918.24761-1-pvorel@suse.cz>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] lapi: Add posix_types.h
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
Cc: Arnd Bergmann <arnd@arndb.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 16-06-20, 21:09, Petr Vorel wrote:
> To fix undefined __kernel_ulong_t, which was defined in v3.4-rc1
> in afead38d011a ("posix_types: Introduce __kernel_[u]long_t").
> 
> This fixed build error:
> 
> In file included from /usr/src/ltp/include/lapi/msgbuf.h:13,
>                  from /usr/src/ltp/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c:9:
> /usr/src/ltp/include/lapi/ipcbuf.h: At top level:
> /usr/src/ltp/include/lapi/ipcbuf.h:187: error: expected specifier-qualifier-list before '__kernel_ulong_t'
> 
> Fixes: 3e1fc0644 ("include: Add declaration of struct ipc64_perm")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
> 
> or is it a time to drop that support?
> If I remember we were talking about 3.0, this is 3.4.
> 
> Is this correct?
> +#ifndef __kernel_long_t
> +# if defined(__x86_64__) && defined(__ILP32__)
> +typedef long long		__kernel_long_t;
> +typedef unsigned long long	__kernel_ulong_t;
> +# else
> +typedef long			__kernel_long_t;
> +typedef unsigned long		__kernel_ulong_t;
> +# endif
> +#endif
> 
> Kind regards,
> Petr
> 
>  include/lapi/ipcbuf.h      |  2 +-
>  include/lapi/msgbuf.h      |  2 +-
>  include/lapi/posix_types.h | 21 +++++++++++++++++++++
>  include/lapi/sembuf.h      |  2 +-
>  include/lapi/shmbuf.h      |  2 +-
>  include/tst_timer.h        |  7 +------
>  6 files changed, 26 insertions(+), 10 deletions(-)
>  create mode 100644 include/lapi/posix_types.h

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
