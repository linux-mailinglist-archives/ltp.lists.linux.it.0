Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9D4F132F
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Apr 2022 12:33:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 267CB3CA3E7
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Apr 2022 12:33:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 22EC03C8F8A
 for <ltp@lists.linux.it>; Mon,  4 Apr 2022 12:33:37 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E5B2320005E
 for <ltp@lists.linux.it>; Mon,  4 Apr 2022 12:33:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A582F210EF;
 Mon,  4 Apr 2022 10:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1649068415;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJgMz+ytdu4tbzE5KPxJaufQaQQUOR9/3LTvcXAkPsA=;
 b=Bc984qQZq/V+dgXZel0bDUBvxCspzhIaMTy0xs1SX2lLkuBlEqyuzEMkGFiSjlOjb7ujLC
 Mkmy1e20S5/gF0FMwL4vsBBCJi4nuWUgeu1rK8woyCKyKD+qBOKNLWtMGLHzxRonIFcEM9
 E6se9gMhsiLqvPwERGbdJzbclwLh6Fc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1649068415;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJgMz+ytdu4tbzE5KPxJaufQaQQUOR9/3LTvcXAkPsA=;
 b=RCHpn505xrE6s8V7Q3gpStbetSzyON2eESspJWAmndfRcn/07QJ7IqmmekgMUm7LRGEhMc
 5IUOKIHAnDM77yAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61ECA12FC5;
 Mon,  4 Apr 2022 10:33:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ujKAFX/JSmIBRgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 04 Apr 2022 10:33:35 +0000
Date: Mon, 4 Apr 2022 12:33:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <YkrJfb0vZq6WSZmX@pevik>
References: <20220401050804.1286-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220401050804.1286-1-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Rewrite userns06.c using new LTP API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Andrea,

BTW it'd help reviewers a bit if you include a changelog.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
TL;DR: TST_TEST_TCONF() in userns06_capcheck.c

> diff --git a/testcases/kernel/containers/userns/userns06_capcheck.c b/testcases/kernel/containers/userns/userns06_capcheck.c
...
> -/*
> - * Verify that:
> +/*\
> + * [Description]
> + *
>   * When a process with non-zero user IDs performs an execve(), the
>   * process's capability sets are cleared. When a process with zero
>   * user IDs performs an execve(), the process's capability sets
>   * are set.
>   */
nit: I wonder if we want to have docparse documentation in both userns06.c and
userns06_capcheck.c, they now look as 2 separate tests. Maybe describe
everything in userns06.c.

> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +#include "config.h"
> +
> +#ifdef HAVE_LIBCAP
...
> +	if (argc < 2)
> +		tst_brk(TBROK, "userns06_capcheck <privileged|unprivileged>");
> +
> +	tst_reinit();
I'm not sure if tst_reinit() shouldn't be called even before tst_brk(TBROK, ...).
> +
> +	SAFE_FILE_SCANF("/proc/sys/kernel/cap_last_cap", "%d", &last_cap);
> +
>  	if (strcmp("privileged", argv[1]))
>  		expected_flag = 0;
nit: It might help debugging to print argv[1] in TINF0.

>  	caps = cap_get_proc();
> -	SAFE_FILE_SCANF(NULL, "/proc/sys/kernel/cap_last_cap", "%d", &last_cap);
> +
>  	for (i = 0; i <= last_cap; i++) {
>  		cap_get_flag(caps, i, CAP_EFFECTIVE, &flag_val);
>  		if (flag_val != expected_flag)
>  			break;
> +
>  		cap_get_flag(caps, i, CAP_PERMITTED, &flag_val);
>  		if (flag_val != expected_flag)
>  			break;
>  	}

> -	if (flag_val != expected_flag) {
> -		printf("unexpected effective/permitted caps at %d\n", i);
> -		exit(1);
> -	}
> +	if (flag_val != expected_flag)
> +		tst_res(TFAIL, "unexpected effective/permitted caps at %d", i);
The flags are CAP_EFFECTIVE and CAP_PERMITTED only here, right?
(i.e. no CAP_INHERITABLE). Not sure how helpful would be to print here which
flag was the failing one.

> +	else
> +		tst_res(TPASS, "expected caps at %d", i);
> +}

>  #else
> -	printf("System is missing libcap.\n");
> -#endif
> -	tst_exit();
> +int main(void)
> +{
> +	tst_brk(TBROK, "System is missing libcap");
>  }
Why don't you also use TST_TEST_TCONF() here?
> +#endif

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
