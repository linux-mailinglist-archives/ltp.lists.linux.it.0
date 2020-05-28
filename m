Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B37931E5D3B
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 12:35:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A64323C3201
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 12:35:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E37A73C07CF
 for <ltp@lists.linux.it>; Thu, 28 May 2020 12:35:12 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DD1D6143E7E9
 for <ltp@lists.linux.it>; Thu, 28 May 2020 12:35:11 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id x11so10409279plv.9
 for <ltp@lists.linux.it>; Thu, 28 May 2020 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2j/h6ySQ7QUsYjnQ66oiAec/WdfdkyZ95w5oqGIXb1Y=;
 b=g1LUNWGibxTXYRXH7gEW3qBiKZ71Wkg2oH130OWMIq3veB5WF0vLVHVWXM8y41FmNH
 +M1GID8/oLGa9vh8wDTWdYOc/3bOjmLoYbZT0GLQwJ1Q58F5almk/yqnkopiBxyoHuNT
 r+5MIalo2HSXotDJSIWrrz6yREX4gDp7OnHy+EmmY+etWJvsC4SjxHqx64OxbnlYBWx6
 kEro4oxAtU5L1H++sGZ9NahRXj5ARJbRzc/PbeatNsRtMvH7koSvLZrHpm5Y1GiHApZX
 aUH+zBuVoVbNJNt7MUn0z3E8ScO2bqTWRnaImjcXkISQ39V/kX0pZZjeSo8dl4mTjyVi
 xIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2j/h6ySQ7QUsYjnQ66oiAec/WdfdkyZ95w5oqGIXb1Y=;
 b=q/+Tbgp6DJo0K05BELQUb3VJeZL4iRH7Vy8UqRZxZ9UmU5uV/KnHlbamW48ajBJ18z
 g73+5aLWa4BHujKaPGBfXtK+BAURMm4nRFCBaO7QVCIR87GBjiGp4Gpzlv8RJNl77UPX
 4jvmhj37bte2M4fRi2qQKnq/whAFXyr3nvKUpvEVZ0BPbzfQDJifZuzfZWHeYNCmfaJG
 EvZ/FM2dEa5juYL36pzFJ86lsKrXnABuLPHfehujzB5pdVdTDaIWneSW+JwffWLZOPMf
 yhOUZUX2X+c7QhV0SvzuuU56WvcOCPgLfprjuCP4wuPsg5Vt1RcCbgggP35MockWOsO8
 C+Ig==
X-Gm-Message-State: AOAM533UcwAt8gbCT2PRvqFpXLnWz4XQcyuJtJESlljV0Im6p0y9rHOC
 OgadP5iKOBvGNONh3O8LIDdU1H5k2E4=
X-Google-Smtp-Source: ABdhPJxnqNMxUWkNxLKCf3QD262ZxANkdR8D63bw6t4JHi+KreVuR05y6dI719qzcSH3L7KQxnBu2w==
X-Received: by 2002:a17:90a:bb85:: with SMTP id
 v5mr2850947pjr.150.1590662110315; 
 Thu, 28 May 2020 03:35:10 -0700 (PDT)
Received: from localhost ([122.172.60.59])
 by smtp.gmail.com with ESMTPSA id k12sm1093263pgm.11.2020.05.28.03.35.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 May 2020 03:35:09 -0700 (PDT)
Date: Thu, 28 May 2020 16:05:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200528103506.rlchdwf2yppl7fhz@vireshk-i7>
References: <70417fdc55c750e8b13d7124e66a7e8a59182e75.1590494889.git.viresh.kumar@linaro.org>
 <86a36c7d5919a966e077cb76f0d8710f31bcc60a.1590649002.git.viresh.kumar@linaro.org>
 <CAK8P3a11aWYdBtgV=T91_BOVR_hX-OZTAVhr806nbTFtCE+3MQ@mail.gmail.com>
 <20200528091148.3afrkdjqzjer4vqh@vireshk-i7>
 <CAK8P3a3Y4P-aLCEYmYiLGqNcccyXCcGfHJkoPAEzxFz8p2yocw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3Y4P-aLCEYmYiLGqNcccyXCcGfHJkoPAEzxFz8p2yocw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls: clock_settime: Add test around y2038
 vulnerability
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

On 28-05-20, 11:31, Arnd Bergmann wrote:
> On Thu, May 28, 2020 at 11:11 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 28-05-20, 10:27, Arnd Bergmann wrote:
> > > On Thu, May 28, 2020 at 8:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > > +       ret = tv->clock_settime(CLOCK_REALTIME, tst_ts_get(&ts));
> > > > +       if (ret == -1)
> > > > +               tst_brk(TBROK | TERRNO, "clock_settime() failed");
> >
> > But I noticed that even this version may not be good enough, as I am
> > still doing the same thing in setup(), i.e. setting time to just
> > before y2038 to test if it is y2038 safe or not. I believe even that
> > isn't fine ?
> 
> Good point. I see you have this check above that:
> 
> +       /* Check if the kernel is y2038 safe */
> +       if (tv->type != TST_KERN_OLD_TIMESPEC)
> +               return;
> +
> 
> So that part should prevent it from doing something bad,

Not really. That code is part of the setup() routine and with "return"
we will go and run the actual test run(). That code is there to avoid
running the code on time64 implementation unnecessarily.

> but I now
> see it's still not great because it also prevents the test case from running
> on 64-bit architectures. If you change the condition to also check for
> sizeof(__kernel_old_timespec) it should be ok.

What about this instead of the whole setup() changes:

       /* Check if the kernel is y2038 safe */
       if (tv->type == TST_KERN_OLD_TIMESPEC &&
           sizeof(__kernel_old_timespec) == 8)
               tst_brk("Invalid configuration");

> > diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime03.c b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
> > index 9e316378b1cc..876651a5d537 100644
> > --- a/testcases/kernel/syscalls/clock_settime/clock_settime03.c
> > +++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
> > @@ -72,6 +71,7 @@ static void run(void)
> >                 .sigev_notify = SIGEV_SIGNAL,
> >                 .sigev_signo = SIGABRT,
> >         };
> > +       struct tst_ts diff;
> >         timer_t timer;
> >         sigset_t set;
> >         int sig, ret;
> > @@ -105,7 +105,16 @@ static void run(void)
> >         if (sigwait(&set, &sig) == -1)
> >                 tst_brk(TBROK, "sigwait() failed");
> >
> > +       ret = tv->clock_gettime(CLOCK_REALTIME, tst_ts_get(&end));
> > +       if (ret == -1)
> > +               tst_brk(TBROK | TERRNO, "clock_gettime() failed");
> > +
> >         if (sig == SIGABRT) {
> > +               diff = tst_ts_diff(end, ts);
> > +
> > +               if (tst_ts_get_sec(diff) != EXPIREDELTA)
> > +                       tst_res(TINFO, "Test slept longer than it should have, expected:%d, actual:%lld",
> > +                               EXPIREDELTA, tst_ts_get_sec(diff));
> >                 tst_res(TPASS, "clock_settime(): Y2038 test passed");
> >                 return;
> 
> Yes, I think that should print a warning when something goes wrong,
> but it can be improved:
> 
> - don't say it slept longer when it could also have slept shorter, or not
>   slept at all. It's probably enough to say that the expired time is not what
>   was expected and leave the interpretation to a person

Right.

> - comparing only the seconds means that you warn when the elapsed
>   time was less than expected or more than 1000000000 nanoseconds
>   longer than expected, but that is a fairly long and arbitrary interval.
>   Maybe make it something like 50ms and use a constant for it, so it
>   can be adjusted if necessary.

Ok.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
