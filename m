Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2A57C6A76
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Oct 2023 12:08:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93C7F3CC14D
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Oct 2023 12:08:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7556D3C8882
 for <ltp@lists.linux.it>; Thu, 12 Oct 2023 12:08:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6C9101009BFA
 for <ltp@lists.linux.it>; Thu, 12 Oct 2023 12:08:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C2BB2185E;
 Thu, 12 Oct 2023 10:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1697105293;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kBtiiUxM50/ccVip0oiCk20K1lHboKVa5CB5IIJGnpg=;
 b=oA/2E4ChevdA4TVm3oci/juisnu3ZqEgYMLreEgFd1QlyhMh17fNPD33yxX6pw5xSxUzRV
 VwHzC61HmEzNpLcy9B2GC8kSHchB6/j3LRD1y78PdMm5bErsCA2tYh1j9/P2DQrfiYeTwt
 MMWhSGg9y9UUCmm+BiNtR2Tsl/Z8X8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1697105293;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kBtiiUxM50/ccVip0oiCk20K1lHboKVa5CB5IIJGnpg=;
 b=QiqAlz7dNQ3QpGtLZRvJyP5K+Pxpf9KgnMHBEQR8Hy0Dw950sFDJSjm1IJzwDNXzo0vm9b
 USS3JFziPkPU4jBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 651F9139F9;
 Thu, 12 Oct 2023 10:08:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 22d/F43FJ2WoBQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 12 Oct 2023 10:08:13 +0000
Date: Thu, 12 Oct 2023 12:08:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <20231012100812.GD618148@pevik>
References: <1697021709-22916-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1697021709-22916-2-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1697021709-22916-2-git-send-email-xuyang2018.jy@fujitsu.com>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.32
X-Spamd-Result: default: False [-3.32 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.02)[54.21%]
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] link05: Convert docs to docparse
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

Hi Xu,

> +++ b/testcases/kernel/syscalls/link/link05.c
> @@ -1,12 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
> - *  AUTHOR		: Richard Logan
> - *  CO-PILOT		: William Roske
> + * AUTHOR		: Richard Logan
> + * CO-PILOT		: William Roske
* Authors: Richard Logan, William Roske

>   * Copyright (c) 2014 Cyril Hrubis <chrubis@suse.cz>
* Copyright (c) Linux Test Project, 2001-2023

>   */

With this fixed:
Reviewed-by: Petr Vorel <pvorel@suse.cz>

> -/*
> +/*\
> + * [Description]
> + *
>   * Test if link(2) fails with EMLINK.
>   */

I was thinking how to cleanup test a bit. I don't like the loop
(SAFE_STAT(fname, &fbuf)). It could be simplified with putting
the loop into .tcnt = 1000, if (1000) (and put 1000 to #define).

Also it mixes tabs and spaces (visible in make check-link05,
spaces should be converted to tabs).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
