Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A882303FD
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 09:24:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45BF73C2681
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 09:24:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A28833C25A5
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 09:24:06 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C7E641400E6F
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 09:24:05 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id m8so3579193pfh.3
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 00:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fl/TkPlxmb98Tquv00P1JhxyWEY/eE7FBLKgqqWzv5k=;
 b=vVNnjqX3+w1GOfBGr5/GBBA6gWCBW52/0umH4dN66JZBIIh1/bdCCAc7SJbJdBAByZ
 JztpscQoA15FISc2LQG3tSnAKK9srcRtcRb2YyTVWO2ZMST0xLODsBArc5ON+ZJKLYFn
 Qe2eIK1OsKjD+LpqulI0XCxJE0AXTL3RiqPgKw3Nw4KM2pNNyhccv7uPNiu8/4gDTPzz
 mIHwjrlJGN8c6RoupdUdQJLz4Hdt86/oSG2UPkecK8Ss/Qtr7I8N6zfwFIkyMp77ITXo
 o66i8KhAiYws1lnd/ymZON05UX1eoBoeDKAdxpCgXLWzPh/5NXecViG9STdIW5BIyPro
 SG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fl/TkPlxmb98Tquv00P1JhxyWEY/eE7FBLKgqqWzv5k=;
 b=L+FOvqWdGjwqBrIgwPgRHgMzcYSO9pjEmOwi/4dI7kLWWJINT/D3TtTHXzZTQsgR3q
 g7QrNdgnWnR/BvYOAq+PuWQ6fQwAxO6rEqhXiuZ5wca4RbsS1Syb/2kJVmw0fQa6xUvj
 p1tcqpcJ1J0e+yINNY+xs/hvMnWz5Jj6uKNzT4IhSY00kJLQ3PZb9600vSnilHXrMAUM
 vpUUBQKi3RCwKFsLsmpFRRe7U1I4x4wgrXaDw5r7Iz/jNhgs3yI51OX1syee2MGcIb2I
 kDz6AhO1QX6I9xVKwkFUsBHjpK46ZmbbzHTWTQPPED2knTjZqyulxCbNnOhI2Rrdcq2k
 ZagQ==
X-Gm-Message-State: AOAM531ymXuOZsqx9k6rvOXVl6KSFgJAyNHdS2CiFNIC9uZeCR1Ryugb
 unozmyEJxRsD9WOnL+u8IouAmw==
X-Google-Smtp-Source: ABdhPJy9B/q5hKq6G7ALGZN9keR+Lg41pxTv6EhT1x4QURGpg12qJnwBNqQD6wTB7s0wR+mdL/MxdQ==
X-Received: by 2002:a63:6c1:: with SMTP id 184mr24021227pgg.262.1595921044129; 
 Tue, 28 Jul 2020 00:24:04 -0700 (PDT)
Received: from localhost ([223.190.9.130])
 by smtp.gmail.com with ESMTPSA id p11sm1945641pjb.3.2020.07.28.00.24.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Jul 2020 00:24:03 -0700 (PDT)
Date: Tue, 28 Jul 2020 12:53:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200728072357.22lyy2b4auyqqmvs@vireshk-mac-ubuntu>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <883a188e83c201b23074bf0ac974b41d89d818c7.1593152309.git.viresh.kumar@linaro.org>
 <20200727094030.GB7863@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727094030.GB7863@yuki.lan>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 14/19] syscalls/select6: Add support for time64
 tests
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

On 27-07-20, 11:40, Cyril Hrubis wrote:
> > @@ -38,7 +39,7 @@ static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
> >  	}
> >  	case 2: {
> >  		int ret;
> > -		struct timespec ts = {
> > +		struct __kernel_old_timespec ts = {
> >  			.tv_sec = timeout->tv_sec,
> >  			.tv_nsec = timeout->tv_usec * 1000,
> >  		};
> 
> I'm a bit lost here, should we actually pass the __kernel_old_timespec
> to all the tst_syscall() fuctions here?

select, pselect6, pselect6_time64, and newselect, all have different
requirements, some take timespec and others take timeval.

Though after looking again at kernel sources I feel pselect6 may need
__kernel_timespec instead of __kernel_old_timespec, which is different than what
we did with other syscalls.

Arnd, can you confirm this please ?

> I guess that the only function that would take the argument as struct
> timeval is the select() glibc function, or do I miss something?

select in kernel also takes old timeval.

> > @@ -47,7 +48,22 @@ static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
> >  		timeout->tv_usec = ts.tv_nsec / 1000;
> >  		return ret;
> >  	}
> > -	case 3:
> > +	case 3: {
> > +		int ret = 0;
> > +#if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
>             ^
> 	    __NR_pselect6_time64 ?
> 
> > +		struct __kernel_timespec ts = {
> > +			.tv_sec = timeout->tv_sec,
> > +			.tv_nsec = timeout->tv_usec * 1000,
> > +		};
> > +		ret = tst_syscall(__NR_pselect6_time64, nfds, readfds, writefds, exceptfds, &ts, NULL);
> > +		timeout->tv_sec = ts.tv_sec;
> > +		timeout->tv_usec = ts.tv_nsec / 1000;
> > +#else
> > +		tst_brk(TCONF, "__NR_pselect6 time64 variant not supported");
> > +#endif
> > +		return ret;
> > +	}
> > +	case 4:
> >  #ifdef __NR__newselect
> >  		return tst_syscall(__NR__newselect, nfds, readfds, writefds, exceptfds, timeout);
> >  #else
> > @@ -72,11 +88,14 @@ static void select_info(void)
> >  		tst_res(TINFO, "Testing SYS_pselect6 syscall");
> >  	break;
> >  	case 3:
> > +		tst_res(TINFO, "Testing SYS_pselect6 time64 syscall");
> > +	break;
> > +	case 4:
> >  		tst_res(TINFO, "Testing SYS__newselect syscall");
> >  	break;
> >  	}
> >  }
> >  
> > -#define TEST_VARIANTS 4
> > +#define TEST_VARIANTS 5
> 
> Also lastly but not least we should clean up the rest of the select
> tests and add support for the different variants there as well.

Maybe not. IIUC only pselect6 got changed to adapt to different timespec
structures and the other ones aren't.

Arnd: Can you confirm this as well ?

> Looking at them these are just copy&paste of the same test with a
> different fds, we can easily merge them into a single test.
> 
> And the coverate in these tests is a bit lacking, we do not have a
> single tests that would send a data over a pipe to a fd select is
> watching and check that select was woken up by that. There is no such
> test in the pselect/ directory either.

Hmm, I will look at that separately then.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
