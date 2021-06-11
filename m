Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F53A43DF
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:15:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA2FF3C8E96
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:15:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 069783C75A0
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:15:25 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6D6701001750
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:15:25 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BE97A21A5C;
 Fri, 11 Jun 2021 14:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623420924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=meqeYP79zVmgPce+d4Z4ackGcWr4lE2KbEttvJksSjQ=;
 b=SNL6jCeFT5/BpUGRkb0Tzom3kc49SookaC8YP1QKSRPCFq+bVM/cPpVMlVFJtRhJ6zuIjr
 1R4Ce8YaOz77CL2JRXLGHZGArCwu35CFIUB9jWbucPZWoj6L7pQUEQgDkTwDnQqZ61NXCY
 lXsBA5wsZtpG+RBedtX0n6zvfjv9MHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623420924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=meqeYP79zVmgPce+d4Z4ackGcWr4lE2KbEttvJksSjQ=;
 b=qUDHEugsO8LdoXC0IT4RfCa1aapjDY4dRcgxeHL+rwLAPn3q3jpYyEUEANSRWMHU2xaHJY
 paCQ2OG9VoUwdTDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A8E14118DD;
 Fri, 11 Jun 2021 14:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623420924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=meqeYP79zVmgPce+d4Z4ackGcWr4lE2KbEttvJksSjQ=;
 b=SNL6jCeFT5/BpUGRkb0Tzom3kc49SookaC8YP1QKSRPCFq+bVM/cPpVMlVFJtRhJ6zuIjr
 1R4Ce8YaOz77CL2JRXLGHZGArCwu35CFIUB9jWbucPZWoj6L7pQUEQgDkTwDnQqZ61NXCY
 lXsBA5wsZtpG+RBedtX0n6zvfjv9MHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623420924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=meqeYP79zVmgPce+d4Z4ackGcWr4lE2KbEttvJksSjQ=;
 b=qUDHEugsO8LdoXC0IT4RfCa1aapjDY4dRcgxeHL+rwLAPn3q3jpYyEUEANSRWMHU2xaHJY
 paCQ2OG9VoUwdTDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id QHjeJ/xvw2AfcQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 11 Jun 2021 14:15:24 +0000
Date: Fri, 11 Jun 2021 15:49:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMNp8tAdF1usM1LM@yuki>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
 <20210609173601.29352-3-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609173601.29352-3-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 03/10] getrusage02: Convert getrusage02 to new
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
>  #ifndef RUSAGE_BOTH		/* Removed from user space on RHEL4 */
>  #define RUSAGE_BOTH (-2)	/* still works on SuSE      */
>  #endif /* so this is a work around */

This is used as invalid value here, so this whole part looks wrong.

Can we just place -2 in the testcases structure instead?

> -static void setup();
> -static void cleanup();
> -
> -char *TCID = "getrusage02";
> -
>  static struct rusage usage;
>  
>  struct test_cases_t {
> @@ -90,56 +33,25 @@ struct test_cases_t {
>  } test_cases[] = {
>  	{
>  	RUSAGE_BOTH, &usage, EINVAL},
> -#ifndef UCLINUX
>  	{
>  	RUSAGE_SELF, (struct rusage *)-1, EFAULT}
> -#endif
>  };
>  
> -int TST_TOTAL = ARRAY_SIZE(test_cases);
> -
> -int main(int ac, char **av)
> +static void verify_getrusage(unsigned int i)
>  {
> -
> -	int lc, i;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		for (i = 0; i < TST_TOTAL; i++) {
> -			TEST(getrusage(test_cases[i].who, test_cases[i].usage));
> -
> -			if (TEST_RETURN == -1 &&
> -			    TEST_ERRNO == test_cases[i].exp_errno)
> -				tst_resm(TPASS | TTERRNO,
> -					 "getrusage failed as expected");
> -			else
> -				tst_resm(TFAIL | TTERRNO,
> -					 "getrusage failed unexpectedly");
> -		}
> -	}
> -
> -	cleanup();
> -
> -	tst_exit();
> -
> +		TEST(getrusage(test_cases[i].who, test_cases[i].usage));
> +
> +		if (TST_RET == -1 &&
> +		    TST_ERR == test_cases[i].exp_errno)
> +			tst_res(TPASS | TTERRNO,
> +				"getrusage failed as expected");
> +		else
> +			tst_res(TFAIL | TTERRNO,
> +				"getrusage failed unexpectedly");

Here as well, can we please switch to TST_EXP_FAIL()?

>  }
>  
> -void setup(void)
> -{
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -}
> -
> -void cleanup(void)
> -{
> -
> -}
> +static struct tst_test test = {
> +	.test = verify_getrusage,
> +	.tcnt = ARRAY_SIZE(test_cases),
> +	.needs_root = 1,

Do we really need root for this test?

The original test works fine when executed as a user.

> +};
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
