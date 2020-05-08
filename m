Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A32C1CA182
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 05:30:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F80B3C7093
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 05:30:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A804B3C6C37
 for <ltp@lists.linux.it>; Fri,  8 May 2020 05:30:43 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B3E3E1400BC7
 for <ltp@lists.linux.it>; Fri,  8 May 2020 05:30:42 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id j21so227627pgb.7
 for <ltp@lists.linux.it>; Thu, 07 May 2020 20:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dbhxnCtg5XgxwqaTVgXEGsuG/pmefZFLfZc+6764h3Q=;
 b=QGm02kyeRFW+sXxniplcDRT0hYVefPQgSrNkW3iS023LXUUhU/geDztD0rDbjcO7nc
 24OUuJpVdxFHf4QxjFrtusRpumL+kqt5ORM4DwhXMDXxQlp0Kn7a93dGlpwcKwjiJfo3
 dvkXbhkPknSROCpkYPOmYjxftyHM+8/36BG5MSr3uxAYa7seXyTs2KypUrvHGH72regy
 okP/ssYmNaNhe3GjZG9qny/YCmQ/Gw7gLkbiaTEAp9cpiaylvQ9prr4355vVrJgZO3yT
 BUDguyOFNDzq5SaHrmb5drgXtBN27mJcyOp6kwsVwADcXNBKh7cdVfAAOaT5DUVZWUnE
 +5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dbhxnCtg5XgxwqaTVgXEGsuG/pmefZFLfZc+6764h3Q=;
 b=RPNMtD+0cLssnZ3ExvO90sVoONjDOKQZHL6TPu585USxg07u2J9jiARVkf23VxhoGr
 P5s/w5DEn/Bpra1cSPIpkCCtGd4DVBx44lIPZmBzw+gaVaiUwGqbZ5b9wHP7Zp5BbOrG
 AExc2KjWodQUyHVE05h9LDJ06dCxHVAevK6y9N+QW5dQAbCCifk7zEHlLpYlxZVHJ7Ro
 FvIrh5VrL09G48oIFOEZWn3UVQoDaosCaaKOXqKC5vGY50BnzXRit7KB8NLtZGo683E3
 GF+Ww8YM2KR1pzKBcP3tN/Lls2XgitNqBaiivyDhIuAmTxkQ1OdIgLb6mZIzlyTaHqeS
 lgbw==
X-Gm-Message-State: AGi0PuacdJxKMo6geSgUt73hihFPy7WQKq2RHGIibfn2o2BGuQNqcqrH
 /wyL7Ew39VFFglK8Y+b75SWOeQ==
X-Google-Smtp-Source: APiQypLCXs51AfogucXXblWcWvNCQ6ynmFt5N1ySVT6yU/YDEO03jQrJ2nwfbO8/3cQC5/k0T3LjNw==
X-Received: by 2002:a62:a106:: with SMTP id b6mr596088pff.23.1588908641034;
 Thu, 07 May 2020 20:30:41 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id b1sm221431pfi.140.2020.05.07.20.30.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 20:30:39 -0700 (PDT)
Date: Fri, 8 May 2020 09:00:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200508033034.cyem2olxb7kpvu4s@vireshk-i7>
References: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
 <379f4d58e86b5249f56ff58e1907dee69d67e451.1588669892.git.viresh.kumar@linaro.org>
 <20200507145258.GA16940@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507145258.GA16940@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/8] syscalls/futex: Add support for time64 tests
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
Cc: arnd@arndb.de, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 07-05-20, 16:52, Petr Vorel wrote:
> Hi,
> 
> FYI, 2nd and 6th patch didn't apply cleanly.
> Trivial fixes, but for anybody who is lazy to repeat the work here it's done:
> https://github.com/pevik/ltp/tree/Viresh_Kumar/futex_wait_bitset.v1

I was wondering on why it won't rebase properly, unless I tried to do
it again the way you have it. I forgot to mention that these patches
were based on the earlier patches I sent and so there was some
dependency in tst_timer.h. If you apply following series first, you
won't get these rebase issues.

[PATCH 1/4] syscalls/timer_gettime: Add support for time64 tests

Will it be easier if I resend all my patches again in a single series
? I can also add the new tests I have converted then.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
