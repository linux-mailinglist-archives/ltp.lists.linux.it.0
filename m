Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065F2DCE2E
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 10:20:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48FCA3C3351
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 10:20:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 2C0E23C2891
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 10:20:09 +0100 (CET)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C1ED1600BE4
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 10:20:08 +0100 (CET)
Received: by mail-pg1-x533.google.com with SMTP id k65so9601408pgk.0
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 01:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PzJAscV7wRyTzNbn/8YuAHdSYhmcwAkAz3Cg/lT5ucM=;
 b=hEliEciDJV5pJhnO5wDp5cGn//YGhqArJf0Z6mxdckeXJI++OH4GbBKRKmDWX6fmt7
 9AEcJ3BuigoG3xlP8Mwmh3eyhbVmH/0j7TomC4r59yJitKpC5Ty/IBLPuP+U3opAjO2S
 xpwKHH4T0ZDgLLI3pboDF3iHpJ0InJv6sAcgOcapHbtkSOEb7XZL9C9SVSZvhunfU3AT
 wdUIj8KPkR/WI92z4qV1eyutES8cEfuNwArVwzGLWf1IUmBRNYol2tG8sdDppjrZjinI
 4JfuSUsXLLjfCDnPOl2wBUQeyUsFGujLZCD/nZqEwNuxFCGOUTcxwVD2F2L/58NATj9h
 UBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PzJAscV7wRyTzNbn/8YuAHdSYhmcwAkAz3Cg/lT5ucM=;
 b=XeXJCzoYwrD6Jl0D+ydLYjvxbri592dV7HSnLii4DQNabI0ibLdjbwWnKsSv4kLbI7
 fD6t2UUdXkpqWLptAw/9u/i0GFT20XHSRfwDCVk9QiGYP62uC+47Up2UDM3spvqgVcSP
 OsoqwCrIPItct9Bov6IubE4NWmcgBe9RhiXYjPDNLtZ69Y2IdnZ8Cs218u6r+FEQbHWC
 53vZdraqSqBSOXgtVTEj5r3hYgglRsnUc3/hGc41xNDBLKx4RTo+xPYcU9zfue5i1Lfj
 NlOfYqSmovWH1isz6S+vTEd8GtLnwy6fN4vpPjzrN4QlPpweAcu+VsmP7AYFSdy7a5pE
 aDnA==
X-Gm-Message-State: AOAM530SJMqL1FNs+LuWPpl5e4eujYT1JEZe0pdmHIOvJRMlgOUoHJ3M
 HU6rhAd7VQ5ZjpXciMobIkP/5vrelJHRZQ==
X-Google-Smtp-Source: ABdhPJyWi2kehOP1m+h0McLIjaWHoTwDvTjIi61T1ZxgtsIlN3RnAdqd9X04ARWDJbzvEQ3InRYBQg==
X-Received: by 2002:a62:b50f:0:b029:19e:2974:b7a4 with SMTP id
 y15-20020a62b50f0000b029019e2974b7a4mr5531353pfe.61.1608196807300; 
 Thu, 17 Dec 2020 01:20:07 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id 72sm5163532pfw.177.2020.12.17.01.20.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 01:20:06 -0800 (PST)
Date: Thu, 17 Dec 2020 14:50:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201217092004.yxj2woxzaffqo3vh@vireshk-i7>
References: <a7007a68b6a11f84f6551d253563da2f37319e55.1608179175.git.viresh.kumar@linaro.org>
 <X9siWpm84NICafIt@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9siWpm84NICafIt@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] module.mk: Remove build-in.a files as well during
 make clean
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 17-12-20, 10:18, Cyril Hrubis wrote:
> Hi!
> > Remove build-in.a files as well during make clean and also add it to
> > .gitignore.
> 
> It's actually built-in.a not build-in.a.

I copied the name from your earlier email, didn't apply much brain
after that as it wasn't generating for me :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
