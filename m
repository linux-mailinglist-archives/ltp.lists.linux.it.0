Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AB4215125
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 04:21:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B35033C2A04
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 04:21:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EA6473C20BC
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 04:21:42 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B3F8160076F
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 04:20:38 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id p1so5463502pls.4
 for <ltp@lists.linux.it>; Sun, 05 Jul 2020 19:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zFdkemrzggb/6CwfpsS4CYl9t/hY5GILnJRpmT0fCrk=;
 b=LNy4Q9oBVXbGU0vva0K8NBkHEtGJjQyJnkVQ1aWpECx9dnr5c8ek6SdT+o70OURZai
 xSoLzay1vcPwxKPr/tR6nJ3KSn/BCWdNFERjey5u2/EnX2K6Lm6/Rrx8xaLwQKFSRklg
 sGufTPHs2fZTAU0potGz5VfnMXvrG01jJcXQbbWDK4DnbA/pB//AcCX3Zg84aD4FWbEL
 KLmSwyGIp+u2Dv2EAa+eYz2J1gGng2QUGxwXWuBoapuL1WvvaqQqOWTvqfzxKDdaac3c
 CJJcdjanZ9EVpMGH7YJPRMCvht5OwCfBH/Wrb1cTmgOz6PIH48DSU2Svd+UZwArLVxAx
 Oyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zFdkemrzggb/6CwfpsS4CYl9t/hY5GILnJRpmT0fCrk=;
 b=m6fL62dfuA9KmHNPvxRv2t+U8XM3hkbFatnY/WGsUdjd6D59/aDS2GFVqKHdMwwUQO
 9LTZAUoG7xW4BzZ9AJfxazHq+fPK16YnjBeDdCzHV7LGgxGaFS8pl/f9N5dUjkbsgC4V
 6SFFl3O+OuYLameZZQYiHworzfL+4//tsV0SLFRcRUOuPpoPDxHF3IqT+gi+nIp9aGw0
 HQNiLrLysVNSVN0gtrGsy96cuHQWDRyeD5+yItr21qwihj2XVXVFZj2vV93M8wSvUDge
 0yqCh2aJqNFRL2XxhT8r9x8rzgLlc8No8+XK5KIJfvaz5RgO7WL9o0/O0spT5uS/jOZ1
 PQLA==
X-Gm-Message-State: AOAM531YtBoPVATqpes6d8+eVykT+gkX5S9kZVIQzS9I+uwzC8UtfHFo
 314s9OP610UL7PuNU9e2pvcCSg==
X-Google-Smtp-Source: ABdhPJyzZDmtoRTEKAXgw/BlTvoUOZmXJz0V3StVAySOsBCJ5uIfBXXaYBFaFSZEkdUC/Qsj74eLRw==
X-Received: by 2002:a17:902:9a0a:: with SMTP id
 v10mr38593541plp.340.1594002100583; 
 Sun, 05 Jul 2020 19:21:40 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id i66sm9858648pfc.12.2020.07.05.19.21.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Jul 2020 19:21:39 -0700 (PDT)
Date: Mon, 6 Jul 2020 07:51:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200706022137.umsgf5etdv6723we@vireshk-i7>
References: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
 <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
 <CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com>
 <20200703125927.GA11556@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703125927.GA11556@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 5/6] syscalls: Don't pass struct timespec to
 tst_syscall()
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
Cc: Donghai Qiao <dqiao@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 03-07-20, 14:59, Cyril Hrubis wrote:
> Hi!
> I guess that we need:
> 
> diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
> index bc0bef273..c0727a34c 100644
> --- a/lib/tst_clocks.c
> +++ b/lib/tst_clocks.c
> @@ -14,11 +14,11 @@
>  
>  typedef int (*mysyscall)(clockid_t clk_id, void *ts);
>  
> -int syscall_supported_by_kernel(mysyscall func)
> +int syscall_supported_by_kernel(long sysnr)
>  {
>  	int ret;
>  
> -	ret = func(0, NULL);
> +	ret = syscall(sysnr, func(0, NULL);
>  	if (ret == -1 && errno == ENOSYS)
>  		return 0;
>  
> @@ -32,13 +32,13 @@ int tst_clock_getres(clockid_t clk_id, struct timespec *res)
>  	int ret;
>  
>  #if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)
> -	if (!func && syscall_supported_by_kernel(sys_clock_getres64)) {
> +	if (!func && syscall_supported_by_kernel(__NR_clock_getres64)) {
>  		func = sys_clock_getres64;
>  		tts.type = TST_KERN_TIMESPEC;
>  	}
>  #endif
>  
> -	if (!func && syscall_supported_by_kernel(sys_clock_getres)) {
> +	if (!func && syscall_supported_by_kernel(__NR_clock_getres)) {
>  		func = sys_clock_getres;
>  		tts.type = TST_KERN_OLD_TIMESPEC;
>  	}
> @@ -62,13 +62,13 @@ int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
>  	int ret;
>  
>  #if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
> -	if (!func && syscall_supported_by_kernel(sys_clock_gettime64)) {
> +	if (!func && syscall_supported_by_kernel(__NR_clock_gettime64)) {
>  		func = sys_clock_gettime64;
>  		tts.type = TST_KERN_TIMESPEC;
>  	}
>  #endif
>  
> -	if (!func && syscall_supported_by_kernel(sys_clock_gettime)) {
> +	if (!func && syscall_supported_by_kernel(__NR_clock_gettime)) {
>  		func = sys_clock_gettime;
>  		tts.type = TST_KERN_OLD_TIMESPEC;
>  	}
> @@ -91,13 +91,13 @@ int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
>  	static mysyscall func;
>  
>  #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
> -	if (!func && syscall_supported_by_kernel(sys_clock_settime64)) {
> +	if (!func && syscall_supported_by_kernel(__NR_clock_settime64)) {
>  		func = sys_clock_settime64;
>  		tts.type = TST_KERN_TIMESPEC;
>  	}
>  #endif
>  
> -	if (!func && syscall_supported_by_kernel(sys_clock_settime)) {
> +	if (!func && syscall_supported_by_kernel(__NR_clock_settime)) {
>  		func = sys_clock_settime;
>  		tts.type = TST_KERN_OLD_TIMESPEC;
>  	}

Thanks, this will do.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
