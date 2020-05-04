Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A82781C3217
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 07:11:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 759513C2692
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 07:11:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 74B773C2684
 for <ltp@lists.linux.it>; Mon,  4 May 2020 07:11:12 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4D1DB200742
 for <ltp@lists.linux.it>; Mon,  4 May 2020 07:11:11 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id s18so7971406pgl.12
 for <ltp@lists.linux.it>; Sun, 03 May 2020 22:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xp1xZiMkNvAv/QhFCfUavMiuNw5kqy63N5kBCKH3NcA=;
 b=NIC62U2C98D77d9zWj1JSiVPaADd/BQMeizZW2MPAOztAfhIxnecztPMC9XM5XbwyH
 LQpKKA7hdjhsh5X7qaJAWRbqCqGaNf/qzZBEOc8u7IVyQNhaYgVq88fRXgIUFsCuvg8+
 orVytN63gzRdfjOXK4cMCFQ65OM4z5RDbosX8oziyEDHJHjhWQ0YQ2g6k8Hu4yHu16g6
 l0f/0hlXxmG2yKUCyPPjKjJXFEd5TyJMQOZr5zSJm6tud+jmyBzJOe3jQFxLQ/ohUaBt
 fRsJ4n5S/44lXFkOCSAFUSUAREv4OUuVbtZW/D02QOk+i/s1b+hcN72iZG2VMD5QiZBv
 +sLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xp1xZiMkNvAv/QhFCfUavMiuNw5kqy63N5kBCKH3NcA=;
 b=auewnRnDCm29ygWrSHSIxbD1SXxGdvTGqsg+YOImMvk7mmEel6PUIcokhm78VVnhql
 /Z7QOOIzT++kdDUL82plVpSUDBfg/7p2wvE189FQEaOk6WWdIPDp2YOZnGkrQ/EldLBv
 LcgtekTdmKOdLeU+OyK6Pqe8qUfsVF99vofR+ThU97EY7XD8DReA2cgzrJNVMk6W4IJK
 AQmok6jtGkhqU2vViB6JjVGbmQji+sEm3OtcYRMKxwoVdmgOx8MH1A5sLdRJ8R5oHRgb
 IYdfDep/RPLziGuQCctLc2SVb0I8Q8/sxppRLcXX3ATL0ZNpgg6ZK59IhVycCrREfKLf
 2wBQ==
X-Gm-Message-State: AGi0Pub/i+vbz+Ia8j2hnGvGJyRJRGpjqCcJEqZ4EFJhR1Eu7B7RtnNm
 DEcOQhsnuMdY8DNtZ4iyhfAwSw==
X-Google-Smtp-Source: APiQypJUGRxB80xh+y4629+lDGj58EXx71UstlbeoAFVdPedchPQ1gtUupyFBQzhfjWCqrTFfPyWag==
X-Received: by 2002:a62:1814:: with SMTP id 20mr16103501pfy.63.1588569069393; 
 Sun, 03 May 2020 22:11:09 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id v1sm7703535pfn.212.2020.05.03.22.11.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 May 2020 22:11:08 -0700 (PDT)
Date: Mon, 4 May 2020 10:41:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200504051107.edvfiqloegt3ak5o@vireshk-i7>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200430085742.1663-2-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430085742.1663-2-yangx.jy@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/pidfd_open*.c: Drop .min_kver flag
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

On 30-04-20, 16:57, Xiao Yang wrote:
> 1) Drop .min_kver flag directly because of two following reasons:
>    a) pidfd_open(2) may be backported to old kernel which is less
>       than v5.3 so kernel version check is meaningless.
>    b) tst_syscall() can report TCONF if pidfd_open(2) is not supported.
> 2) For pidfd_open03.c, check if pidfd_open(2) is not supported before
>    calling fork() and remove unnecessary TEST().
> 
> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> ---
>  .../kernel/syscalls/pidfd_open/pidfd_open01.c      |  1 -
>  .../kernel/syscalls/pidfd_open/pidfd_open02.c      |  1 -
>  .../kernel/syscalls/pidfd_open/pidfd_open03.c      | 14 +++++++++-----
>  3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
> index 293e93b63..983dcdccb 100644
> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
> @@ -32,6 +32,5 @@ static void run(void)
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
> index 48470e5e1..2fc3b3a5f 100644
> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
> @@ -27,11 +27,9 @@ static void run(void)
>  		exit(EXIT_SUCCESS);
>  	}
>  
> -	TEST(pidfd_open(pid, 0));
> -
> -	fd = TST_RET;
> +	fd = pidfd_open(pid, 0);
>  	if (fd == -1)
> -		tst_brk(TFAIL | TTERRNO, "pidfd_open() failed");
> +		tst_brk(TFAIL | TERRNO, "pidfd_open() failed");

Unrelated change, please drop it.

>  
>  	TST_CHECKPOINT_WAKE(0);
>  
> @@ -49,8 +47,14 @@ static void run(void)
>  		tst_res(TPASS, "pidfd_open() passed");
>  }
>  
> +static void setup(void)
> +{
> +	// Check if pidfd_open(2) is not supported
> +	tst_syscall(__NR_pidfd_open, -1, 0);
> +}
> +
>  static struct tst_test test = {
> -	.min_kver = "5.3",
> +	.setup = setup,
>  	.test_all = run,
>  	.forks_child = 1,
>  	.needs_checkpoints = 1,

Please have a look at fsopen_supported_by_kernel() in lapi/fsmount.h
and make such a helper.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
