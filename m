Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715B20EB76
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 04:28:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01D303C5772
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 04:28:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 92C183C25E9
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 04:28:02 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D0AC120096A
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 04:28:01 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id cv18so3621574pjb.1
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 19:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K5e2p+p3+z3xPxp0VlGkPm22IFcJLi+DGKZV8IKyvg0=;
 b=qNi/zoZTJNcR9/l/FmOGcxGcjYYnkDIfGbpfSCSzR6T0DpSle09a2oPFsrTgDgqnXd
 RPZFFds00KhvJ/bbI711znpfvVxroWmP3OKjw81DWEbbLdvjjRUKXuyFHOMRM8xwIhLI
 t3phniGXbr4y0svdBMUC+ncnM/Jfquf8gUkxZJ+hgrq7TGUkLylFxzgw2IJdMX1acRO6
 ZJ+ZdxS/J5RjM047cbLtFMvvQNcJDM5k6T3F9HZ+yHHmWoNXDZ4nHVlaX02d+5xPRJn4
 dXZX65ambZoRYF0UzlpeYCtIvG7gcCL/hS2lfepk8XEQIZpk3RHeLBTuU9//szy5oxvy
 ZgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K5e2p+p3+z3xPxp0VlGkPm22IFcJLi+DGKZV8IKyvg0=;
 b=a2AKaOlNdlQsRpNTed/UvI/mCXwDjYo9o2plsll70tHHUlu+mj+nvUwejggOzFS4YQ
 izI0M2WnYyKnoandWrlk9z30UO/z8RTLieivruAKyXaMRnvvcL84sjoYE8M14Ksnipwt
 coH0UyejGLWvUx4wjgZn8aZ0R5V8gnHhSApotNG/nYkPHkMZUftkYKKEgSv8xLfWyGQC
 uaqrAIa+jdOmcpZ8mOb9881JhMTy43I0f9EKdIC34KbLz37EsLxwjzgT6rYfHrrVgaEL
 TMm/HK2WkKgYvQ3unOx0Zm3xU7JW5pZ15ip+Dp984c13PCbHYQoU5u4RvPGEyBZnKXb/
 y+Fw==
X-Gm-Message-State: AOAM531hZx4yel8SczKHde/0sP3qj3qZ46Gf4gsL1UocTvLRxNQIlXuk
 iX1ZIBmAOQ9l6KH1OOm4r0du9A==
X-Google-Smtp-Source: ABdhPJz4Q9Y3kU3B1FzBu2q6QriBi7ixewbn7RRblUlt256qMG/A8fhmc3RexQGvbndpyGiazDwJOg==
X-Received: by 2002:a17:902:9042:: with SMTP id
 w2mr16299954plz.9.1593484080037; 
 Mon, 29 Jun 2020 19:28:00 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id i10sm933016pgq.36.2020.06.29.19.27.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 19:27:59 -0700 (PDT)
Date: Tue, 30 Jun 2020 07:57:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200630022757.kdfspo2ixfq4snkp@vireshk-i7>
References: <7c68854a1b6ef828ed8dd83cb611bd5b5d53c2f8.1593430825.git.viresh.kumar@linaro.org>
 <7d8f71c73ac4518375b81651f82ef040c02082a1.1593430825.git.viresh.kumar@linaro.org>
 <CAK8P3a0ZAjUnybGVD4Kh5t5PZth3wgt672SwNf9iVPmqBUg4LQ@mail.gmail.com>
 <20200629121351.GA11544@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629121351.GA11544@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/timer_settime01: Make sure the timer
 fires
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 29-06-20, 14:13, Cyril Hrubis wrote:
> Hi!
> > > This works well for all clocks except CLOCK_PROCESS_CPUTIME_ID and
> > > CLOCK_THREAD_CPUTIME_ID for some reason. I tried to read the values for
> > > those clocks by sleeping for 1 second and then reading values using
> > > timer_gettime() in a loop, and the value incremented every 15-16 seconds
> > > by a value of 1 (which was in ms if I am not wrong).
> > >
> > > No idea what the hell is going on here and so need experts advice :)
> > 
> > The problem is that these clocks only tick while the process is running. Instead
> > of sleeping for one second, you need to be in a busy-loop to ensure they
> > actually advance.
> 
> Indeed, we may as well do something as:
> 
> 	while (!caught_signal);
> 
> instead of sleep() in the case of the CPUTIME clocks.

So I did the right thing by asking and not wasting time :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
