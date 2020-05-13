Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3051D06AE
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 07:55:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 15A3A3C54D6
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 07:55:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AE0C73C2095
 for <ltp@lists.linux.it>; Wed, 13 May 2020 07:55:38 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 58D39600D52
 for <ltp@lists.linux.it>; Wed, 13 May 2020 07:55:19 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id f6so7302628pgm.1
 for <ltp@lists.linux.it>; Tue, 12 May 2020 22:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xuS8UfIgd03oCtA4hsFbtJGPuOFmaZGIzeFngFtPb3k=;
 b=cJgqm9e9S+aJPH5ThPjjUh+92/zBmmacDSX1RlXtn5hO6KagRYR6gOi/XGA0fma1Fz
 UyJovSpISlQ4V33PvpuuAD4Nr+vYXUuLGmKpZOh3/msFiSCXBqM5rEM9C4GXtbInNBlm
 25OFbzFZOCR/g93pnh2Nugwldi1R4iRUzQaXUX2rndQ9e9WZSuCAGzjv5jNfjbu2RRqs
 uxnN/4BVW12nzbY7bew5jzYd6OlPmDeeRPsykfIzMtByntEKd6RTCY3mqTStmFb/WsBj
 QwmDYrSPLpFHe0Yft+98h+s7CECxC9jm9wJVcfkpHC7GnA1XpvecE8XdBthSHyHR1QGr
 Ou3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xuS8UfIgd03oCtA4hsFbtJGPuOFmaZGIzeFngFtPb3k=;
 b=V/lQHuO1j5xOiug5152m3/IJa/uXx+C0h6x7NoXQbjVTPZeauS+yeYRgtnfLtik6nr
 YoKg8eYgRxBwlmeX6vkbMXGp/oD7g0mE06+x4Klz0VtdLzQyLkiJMBtRoCtbAD2yFw+T
 Tvh8ar+fDHXKnTMwTrjZQlPfjdi9iRzLASFVimhryg9qyKUlhwFGitbiEWkRfhawKx2O
 PS67Ps9xdt/e9JvIGBtv03t1G4UwE9rfEF/g5+LPClpgI/4p8ukNFuQrdwrykmoWSKUk
 aH4CabUS5x9H/jeJQovnnpS7qWrJfIunzqiz8W+3Cp0qfQDN4ikri54d+8fWBW10tYD7
 Nh+w==
X-Gm-Message-State: AGi0PuadcYrBsJH+T3aqGLo+FyMm3kYrbMmzaK4TjaMTrj/k5XmmXKA9
 75j3F/R9N4vtvKzAhezGawdG2Q==
X-Google-Smtp-Source: APiQypKCzMEzbDrl2cHe7Uv9+fQWzVHfob6x2lC8Fjh8aMD8H80K+4LWb+//t6KqMPj5aHGSnhDTew==
X-Received: by 2002:a63:a55c:: with SMTP id r28mr17164543pgu.108.1589349336205; 
 Tue, 12 May 2020 22:55:36 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id l137sm14042126pfd.107.2020.05.12.22.55.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 22:55:35 -0700 (PDT)
Date: Wed, 13 May 2020 11:25:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200513055533.ipmghf2oacc22mzy@vireshk-i7>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <20200513012626.1571-2-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513012626.1571-2-yangx.jy@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/pidfd_open*.c: Drop .min_kver flag
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

On 13-05-20, 09:26, Xiao Yang wrote:
> 1) Drop .min_kver flag directly because of two following reasons:
>    a) pidfd_open(2) may be backported to old kernel which is less
>       than v5.3 so kernel version check is meaningless.
>    b) tst_syscall() can report TCONF if pidfd_open(2) is not supported.
> 2) For pidfd_open03.c, check if pidfd_open(2) is not supported before
>    calling fork().
> 
> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

You can not apply someone's tag without them explicitly asking you to.

> ---
>  testcases/kernel/syscalls/pidfd_open/pidfd_open01.c |  1 -
>  testcases/kernel/syscalls/pidfd_open/pidfd_open02.c |  1 -
>  testcases/kernel/syscalls/pidfd_open/pidfd_open03.c | 12 +++++++++++-
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
> index ba1580bc7..6f5114f68 100644
> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
> @@ -29,6 +29,5 @@ static void run(void)
>  }
>  
>  static struct tst_test test = {
> -	.min_kver = "5.3",
>  	.test_all = run,
>  };
> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
> index dc86cae7a..a7328ddfe 100644
> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
> @@ -51,7 +51,6 @@ static void run(unsigned int n)
>  }
>  
>  static struct tst_test test = {
> -	.min_kver = "5.3",
>  	.tcnt = ARRAY_SIZE(tcases),
>  	.test = run,
>  	.setup = setup,
> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
> index 48470e5e1..9e27ee75e 100644
> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
> @@ -49,8 +49,18 @@ static void run(void)
>  		tst_res(TPASS, "pidfd_open() passed");
>  }
>  
> +static void setup(void)
> +{
> +	int pidfd = -1;
> +
> +	// Check if pidfd_open(2) is not supported
> +	pidfd = tst_syscall(__NR_pidfd_open, getpid(), 0);
> +	if (pidfd != -1)
> +		SAFE_CLOSE(pidfd);
> +}
> +

This only fixes the 3rd test, the other two will have an issue now.

>  static struct tst_test test = {
> -	.min_kver = "5.3",
> +	.setup = setup,
>  	.test_all = run,
>  	.forks_child = 1,
>  	.needs_checkpoints = 1,
> -- 
> 2.21.0
> 
> 

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
