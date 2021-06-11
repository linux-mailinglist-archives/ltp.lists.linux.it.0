Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 880033A41C6
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 14:12:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAD903C8E9B
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 14:12:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 81E3D3C307A
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 14:12:26 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 994D02013D4
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 14:12:24 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 021011FD3F;
 Fri, 11 Jun 2021 12:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623413544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b8AnS2Ver1V4BW3AB2C2QtlPOMmoSb+AdTidr1MKLAc=;
 b=KclCEJSiOayl2QE6tNP7N/DEASOyMsrs0F2sy5P+60boqHq5X4YV5t0xdp2+Gd87zYN9iz
 wwYXZcPOJVNYbFOmmXM57Z6DyzfJBg49lehy9wYvMxGkZ5Q/LjEGSDrA+B3nSKtYhAz8AH
 cIjNeqRSFzdbuB6D90W1eKIAM/7lwgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623413544;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b8AnS2Ver1V4BW3AB2C2QtlPOMmoSb+AdTidr1MKLAc=;
 b=kBwS+RqecPT2X6dJPeAkY3Z0pGkBv1pAVWV4lJHxNExIUCwp2FK8QVXPYRtGItb/jKfFQK
 pDDBIZV4a+Mj9zCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D4A03118DD;
 Fri, 11 Jun 2021 12:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623413543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b8AnS2Ver1V4BW3AB2C2QtlPOMmoSb+AdTidr1MKLAc=;
 b=NriJPz0yzFpZB8UE7gw8e67lq/AMXXjh2Vr0y/x1798C1OW+bUIiWPe9NNt125VK7eNOI9
 xT+JeuQyfUTSMyuuWlmtl0p8Cz/pUrxYtcVPyQLI1YxwSf5wTN+Mz6O/GvTiIoOcseiRLd
 yfUMGTzj6sLlL6wJGvIaOXG/CboXa6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623413543;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b8AnS2Ver1V4BW3AB2C2QtlPOMmoSb+AdTidr1MKLAc=;
 b=syXJNDjFuH5MAQpefYIt2nAtd4kMHMCrwtUbZ9tG1PNDR+iGACIF0JyrgoZvET+j6h1H4B
 Dj74c9KRa6O3TKAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id LMmqMidTw2CvMwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 11 Jun 2021 12:12:23 +0000
Date: Fri, 11 Jun 2021 13:46:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMNNHVaIQZ84+lLS@yuki>
References: <20210602040423.9350-1-vinay.m.engg@gmail.com>
 <20210610050952.2862-1-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610050952.2862-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] adjtimex02.c: Skipped EFAULT tests for libc
 variant"
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
Cc: metan@ucw.cz, rwmacleod@gmail.com, umesh.kalappa0@gmail.com,
 ltp@lists.linux.it, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Tested EFAULT cases only for "__NR_adjtimex" syscall.
> 
> Tests for bad addresses in LTP cases trigger segment
> fault in libc on a 32bit system.
> 
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  .../kernel/syscalls/adjtimex/adjtimex02.c     | 226 ++++++++++++------
>  1 file changed, 152 insertions(+), 74 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/adjtimex/adjtimex02.c b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
> index 19ee97158..5eaea6352 100644
> --- a/testcases/kernel/syscalls/adjtimex/adjtimex02.c
> +++ b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
> @@ -10,115 +10,193 @@
>  #include <unistd.h>
>  #include <pwd.h>
>  #include "tst_test.h"
> +#include "lapi/syscalls.h"
>  
> -#define SET_MODE ( ADJ_OFFSET | ADJ_FREQUENCY | ADJ_MAXERROR | ADJ_ESTERROR | \
> -	ADJ_STATUS | ADJ_TIMECONST | ADJ_TICK )
> +#define SET_MODE (ADJ_OFFSET | ADJ_FREQUENCY | ADJ_MAXERROR | ADJ_ESTERROR | \
> +				ADJ_STATUS | ADJ_TIMECONST | ADJ_TICK)
>  
> -static int hz;			/* HZ from sysconf */
> -
> -static struct timex *tim_save;
> -static struct timex *buf;
> +static int hz;		/* HZ from sysconf */
>  
> +static struct timex *tim_save, *buf;
>  static struct passwd *ltpuser;
>  
> -static void verify_adjtimex(unsigned int nr)
> +struct test_case {
> +	unsigned int modes;
> +	long lowlimit;
> +	long highlimit;
> +	long delta;
> +	int exp_err;
> +};
> +
> +static int libc_adjtimex(void *timex)
>  {
> -	struct timex *bufp;
> -	int expected_errno = 0;
> +	return adjtimex(timex);
> +}

Do we need this indirection?

As long as we fix the prototype in the test_variants to have a proper
type for the function, i.e. the timex pointer is struct timex * instead
of void * we can store the libc function pointer directly to the variant
structure.

> -	/*
> -	 * since Linux 2.6.26, if buf.offset value is outside
> -	 * the acceptable range, it is simply normalized instead
> -	 * of letting the syscall fail. so just skip this test
> -	 * case.
> -	 */
> -	if (nr > 3 && (tst_kvercmp(2, 6, 25) > 0)) {
> -		tst_res(TCONF, "this kernel normalizes buf."
> -				"offset value if it is outside"
> -				" the acceptable range.");
> -		return;
> -	}
> +static int sys_adjtimex(void *timex)
                            ^
			    This should be struct timex *
> +{
> +	return tst_syscall(__NR_adjtimex, timex);
> +}
> +
> +static struct test_case tc[] = {
> +	{
> +	.modes = SET_MODE,
> +	.exp_err = EFAULT,
> +	},
> +	{
> +	.modes = ADJ_TICK,
> +	.lowlimit = 900000,
> +	.delta = 1,
> +	.exp_err = EINVAL,
> +	},
> +	{
> +	.modes = ADJ_TICK,
> +	.highlimit = 1100000,
> +	.delta = 1,
> +	.exp_err = EINVAL,
> +	},
> +	{
> +	.modes = ADJ_OFFSET,
> +	.highlimit = 512000L,
> +	.delta = 1,
> +	.exp_err = EINVAL,
> +	},
> +	{
> +	.modes = ADJ_OFFSET,
> +	.lowlimit = -512000L,
> +	.delta = -1,
> +	.exp_err = EINVAL,
> +	},
> +};
> +
> +static struct test_variants
> +{
> +	int (*adjtimex)(void *timex);
                        ^
			This should be struct timex * as well.
> +	char *desc;
> +} variants[] = {
> +	{ .adjtimex = libc_adjtimex, .desc = "libc adjtimex()"},
> +
> +#if (__NR_adjtimex != __LTP__NR_INVALID_SYSCALL)
> +	{ .adjtimex = sys_adjtimex,  .desc = "__NR_adjtimex syscall"},
> +#endif
> +};
> +
> +static void verify_adjtimex(unsigned int i)
> +{
> +	struct timex *bufp;
> +	struct test_variants *tv = &variants[tst_variant];
>  
>  	*buf = *tim_save;
>  	buf->modes = SET_MODE;
>  	bufp = buf;
> -	switch (nr) {
> -	case 0:
> -		bufp = (struct timex *)-1;
> -		expected_errno = EFAULT;
> -		break;
> -	case 1:
> -		buf->tick = 900000 / hz - 1;
> -		expected_errno = EINVAL;
> -		break;
> -	case 2:
> -		buf->tick = 1100000 / hz + 1;
> -		expected_errno = EINVAL;
> -		break;
> -	case 3:
> -		/* Switch to nobody user for correct error code collection */
> -		ltpuser = SAFE_GETPWNAM("nobody");
> -		SAFE_SETEUID(ltpuser->pw_uid);
> -		expected_errno = EPERM;
> -		break;
> -	case 4:
> -		buf->offset = 512000L + 1;
> -		expected_errno = EINVAL;
> -		break;
> -	case 5:
> -		buf->offset = (-1) * (512000L) - 1;
> -		expected_errno = EINVAL;
> -		break;
> -	default:
> -		tst_brk(TFAIL, "Invalid test case %u ", nr);
> +
> +	if (tc[i].exp_err == EINVAL) {
> +		if (tc[i].modes == ADJ_TICK) {
> +			if (tc[i].lowlimit)
> +				buf->tick = tc[i].lowlimit - tc[i].delta;
> +
> +			if (tc[i].highlimit)
> +				buf->tick = tc[i].highlimit + tc[i].delta;
> +		}
> +		if (tc[i].modes == ADJ_OFFSET) {
> +			if (tc[i].lowlimit) {
> +				tst_res(TCONF, "this kernel normalizes buf. offset value if it is outside the acceptable range.");
> +				return;
> +			}
> +			if (tc[i].highlimit) {
> +				tst_res(TCONF, "this kernel normalizes buf. offset value if it is outside the acceptable range.");
> +				return;
> +			}
> +		}
>  	}
>  
> -	TEST(adjtimex(bufp));
> -	if ((TST_RET == -1) && (TST_ERR == expected_errno)) {
> -		tst_res(TPASS | TTERRNO,
> -				"adjtimex() error %u ", expected_errno);
> -	} else {
> -		tst_res(TFAIL | TTERRNO,
> -				"Test Failed, adjtimex() returned %ld",
> -				TST_RET);
> +	if (tc[i].exp_err == EFAULT) {
> +		if (tv->adjtimex != libc_adjtimex) {
> +			bufp = (struct timex *) -1;
> +		} else {
> +			tst_res(TCONF, "EFAULT is skipped for libc variant");
> +			return;
> +		}
> +	}
> +
> +	TEST(tv->adjtimex(bufp));
> +
> +	if (tc[i].exp_err != TST_ERR) {
> +		tst_res(TFAIL | TTERRNO, "adjtimex(): expected %s mode %x",
> +					tst_strerrno(tc[i].exp_err), tc[i].modes);
> +		return;
>  	}

We should really use TST_EXP_FAIL() here instead.

> -	/* clean up after ourselves */
> -	if (nr == 3)
> -		SAFE_SETEUID(0);
> +	tst_res(TPASS, "adjtimex() error %s", tst_strerrno(tc[i].exp_err));
> +
>  }
>  
>  static void setup(void)
>  {
> +	struct test_variants *tv = &variants[tst_variant];
> +	size_t i;
> +	int expected_errno = 0;
> +
> +	tst_res(TINFO, "Testing variant: %s", tv->desc);
> +
>  	tim_save->modes = 0;
>  
> +	buf->modes = SET_MODE;
> +
> +	/* Switch to nobody user for correct error code collection */
> +	ltpuser = SAFE_GETPWNAM("nobody");
> +	SAFE_SETEUID(ltpuser->pw_uid);
> +	expected_errno = EPERM;
> +
> +	TEST(tv->adjtimex(buf));
> +
> +	if ((TST_RET == -1) && (TST_ERR == expected_errno)) {
> +		tst_res(TPASS, "adjtimex() error %s ",
> +				tst_strerrno(expected_errno));
> +	} else {
> +		tst_res(TFAIL | TTERRNO,
> +				"adjtimex(): returned %ld", TST_RET);
> +	}
> +
> +	SAFE_SETEUID(0);

What is this nonsense?

What is doing a test code in the test setup?

The only thing that should be done in the setup is to store the nobody
uid into a global variable.

The EPERM test should be done in the verify_adjtimex() function, we can
do something as:

	if (tc[i].exp_err == EPERM)
		SAFE_SETEUID(nobody_uid);


	/* do the actuall test */

	if (tc[i].exp_err == EPERM)
		SAFE_SETEUID(0);

>  	/* set the HZ from sysconf */
>  	hz = SAFE_SYSCONF(_SC_CLK_TCK);
>  
> -	/* Save current parameters */
> -	if ((adjtimex(tim_save)) == -1)
> +	for (i = 0; i < ARRAY_SIZE(tc); i++) {
> +		if (tc[i].modes == ADJ_TICK) {
> +			tc[i].highlimit /= hz;
> +			tc[i].lowlimit /= hz;
> +		}
> +	}
> +
> +	if ((adjtimex(tim_save)) == -1) {
>  		tst_brk(TBROK | TERRNO,
> -			"adjtimex(): failed to save current params");
> +		"adjtimex(): failed to save current params");
> +	}
>  }
>  
>  static void cleanup(void)
>  {
> +
>  	tim_save->modes = SET_MODE;
>  
> -	/* Restore saved parameters */
> -	if ((adjtimex(tim_save)) == -1)
> -		tst_res(TWARN, "Failed to restore saved parameters");
> +	if ((adjtimex(tim_save)) == -1) {
> +		tst_brk(TBROK | TERRNO,
> +		"adjtimex(): failed to save current params");
                                  ^
				  This was correct before the change, we
				  change the modes to SET_MODE so we
				  really restore the value here.
> +	}
>  }
>  
>  static struct tst_test test = {
> -	.needs_root = 1,
> -	.tcnt = 6,
> +	.test = verify_adjtimex,
>  	.setup = setup,
>  	.cleanup = cleanup,
> -	.test = verify_adjtimex,
> +	.tcnt = ARRAY_SIZE(tc),
> +	.test_variants = ARRAY_SIZE(variants),
> +	.needs_root = 1,
>  	.bufs = (struct tst_buffers []) {
> -		{&buf, .size = sizeof(*buf)},
> -		{&tim_save, .size = sizeof(*tim_save)},
> -		{},
> -	}
> +		 {&buf, .size = sizeof(*buf)},
> +		 {&tim_save, .size = sizeof(*tim_save)},
> +		 {},
> +		}
>  };
> -- 
> 2.17.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
