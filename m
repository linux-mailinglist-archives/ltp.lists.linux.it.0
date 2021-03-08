Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D15330AF7
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 11:17:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A3BF3C558F
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 11:17:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id BDF123C063A
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 11:17:37 +0100 (CET)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2FF66100064B
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 11:17:37 +0100 (CET)
Received: by mail-pj1-x1030.google.com with SMTP id i14so2750329pjz.4
 for <ltp@lists.linux.it>; Mon, 08 Mar 2021 02:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=er7xkrAg0rZAiBfLe/zWJvd6su1qBEms0UMy9w/aF18=;
 b=JNjoQWqSHJFlm5oIdi1LyUQ1A6Ul0HMF3pzLPP2aeH6FknIKHpoQw4FgtWQJ+aIuDz
 hOSL3D4cn9NRQmTOejz3SdILBwofUYFRk56Om3Qz9bOXR4cF7jEySMOyhZ4yttxyyZaA
 29l0kWpT2p+L+AZd+ffUPakGnVkvBohsQxXmLTL/Q/qyTdbq8yFoQ2DxN42UwoQsJ+bs
 5uCHi5cxj8jVF5GBp2z8AvVmmxhmq5T/blLCOLIEUE8HXNT2QTDQOQBrEz8Gvyh/MC/2
 dp0KJ58g8P1Ozh2vkfFu2HcdY6y1au3sQQaDvVWVKmR+EOFA4/UYfpD5+UyuMwEzG0Ax
 7S9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=er7xkrAg0rZAiBfLe/zWJvd6su1qBEms0UMy9w/aF18=;
 b=pNCQsHxG7TZWUlFyg/MsXeWv+BMydOhBYu5/k3+PQ56SiFWsIHCe5I+c4Xbtv70qt5
 pJLa40MtlFE5/vlCSRNjKOpSVRB98Jp3u4OjUGfWLJ63hhoTzV0SidtpmngN3j/P2oe9
 5xgcvJPQdPkpouFPj8ZtdYc8p4xe48OH+MLfmkPrDiELHzGzIX5dVm2u+IHRI/dmihBE
 AeMl0NBN6QGO2owZIK9RU/Yyagj/Op530bFIO5cAmrROX+Ka4FRrEn7Vslovf8iVt/8T
 nZyMRGtQZxr4gYuaY2kRyZpXJu6vLEVXJUaNbZXnVlN+eL0AcNtvrEek1PlOGeJeokMd
 h5Dw==
X-Gm-Message-State: AOAM531o9+vIi+ThaWe1kYQ3vhr1LwcSk3MktZm+KHb/N+QZX2C60hjV
 sJ7TeT468QTKFAL2haoJ9k0tbA==
X-Google-Smtp-Source: ABdhPJxEXTDrE3ycMgNdDY0FV/4m6oubi4LUPhaKuNKLOJinPIkaVfR1YSEyfWb+BHGMP53J11UbDg==
X-Received: by 2002:a17:90a:f2d2:: with SMTP id
 gt18mr24174270pjb.210.1615198655539; 
 Mon, 08 Mar 2021 02:17:35 -0800 (PST)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id v4sm10471254pjo.32.2021.03.08.02.17.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Mar 2021 02:17:34 -0800 (PST)
Date: Mon, 8 Mar 2021 15:47:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20210308101732.lzkjql3t7aoscruk@vireshk-i7>
References: <20210308065329.25824-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308065329.25824-1-liwang@redhat.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime04: print more info to help debugging
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 08-03-21, 06:53, Li Wang wrote:
> We get some sporadically failures like below, but we don't know which
> loop it comes from. So adding more prints to help locate issue.
> 
>   tst_test.c:1286: TINFO: Timeout per run is 0h 05m 00s
>   vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
>   clock_gettime04.c:157: TPASS: CLOCK_REALTIME: Difference between successive readings is reasonable
>   clock_gettime04.c:150: TFAIL: CLOCK_REALTIME_COARSE: Difference between successive readings greater than 5 ms (1): 8
>   clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC: Difference between successive readings is reasonable
>   clock_gettime04.c:150: TFAIL: CLOCK_MONOTONIC_COARSE: Difference between successive readings greater than 5 ms (0): 5
>   clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive readings is reasonable
>   clock_gettime04.c:157: TPASS: CLOCK_BOOTTIME: Difference between successive readings is reasonable
> 
> Btw, it occurs on a x86_64 (not virtualized) with kernel 5.11.0.
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  testcases/kernel/syscalls/clock_gettime/clock_gettime04.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> index 5f8264cc6..4dc9093c7 100644
> --- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> +++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> @@ -108,6 +108,9 @@ static void run(unsigned int i)
>  			if (tv->clock_gettime == my_gettimeofday && clks[i] != CLOCK_REALTIME)
>  				continue;
>  
> +			if (tv->clock_gettime && count == 10000)

clock_gettime will always be valid here, isn't it ?

> +				tst_res(TINFO, "%s", tv->desc);
> +

I think you just need to add this to setup(), same is done for various
tests already.

        tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
