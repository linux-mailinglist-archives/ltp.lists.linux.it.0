Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7ED4A6C8A
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Feb 2022 08:56:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55D883C98AA
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Feb 2022 08:56:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DAB013C8DAA
 for <ltp@lists.linux.it>; Wed,  2 Feb 2022 08:56:50 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6659610005AF
 for <ltp@lists.linux.it>; Wed,  2 Feb 2022 08:56:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8257A1F380;
 Wed,  2 Feb 2022 07:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643788609;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aajBBszOkGHhpEyCZBPhONOO0eR8XiZlNPtkzJBwHIY=;
 b=WMR4hnvPPJIWaC41ktB4wYKAdWQtzDb873GB6CGZLRVo4XQxi2ui2GGPZ5XNcncnrF3fA4
 GzJxxzsCBepjAYzqK73WrEwJ5wDZcWdEBMusnpY+ThRbclttumLd2EmBugIDrX6XnBeg5h
 ziOjuPHqwsZzK5JuKkmOb8PJc38N6y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643788609;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aajBBszOkGHhpEyCZBPhONOO0eR8XiZlNPtkzJBwHIY=;
 b=nGqtceW1gtGKM1aNwo2VnyyiRTguUzueWM6NpQ/pdFjNd3z8E4lihaJ7XC8nIAwNf045ot
 Mg2xZXb7vOzLCMDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 563D713B92;
 Wed,  2 Feb 2022 07:56:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id srAhE0E5+mH1FgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 02 Feb 2022 07:56:49 +0000
Date: Wed, 2 Feb 2022 08:56:47 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <Yfo5P7ZZI33xz+6K@pevik>
References: <20220201142230.20243-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201142230.20243-1-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Extract libclone from
 testcases/kernel/containers
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Andrea,

[ Cc Richie, Li ]
https://lore.kernel.org/ltp/20220201142230.20243-1-andrea.cervesato@suse.de/

> libclone has been added to the libs folder and updated with the new
> LTP API. This library will be used by containers tests, which will be
> updated to the new LTP API as well.
I suppose you want to use it for containers (still use legacy API), which
already use it. I remember Richie not considering libclone.h as a good source
and suggesting to use SAFE_CLONE() for simple cases.

https://lore.kernel.org/ltp/878s7k59tk.fsf@suse.de/

We probably need some wrapper for containers, but we should recheck, whether
we want to take a different approach. Code in the functions is really a bit weird.

...
> +#ifndef SYS_unshare
> +#ifdef __NR_unshare
> +#define SYS_unshare __NR_unshare
> +#elif __i386__
> +#define SYS_unshare 310
> +#elif __ia64__
> +#define SYS_unshare 1296
> +#elif __x86_64__
> +#define SYS_unshare 272
> +#elif __s390x__ || __s390__
> +#define SYS_unshare 303
> +#elif __powerpc__
> +#define SYS_unshare 282
> +#else
> +#error "unshare not supported on this architecure."
> +#endif
> +#endif

nit: we usually put space before define for a readability.

#ifndef SYS_unshare
#ifdef __NR_unshare
# define SYS_unshare __NR_unshare
#elif __i386__
# define SYS_unshare 310
#elif __ia64__
# define SYS_unshare 1296
...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
