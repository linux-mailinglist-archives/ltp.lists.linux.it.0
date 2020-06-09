Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B90B91F3625
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 10:34:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 15E213C61C5
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 10:34:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 200463C2E46
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 10:33:58 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 49B321001432
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 10:33:58 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id bg4so7763034plb.3
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 01:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zRms961ku//CmjuBW6h+h1iL7YbAtsR7ASp8Rss4bh0=;
 b=QlyJOe1deWIs2xeVioGYgvLwOgiKIzHGita/H9JIKeK3ddfh3Tb3fUUwFvUxcD9FsY
 +AcduO8ZrSvv/3hyr8bMWU89CrFu75+9bNXfvoOaiOQfl5xyzD4jVitXHRoe75oNGH4V
 tUHTxEREmalf09Sb7DuVZ9/lekWC3USyF920UhSujDutIbbmHp29JkAr7BUoiEqO/O9j
 3iYz8rFGW82UBfho9KmdFaHYte2kjS7sSqZbpBZKAABg+R2oAu23Z2W/ofM2PTbWy9cJ
 wAJwwB+VTb2jkhpyG6S6S5xJAHkD0YRkmGm6eY2TKigVqyQy3j9c/I/1FyFXf0U0teHr
 rIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zRms961ku//CmjuBW6h+h1iL7YbAtsR7ASp8Rss4bh0=;
 b=pBaVQJkrAKWOz5nKZdWdJ8TNEEXjKZSxSghde1ttGnRyhwgadEKyuxaxpSO+HTbFAx
 WgHuOYI9Dv3dO3dP2X0tztDhMA3yRQrb50AxaM9YW710jaPa4hypW97J3Y4NkSwhWRFU
 K0520J3HO8D2YUDjT40a8JleyfBgDkRmrYe4bK5IxxLPwDw5WX2XsJ07F2vs7fy76j3p
 uG9u/A+0yXymTGo6R8fmaXW0ZhDStm0qEJWJbkjt6PuR1OrSKzJvnjH2xEtPlLssfZ+A
 BDOuQrEuSgPkg2FRzH7u6HtN9+J4wuywp2OtqcZFbVEeP4pcB8CtoAP6y2gELllLgyY7
 BhAg==
X-Gm-Message-State: AOAM530fd43SCLgj0PmTPVNm1Z21xTyQdd+m+p4pEOjx9LD0aKJcwz01
 lZ+f7pKskSzXnlNg3dmAdO+yLg==
X-Google-Smtp-Source: ABdhPJwRIvf6fSyzW687XwdQjqsot9vZeImMrYjtZ/pkB3ERZ5o4Kxz9tNEA2djWQljFCM0PW9WjhQ==
X-Received: by 2002:a17:90a:30a9:: with SMTP id
 h38mr3371893pjb.7.1591691636847; 
 Tue, 09 Jun 2020 01:33:56 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id 77sm9238610pfx.172.2020.06.09.01.33.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 01:33:56 -0700 (PDT)
Date: Tue, 9 Jun 2020 14:03:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200609083354.haqmv2yg4ns7up7a@vireshk-i7>
References: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
 <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
 <20200608100900.c4fi7pw7euie6tnt@vireshk-i7>
 <CAK8P3a004cavRhyWx+uXYYteBi1LviahAv11+9JyGadN-vo8og@mail.gmail.com>
 <20200608112000.sjrbvmqjciifgyub@vireshk-i7>
 <CAK8P3a0PqtFWTZr9hvSy5Y0ZZOSNgfzw0x1DTTyuzfsfROpAvw@mail.gmail.com>
 <20200609070535.iym6m5n2v5urykbc@vireshk-i7>
 <CAK8P3a0giS2A=4Hc4SO7cVn_nOU4rz-KzbSkQJcddM2Hc=KRxg@mail.gmail.com>
 <20200609083219.5473zf2tq4tmjxac@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609083219.5473zf2tq4tmjxac@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

On 09-06-20, 14:02, Viresh Kumar wrote:
> On 09-06-20, 09:43, Arnd Bergmann wrote:
> > On Tue, Jun 9, 2020 at 9:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 08-06-20, 16:51, Arnd Bergmann wrote:
> > > > You already have a special case for gettimeofday(), so just round down
> > > > the 'start' value to the previous microsecond when you are in that
> > > > case.
> > >
> > > Since this will also affect the next reading as well (as we will loose
> > > values < 1 us), I tried to do it a bit differently.
> > >
> > > @@ -78,6 +78,13 @@ static void run(unsigned int i)
> > >                         tv->gettime(clks[i], tst_ts_get(&ts));
> > >                         end = tst_ts_to_ns(ts);
> > >
> > > +                       /*
> > > +                        * gettimeofday() doesn't value less than 1 us, copy
> > > +                        * that from start.
> > > +                        */
> > > +                       if (tv->gettime == my_gettimeofday && end < start)
> > > +                               end += start % 1000;
> > 
> > This looks like it should work correctly, but it feels a bit more fragile than
> > 
> >                        if (tv->gettime == my_gettimeofday)
> >                                start -= start % 1000;

And this can be
        start /= 1000;

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
