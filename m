Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC199209C48
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 11:50:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 787D53C2B8C
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 11:50:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5737A3C1419
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 11:50:13 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EFAE81A01743
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 11:50:11 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id l6so7179pjq.1
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yQqBankCqU35ZX1YLG61bcL8hlDe4Rs3JeBufWxe9Yw=;
 b=gwJR160VSO+OCeXKAce0bl0pml2H20wu2mvwf0BMT+ufc9Qa33oNqsap33qyFmtdkX
 5ebfxFS3Q2+wNGbliZpr56GgWhuABVuAUdco4NUx67w3xEcoyPpJ5u67dTcdaL3jUXo/
 dFbwIoLXmjMYpnA8xhI8vCXmyOYHqWkO2I8UT02FDlBxMn9SpTrTDA83Bh1J0JCxuHFo
 7hrT4SK32sWo/7ayn/Onz/7m1qgYD/5Fm6Z3kdK7qSmFeAj+YgdipxLoN78OJSqe7Et2
 2AW4pSHVd7RjL85L8xjToV33FUXOMTfx2frQGTm9DAgKhHeBnpdI4TTsmDOaavbyYLT9
 1vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yQqBankCqU35ZX1YLG61bcL8hlDe4Rs3JeBufWxe9Yw=;
 b=I5EWEvPOrhp1e6iKkjiCR3b5tD7l17N5Lltlbrnf49vIVM3WTin8T6+QXoKq35uU1m
 5C3Pg2gHdGE1TnFQpyrKlvtNS+tPz/PUBELbedpkkS5fLVSnJiDcRCSMW2XAIpfj3t+i
 2rvEYLQ6z2bERz4xWWT9m2UxJqqHYDfFlSIxN8vHbm/xHT55Lk+gZilcTEtBYMZFdjkT
 lcUujR5Q9HJLwleWC92cCMkR3ZZpkJLzZtgGvfclUU1KJLuvzy9WLYozpxW68x+3sP5X
 sZaDA9GhdBD9yUjQGwjh3EsxBLE2iA91WDdo78X1x9c3WjcHyn3exXcozIcMvYVdek4L
 nQwg==
X-Gm-Message-State: AOAM530T8m6LEBIXfO13eFV1kO7N5GTHb7xsKFkeS/k102Jy1lRMXfh/
 2BZ75UkUTv3m2BImdbcJYnLlWQ==
X-Google-Smtp-Source: ABdhPJxDQLaueuLB9OluaRwKwgNXysV3iKNtCShppQyirkniwd78N6tqq7N366P/4eE123k2eI5keA==
X-Received: by 2002:a17:902:9309:: with SMTP id
 bc9mr32796481plb.232.1593078610151; 
 Thu, 25 Jun 2020 02:50:10 -0700 (PDT)
Received: from localhost ([122.172.111.76])
 by smtp.gmail.com with ESMTPSA id mp15sm7840225pjb.45.2020.06.25.02.50.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 02:50:09 -0700 (PDT)
Date: Thu, 25 Jun 2020 15:20:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200625095006.d6ndameqblecadp4@vireshk-i7>
References: <a4a628a637a6eeeed4249656836bd217f5cbb9ac.1590144577.git.viresh.kumar@linaro.org>
 <9621b4f97b539f2e080b00491eb9ba4973878028.1591760262.git.viresh.kumar@linaro.org>
 <20200624142327.GA5181@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624142327.GA5181@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

On 24-06-20, 16:23, Cyril Hrubis wrote:
> > +static void verify(void)
> > +{
> > +	struct test_variants *tv = &variants[tst_variant];
> > +	struct tst_its spec = {.type = tv->type, };
> > +
> > +	TEST(tv->func(timer, tst_its_get(&spec)));
> > +	if (TST_RET == 0) {
> > +		tst_res(TPASS, "timer_gettime() Passed");
> > +	} else {
> > +		tst_res(TFAIL | TTERRNO, "timer_gettime() Failed");
> >  	}
> 
> Looking at manuals it seems that:
> 
> * Newly created timer is disarmed
> 
> * For disarmed timers the clock_gettime() should get itimer with zeroes
> 
> So we check here that the returned itimer has zeroes for both oneshoot
> and interval timers here.

I am not sure what oneshoot/interval timers you are talking about :)

This is what I came to, is this sufficient ?

diff --git a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
index ea7cc6b59f7e..4a949486a920 100644
--- a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
+++ b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
@@ -55,7 +55,19 @@ static void verify(void)
 
        TEST(tv->func(timer, tst_its_get(&spec)));
        if (TST_RET == 0) {
-               tst_res(TPASS, "timer_gettime() Passed");
+               if ((spec.type == TST_KERN_OLD_TIMESPEC &&
+                       (spec.ts.kern_old_its.it_interval.tv_sec ||
+                        spec.ts.kern_old_its.it_interval.tv_nsec ||
+                        spec.ts.kern_old_its.it_value.tv_sec ||
+                        spec.ts.kern_old_its.it_value.tv_nsec)) ||
+                   (spec.type == TST_KERN_TIMESPEC &&
+                       (spec.ts.kern_its.it_interval.tv_sec ||
+                        spec.ts.kern_its.it_interval.tv_nsec ||
+                        spec.ts.kern_its.it_value.tv_sec ||
+                        spec.ts.kern_its.it_value.tv_nsec)))
+                       tst_res(TFAIL, "timespec should have been zeroed");
+               else
+                       tst_res(TPASS, "timer_gettime() Passed");
        } else {
                tst_res(TFAIL | TTERRNO, "timer_gettime() Failed");
        }

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
