Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 792D01E5805
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 08:58:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C0903C31D3
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 08:58:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B8F983C31B7
 for <ltp@lists.linux.it>; Thu, 28 May 2020 08:58:19 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1111C101316C
 for <ltp@lists.linux.it>; Thu, 28 May 2020 08:58:19 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id z15so1828219pjb.0
 for <ltp@lists.linux.it>; Wed, 27 May 2020 23:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KUGMUncFe2yGYu74oy3Go0DnMM38SPo6NtIOiAV7p/8=;
 b=UBAf9jpP1ULYfYeebuwoa3xt2NO8HJpW7JI1D7YhHOFZuo4vGOdRvnfADknj2V8Ac8
 HZ3shMrbnhOoGwg+tQLMK3eJyKSXn59lKueBP74CZH8VE2wdH9trVOU3dPaXNGXBxMFu
 s9dhQPlvwYJFFfWLDd3qY5LB9fi/eOa7Sl8zoi5ngmlTMoEvP1OFlvi+BlANVbltafqm
 S65bvy1YSvoDKKS0NbVYMIggacsxqrrg3BcdiYQS8RfKbSpMWA9EBRX//A5qwv0QZlv8
 kARl9NFJXnyW1UVJ44DvQqtgfxfh6DFDRKW3c5ozdrbp2YkFO37+KU++kKb+XcW4gp2R
 jkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KUGMUncFe2yGYu74oy3Go0DnMM38SPo6NtIOiAV7p/8=;
 b=CQ66qBf3IORC68xyFQ5+bOgjxYnjHy/wqC/p0EQxhGAXwavdvbYNWZxgTDvbhNwONg
 qIs5JG1HG6kcSmpou2ZP3acyOLCV4wMldG2fL0tpw8m0DE/7jr49sujlvPqCv+QPLDhj
 hHuyrvGSLwB/5mZ5PzdnoN5tgmzO4V00WazAdkScN6X99X76A67opfXz5DvnblOhXW9C
 qrbRtUgdgkXMOtQorJsOwSW8hKyl0syxXa+nyAkQdHv+WHb83DPpdT+QuzswYFuXcfrj
 3fn2l3t23yTzQxeJapUOxBYBMezRSv67l2fmFrYGyX/IYSt0JpW2LNFYWqDNMrUImfdv
 moaQ==
X-Gm-Message-State: AOAM533Jx4ASWSV79Jo6CJbXeasIN1SzO+lm5sEE/t59YmMdMNHASZWz
 bZebYJLS7NGHvRsiHa1Go+dTZg==
X-Google-Smtp-Source: ABdhPJy5LgjDY+7bFzTqJ+bzdWSbIk5ScwAaAj6/E83h9RNEQ1caIujw1I9nsJk5OVQTtXZYU6Cueg==
X-Received: by 2002:a17:902:8b82:: with SMTP id
 ay2mr2058070plb.142.1590649097455; 
 Wed, 27 May 2020 23:58:17 -0700 (PDT)
Received: from localhost ([122.172.60.59])
 by smtp.gmail.com with ESMTPSA id p7sm3837630pfq.184.2020.05.27.23.58.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 23:58:16 -0700 (PDT)
Date: Thu, 28 May 2020 12:28:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200528065815.4zygmlzz4s2xpuq6@vireshk-i7>
References: <70417fdc55c750e8b13d7124e66a7e8a59182e75.1590494889.git.viresh.kumar@linaro.org>
 <CAK8P3a13aJ3joRBE=P06fX8fxS-yroHx=T=bG0ZtdjhWE3RAJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a13aJ3joRBE=P06fX8fxS-yroHx=T=bG0ZtdjhWE3RAJg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: clock_settime: Add test around y2038
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

On 27-05-20, 13:18, Arnd Bergmann wrote:
> On Tue, May 26, 2020 at 2:10 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > This adds a test around the y2038 vulnerability, it sets the system time
> > to just before y2038 time (i.e. max value that can be stored in s32),
> > and adds a timer to expire just after crossing it.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Nice!
> > +static struct test_variants {
> > +       int (*clock_settime)(clockid_t clk_id, void *ts);
> > +       int (*timer_settime)(timer_t timerid, int flags, void *its,
> > +                            void *old_its);
> > +       enum tst_ts_type type;
> > +       char *desc;
> > +} variants[] = {
> > +#if (__NR_clock_settime != __LTP__NR_INVALID_SYSCALL)
> > +       { .clock_settime = sys_clock_settime, .timer_settime = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
> > +#endif
> > +
> > +#if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
> > +       { .clock_settime = sys_clock_settime64, .timer_settime = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
> > +#endif
> 
> I think the first one has to be guarded so we do not try to set
> the time to just before the end with sys_clock_settime() on
> 32-bit machines, as kernels that don't fully support 64-bit
> time_t behave in unpredictable ways when you do that and
> are likely to crash.
> 
> However, we probably do want to test this on 64-bit kernels
> with sys_clock_settime() anyway.

I have done this differently, please see V2.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
