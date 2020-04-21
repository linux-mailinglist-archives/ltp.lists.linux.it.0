Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E79531B22A7
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 11:26:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A592C3C29B6
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 11:26:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E35863C039E
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 11:26:21 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 254F160054C
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 11:26:20 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id g30so6362087pfr.3
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 02:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N9OOnzvWtqRRnE/g4n3fDjyYytvRXlMYHOoix2+P8go=;
 b=SnEeS77ZyTv3th832R1fonKmi9UuuswZPvpjSy6poKSG3PpaLftWWiB0G+z1AhiJKt
 OGuqGRXjgQlscrlNIX9CYCYyMelO9vP/s06sp/WXITXQcBFwlgqoUcmvn+3ODw4XLUj6
 JckcEm6D4IMIL5Swk4Jgn2v4s3+KbAbhWTA6U+diz/GTHhUNqWCocV+6TAjvYvYAcgwm
 gmz+W52oKQuvmF8kOrKn9pF1t8/GL2hCoybGeVSzGAT3h6G6Gr16vJsuhZWP6nMpyHLe
 wbWMdLFE1uBBUmfRXyjWCVsDuaWZM20/eiQvuJ1daeyt/F8onhQ161RbtzVygi27KjuA
 FRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N9OOnzvWtqRRnE/g4n3fDjyYytvRXlMYHOoix2+P8go=;
 b=Hy3+xyIlxqk+7ZB8R/52MLQPnnffWOxJqOxk48xbvoLxJLCU97VG9Ge5eDSHvE3XBH
 yQAWPJzfzX/EQGjtwnq7FjbPYv/m1maY62dRBmB4RCMpGMFTuYAjb9w+3GNk96BJRnch
 enGSw+r/xtk2G8EirxOI/clNIoKOwxFtNvJjH1uHpJWvSh0B8XysrO3Owc47aIoNxR+z
 LO4udNnt7WQbp1K0+EWrzDFv9omL00wL70Eo8/LKXq0rOoQs2euxIhD2IQ4wt/UvrNjp
 PHHHBOj8elH0LqFBNTP2tkYVAcxX9qYMW/7hE4Ws3b2VSSjHvY+g8e5sjsVrn3+H5kXn
 2UmA==
X-Gm-Message-State: AGi0PuYOOSmTGF50Kj+Scx1HSoY8DFVI9i0b2NVaDaMhWwyaOkR0148l
 0zZ1Yw0YyvCjxyt9kRblqtm72Q==
X-Google-Smtp-Source: APiQypKb5cN8/D+4IfNPoTnAurbnxpVWh7g26cxJfUKr9/iSXHiqJXm14j2VPMQiuDjg6hWLSy4lOA==
X-Received: by 2002:a63:c44d:: with SMTP id m13mr15541230pgg.314.1587461179360; 
 Tue, 21 Apr 2020 02:26:19 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id l15sm1720893pgk.59.2020.04.21.02.26.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Apr 2020 02:26:18 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:56:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200421092616.lnktrr4e4pv7wemm@vireshk-i7>
References: <CAKohponWBU_pSDk6sjsMFBkJzwPDz71DcyC1_X6x1=0bZMb=aQ@mail.gmail.com>
 <20200421092045.GC6577@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421092045.GC6577@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Purpose of clock_nanosleep2 tests ?
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 21-04-20, 11:20, Cyril Hrubis wrote:
> Hi!
> > While working on the time64 variants I stumbled upon
> > testcases/kernel/syscalls/clock_nanosleep2/.
> > 
> > The commit  log says that we were trying to test clock_nanosleep2()
> > syscall, which I am unable to find, but still this ends up calling the kernel
> > variant directly for clock_nanosleep() only.
> > 
> > What am I missing ? Why is this stuff required ?
> 
> Hmm, I guess that there is no clock_nanosleep2() and the test is a
> result of a confusion of some kind. Maybe the author just confused
> clock_nanosleep(2) with clock_nanosleep2().
> 
> Looking at clock_nanosleep() tests, there does not seem to be a test
> for ABSTIME so the best solution would be to move the test to
> clock_nanosleep directory. What do you think?

clock_nanosleep03.c already tests ABSTIME. I think we can just drop
clock_nanosleep2 directory completely. I will send a patch if that looks okay.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
