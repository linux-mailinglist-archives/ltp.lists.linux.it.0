Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE080202F65
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 07:11:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 410833C2D20
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 07:11:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C5BA63C2BDB
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 07:11:40 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 13CE22011C8
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 07:11:40 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id s88so8036822pjb.5
 for <ltp@lists.linux.it>; Sun, 21 Jun 2020 22:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WntBQOKsyjWOjmqPUed1CXWnZWVWy4lDU/0MPNSjky8=;
 b=iiSz/PXCWDrwcXbCD6ZWVUFKi++s8C1AA2HakYo0LMnnej60FmNT9ie9AsMgHbSLIi
 JwXq7bjLTvmXmGdY6ER21M670CWSsK0VZP8r0hKD695EljaR8s//ps3D9p3k2tyUpGkG
 mw8YttYVf7V7qY2mzV5b9+f2e9kyzeipNDDj7yANBLAZ+4Gd3UlbVwaQXcdAgNN065i/
 6X3hAEi6vh8ELUWCpGwBDq3XVqzNw4ZsdraicUm0xhy0z+hxSmI52JxfiCf7hL8z4dxd
 yzteHYc/jOXeb8EhFYXYPiXH8+TfbcFlzULm44czbYfCAPj8yU6i4IO6bf2jt7cJIJbB
 Xl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WntBQOKsyjWOjmqPUed1CXWnZWVWy4lDU/0MPNSjky8=;
 b=FVHQn8jBQfSzovwMRE2O4tfXRCxrveqfm0VE8lEaVWz8cZDtpOeC1S+8CZuGArE99K
 1MvHLRW+bL15L0pXTbIMvvvb22EGzwaxPy1Dojqiaj9l3KndmSYEEZ9q11Y5rl7ZaCpO
 wSdiVk4FZXEYpddcvTe4SgLh4+T6bcM7CX5Xq4QQ73NlpZYNvmBehx59IoXOVwo4tBr5
 D25R+wgZrtqvQpGipjZIrE8XbAhq6wcclSBkQAdXo1nfAdE8mtW0pLSucAFVVuFgjFMt
 XfLZwCsDHNG0isxiLw+/o/Fkk52T7vf0HulDeEak2euHyAPz5w+oqU3wtMR8SPJjRndg
 HD8g==
X-Gm-Message-State: AOAM531bnwIcbfp4Q2fML8rQp2+OwQIrajdcqj9I12HOmH4nl7ak3tbi
 aIUEDHGnmDWkPN2e3VqWkHCd5g==
X-Google-Smtp-Source: ABdhPJz+0pv8z5mZ2NJoHPtHZvOcOfytM7PEi3Cab8K25JfdjazOg6f9+0INCPULMCdNwEciBAYAmQ==
X-Received: by 2002:a17:902:ee12:: with SMTP id
 z18mr17861371plb.308.1592802698461; 
 Sun, 21 Jun 2020 22:11:38 -0700 (PDT)
Received: from localhost ([122.172.111.76])
 by smtp.gmail.com with ESMTPSA id y7sm12265376pjy.21.2020.06.21.22.11.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Jun 2020 22:11:37 -0700 (PDT)
Date: Mon, 22 Jun 2020 10:41:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200622051135.dzitlt3tpyftfvqc@vireshk-i7>
References: <8b9a7e8ea27894090f1e31e178d7328f118163d0.1591270889.git.viresh.kumar@linaro.org>
 <CA+G9fYuHsezzit3pzHiz-6ad4AfbgRsdbuqfUKvLif7_Jk5WkA@mail.gmail.com>
 <20200618134205.GB19072@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618134205.GB19072@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime03: Fix issues with negative offset
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 18-06-20, 15:42, Petr Vorel wrote:
> > Test ran for 100 iterations on x86 device and confirmed test getting pass.
> FYI with very high number of the tests it still can fail, but it's
> much less likely:
> 
> ./clock_gettime03 -i 100000
> Summary:
> passed   3599972
> failed   28
> skipped  0
> warnings 0

I am not able to hit it on my x86 box, even after suppressing all the print
messages (in order to get rid of any delays). Looks like a hardware/platform bug
to me. I tried a loop of 100,00,000 as well :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
