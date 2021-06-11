Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2673A43CD
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:07:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70B5D3C75DF
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:07:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A2E8E3C3089
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:07:31 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B7ADC100175C
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:07:30 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1BA811FD3F;
 Fri, 11 Jun 2021 14:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623420450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zak4eZLXcY4Buqz/4lBfMAFrl6nFMktVB+/TR80OmOk=;
 b=BuNmeE+S3YyvZU5sBeSTGLfH3PbqlwREAhQ8FH4YA3kWQax86jgDccl1mAToUqsC2OzHyA
 VEWZ4SloXdC0x8W8nSt7Z4qoTCoHKjf577g2U0vIBOkBJA3bJOUOt7H/pFnBllIeK1dlYX
 GdZk7uPl4CpiZOPdBqGQmXw9O7Yg2P8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623420450;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zak4eZLXcY4Buqz/4lBfMAFrl6nFMktVB+/TR80OmOk=;
 b=qmDfJqouUZ9spKUoM53qL28Gx7NzcfroaRAWXrdHWRxCTTV7dqbe5ifzCE874M0ACWpNfa
 2/UjoozCe++E9gCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 01CF8118DD;
 Fri, 11 Jun 2021 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623420450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zak4eZLXcY4Buqz/4lBfMAFrl6nFMktVB+/TR80OmOk=;
 b=BuNmeE+S3YyvZU5sBeSTGLfH3PbqlwREAhQ8FH4YA3kWQax86jgDccl1mAToUqsC2OzHyA
 VEWZ4SloXdC0x8W8nSt7Z4qoTCoHKjf577g2U0vIBOkBJA3bJOUOt7H/pFnBllIeK1dlYX
 GdZk7uPl4CpiZOPdBqGQmXw9O7Yg2P8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623420450;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zak4eZLXcY4Buqz/4lBfMAFrl6nFMktVB+/TR80OmOk=;
 b=qmDfJqouUZ9spKUoM53qL28Gx7NzcfroaRAWXrdHWRxCTTV7dqbe5ifzCE874M0ACWpNfa
 2/UjoozCe++E9gCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id P72pOiFuw2AsbQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 11 Jun 2021 14:07:29 +0000
Date: Fri, 11 Jun 2021 15:41:43 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMNoFyN89L6/VhP3@yuki>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609173601.29352-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 01/10] getitimer02 : Convert getitimer02 to new
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
>  		/* call with a bad address */
>  		TEST(getitimer(ITIMER_REAL, (struct itimerval *)-1));
>  

Can we please make use of TST_EXP_FAIL() here instead?

> -		if (TEST_RETURN == 0) {
> -			tst_resm(TFAIL, "call failed to produce "
> -				 "expected error - errno = %d - %s",
> -				 TEST_ERRNO, strerror(TEST_ERRNO));
> -			continue;
> +		if (TST_RET == 0) {
> +			tst_res(TFAIL, "call failed to produce "
> +				"expected error - errno = %d - %s",
> +				TST_ERR, strerror(TST_ERR));
>  		}
>  
> -		switch (TEST_ERRNO) {
> +		switch (TST_ERR) {
>  		case EFAULT:
> -			tst_resm(TPASS, "expected failure - errno = %d - %s",
> -				 TEST_ERRNO, strerror(TEST_ERRNO));
> +			tst_res(TPASS, "expected failure - errno = %d - %s",
> +				 TST_ERR, strerror(TST_ERR));
>  			break;
>  		default:
> -			tst_resm(TFAIL, "call failed to produce "
> -				 "expected error - errno = %d - %s",
> -				 TEST_ERRNO, strerror(TEST_ERRNO));
> +			tst_res(TFAIL, "call failed to produce "
> +					"expected error - errno = %d - %s",
> +					TST_ERR, strerror(TST_ERR));

And can we please have a proper indentation here from the start instead
of fixing that in subsequent patches?

> -#endif /* if !defined(UCLINUX) */
> +static struct tst_test test = {
> +			.test_all = verify_getitimer,
> +			.needs_root = 1,

And here as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
