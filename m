Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE948986C
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jan 2022 13:18:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1BF33C9385
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jan 2022 13:18:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4B4623C07BA
 for <ltp@lists.linux.it>; Mon, 10 Jan 2022 13:18:29 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A1F432000DF
 for <ltp@lists.linux.it>; Mon, 10 Jan 2022 13:18:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D864B210EE;
 Mon, 10 Jan 2022 12:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1641817107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LstIyx6nbwXbPuQdC6qxFTFAd1kbPI8icRG2HJ3ri1k=;
 b=RdprpUvZdvuUa85wgZbVkp4gc8PoegiMBlq3HlIiI2ill/cvQhZXBFgHiYigccXYbJSyjx
 1lA8U2ptU+DDcpyticsm4yyFThsqrppQyJ6Xa5hlIZMvP1yxQdFeztYSB2lG1LxRyP2RNc
 F7yTKYuVQ2w7+BKGfrNWGSKqg4fPDh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1641817107;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LstIyx6nbwXbPuQdC6qxFTFAd1kbPI8icRG2HJ3ri1k=;
 b=M8ZJhgLdg7gUv+W5KkPwoNFmEPSqIvtUscpoeQNytZ0tPA3Vb4o6a1uhZECnQX0BXwwn2c
 Qb/Nnqs2c2YIxVBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB90313CCB;
 Mon, 10 Jan 2022 12:18:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 53kNLRMk3GEZDwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 10 Jan 2022 12:18:27 +0000
Date: Mon, 10 Jan 2022 13:20:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YdwkcurrWVngMWT4@yuki>
References: <YdbQmTJK73804UYT@yuki>
 <1641779349-8424-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1641779349-8424-2-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1641779349-8424-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/4] lib: Introduce KCONFIG_SKIP_CHECK
 environment variable
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
> This environment variable is designed to add kernel config check functionality
> switch. So we can skip kconfig check completely and it is useful especially
> for the embedded platforms that they don't have kernel config.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  doc/user-guide.txt |  1 +
>  lib/tst_kconfig.c  | 20 ++++++++++++++++++++
>  lib/tst_test.c     |  1 +
>  3 files changed, 22 insertions(+)
> 
> diff --git a/doc/user-guide.txt b/doc/user-guide.txt
> index 494652618..864467f60 100644
> --- a/doc/user-guide.txt
> +++ b/doc/user-guide.txt
> @@ -10,6 +10,7 @@ For running LTP network tests see `testcases/network/README.md`.
>  |==============================================================================
>  | 'KCONFIG_PATH'        | The path to the kernel config file, (if not set, it tries
>                            the usual paths '/boot/config-RELEASE' or '/proc/config.gz').
> +| 'KCONFIG_SKIP_CHECK'  | Skip kernel config check, the default is empty(don't skip).
                                                                           ^
									   Space
									   here
									   please
>  | 'LTPROOT'             | Prefix for installed LTP, the default is '/opt/ltp'.
>  | 'LTP_COLORIZE_OUTPUT' | Force colorized output behaviour. 'y' or '1': always colorize
>                            'n' or '0': never colorize.
> diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
> index 7d7aecfc1..e4264101d 100644
> --- a/lib/tst_kconfig.c
> +++ b/lib/tst_kconfig.c
> @@ -15,6 +15,16 @@
>  #include "tst_kconfig.h"
>  #include "tst_bool_expr.h"
>  
> +static int kconfig_check_skipped(void)
                       ^
		       I would have named this same as the variable,
		       i.e. kconfig_skip_check()

Other that these two minor things:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
