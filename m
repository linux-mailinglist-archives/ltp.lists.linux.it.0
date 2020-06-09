Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D32171F3620
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 10:32:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B55463C2E4B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 10:32:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 76DD63C2E45
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 10:32:25 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 63025201148
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 10:32:24 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id n9so7773277plk.1
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=45K1OkFQ+uR0nQ92o9uHCDMKlVhn7WWxxumDG5+7SsQ=;
 b=jhJ6G60O5vDAVHIhyZwik2A08nsDRSh+5X5mIYGld+/xEhDNiQ3LC0MDloVsKxwFDF
 KSrUxb5hVskh0jfwAZyT7H95yHr2LTl10rmMre4cSpLxpvrS+7yQaEopXC8Tyv2LKwQ2
 LAeEFo8jmpTFZ5iMdB5yq8ky4yS+l4AkuwfapjusMtdwZ9ezRd0Q75yylA/in8nVAm7r
 PB6scPi8Ff089n3YG15DbsISYYwpAJkzYYqFJBM90J61sNsn0qh3RL3ouRokxx9ehIzb
 Fx2Rdlg6zHiOuSfNXA5s02Ry6bLPAotRAdm9iBXsZSvKW9hNwWBNLEh+OFS+CfSFEmJ2
 nAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=45K1OkFQ+uR0nQ92o9uHCDMKlVhn7WWxxumDG5+7SsQ=;
 b=RBDjvJ+w4z+2uD491oD7p/HbYSAXDUOGPMGM8JlNbMS4XvLXHY8YqvPWGJ3hVAyOiK
 4/kPvhh7TWvGWEEi/afTfqsKZHuq6IXCYeQhNsa29KYiuIMm9BlvXY3gwdydCAf4aRto
 Y719l8v+M7dJWyL5Uz4MNkod9gjnCKCYCHfIZfe/+7znCnQnx+WlJ7kli9Nm1zab81m0
 Aeiz8HxC/Q2wUtgPn16qgx82UnqR/uPyYt4VbyKgYgVXr8d/HSrGnYC9ZYsqpmR0z+le
 lM5+kt//mmZbeK4wz/yG4M7V+I3QlKJTmGO+ubTkXeNOkjKlXwW87qC0gqRjLPAxRIHa
 ldZQ==
X-Gm-Message-State: AOAM5334SzjbehHeHcvFYsPjsvaIya/RWjMN1UrgdXLbxQggkDVxqEKL
 XgZ1UYYwRQvAbd7o/NyEJkQn1g==
X-Google-Smtp-Source: ABdhPJzOrql6u74Ub6Ywm5CLXjfBDrAPqkGgMGRjBmO9zK3r8s4SIcKz3FVAau6+spQCYt0vstIENw==
X-Received: by 2002:a17:90a:6e2:: with SMTP id
 k89mr3700119pjk.74.1591691542626; 
 Tue, 09 Jun 2020 01:32:22 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id fa13sm1769486pjb.39.2020.06.09.01.32.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 01:32:21 -0700 (PDT)
Date: Tue, 9 Jun 2020 14:02:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200609083219.5473zf2tq4tmjxac@vireshk-i7>
References: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
 <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
 <20200608100900.c4fi7pw7euie6tnt@vireshk-i7>
 <CAK8P3a004cavRhyWx+uXYYteBi1LviahAv11+9JyGadN-vo8og@mail.gmail.com>
 <20200608112000.sjrbvmqjciifgyub@vireshk-i7>
 <CAK8P3a0PqtFWTZr9hvSy5Y0ZZOSNgfzw0x1DTTyuzfsfROpAvw@mail.gmail.com>
 <20200609070535.iym6m5n2v5urykbc@vireshk-i7>
 <CAK8P3a0giS2A=4Hc4SO7cVn_nOU4rz-KzbSkQJcddM2Hc=KRxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0giS2A=4Hc4SO7cVn_nOU4rz-KzbSkQJcddM2Hc=KRxg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On 09-06-20, 09:43, Arnd Bergmann wrote:
> On Tue, Jun 9, 2020 at 9:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 08-06-20, 16:51, Arnd Bergmann wrote:
> > > You already have a special case for gettimeofday(), so just round down
> > > the 'start' value to the previous microsecond when you are in that
> > > case.
> >
> > Since this will also affect the next reading as well (as we will loose
> > values < 1 us), I tried to do it a bit differently.
> >
> > @@ -78,6 +78,13 @@ static void run(unsigned int i)
> >                         tv->gettime(clks[i], tst_ts_get(&ts));
> >                         end = tst_ts_to_ns(ts);
> >
> > +                       /*
> > +                        * gettimeofday() doesn't value less than 1 us, copy
> > +                        * that from start.
> > +                        */
> > +                       if (tv->gettime == my_gettimeofday && end < start)
> > +                               end += start % 1000;
> 
> This looks like it should work correctly, but it feels a bit more fragile than
> 
>                        if (tv->gettime == my_gettimeofday)
>                                start -= start % 1000;
> 
> which would bring the start and end values to the same resolution
> rather than making up values that were never read.

This sounds better, will pick it up.

> Your approach however has the advantage of adding less overhead
> as the % operator on a 64-bit integer is going to turn into a very
> expensive calculation on most 32-bit processors that itself can
> skew the timing.

I am not sure of what you meant here, both the approaches are using
the % operation.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
