Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE2873AA7
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Mar 2024 16:27:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF5EC3CED0D
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Mar 2024 16:27:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A3883C2A69
 for <ltp@lists.linux.it>; Wed,  6 Mar 2024 16:27:49 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A7F31600B80
 for <ltp@lists.linux.it>; Wed,  6 Mar 2024 16:27:48 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98C852055C;
 Wed,  6 Mar 2024 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1709738867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0V8dp2lfuHN9zGbSzLY07kOL+9dGEW7/ZcBELXDjdeg=;
 b=cc1Y71r7rDikV5pQvfJJt8rsqvEuIrEdqEzzyvELQovUE4LO+nxsclF8QTh8LGSlmU6qcu
 f87kTGEIkH/9fUVr5ehQ3CFLMMrx/oTkGP/B1aZx1AgPPsNkb8Wl12B4dIORX0oMZAxA7Y
 b4w9F48TutV1hHORnXFmGNgv0TOs5m8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1709738867;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0V8dp2lfuHN9zGbSzLY07kOL+9dGEW7/ZcBELXDjdeg=;
 b=BdZcDctYbFiGEpylknLenX6cz72Rpk6rWJ+muQq9PGm0ALAitDVekwZ2/cgz/TyCP4HYIY
 E6bqDOjEHA8tgNBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1709738866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0V8dp2lfuHN9zGbSzLY07kOL+9dGEW7/ZcBELXDjdeg=;
 b=kjwlxczhO8pYBkgCSYbVrormpfa5mdgcWhj8Htb4etAf15EXVugxP8HmumhQOH75io7YMX
 MIbjNPBbDrk2uwOE8lCyOGW/XM+sMnw9P+wSPkF9nrYQES25RaCO86uJnlpDTFY5ECih6W
 iyDZN1vsLY8YALtkGqiD/nhWwGap+3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1709738866;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0V8dp2lfuHN9zGbSzLY07kOL+9dGEW7/ZcBELXDjdeg=;
 b=D1s97Aqde6j/Z4KuhwcMKxIERRwg10jRYYg8ir47LjYdeEgIDynKVSo0N4pWwNtHhCkzPc
 dN6Do4dJNTJom1Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86B3313A65;
 Wed,  6 Mar 2024 15:27:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aIO8H3KL6GUoVgAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 06 Mar 2024 15:27:46 +0000
Date: Wed, 6 Mar 2024 16:26:40 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Dennis Brendel <dbrendel@redhat.com>
Message-ID: <ZeiLMOR4rXMY7Sr4@yuki>
References: <20240306085254.534940-1-dbrendel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240306085254.534940-1-dbrendel@redhat.com>
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=kjwlxczh;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=D1s97Aqd
X-Spamd-Result: default: False [0.17 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.cz:+]; RCPT_COUNT_TWO(0.00)[2];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.02)[52.49%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 0.17
X-Rspamd-Queue-Id: 98C852055C
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] munlockall: add test case that verifies memory
 has been unlocked
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
> +/*\
> + * [Description]
> + *
> + * Verify that munlockall(2) unlocks all previously locked memory
> + */
>  
> -char *TCID = "munlockall01";
> -int TST_TOTAL = 1;
> +#include <sys/mman.h>
>  
> -#if !defined(UCLINUX)
> +#include "tst_test.h"
>  
> -int main(int ac, char **av)
> +static void verify_munlockall(void)
>  {
> -	int lc;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> +	unsigned long size = 0;
>  
> -	setup();
> +	SAFE_FILE_LINES_SCANF("/proc/self/status", "VmLck: %ld", &size);
>  
> -	/* check looping state */
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> +	if (size != 0UL)
> +		tst_brk(TBROK, "Locked memory after init should be 0 but is %ld", size);
>  
> -		tst_count = 0;
> +	if (mlockall(MCL_CURRENT | MCL_FUTURE) != 0)
> +		tst_brk(TBROK | TERRNO, "Could not lock memory using mlockall()");
>  
> -		TEST(munlockall());
> +	SAFE_FILE_LINES_SCANF("/proc/self/status", "VmLck: %ld", &size);
>  
> -		/* check return code */
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL | TTERRNO, "munlockall() Failed with"
> -				 " return=%ld", TEST_RETURN);
> -		} else {
> -			tst_resm(TPASS, "munlockall() passed with"
> -				 " return=%ld ", TEST_RETURN);
> +	if (size == 0UL)
> +		tst_brk(TBROK, "Locked memory after mlockall() should be greater than 0, "
> +			       "but is %ld", size);

This line can be shorter:

	tst_brk(TBROK, "After mlockall() locked memory should be >0");

We already checked that size is 0 so no need to print it.

> -		}
> -	}
> +	if (munlockall() != 0)
> +		tst_brk(TBROK | TERRNO, "Could not unlock memory using munlockall()");

We are testing the munlockall() syscall here so it would be better to
use the TST_EXP_PASS() macro.

> -	/* cleanup and exit */
> -	cleanup();
> -	tst_exit();
> +	SAFE_FILE_LINES_SCANF("/proc/self/status", "VmLck: %ld", &size);
>  
> +	if (size != 0UL)
> +		tst_res(TFAIL, "Locked memory after munlockall() should be 0 but is %ld", size);
> +
> +	else
> +		tst_res(TPASS, "Memory successfully locked and unlocked");
>  }
>  
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
> -/* setup() - performs all ONE TIME setup for this test. */
> -void setup(void)
> -{
> -	tst_require_root();
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -}
> -
> -/*
> - * cleanup() - performs all ONE TIME cleanup for this test at
> - *		completion or premature exit.
> - */
> -void cleanup(void)
> -{
> -}
> +static struct tst_test test = {
> +	.test_all = verify_munlockall,
> +};
> -- 
> 2.44.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
