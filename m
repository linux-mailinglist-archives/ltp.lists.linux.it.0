Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C4C265E71
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 13:01:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 364B93C4FC3
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 13:01:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 7E4383C1C7A
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 13:01:45 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4E2931A01103
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 13:01:45 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id j34so6386190pgi.7
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YxHTddLzTpRNE/9deXpiqOJBkT2+8BvvRh9FfHqfmQM=;
 b=J26qjMllvALLJ4kedSoHuQ0o3xNXKDjsSKyhxhqxO1ubAokzxKoSbC27pHpeA2yMEM
 6sxqp4JXO02fiMKncmOhaoQVkE4C0KGGgSPz5PFXORKSC9w5zqBI3UL5Mnq9Mn0Iqlon
 IJuAzYQSp1b7YfS5IC7EYcKb3aPA8KFgQNjsfdhEeNWaAl4uoWf40ZUvgMVGOR45eejp
 ozyAq8+ugXJ0B5hA+W/ssiDnPLBYQuSH5jHifC2GtAjboAr7pQ6pS0XYxRAKeXUeYo0O
 bOR+tzBww7eGOQ5Wb345BFeBIWkdsUiPdQZEitOv1ugX738rtu5DtaFMA9XS5M6ssdwt
 kcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YxHTddLzTpRNE/9deXpiqOJBkT2+8BvvRh9FfHqfmQM=;
 b=WlvX5prxbu3wdYLpKvPZKfjLJwLUiG8zm4IQWCqskh1AsUf/PXPi8NOeNNBQqCxYk1
 ZwgFdnVMizDV4Yuem5wsGndH/o1Yd+ETGlMF8ks71/g4gD46NDsprurTZpR6WOjs+t/T
 HKwP3V8VicIr27ZcEWNxwgbAV4AQrmrUlxb1m/AnSvFIKhk+Ib6WGfZwvD2He7mPExxt
 t0LE9IbmmAnmENxKGT3oAUAMMEo3hiRa1r0nFP2Cwdppu7LlstWq9gCaERpkOkKNvWul
 L12/n/E41Lqcj9H13CtYDo11fNXK2IaCQBMfP75ptLmufzGL22rMIlU7ma1/B2imv/jv
 YwCg==
X-Gm-Message-State: AOAM532/MuVMK1VXfDuXTeVPGQrFU2kaugWXd7vQTtSHlNIyne4KGeV2
 qrc1lbD/LUNJ/sMpBPZMqGUZdQ==
X-Google-Smtp-Source: ABdhPJxhTGEbgRH+DeCdiiDJbvgZVItY8gSd3TBhtxTD1+i8PC1MP+NMlcPRpng380o+gNaE3A07tA==
X-Received: by 2002:a63:d115:: with SMTP id k21mr1272354pgg.272.1599822103662; 
 Fri, 11 Sep 2020 04:01:43 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id r144sm2134807pfc.63.2020.09.11.04.01.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 04:01:43 -0700 (PDT)
Date: Fri, 11 Sep 2020 16:31:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200911110141.6vgc44hrl2hbtq3r@vireshk-i7>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
 <20200911095314.GA9505@dell5510>
 <20200911103950.kehhklgyie2tqpxh@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911103950.kehhklgyie2tqpxh@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/16] syscalls: Use common variants structure
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11-09-20, 16:09, Viresh Kumar wrote:
> I didn't get any of these on my x86 box :(
> 
> I think this should fix it, but I would required help of your bot to
> get the testing done for all these architectures. This should get
> merged in the first patch, I will resend it.
> 
> diff --git a/include/time64_variants.h b/include/time64_variants.h
> index 934268b0328b..972eb333b614 100644
> --- a/include/time64_variants.h
> +++ b/include/time64_variants.h
> @@ -7,10 +7,13 @@
>  #ifndef TIME64_VARIANTS_H
>  #define TIME64_VARIANTS_H
>  
> +#ifdef HAVE_LIBAIO
>  #include <libaio.h>
> +#endif /* HAVE_LIBAIO */
> +
>  #include <signal.h>
>  #include <stdio.h>
> -#include <sys/poll.h>
> +#include <poll.h>
>  #include <time.h>
>  #include "tst_timer.h"
>  
> @@ -32,8 +35,12 @@ struct time64_variants {
>         int (*timer_settime)(kernel_timer_t timerid, int flags, void *its, void *old_its);
>         int (*tfd_gettime)(int fd, void *its);
>         int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
> +
> +#ifdef HAVE_LIBAIO
>         int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
>                         struct io_event *events, void *timeout, sigset_t *sigmask);
> +#endif /* HAVE_LIBAIO */
> +
>         int (*mqt_send)(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
>                         unsigned int msg_prio, void *abs_timeout);
>         ssize_t (*mqt_receive)(mqd_t mqdes, char *msg_ptr, size_t msg_len,

And both these changes broke my build. I don't even understand how
could the ifdef change break it for me :(

I am looking into it.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
