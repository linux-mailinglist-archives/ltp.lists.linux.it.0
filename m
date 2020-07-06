Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 441672155B8
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 12:40:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4D333C5502
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 12:40:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 17F943C1CEF
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 12:40:39 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 77208600053
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 12:40:38 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id 207so16615943pfu.3
 for <ltp@lists.linux.it>; Mon, 06 Jul 2020 03:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vkpqbBz+pSZ11xTNIkGB6caydw2mr4L8w/4OzK2fF6Q=;
 b=mUSU6F7JNaNPGvQoiEkHOTsHXjK7yGqp9y/xJyT41cb85uQHtHxylFs0Hr7kt2SPFW
 WWB9wksju3dgFT1jy9E5xAqrTvEvjPTdebNYta4xKnmY5rYQ0CRaAjPD3beb72D6yiiA
 w4Am848Fi7KDwdKx/xcVFqvE6aqBcy7CJMemzhqdxT5N5XMs2Tn+NQYPOMUAhQDj4vJU
 Y6X5Z9r0+4H3wBiicyS+zVE5KkhW1vISKZ/ol5NjDqYxMiqPtalIYQVWAxNCwGHPDR0n
 isx8S+1YYo+J6gx7Mli+ZPE8ITZFfvKUtob2998npKquEScNyn30S+4da1QOr6smXglu
 0Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vkpqbBz+pSZ11xTNIkGB6caydw2mr4L8w/4OzK2fF6Q=;
 b=rDJqNzfw6Of7qzr/K/NHTKTE8p0tdcWQatOgKpoFS/Q4efwnLdH6UhO6ZAyk1Glwpf
 uTGa7WGnFqiBr8WNXacR6iW/wUmnEYReJ7NjXILoXdz6tX4yCjLoGCVGveeX5WyDuQmP
 jSVbHkgJuEJqfUPO6MheVwDrC+KngdwWgkEVALzvaI1V0N1Q4B2Ev2uACyX2tDqnuAw/
 /L1TLtL2dE4E1Hy0V1AFRejVF7QoRrN+ZspsyBJzzp7todMcjkVziZdecM/urLhI70QQ
 5ciqZiIb2/AktgHJl4haIxtp4VHvwbzbOXo1A0JltCdvqErns9KzQvZD3bQ66KMSRJhw
 ejGw==
X-Gm-Message-State: AOAM532opAbLKUCaWn8/tfZwfus3QxVqHhUAIUrj5GqinyOh16Dq0GAr
 YvBPStQItL9uyx7w0MlfkrhAcw==
X-Google-Smtp-Source: ABdhPJx4C6FrOt+HVWTdzeC7O9Sg3mB76ovH89WzZ/bWFzujZCJq4yFS5C28H1iFn2Z8Rk/WkYGwwg==
X-Received: by 2002:a63:7f53:: with SMTP id p19mr36774875pgn.299.1594032036761; 
 Mon, 06 Jul 2020 03:40:36 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id d18sm18579236pjv.25.2020.07.06.03.40.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2020 03:40:35 -0700 (PDT)
Date: Mon, 6 Jul 2020 16:10:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200706104033.6vk7eqmcdxtqbnjn@vireshk-i7>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <6030fa8c1deda3aab977c7d5745c117fda87708a.1593152309.git.viresh.kumar@linaro.org>
 <20200703124548.GB2308@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703124548.GB2308@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

On 03-07-20, 14:45, Cyril Hrubis wrote:
> > diff --git a/testcases/kernel/syscalls/futex/futex_wait05.c b/testcases/kernel/syscalls/futex/futex_wait05.c
> > index 2573ae177d5b..8fad5d858716 100644
> > --- a/testcases/kernel/syscalls/futex/futex_wait05.c
> > +++ b/testcases/kernel/syscalls/futex/futex_wait05.c
> > @@ -19,7 +19,7 @@ int sample_fn(int clk_id, long long usec)
> >  	futex_t futex = FUTEX_INITIALIZER;
> >  
> >  	tst_timer_start(clk_id);
> > -	TEST(futex_wait(&futex, futex, &to, 0));
> > +	TEST(syscall(SYS_futex, &futex, FUTEX_WAIT, futex, &to, NULL, 0));
> >  	tst_timer_stop();
> >  	tst_timer_sample();
> 
> Why aren't we adding the two functions here as well?

I am not sure which two functions are you talking about here ..

> Is the timer library incompatible with test variants?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
