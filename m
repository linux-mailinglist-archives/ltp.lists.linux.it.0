Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7473A43FC
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:23:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 070253C7623
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:23:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 649263C1976
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:22:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C5F7D1401751
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:22:58 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E52F1FD73;
 Fri, 11 Jun 2021 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623421378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jvgjft3HFZgMYtsq9GAn296ecK3IRV8o2Rs69Qtmn7Q=;
 b=VmKC/HKsvd09ntmxdTIVClIAoRGC5InqSqN3ojKALZyG9IEFFn9MW45prkLMV5oUOFislm
 RLhI6pKwjx9Uxba9uArw6UbOqT7+A1XyDlKogMOjLWQY+Rb1ASOFtfnj1K7qR78o2vyw7y
 TVvmSdOIYs7gS0/RKSMic7cVEsJ5014=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623421378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jvgjft3HFZgMYtsq9GAn296ecK3IRV8o2Rs69Qtmn7Q=;
 b=TH6TfGiCyzjv0vUePCQ8V1dzz4jPGTo8twpiWTc4CyvmWCWrjNwgRyEIEGQJsdL8aqDJqe
 tTcvDz1Blr8GuqBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 13EBF118DD;
 Fri, 11 Jun 2021 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623421378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jvgjft3HFZgMYtsq9GAn296ecK3IRV8o2Rs69Qtmn7Q=;
 b=VmKC/HKsvd09ntmxdTIVClIAoRGC5InqSqN3ojKALZyG9IEFFn9MW45prkLMV5oUOFislm
 RLhI6pKwjx9Uxba9uArw6UbOqT7+A1XyDlKogMOjLWQY+Rb1ASOFtfnj1K7qR78o2vyw7y
 TVvmSdOIYs7gS0/RKSMic7cVEsJ5014=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623421378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jvgjft3HFZgMYtsq9GAn296ecK3IRV8o2Rs69Qtmn7Q=;
 b=TH6TfGiCyzjv0vUePCQ8V1dzz4jPGTo8twpiWTc4CyvmWCWrjNwgRyEIEGQJsdL8aqDJqe
 tTcvDz1Blr8GuqBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id PTyCA8Jxw2AAdQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 11 Jun 2021 14:22:58 +0000
Date: Fri, 11 Jun 2021 15:57:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMNrt8TxrxhNjFPN@yuki>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
 <20210609173601.29352-5-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609173601.29352-5-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 05/10] setitimer02: Convert setitimer02 to new
 API
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +static void verify_setitimer(void)
>  {
> -	int lc;
>  	struct itimerval *value;
>  
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();		/* global setup */
> -
> -	/* The following loop checks looping state if -i option given */
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		/* reset tst_count in case we are looping */
> -		tst_count = 0;
> -
> -		/* allocate some space for a timer structure */
> -		if ((value = malloc((size_t)sizeof(struct itimerval))) ==
> -		    NULL) {
> -			tst_brkm(TBROK, cleanup, "value malloc failed");
> -		}
> -
> -		/* set up some reasonable values */
> -
> -		value->it_value.tv_sec = 30;
> -		value->it_value.tv_usec = 0;
> -		value->it_interval.tv_sec = 0;
> -		value->it_interval.tv_usec = 0;
> -		/*
> -		 * issue the system call with the TEST() macro
> -		 * ITIMER_REAL = 0, ITIMER_VIRTUAL = 1 and ITIMER_PROF = 2
> -		 */
> -
> -		/* call with a bad address */
> -		TEST(setitimer(ITIMER_REAL, value, (struct itimerval *)-1));
> -
> -		if (TEST_RETURN == 0) {
> -			tst_resm(TFAIL, "call failed to produce EFAULT error "
> -				 "- errno = %d - %s", TEST_ERRNO,
> -				 strerror(TEST_ERRNO));
> -			continue;
> -		}
> -
> -		switch (TEST_ERRNO) {
> -		case EFAULT:
> -			tst_resm(TPASS, "expected failure - errno = %d - %s",
> -				 TEST_ERRNO, strerror(TEST_ERRNO));
> -			break;
> -		default:
> -			tst_resm(TFAIL, "call failed to produce EFAULT error "
> -				 "- errno = %d - %s", TEST_ERRNO,
> -				 strerror(TEST_ERRNO));
> -		}
> -
> -		/*
> -		 * clean up things in case we are looping
> -		 */
> -		free(value);
> -		value = NULL;
> +	/* allocate some space for a timer structure */
> +	if ((value = malloc((size_t)sizeof(struct itimerval))) ==
> +		NULL) {
> +		tst_brk(TBROK, "value malloc failed");
>  	}

This should be allocated as a guarded buffer and initialized once in the
test setup, see:

https://github.com/linux-test-project/ltp/wiki/C-Test-API#131-guarded-buffers

> -	cleanup();
> -	tst_exit();
> -
> -}
> -
> -#else
> -
> -int main(void)
> -{
> -	tst_resm(TINFO, "test is not available on uClinux");
> -	tst_exit();
> -}
> -
> -#endif /* if !defined(UCLINUX) */
> -
> -/*
> - * setup() - performs all the ONE TIME setup for this test.
> - */
> -void setup(void)
> -{
> +	/* set up some reasonable values */
> +	value->it_value.tv_sec = 30;
> +	value->it_value.tv_usec = 0;
> +	value->it_interval.tv_sec = 0;
> +	value->it_interval.tv_usec = 0;
> +	/*
> +	 * issue the system call with the TEST() macro
> +	 * ITIMER_REAL = 0, ITIMER_VIRTUAL = 1 and ITIMER_PROF = 2
> +	 */
> +
> +	/* call with a bad address */
> +	TEST(setitimer(ITIMER_REAL, value, (struct itimerval *)-1));
> +
> +	if (TST_RET == 0) {
> +		tst_res(TFAIL, "call failed to produce EFAULT error "
> +			"- errno = %d - %s", TST_ERR,
> +			strerror(TST_ERR));
> +	}
>  
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> +	switch (TST_ERR) {
> +	case EFAULT:
> +		tst_res(TPASS, "expected failure - errno = %d - %s",
> +			TST_ERR, strerror(TST_ERR));
> +		break;
> +	default:
> +		tst_res(TFAIL, "call failed to produce EFAULT error "
> +			"- errno = %d - %s", TST_ERR,
> +			strerror(TST_ERR));
> +	}
>  
> -	TEST_PAUSE;
> +	/*
> +	 * clean up things in case we are looping
> +	 */
> +	free(value);
> +	value = NULL;

Here as well, we should switch to TST_EXP_FAIL()

>  }
>  
> -/*
> - * cleanup() - performs all the ONE TIME cleanup for this test at completion
> - * 	       or premature exit.
> - */
> -void cleanup(void)
> -{
> +static struct tst_test test = {
> +	.test_all = verify_setitimer,
> +	.needs_root = 1,

Here as well, no need for the root.

> +};
>  
> -}
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
