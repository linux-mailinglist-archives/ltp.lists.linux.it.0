Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E0EF78D3
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 17:32:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E4663C2351
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 17:32:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9E4693C0FE7
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 17:31:58 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 71B40601E93
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 17:31:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7BB49ABF6;
 Mon, 11 Nov 2019 16:31:56 +0000 (UTC)
Date: Mon, 11 Nov 2019 17:31:50 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191111163144.GB16894@rei.lan>
References: <20191108142434.GA5913@rei>
 <1573462752-6679-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573462752-6679-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/prctl02: add more error tests
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
> +static const struct sock_fprog strict = {
> +	.len = (unsigned short)ARRAY_SIZE(strict_filter),
> +	.filter = (struct sock_filter *)strict_filter
> +};
> +
> +static const struct sock_fprog *strict_addr = &strict;

This should be:

static unsigned long strict_addr = (unsigned long)&strict;

> +static unsigned long bad_addr;
> +static unsigned long num_0;
> +static unsigned long num_1 = 1;
> +static unsigned long num_2 = 2;
> +static unsigned long num_invalid = 999;
>  
>  static struct tcase {
>  	int option;
> -	unsigned long arg2;
> +	unsigned long *arg2;
> +	unsigned long *arg3;
>  	int exp_errno;
>  } tcases[] = {
> -	{OPTION_INVALID, 0, EINVAL},
> -	{PR_SET_PDEATHSIG, INVALID_ARG, EINVAL},
> +	{OPTION_INVALID, &num_1, &num_0, EINVAL},
> +	{PR_SET_PDEATHSIG, &num_invalid, &num_0, EINVAL},
> +	{PR_SET_DUMPABLE, &num_2, &num_0, EINVAL},
> +	{PR_SET_NAME, &bad_addr, &num_0, EFAULT},
> +	{PR_SET_SECCOMP, &num_2, &bad_addr, EFAULT},
> +	{PR_SET_SECCOMP, &num_2, &strict_addr, EACCES},
> +	{PR_SET_TIMING, &num_1, &num_0, EINVAL},
> +#ifdef HAVE_DECL_PR_SET_NO_NEW_PRIVS
> +	{PR_SET_NO_NEW_PRIVS, &num_0, &num_0, EINVAL},
> +	{PR_SET_NO_NEW_PRIVS, &num_1, &num_0, EINVAL},
> +	{PR_GET_NO_NEW_PRIVS, &num_1, &num_0, EINVAL},
> +#endif
> +#ifdef HAVE_DECL_PR_SET_THP_DISABLE
> +	{PR_SET_THP_DISABLE, &num_0, &num_1, EINVAL},
> +	{PR_GET_THP_DISABLE, &num_1, &num_1, EINVAL},
> +#endif
> +#ifdef HAVE_DECL_PR_CAP_AMBIENT
> +	{PR_CAP_AMBIENT, &num_2, &num_1, EINVAL},
> +#endif
> +#ifdef HAVE_DECL_PR_GET_SPECULATION_CTRL
> +	{PR_GET_SPECULATION_CTRL, &num_1, &num_0, EINVAL},
> +#endif

Why the ifdefs, you have even added a fallback definitions into the lapi
header?

The usuall way how to deal with these is to:

1) Add fallback definitions to lapi
2) Ensure these tests does not fail on older kernels

   We do expect EINVAL in these cases anyways, which is what we would
   get if the prctl() option is unknown to the kernel anyways, so here
   we can just get rid of these ifdefs and things should work fine.

> +	{PR_SET_SECUREBITS, &num_0, &num_0, EPERM},
> +	{PR_CAPBSET_DROP, &num_1, &num_0, EPERM},
>  };
>  
>  static void verify_prctl(unsigned int n)
>  {
>  	struct tcase *tc = &tcases[n];
>  
> -	TEST(prctl(tc->option, tc->arg2));
> +	TEST(prctl(tc->option, *tc->arg2, *tc->arg3));
>  	if (TST_RET == 0) {
>  		tst_res(TFAIL, "prctl() succeeded unexpectedly");
>  		return;
>  	}
>  
>  	if (tc->exp_errno == TST_ERR) {
> -		tst_res(TPASS | TTERRNO, "prctl() failed as expected");
> +		tst_res(TPASS | TTERRNO, "prctl() %d failed as expected", tc->option);
>  	} else {
> -		tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
> +		if (tc->option == PR_SET_SECCOMP && TST_ERR == EINVAL)
> +			tst_res(TCONF, "current system was not built with CONFIG_SECCOMP.");
> +		else
> +			tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
>  				tst_strerrno(tc->exp_errno));
>  	}
>  }
>  
> +static void setup(void)
> +{
> +	bad_addr = (unsigned long)tst_get_bad_addr(NULL);
> +}
> +
>  static struct tst_test test = {
> +	.setup = setup,
>  	.tcnt = ARRAY_SIZE(tcases),
>  	.test = verify_prctl,
> +	.caps = (struct tst_cap []) {
> +		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
> +		TST_CAP(TST_CAP_DROP, CAP_SETPCAP),
> +		{}
> +	},
>  };
> -- 
> 2.18.0
> 
> 
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
