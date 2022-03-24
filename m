Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ED84E6A0E
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Mar 2022 21:55:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A7D53C1BC2
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Mar 2022 21:55:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A5A43C0358
 for <ltp@lists.linux.it>; Thu, 24 Mar 2022 21:55:46 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 25F9A1401118
 for <ltp@lists.linux.it>; Thu, 24 Mar 2022 21:55:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 352C8210F4;
 Thu, 24 Mar 2022 20:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648155345;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g11vGhB+12oMHqA5EJX/4voWgR+8lgtRN4ZShgkVZtM=;
 b=Pd505GI3b4igH2IAiwbbYzWrfxvJPlPGVdWBdIZxsRN+HQ71RWvLOn6aJLukCdKTV/D3w+
 NS72UMH+juhuqnJcL2+BKUxej1SOfTFyTxN7QQ6WxnKPUDaDHfcEC0Weps5pp0lSncWucb
 aBr5WUL6j5U9WtuuifUUWgh9yfqMY0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648155345;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g11vGhB+12oMHqA5EJX/4voWgR+8lgtRN4ZShgkVZtM=;
 b=kQy8CIsbnegcgLQP6sk5lxSsWsg7TDy0jJ6Zwr3gL48taaYYKM4GrlhtL/9Q1Y8tH3vC+r
 gth35jM4udjlbmDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A971132E9;
 Thu, 24 Mar 2022 20:55:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a0YGANHaPGKSIAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 24 Mar 2022 20:55:44 +0000
Date: Thu, 24 Mar 2022 21:55:43 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <Yjzaz/taJP7u+fTk@pevik>
References: <20220315122351.8556-1-andrea.cervesato@suse.de>
 <20220315122351.8556-5-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315122351.8556-5-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/8] Rewrite userns04.c using new LTP API
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

LGTM, thanks!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

>  testcases/kernel/containers/userns/userns04.c | 139 ++++++------------
..
> +#include <stdio.h>
> +#include <stdbool.h>
<stdbool.h> belongs to common.h.

> +#include "common.h"
> +#include "tst_test.h"
> +#include "lapi/syscalls.h"

...
> +static void run(void)
>  {
>  	pid_t cpid1, cpid2, cpid3;
>  	char path[BUFSIZ];
>  	int fd;
...
> +	cpid1 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD, (void *)child_fn1, NULL);
>  	if (cpid1 < 0)
> -		tst_brkm(TBROK | TERRNO, cleanup, "clone failed");
> +		tst_brk(TBROK | TTERRNO, "clone failed");
We could create SAFE_LTP_CLONE_QUICK() (as a separate effort).

> -	/* child 2 */
>  	sprintf(path, "/proc/%d/ns/user", cpid1);
> -	fd = SAFE_OPEN(cleanup, path, O_RDONLY, 0644);
> -	cpid2 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD,
> -		(void *)child_fn2, (void *)((long)fd));
> +
> +	fd = SAFE_OPEN(path, O_RDONLY, 0644);
> +	cpid2 = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD, (void *)child_fn2, (void *)((long)fd));
>  	if (cpid2 < 0)
> -		tst_brkm(TBROK | TERRNO, cleanup, "clone failed");
> +		tst_brk(TBROK | TTERRNO, "clone failed");
...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
