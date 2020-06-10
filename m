Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE881F4E00
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 08:17:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2E6C3C2E1A
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 08:17:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AF0093C0194
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 08:17:41 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F3E45600338
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 08:17:40 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id u5so527899pgn.5
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 23:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9QyjPUENR4E2UD6/PddeK5AXQhSebOfEgPJLHEPP5Dk=;
 b=N/gbBFlBKia/IpG0RzND4qjPLik/tK/GEC653DpsGxWO8bH3peMiuNygbtoKOujuTE
 gdEoQbVp4A1VRuN/0oubC+3J/agvfIV6LDqKnS6Cy0yFUtpcLZuR4yhGYEMqszUuLwWx
 lnq9MhBYXU/wYObbnk5tNUvB6Q7fWjQjBVUuL2AKeXsf3yT0INl2Btm2Cje2FHhDL/hv
 WhFO7HsG1XOFz4WUflhqFFB9psrfrQCWZTn68c3f2oFaUBFYrDO2ujG3lMiY+jwAuXGC
 2rRAPm/hrQkA9sSz2sHnm2w73bzXcE3zh+hQrSYRqeh6ZRUXk0EBfhjDhVrwL7Kf/MOs
 9G7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9QyjPUENR4E2UD6/PddeK5AXQhSebOfEgPJLHEPP5Dk=;
 b=RE1w0y/NYQg5wjG5EWs1o4ul71yX5qF5Qpiehy5fZX8OKrv6PHMmdOicynwwLTqLY5
 J6aZsvkFGvY5nUVG6QzYb31YHPam87G6NoGd6IM+b/8Avqqf3pyie9alvmUSLpIfiJQr
 hGuHj/OX/COu2fYPNFOKo5g4PnB/ThqiTbQ2C/qPtk4rBi4cqZsVWSroBCpm3ddB7pRt
 Ku181BKg3IQQTipmrq1g+V6aELkF7yrUUPTNrZFzKM0hPXepf463gNjXDi97LF5kSqKh
 4YWF+jTwWFYNZV1Np93sn2JIRBrGby82eSigvfjGjvkWs/bbE34CLh1dI7A05X8A4unl
 6NbQ==
X-Gm-Message-State: AOAM532cgnqR6tEQr1YtT6iZXb/jwsNPKf7n6eBZjEtc/dP32g67YTyC
 LrLphmdFoY1kDkT+2Yju7c/8ZQ==
X-Google-Smtp-Source: ABdhPJx7Obe4sSM7oQNcNcFpu+8sq5hvK5+4fMiKaTSgpfvr+5tUIsZYF69CeXZXvI1QI++LYx+kyg==
X-Received: by 2002:aa7:9252:: with SMTP id 18mr1359326pfp.17.1591769859392;
 Tue, 09 Jun 2020 23:17:39 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id h8sm4501088pjb.1.2020.06.09.23.17.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 23:17:38 -0700 (PDT)
Date: Wed, 10 Jun 2020 11:47:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200610061736.pozfqs4fh4wakdep@vireshk-i7>
References: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
 <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
 <20200608100900.c4fi7pw7euie6tnt@vireshk-i7>
 <CAK8P3a004cavRhyWx+uXYYteBi1LviahAv11+9JyGadN-vo8og@mail.gmail.com>
 <20200608112000.sjrbvmqjciifgyub@vireshk-i7>
 <CAK8P3a0PqtFWTZr9hvSy5Y0ZZOSNgfzw0x1DTTyuzfsfROpAvw@mail.gmail.com>
 <20200609070535.iym6m5n2v5urykbc@vireshk-i7>
 <CAK8P3a0giS2A=4Hc4SO7cVn_nOU4rz-KzbSkQJcddM2Hc=KRxg@mail.gmail.com>
 <20200609083219.5473zf2tq4tmjxac@vireshk-i7>
 <CAK8P3a2BaLtcyyfNQUJq-gvO6C_53hvLaNhajcpREwqHCEBYqg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2BaLtcyyfNQUJq-gvO6C_53hvLaNhajcpREwqHCEBYqg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/clock_gettime: Add test to check bug
 during successive readings
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 09-06-20, 10:51, Arnd Bergmann wrote:
> Yours only needs it when the nanoseconds are actually lower, which
> is only the case if no the actual time has not crossed into the next
> microsecond.

That is a very small percentage of cases I believe, and so I won't
count my version to be really better here :)

> If the gettimeofday() call itself takes over a microsecond
> to complete, then it usually will have wrapped, but this is highly
> hardware specific as the amount of time it takes to read the current
> clock registers can be anywhere from 'almost free' to 'several
> microseconds'.
> 
> Doing a division would be the same as the modulo operator.

Sure.

> Using a 32-bit modulo or division on the tv_nsec portion instead
> of doing it on the 64-bit nanoseconds is much faster but also
> a little more complex.

Yeah, keeping separate values is a mess. Another thing I was thinking
about, does the time it takes to do a division operation has the
tendency to affect the output of the program? i.e. not catching bugs
sometimes ? Otherwise who cares about the time spent doing division
during testing of the kernel :)

> Another option would be to allow up to 999 nanoseconds of
> time going backwards before printing an error for the case
> of gettimeofday() after clock_gettime(), like
> 
> if ((tv->gettime == my_gettimeofday)
>     slack = 999;
> else
>     slack = 0;
> 
> if (start + slack < end)
>       failure();

I like it, but I think you did it a bit incorrectly according to the
current code:

if (end + slack < start)
      failure();

> This is much faster as it avoids the division but does not catch
> the corner case of gettimeofday() returning a value that is
> slightly before the previous clock_gettime() but that is actually
> in the previous microsecond interval.

Hmm, I am not sure I understand it. The only bug that can happen with
gettimeofday() is when it returns a value with a different microsecond
value than clock_gettime(), as we can't capture values lower than 1
us.

So, clock_gettime() returns 4001 ns and gettimeofday() returns 3000
(or 2000 or 1000) ns. This is the only bug possible here. And adding
999 to gettimeofday() output will never make it cross the microsecond
boundary (as it has 000 at the end) and so we should always catch the
bug.

Where am I wrong here now ? Of course I am :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
