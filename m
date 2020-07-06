Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C598421567D
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 13:36:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 440763C54F3
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 13:36:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 1ADCC3C1CEF
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 13:36:49 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6188F7DD546
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 13:35:44 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id f16so6514697pjt.0
 for <ltp@lists.linux.it>; Mon, 06 Jul 2020 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kxGLOKjR55Lo8n2fgV1IOGVTN5f1Y+2XJWkVphc5B8E=;
 b=lafN+DLzupwVY4ZKWq/Txo2jNtcS/yCUhg21amxFzD5jjsww1gHc0eskLTuE7kTd9+
 8isvNrLTvzfqTIXyhM9/w43Y2Tl0x5yaKwXYCN2KOGF0BzGWYcSkRjGqf2u6JzNMyyLi
 ioC5gn70j3o1YH6HZOODHmh4D+97BYMcKWYRpRu0hcEz7D/DlFJ6kNrgBhj+7E+8sotl
 XCKzTLlktKU4/B6dpzRq9xm/OiAPN4NE+Uy3pta/h0BbagqKsgsK4Q+VyVZsYBRY3HaP
 KdcN8kEKaLv2CoQSfNZFh0Dp+mjygQT3BME9HdGcTFdwTAwXSMs5Z2HgcYfnqkbRwnKd
 MlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kxGLOKjR55Lo8n2fgV1IOGVTN5f1Y+2XJWkVphc5B8E=;
 b=Ey2GapZEKpyxeGDYyg8bZumV8hcKzkinp19v2iTjgYF3FBwbyR9NvSDpthKUx69jrg
 a+lHpab6GdK77SbOdzIZ6s73XvL3g4nm1J6+fdOSQtljBc4zcbJ3FmcdTLkI9TtELSuM
 +0ATXKSAlSCk7pDaWTnrWAUAYyIb6D5btekSq91nGQAMALFpjj96V1Yqey8dfdDvb1jo
 kmyrUNDyfccPVCT7/Qms4SYN+DcBwmg/pcJjqElAfJbTV7aL39ghILAof3O2nnpSelFE
 yRBTRaiSx5kZPg2HMgM1m2FIePOJtEyG2gor0/HtR4/u+w6UIfTasNBdSl2MU3TTXJDk
 TY+A==
X-Gm-Message-State: AOAM531T97WzOOPimRe5FSkNT8loRfiowWElL75NBRqVBm7CdwNERQz8
 1mLKXudoigii9wPu2GiaA7dz2Q==
X-Google-Smtp-Source: ABdhPJzhWFHMJNDcZabV/mvds/zNUvLBV2d3i4KeIAVp04/cZP7GFL08AkP2cIfXGbrFwwoTu91Djg==
X-Received: by 2002:a17:902:b60f:: with SMTP id
 b15mr41325379pls.248.1594035406434; 
 Mon, 06 Jul 2020 04:36:46 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id gx23sm14470137pjb.39.2020.07.06.04.36.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2020 04:36:44 -0700 (PDT)
Date: Mon, 6 Jul 2020 17:06:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200706113642.kfnxrbqvae4qx4hb@vireshk-i7>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <6030fa8c1deda3aab977c7d5745c117fda87708a.1593152309.git.viresh.kumar@linaro.org>
 <20200703124548.GB2308@yuki.lan>
 <20200706104033.6vk7eqmcdxtqbnjn@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706104033.6vk7eqmcdxtqbnjn@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 07/19] syscalls/futex: Add support for time64
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

On 06-07-20, 16:10, Viresh Kumar wrote:
> On 03-07-20, 14:45, Cyril Hrubis wrote:
> > > diff --git a/testcases/kernel/syscalls/futex/futex_wait05.c b/testcases/kernel/syscalls/futex/futex_wait05.c
> > > index 2573ae177d5b..8fad5d858716 100644
> > > --- a/testcases/kernel/syscalls/futex/futex_wait05.c
> > > +++ b/testcases/kernel/syscalls/futex/futex_wait05.c
> > > @@ -19,7 +19,7 @@ int sample_fn(int clk_id, long long usec)
> > >  	futex_t futex = FUTEX_INITIALIZER;
> > >  
> > >  	tst_timer_start(clk_id);
> > > -	TEST(futex_wait(&futex, futex, &to, 0));
> > > +	TEST(syscall(SYS_futex, &futex, FUTEX_WAIT, futex, &to, NULL, 0));
> > >  	tst_timer_stop();
> > >  	tst_timer_sample();
> > 
> > Why aren't we adding the two functions here as well?
> 
> I am not sure which two functions are you talking about here ..
> 
> > Is the timer library incompatible with test variants?

I kept staring at this code and your comment and may have understood
finally :)

I haven't added futex variants here as this uses the _sample_
callback, which works with the simple timer code in LTP and as I
remember from some earlier discussion, that would be a lot of changes
and may not be worth it.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
