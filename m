Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6223DA7E
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 14:55:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DA8F3C321C
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 14:55:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E37DF3C2334
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 14:55:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C66071A014F7
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 14:55:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E614ADA8;
 Thu,  6 Aug 2020 12:56:00 +0000 (UTC)
Date: Thu, 6 Aug 2020 14:56:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200806125603.GC3315@yuki.lan>
References: <ebc888947b095fd6a359ad749e50217d0b38954e.1596637728.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebc888947b095fd6a359ad749e50217d0b38954e.1596637728.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V8 1/2] syscalls/utimensat: Migrate to new test
 framework
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

Hi!
> +static void reset_time(char *pathname, int dfd, int flags)
> +{
> +	struct timespec ts[2];
> +	struct stat sb;
>  
> -		ts[1].tv_sec = atoi(argv[optind + 3]);
> -		if (argv[optind + 4][0] == 'n') {
> -			ts[1].tv_nsec = UTIME_NOW;
> -		} else if (argv[optind + 4][0] == 'o') {
> -			ts[1].tv_nsec = UTIME_OMIT;
> -		} else {
> -			ts[1].tv_nsec = atoi(argv[optind + 4]);
> -		}
> +	ts[0].tv_sec = 0;
> +	ts[0].tv_nsec = 0;
> +	ts[1].tv_sec = 0;
> +	ts[1].tv_nsec = 0;
>  
> -		tsp = ts;
> +	TEST(sys_utimensat(dfd, pathname, ts, flags));
> +	TEST(stat(pathname, &sb));

Wrapping the calls to TEST() macro here is useless.

Also we do pass libc timespec to a syscall that is supposed to take the
old kernel type, right?

I guess that the options are:

* Use the glibc function here instead

* Change the type in the follow up patch

> +	if (sb.st_atime || sb.st_mtime) {
> +		tst_res(TFAIL, "Failed to reset access and modification time (%lu: %lu)",
> +			sb.st_atime, sb.st_mtime);
>  	}
> +}

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
