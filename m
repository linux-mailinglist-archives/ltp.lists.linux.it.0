Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C274E3FEB79
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 11:42:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93EAF3C2D5C
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 11:42:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 732AE3C1A2B
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 11:42:24 +0200 (CEST)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D21C41001175
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 11:42:23 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id e16so1191082pfc.6
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 02:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TkV9U6eH55FjoPzeAz8pFlo952jbFfuRVpzEQ7fp08E=;
 b=zwAX5LQ92EU+2DCp2oKoUA3gtiouC5MEHEb9MdEtWy0g1P0kGBXhJuQ3JYnclxFAK4
 hF+szppzbjMtfcBPNR5R8W1yG7b8YM7YPk+KmLd2IOYnjPEeRGkaIi0PVNZPxqvQ88cX
 H+rpy/PeStsGvRTu4wI0ja0nw+rEF7Sm/JDkfAui3BpILHzb28sdxIRemfWIKFFSmC6I
 zqfnSxn0+Ba62gpV46dHLDbcTlKttEzWxT3ca2RknPWCtBuacbTRaaj0wUiKdLFMOUp5
 7sQoC+rR57Lt5XibEgpJWOyKjHD/GvtJ2BhRcJj9PLILRtSHikiSIWMiFkA6m0kZLXgA
 Xd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TkV9U6eH55FjoPzeAz8pFlo952jbFfuRVpzEQ7fp08E=;
 b=JZNkvCOzMuFkATWTv8qIrO4suB36fiQAl4Upw5IcQaSlwB6oVN6nWjl6tb1bCe/0hH
 2f+x+ISsN5XAQ1M1zdoqkLzFSWKAHaziCUDl8i3rnS5qzCjDCUTcSXVgp6W1nZKodKBP
 cJ7SnvKlmWkN25K7n+lHsgxrwJnquigRgBEpl3NjwEMY7IOQ05oivgb8iqA4keRpX/bt
 MCGugYuVTbG2FQkG1+klQpPC+UCM0xsQkTK/k8IpVj7DMUFCY3iRxDFM8EL6hm6qV6kJ
 4H8TRQ58ixQPUPEbBRzOv+Yx40kXUu8jzFysPtOXsMcYWwhBdvltGs+oZW22qmRT0tdT
 O1SA==
X-Gm-Message-State: AOAM531Oo3+ee8DTGIDAJXcaRKa4NBQWRYuv9zQnk/+aWF9g2xsAJClr
 ElUDzugZB9etPj2FqYSPYqr2pA==
X-Google-Smtp-Source: ABdhPJzIx68GiiX3KSCsJ5Pv7dXBJcSM3x1ozEBR99tsdN+AlYHB/+qSNbWu5MbSszkNrL0WgnJokw==
X-Received: by 2002:a63:4303:: with SMTP id q3mr2366564pga.375.1630575742013; 
 Thu, 02 Sep 2021 02:42:22 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id ml10sm1689005pjb.9.2021.09.02.02.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 02:42:21 -0700 (PDT)
Date: Thu, 2 Sep 2021 15:12:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Joerg Vehlow <lkml@jv-coder.de>, arnd@kernel.org
Message-ID: <20210902094219.xy73hs5ccafkrysr@vireshk-i7>
References: <20210902093655.6104-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210902093655.6104-1-lkml@jv-coder.de>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/aarch64: Remove 32 bit only syscalls
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

+Arnd

On 02-09-21, 11:36, Joerg Vehlow wrote:
> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> 
> These syscalls are not available in 64 bit builds of linux.
> See: <linux>/include/uapi/asm-generic/unistd.h
> 
> With the syscall defined, the test clock_gettim04 fails with
> ../../../../include/tst_timer.h:216: TCONF: syscall(403) __NR_clock_gettime64 not supported
> 
> Fixes: 59d278d61ed90117607f389326e0816a14dbf53c ("lapi/syscalls: Update syscall numbers")
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
> 
> I am not 100% sure, how the syscall table for aarch64 is generated.
> There are also compat version for some of the 32 bit only 64 bit syscalls,
> but I think they are only available, when running an 32 bit arm application.
> 
>  include/lapi/syscalls/aarch64.in | 20 --------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
> index 5a2816099..a47185954 100644
> --- a/include/lapi/syscalls/aarch64.in
> +++ b/include/lapi/syscalls/aarch64.in
> @@ -278,26 +278,6 @@ statx 291
>  io_pgetevents 292
>  rseq 293
>  kexec_file_load 294
> -clock_gettime64 403
> -clock_settime64 404
> -clock_adjtime64 405
> -clock_getres_time64 406
> -clock_nanosleep_time64 407
> -timer_gettime64 408
> -timer_settime64 409
> -timerfd_gettime64 410
> -timerfd_settime64 411
> -utimensat_time64 412
> -pselect6_time64 413
> -ppoll_time64 414
> -io_pgetevents_time64 416
> -recvmmsg_time64 417
> -mq_timedsend_time64 418
> -mq_timedreceive_time64 419
> -semtimedop_time64 420
> -rt_sigtimedwait_time64 421
> -futex_time64 422
> -sched_rr_get_interval_time64 423
>  pidfd_send_signal 424
>  io_uring_setup 425
>  io_uring_enter 426
> -- 
> 2.25.1

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
