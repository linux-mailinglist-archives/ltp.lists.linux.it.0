Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E26620CE52
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:43:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D0293C5755
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:43:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 88A563C5760
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:43:37 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 085D31A00E06
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:43:37 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id s14so6995612plq.6
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 04:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qTq6r3poLWttMgQRqejd5vtVKThBxdqBHzo4RfjoctE=;
 b=h1q6/bouCfV0Irp9FZYaQv/C6NPQ7qSl/GIGv8NnDreKYANPH8GcQQmlhiFEcAoPHf
 Rw6Kq3wuaN3SztrHVV3wc4MooC5kHGc0/GZU795z5LPEU9zt486vDcIxa14P1JbZaqCQ
 nhgUBXKvKfc17zYleOJ9/2IOuBn6JdkoTnKKNZkFt1wTi/eb3obst1dQOQn9UYfPjQ2t
 IR5NkD8O+bYSvsQsSImpq9xKUSGBOXiPtXQVAAjvBRkSqMMPAVFznYARrVM32ry7xtKm
 QrvZuO4KFgH3lhI6x+kr0CAgpsL/G4nPF02NUATZvcq8jv5NDLy9VnFRYR6pPUeiXFuu
 dDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qTq6r3poLWttMgQRqejd5vtVKThBxdqBHzo4RfjoctE=;
 b=UL4XbhK3L9xZTCGzY83J+BGjkTBBsFLW5eI15CikeKwY3P7biyUY2P78fi1zhjadr+
 mItIQG/08USxi4rlFKYUWRoaXKgwkPMsi0QW6s0JyO/D2FDyOwz4KfY1E2rPrcufCjLi
 iEArSODNAB6YfNNv4+3IQdf/Ezn8SscTMEPyV1zmCl3Pg1COHpKTtperQHDqJxqNI8vJ
 CdtDSkMHQxngwQ7BoCzLVL2JrlJhCm5McILF+92d+rX9y3Yt6iRJSWmCUgsHD+yqH6Zj
 0mLbZf2IWb3VGv/M2RYVsJ4GeZqX9/zx7GcoCz6tTmV4cO9OKXWUipW8HzFZmUJ8d60X
 hDZA==
X-Gm-Message-State: AOAM533F67cz0BE5Ff8XkeAVoN5cIMe9b26BeBGZcv7gYcABaZn4xoJi
 ZKdtHzjb3BFON2mhxTFsNjbapw==
X-Google-Smtp-Source: ABdhPJx/xe3EFeyfmg6xcLti9z9UCcH7+mpDs3gI1/LqX8SiCtOJQRYsoTydgykjr0IYKwYN82iUAw==
X-Received: by 2002:a17:90b:400f:: with SMTP id
 ie15mr15205109pjb.94.1593431015516; 
 Mon, 29 Jun 2020 04:43:35 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id z11sm19152785pfg.169.2020.06.29.04.43.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 04:43:34 -0700 (PDT)
Date: Mon, 29 Jun 2020 17:13:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200629114333.akzbp4bjz6lx6vgm@vireshk-i7>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <ff846fd931de19b2bbb44b2bc0631f4883a8e8bf.1593152309.git.viresh.kumar@linaro.org>
 <20200629093938.GB2552@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629093938.GB2552@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 03/19] syscalls/timer_settime: Add support for
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

On 29-06-20, 11:39, Cyril Hrubis wrote:
> Hi!
> Pushed with a minor change, thanks.
> 
> Added cast to (timer_t) to the -1 to avoid warnings.
> 
> Also if you are not burned out writing timer testcases and still willing
> to spend a bit of time none of the timer tests actually check that the
> timer fires. I guess that it would be easy to add the check that reads
> back the itmierspec, checks that the value is sane and also waits for
> singnal or two to the timer_settime01.

Done and sent.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
