Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E68BD1D26B8
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 07:38:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5981F3C5465
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 07:38:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2D8C93C2573
 for <ltp@lists.linux.it>; Thu, 14 May 2020 07:38:43 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9615860162D
 for <ltp@lists.linux.it>; Thu, 14 May 2020 07:38:42 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id f6so805744pgm.1
 for <ltp@lists.linux.it>; Wed, 13 May 2020 22:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CJrxPb2ZCcivjfTqLWhibyxR/hcVciJTRL2h4ElMMgI=;
 b=OxLhpythB619kT3rm84FQbYGpkZcwdtGm4+5DELNX8kF4CIOXEbEJDRGVJfeE3+itF
 wgSXI29ivXPzC4IZzm3v3moyzyDtdOFH15sZXzG0f4RcsouNQGYERYcSXkM+luGwfZlz
 OXgoJmDFz+QmurCJMKM7aYqCSfRl3t19warvxxQnfKOrboBuXClVhtz4VS6sOnp77TH0
 v2FEopHZZ0rwLdIP/ixNnIJummrmLOaUB9FzurYDP9HwEiJ5SU+ljnWR/CEK7VxO1Dni
 SMeWFESQbDGHpMNwECxIfV1p88OWZeTL/ed5gMEvvXofiVdm3LtxjIc6tMKnDAd7VUIG
 HKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CJrxPb2ZCcivjfTqLWhibyxR/hcVciJTRL2h4ElMMgI=;
 b=XQ+F63dvShcVVGAtE8RSfG+dEpNpDEi1H15yOM05mCG/7okpcGymv339xMQkENCHFD
 l5DqwHWdyGGIpGffJuNxdbraIDvKUMYuFN0cjeW2jhd8AzGFm6vhgVWrhEkoKZBFiIrS
 40ePciTK3rRrHseOIxgG7RAYsEHh6Q5hQtnQeExkqXIXVH6rXhhtf2n1RB4YqUrl48es
 KmBWC/P49+2xyGblQrVpmnL/qY9IOztV3Hf6x8ROsDzHOtv0Dk3A0RXmfCE5WoAZhDYq
 Q4yaibblLXk1snbrbQT1OOcaH1E7h+yz0v8+ru9Iav7zVLU1UY3CNpiMWrvlgKax5iZE
 yDnA==
X-Gm-Message-State: AOAM530M7clhABsrb6WVMkEzT+tcE6RvN0adstmYrZfB2jnCXrv459d+
 FLRCCt+ZsltHwqj3OsThdTawOw==
X-Google-Smtp-Source: ABdhPJzIDb1T9vWM0EgNbcGna2SSk3CoiREC9TmnN2CnVRsVfC1rGhm+SDgUFp6+zdEkte79jSU6YQ==
X-Received: by 2002:a62:be0b:: with SMTP id l11mr2912554pff.1.1589434721040;
 Wed, 13 May 2020 22:38:41 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id w19sm1195418pfq.43.2020.05.13.22.38.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 22:38:40 -0700 (PDT)
Date: Thu, 14 May 2020 11:08:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200514053836.c45c4jhp4hwgiik4@vireshk-i7>
References: <437d6fd3926de4c801ae0edb2379c6afafcb34d4.1589190284.git.viresh.kumar@linaro.org>
 <20200513113318.GA25472@dell5510>
 <20200513114239.roy5hqu26lm2of4l@vireshk-i7>
 <20200513125428.GA15868@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513125428.GA15868@dell5510>
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

On 13-05-20, 14:54, Petr Vorel wrote:
> Hi Viresh,
> 
> > > >  #ifndef __kernel_timex
> > > > +#if defined(__x86_64__) && defined(__ILP32__)
> > > > +typedef long long __kernel_long_t;
> > > > +#else
> > > > +typedef long __kernel_long_t;
> > > > +#endif
> > > > +
> > > > +typedef __kernel_long_t	__kernel_old_time_t;
> 
> > > It's caused by this fallback definition ^, which is already in
> > > include/tst_timer.h. Simple deleting it should fix the problem
> 
> > But tst_timer.h isn't included here in clock_adjtime at all. What's
> tst_timer.h has been included in clock_adjtime.h since 5085e14c7e

And I missed that completely :(

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
