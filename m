Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855D1DABD5
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 09:19:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBA3D3C0331
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 09:19:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 320203C0331
 for <ltp@lists.linux.it>; Wed, 20 May 2020 09:19:53 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C99951A0070B
 for <ltp@lists.linux.it>; Wed, 20 May 2020 09:19:52 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id y18so1121545pfl.9
 for <ltp@lists.linux.it>; Wed, 20 May 2020 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kXWO3E1jjsmwVtinWXimVW51HHcP+f/TIPUzZ79tpZE=;
 b=JqYcb/+oSug2SAO3I2E/O+Mn28WBGWC9GDA0ORzEy1xDLK4m1b4sbkJe7nk+NZsyJ+
 ANfrGXM+gAxw+Qq/X1qqa+vWlc95k3vE0i+aihZC5YvGzjnaXTBKQ72f7s4Tsk0EesRe
 KD4PmcGyW3uUBZNmyyXsKtLqVK4F/BeacuikegqOtEpJ5RnxSbZ9D2QfLq6eJyUtV87G
 yj02n18h8kSBBhpXFz3vbEBysoK4ZB4Pe1Z0shj5cf13Zu3n1e8e128Bztwnl6BNZFpU
 1NWxJTcJJTezzH7LKLRjzbVJ7XoX/LikwABegmf7NDtin8tVKTyon5vs7Q20OwSdte3G
 7LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kXWO3E1jjsmwVtinWXimVW51HHcP+f/TIPUzZ79tpZE=;
 b=ngN/7kh3nLKcfJWXfIOEH5aPnUp1Dn3wB0pwsxssTKpxkefyf2+ZJJ5t2ZLjkfm2+n
 LBpz6raEkvpI94RUXzwvQf/tUM3mYj4gHfIeyfEkr9mqwLJ2k5IoKOfsF2kCw7/X7rA5
 HQ2BV3u/nrnQT25v/QIqyhCmpV3CvvsycYumgeSPjGxrv50gXGJxjkkPhTqK7PI4E66r
 8jQiidNYdaUpIpxuLq8JhiWo7FNH1y4b9KsTGG6Zt9aPdOJ6Iw08qdeqFZMmc265t/l/
 bX8j202Y36FDz2IuEArqOq914ZGocza8UjCgWccMtH4Eu5yFvfN9kWS/lwDsEZzz6MmS
 cNxg==
X-Gm-Message-State: AOAM532tCioCb11JAHnU+z5+MYSjFm2cVnZwdx3V7M3+A9hg1ZQloM73
 uuU3XOqGx/YVuH+3ldAqprkofQ==
X-Google-Smtp-Source: ABdhPJzWaJWm4fiPpzmeEtWoLm37SxLA/FpN2/pFtHneZLViqK3rR91smdecjtHK2gg8qGKkoNXs+A==
X-Received: by 2002:a63:1515:: with SMTP id v21mr2764198pgl.229.1589959191263; 
 Wed, 20 May 2020 00:19:51 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id m13sm1357636pff.9.2020.05.20.00.19.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 00:19:50 -0700 (PDT)
Date: Wed, 20 May 2020 12:49:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200520071948.qtuzbfesqvcnsizd@vireshk-i7>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <3f3b7d669d47ae701385b43deb8280a353dd231e.1589877853.git.viresh.kumar@linaro.org>
 <20200519122347.GC16008@yuki.lan>
 <CAK8P3a2PgjYyijH=VoNGhs_xk1VvFN6ZNvNM-W4TopWY6jJNbA@mail.gmail.com>
 <20200519134511.GD16008@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519134511.GD16008@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls: Don't use tst_syscall()
 unnecessarily
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19-05-20, 15:45, Cyril Hrubis wrote:
> Hi!
> > > > -     tst_clock_gettime(CLOCK_MONOTONIC, &ts);
> > > > +     clock_gettime(CLOCK_MONOTONIC, &ts);
> > >
> > > I guess that this will reintroduce LTP compilation failures on older
> > > glibc, which was the primary reason we used the tst_clock_gettime()
> > > instead of clock_gettime().
> > 
> > I see that clock_gettime was first added in glibc-2.1.3 back in 1999.
> > Can that actually run LTP any more? If it can and this is considered
> > important, I fear the tst_clock_gettime() call needs to be extended
> > to call the clock_gettime()/clock_gettime64()/gettimeofday() syscalls,
> > whichever is the first to work, and convert the formats from the
> > native kernel format to the glibc format.
> 
> I guess that at the current time we do support distros that are at max
> 10 years old, mostly because enterprise support cycles are about 10
> years in lenght.
> 
> The issue here is that glibc needed -lrt passed to linker couple of
> years ago and we wanted to avoid the need of linking everything with
> -lrt, as calling the raw syscall was just easier fix.

To conclude the discussion, is this patch okay or not ? The reason why I am
asking this is because this file still uses the old test framework and so can't
include tst_timer.h, and so doesn't have access to struct __kernel_old_timespec.

What do you suggest I do here ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
