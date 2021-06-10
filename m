Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 688033A2D04
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 15:29:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F270A3C7672
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 15:29:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BD0643C31AA
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 15:29:22 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1375F2011B2
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 15:29:21 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 637FE21A2C;
 Thu, 10 Jun 2021 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623331761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hqmquaXIDp5UrBHi8+beW23V51t3t9mnM2jb/fId8r0=;
 b=cNlDZDEZxlQw+UOp94OQyxalbsNCe1uIeyPwji49XHJJPmukgBwN/zPtbFK3go/fLhZikR
 Ulp94SQpHeg+bvIj1imkDK0V5L6lQCaqoVTdztAt3S+0H5LzNcoYsiITQWlI44pbrzzAtH
 FCRZ+t6Zz7gHjoP6JcA2Px40fMM6/PI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623331761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hqmquaXIDp5UrBHi8+beW23V51t3t9mnM2jb/fId8r0=;
 b=y8ehKQP+TLlq7budyibJKocwAsriMUoMcvFv7I02ZQOFoiiaSYQHG5G0Nod2lwHiPnwoJM
 zgG07KPex/3Fr+CA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4711F118DD;
 Thu, 10 Jun 2021 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623331761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hqmquaXIDp5UrBHi8+beW23V51t3t9mnM2jb/fId8r0=;
 b=cNlDZDEZxlQw+UOp94OQyxalbsNCe1uIeyPwji49XHJJPmukgBwN/zPtbFK3go/fLhZikR
 Ulp94SQpHeg+bvIj1imkDK0V5L6lQCaqoVTdztAt3S+0H5LzNcoYsiITQWlI44pbrzzAtH
 FCRZ+t6Zz7gHjoP6JcA2Px40fMM6/PI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623331761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hqmquaXIDp5UrBHi8+beW23V51t3t9mnM2jb/fId8r0=;
 b=y8ehKQP+TLlq7budyibJKocwAsriMUoMcvFv7I02ZQOFoiiaSYQHG5G0Nod2lwHiPnwoJM
 zgG07KPex/3Fr+CA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Yu4JELETwmCqQgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Thu, 10 Jun 2021 13:29:21 +0000
Date: Thu, 10 Jun 2021 15:03:33 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YMINpZkS4j3bhN9O@yuki>
References: <20210610125229.24140-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610125229.24140-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] newlib_tests: Fix build dependency on lib
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
> this fixes build error:
> 
> $ cd lib && make clean && cd newlib_tests && make
> ld: cannot find -lltp
> 
> Fixes: bbdb9f783 ("lib: Add new test library API")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  lib/newlib_tests/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/newlib_tests/Makefile b/lib/newlib_tests/Makefile
> index 30ca6810c..a263d7db5 100644
> --- a/lib/newlib_tests/Makefile
> +++ b/lib/newlib_tests/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  top_srcdir		?= ../..
>  
> -include $(top_srcdir)/include/mk/env_pre.mk
> +include $(top_srcdir)/include/mk/testcases.mk

Ah right, this adds dependency on the library and builds it if needed.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Btw the lib/tests/ subdirectory has the same problem, but I'm not sure
if we care enough to fix that...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
