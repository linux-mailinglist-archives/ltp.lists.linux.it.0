Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 954DC1D11A1
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 13:42:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3E053C5500
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 13:42:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A00B13C25E1
 for <ltp@lists.linux.it>; Wed, 13 May 2020 13:42:44 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B87BC60068F
 for <ltp@lists.linux.it>; Wed, 13 May 2020 13:42:43 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id z1so7891150pfn.3
 for <ltp@lists.linux.it>; Wed, 13 May 2020 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MhOhxSvOd2ieGTf/5PDVX7HluxZtt1SUMHvsT88BH7s=;
 b=WS2PSikniMHQfATVzyo1sYRs0erkUVAiaMUl7JwGU+KrD/98UGxG6DK32Y/waeoQgm
 VsD2pHSyzyPcob65f96l6V6/Mxlev7y/FtYnLVAAywEitmvmv5KxM+xWs2LFgt8XPyAy
 25/wfQpPrzCWuEjqFgbm6/Etwkz1Yx3vew8PbVKZPX8VcOoQOd/tjQt+SzN2HUiEclO/
 ZRUCcg+jFNVFwMPQFt8w9ZbnpCcuw2icn8GUIhJJ7oJ5oP7+H44E7lFuZJ+kj9uaaVge
 +gxF5R28Yo6yq4tfRSTvQe+RiVvH1gUE5uLuzNbCy/L/IIrX0uIMTJoe6SkGMJ83uuo8
 9h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MhOhxSvOd2ieGTf/5PDVX7HluxZtt1SUMHvsT88BH7s=;
 b=ZdnCyE0mot+sRRHFYK/Jm4/0KIrLjmyhhEn2NkfacGtxPAM04SEQMdo5pE+5rok7IG
 1qnXXzyAdLVR2LGpI6/WaBw382L8Q61isncp+mL6rHRvMkexH/CgLPPYqFgLyoccqobq
 K/2VqOtBgofYBwYeaEK+91rTYokVHFW5h4Ay57jxcILsWCZ3Zb/z2v+OMGNiH3LDrWhU
 wdoGjkAscw7C9tBKXzOU+gHTl+Yh/+vAhS/b81EwEhqVL7uZ1SyYjF9fn0yi/e4GYxgT
 6ia9PUPnOeTj5+1bNmGBZG6LVTfvdLaNJMw5URrrRxF5hvSZIfOE5cLkD8T+OKeMPf0K
 DXPg==
X-Gm-Message-State: AGi0PubOyIpXBAGpTNzMhI4kK/yOToQbvhQUetrStM1Fb7+D9vfN37TD
 8ePvBIULandHMN27VnN/GNMMQg==
X-Google-Smtp-Source: APiQypLUT7h0auVcPwjXBHpQ85Mc1GNzBqB6YOh1d6a9rAF2+GG2a3d2tXKWvtFtqDdnOBrNCCMckA==
X-Received: by 2002:a62:3c5:: with SMTP id 188mr24666804pfd.41.1589370162198; 
 Wed, 13 May 2020 04:42:42 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id gb6sm1593803pjb.56.2020.05.13.04.42.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 04:42:41 -0700 (PDT)
Date: Wed, 13 May 2020 17:12:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200513114239.roy5hqu26lm2of4l@vireshk-i7>
References: <437d6fd3926de4c801ae0edb2379c6afafcb34d4.1589190284.git.viresh.kumar@linaro.org>
 <20200513113318.GA25472@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513113318.GA25472@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: Fix issues around calling syscalls with
 old timespec
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 13-05-20, 13:33, Petr Vorel wrote:
> Hi Viresh,
> 
> checking for __kernel_timespec, which defined in include/tst_timer.h should fix
> it, but we might need some more elegant solution (have that depende
> 
> diff --git testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
> index 42e4c699c..c246f84bb 100644
> --- testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
> +++ testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
> @@ -17,7 +17,7 @@
>  #include <asm/posix_types.h>
>  #include "lapi/timex.h"
>  
> -#ifndef __kernel_timex
> +#ifndef __kernel_timespec
>  #if defined(__x86_64__) && defined(__ILP32__)
>  typedef long long __kernel_long_t;
>  #else
> 
> > +++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
> > @@ -14,9 +14,54 @@
> >  #include <pwd.h>
> >  #include <sys/timex.h>
> >  #include <sys/types.h>
> > +#include <asm/posix_types.h>
> >  #include "lapi/timex.h"
> 
> Thanks! On a first look LGTM.
> Unfortunately, there is failure on Centos 6 (gcc 4):
> 
> https://travis-ci.org/github/pevik/ltp/jobs/686519604
> 
> /usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h:24: error: redefinition of typedef '__kernel_long_t'
> /usr/src/ltp/include/tst_timer.h:99: note: previous declaration of '__kernel_long_t' was here
> /usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h:27: error: redefinition of typedef '__kernel_old_time_t'
> /usr/src/ltp/include/tst_timer.h:102: note: previous declaration of '__kernel_old_time_t' was here
> make[4]: *** [clock_adjtime01] Error 1
> make[4]: *** Waiting for unfinished jobs....
> In file included from /usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c:58:
> /usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h: At top level:
> /usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h:24: error: redefinition of typedef '__kernel_long_t'
> /usr/src/ltp/include/tst_timer.h:99: note: previous declaration of '__kernel_long_t' was here
> /usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h:27: error: redefinition of typedef '__kernel_old_time_t'
> /usr/src/ltp/include/tst_timer.h:102: note: previous declaration of '__kernel_old_time_t' was here
> make[4]: *** [clock_adjtime02] Error 1
> make[4]: Leaving directory `/usr/src/ltp-build/testcases/kernel/syscalls/clock_adjtime'
> 
> >  #ifndef __kernel_timex
> > +#if defined(__x86_64__) && defined(__ILP32__)
> > +typedef long long __kernel_long_t;
> > +#else
> > +typedef long __kernel_long_t;
> > +#endif
> > +
> > +typedef __kernel_long_t	__kernel_old_time_t;
> 
> It's caused by this fallback definition ^, which is already in
> include/tst_timer.h. Simple deleting it should fix the problem

But tst_timer.h isn't included here in clock_adjtime at all. What's
special with Centos that failure is seen there only ?

Any idea ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
