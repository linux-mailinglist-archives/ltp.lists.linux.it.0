Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED29209D42
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 13:10:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 333603C2B92
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 13:10:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A11983C2B82
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 13:10:22 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4A5FB6009AD
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 13:09:27 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id ne5so2875565pjb.5
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UYtyjk8+jFYxY8795VNP2bY64I7YRWB4BTzPdie5/jo=;
 b=dTugxfRhd+ZZe9o3HmAOAdz2YFj0bqEOeqvjXSlcswVNMwE9lyqOaTrBwpWA+sFlAa
 T5kAkLEz1CE1uXltpXhmrBgiloRRXLv8Lxt0g26kTiKKywV3n7uaILDuI7rV9ZG1wofA
 n2Ygv8wZ3hsPs9+PAJxCFh+65gsKDbxBKTr6UMD3xyFO5zKMc9ywsH+Ykqttg31BLpo+
 mkmYBQo/3ey4QQHL0CPyU+ZqlwOFmFnjlmO7V7AB+VozCKnm8+o09c5YXnD7F/r8E4XM
 9nJ43/01m3Cu3xYG2BLykP5PELBOH9bvyO3Ro1OTTCfhXydxFMiyUs8EPsAl/R9+1qBw
 1BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UYtyjk8+jFYxY8795VNP2bY64I7YRWB4BTzPdie5/jo=;
 b=iKpJ7EUCa4fiApi9TD/S+nxTVk6R/d+PWXJ9oMRcvunk1VlLYAzY5VQYiB77b4tbUE
 imeLqkxHQRnKpIrI0LfULv8mNi/LZZgzQw3qWR5OgMmhKi/L7mWHPqhIDK/soHnsJr9K
 Gcy54Lc5xy2VbLn/Ye6kAQ8HVmeqi490vlikAAAuY1UEYW6cpQJK9aAgL6tkeErnuqGl
 DWUFxr/NC3W4FNaLtJFnbK2lQ0kMEnIPKfZ0qWgy4Nc260j8W2xhWV7GHkQ7bhWsJHCj
 mSIP+Bbdd2Le1SOri/nBL6xrJ+/GI6XlsKpd3i4GzuWAXVnfWbmBGliypYC5MwgI5iX4
 xJZQ==
X-Gm-Message-State: AOAM531W4EH/edYPVdvq1XiH8baxBUoIluCHP/Qyg/24Ma4bHV4FreCB
 7YUxo5YMXZELbph4FEinzMGpRg==
X-Google-Smtp-Source: ABdhPJwyWb9iaeWp3OvQjz6iIJ3byOSeYyizCDpQA7uol1oWvbs5LsOsxSseXPs600MIJmh/ClCSVA==
X-Received: by 2002:a17:90a:fe93:: with SMTP id
 co19mr2682542pjb.83.1593083420336; 
 Thu, 25 Jun 2020 04:10:20 -0700 (PDT)
Received: from localhost ([122.172.111.76])
 by smtp.gmail.com with ESMTPSA id oc6sm9180545pjb.43.2020.06.25.04.10.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 04:10:19 -0700 (PDT)
Date: Thu, 25 Jun 2020 16:40:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200625111017.5yjsqi56u6q3u3s2@vireshk-i7>
References: <a4a628a637a6eeeed4249656836bd217f5cbb9ac.1590144577.git.viresh.kumar@linaro.org>
 <9621b4f97b539f2e080b00491eb9ba4973878028.1591760262.git.viresh.kumar@linaro.org>
 <20200624142327.GA5181@yuki.lan>
 <20200625095006.d6ndameqblecadp4@vireshk-i7>
 <20200625110751.GB23637@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625110751.GB23637@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V6 01/17] syscalls/timer_gettime: Add support for
 time64 tests
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

On 25-06-20, 13:07, Cyril Hrubis wrote:
> >         TEST(tv->func(timer, tst_its_get(&spec)));
> >         if (TST_RET == 0) {
> > -               tst_res(TPASS, "timer_gettime() Passed");
> > +               if ((spec.type == TST_KERN_OLD_TIMESPEC &&
> > +                       (spec.ts.kern_old_its.it_interval.tv_sec ||
> > +                        spec.ts.kern_old_its.it_interval.tv_nsec ||
> > +                        spec.ts.kern_old_its.it_value.tv_sec ||
> > +                        spec.ts.kern_old_its.it_value.tv_nsec)) ||
> > +                   (spec.type == TST_KERN_TIMESPEC &&
> > +                       (spec.ts.kern_its.it_interval.tv_sec ||
> > +                        spec.ts.kern_its.it_interval.tv_nsec ||
> > +                        spec.ts.kern_its.it_value.tv_sec ||
> > +                        spec.ts.kern_its.it_value.tv_nsec)))
> > +                       tst_res(TFAIL, "timespec should have been zeroed");
> 
> Indeed that's what I had in mind, can we please abstract this properly
> as well? I guess that we can add helpers such as tst_its_interval_sec()
> tst_its_inverval_nsec, etc.

I preferred it this way as no one else uses it and so maybe we can
live without adding those helpers ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
