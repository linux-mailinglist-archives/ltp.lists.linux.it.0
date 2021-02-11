Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A39BD318B28
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 13:50:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 517093C5DEA
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 13:50:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 602B33C1B8B
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 13:50:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 620511000360
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 13:50:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A99B7AD3E;
 Thu, 11 Feb 2021 12:50:27 +0000 (UTC)
Date: Thu, 11 Feb 2021 13:51:36 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YCUoWPHssRVkQ+vf@yuki.lan>
References: <20210211110317.31942-1-rpalethorpe@suse.com>
 <20210211110317.31942-5-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210211110317.31942-5-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] API: Add tst_clone
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

Hi!
> +	int flags;
> +	pid_t pid = -1;
> +
> +	tst_flush();
> +
> +	errno = ENOSYS;
> +	if (__NR_clone3 != __LTP__NR_INVALID_SYSCALL)
> +		pid = syscall(__NR_clone3, &args, sizeof(args));
> +
> +	if (pid == -1 && errno != ENOSYS)
> +		return -1;

As far as I can tell when kernel is too old we would get EINVAL because
the syscall number is not allocated. ENOSYS happens mostly when syscall
number is allocated and kernel does not implement the functionality,
e.g. it's disabled in .config.

I wonder if it's even menaningful to handle ENOSYS here, I doubt that
clone3() can be disabled, or do I miss something?

> +	if (pid != -1)
> +		return pid;
> +
> +	flags = args.exit_signal | args.flags;
> +
> +#ifdef __s390x__
> +	pid = syscall(__NR_clone, NULL, flags);
> +#else
> +	pid = syscall(__NR_clone, flags, NULL);
> +#endif
> +
> +	if (pid == -1)
> +		return -2;
> +
> +	return pid;
> +}
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 0714f0a0e..6bbee030b 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -424,6 +424,31 @@ pid_t safe_fork(const char *filename, unsigned int lineno)
>  	return pid;
>  }
>  
> +pid_t safe_clone(const char *file, const int lineno,
> +		 const struct tst_clone_args *args)
> +{
> +	pid_t pid;
> +
> +	if (!tst_test->forks_child)
> +		tst_brk(TBROK, "test.forks_child must be set!");
> +
> +	pid = tst_clone(args);
> +
> +	switch (pid) {
> +	case -1:
> +		tst_brk_(file, lineno, TBROK | TERRNO, "clone3 failed");
> +		break;
> +	case -2:
> +		tst_brk_(file, lineno, TBROK | TERRNO, "clone failed");
> +		return -1;
> +	}
> +
> +	if (!pid)
> +		atexit(tst_free_all);
> +
> +	return pid;
> +}
> +
>  static struct option {
>  	char *optstr;
>  	char *help;
> -- 
> 2.30.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
