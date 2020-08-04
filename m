Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB623BA75
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 14:37:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F1903C32CC
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 14:37:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 82ED83C1876
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 14:37:20 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B98F510011AF
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 14:37:19 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id bh1so9634708plb.12
 for <ltp@lists.linux.it>; Tue, 04 Aug 2020 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XpQ8mWmbPBNPjG4jrtaI0Ik0qIzi2rxDJFPJXIJDErc=;
 b=ZCCkxpWbP4xv315J23K3FQd0shYnXSSzIH5QxV9JcyQpAgIGW87q9XFvBsu5dMNaR5
 PfHUg5rNDkMv1XWjp647wzo+m9AeAYzAPi9O+sR7Fql7ORNj2LjQXYlkOSkikgNWuOkZ
 WgyhqDIJ2EcXRE5h5sCtz82dL9CKQeEJqCQ0Db0i/h9VitHZCZ9FOpkDZWnzXukdUFC3
 iwvCK7uFqhOA/KQ9kmz43Dyxko/7UyJ+XfFwJvUl5NGNJrr/uGnReVS17a6/0eSQMn8E
 gp9v5BU+9qEbLy/4kHJuCVFYLOdvckdZRKvl2IqEOttq0V1DLVOyomnBVuRwj7jk1LqF
 xVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XpQ8mWmbPBNPjG4jrtaI0Ik0qIzi2rxDJFPJXIJDErc=;
 b=CNPDWCJy03RdqahQubGCRlh203GuX91tcq8tUyGS7eji9UtnmxmAMU4LCOHiFLqpH2
 ln8sJ9IzZEbUekCAH7Z8QOlxsy/1UaQWcR/T1I/50lZa/iJ3LuJAvEtdOTxKuiEsWbqv
 wnYuJKUABXoBbDlVEo+tWpWF5rcfxUdmoQuzoysu3kWLLIb4sFZuqZyUKPYoz2sQty0l
 vQWyMLmuiNrASMt8eKyXX6REcUa8pL/osgbGCoNGrKn0MnnBYjzofmsTQHIkU40ufxnO
 qRAU2RT+M3/8FFxyUsxGw79M1qKdH07WYkFItXEIdqLrIl/zWiiDlVSHQ0q9+UPmLyH+
 kVqA==
X-Gm-Message-State: AOAM5304XnGcgebCwMbz7V2uLrh5Yv5nJ2n2gf3zXHr4nryQ2nLX/9jX
 PSJxMamO1RH63MeCrzhn7Xt1ig==
X-Google-Smtp-Source: ABdhPJySGuHsyl3DDZuHJnI4sgtPvHRIOHSrWLzPlPb0b2qKVIp1hA4SwC8Eci77qP7Ni414uQjfPQ==
X-Received: by 2002:a17:90a:ba93:: with SMTP id
 t19mr1299903pjr.213.1596544638194; 
 Tue, 04 Aug 2020 05:37:18 -0700 (PDT)
Received: from localhost ([122.162.173.150])
 by smtp.gmail.com with ESMTPSA id j3sm22755470pfe.102.2020.08.04.05.37.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 05:37:16 -0700 (PDT)
Date: Tue, 4 Aug 2020 18:07:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200804123713.kbflzyhwhq6cinga@vireshk-mac-ubuntu>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <5b16889b19e969b79fa7d46c533bb5989ace1e46.1593152309.git.viresh.kumar@linaro.org>
 <20200728121113.GA2412@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728121113.GA2412@yuki.lan>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 19/19] syscalls: clock_settime: Add test around
 y2038 vulnerability
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

On 28-07-20, 14:11, Cyril Hrubis wrote:
> Hi!
> > +++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
> > +static void setup(void)
> > +{
> > +	struct test_variants *tv = &variants[tst_variant];
> > +
> > +	tst_res(TINFO, "Testing variant: %s", tv->desc);
> > +	start.type = end.type = its.type = tv->type;
> > +
> > +	/* Check if the kernel is y2038 safe */
> > +	if (tv->type != TST_KERN_OLD_TIMESPEC &&

Wow!

> > +	    sizeof(start.ts.kern_old_ts) == 8)
> 
> Huh, what exactly are we trying to assert here? First of all we make
> sure we are not using KERN_OLD_TIMESPEC and then check it's size?
> 
> Shouldn't it be tv->type == TST_KERNL_OLD_TIMESPEC && sizeof(start.ts.kern_old_ts) != 8?
> That way we would abort if the old timespec is not 64bit which would
> make a bit more sense to me.

Yeah, thanks for noticing this. I kept it like that throughout the
discussion with Arnd and finally made the mistake while sending the
patch :(

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
