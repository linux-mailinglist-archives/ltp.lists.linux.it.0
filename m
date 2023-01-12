Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FB8666796
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Jan 2023 01:23:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A49953CCAFE
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Jan 2023 01:23:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 62AC13CB55B
 for <ltp@lists.linux.it>; Thu, 12 Jan 2023 01:23:24 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A97BC2009D0
 for <ltp@lists.linux.it>; Thu, 12 Jan 2023 01:23:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D852573C;
 Thu, 12 Jan 2023 00:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1673483002;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aJXa4fL4ZNTgysdvAc64ch8s8ysLgeOKtbL8i+MVgFM=;
 b=f7R+N1AP9oSCxo52sV7/CU74e3tft3Q9HnlxY01p+D3UkGIALcDL1GXFb4AXDUmy0Nftds
 yT4OS6MjF9mKGcONO0pQ0dKJo3svoHhaOWSvkCZcnZ8NK+QMVDTXiIoim0hYAInrs9pLkR
 sLBRoBRoaw1OwrbpkjeL8WdOhHHonRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1673483002;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aJXa4fL4ZNTgysdvAc64ch8s8ysLgeOKtbL8i+MVgFM=;
 b=dA3Seu0HYnaXooebQIuBMT1q7kIXi94teDZF2sAMwdl7UtbtLEIqqdmm8ZEK4Kt2rDrUod
 tjtLrqxERv2UxfBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1997E13677;
 Thu, 12 Jan 2023 00:23:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j6OpA/pSv2N9LAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 12 Jan 2023 00:23:22 +0000
Date: Thu, 12 Jan 2023 01:23:20 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <Y79S+OcmLkTP5UfH@pevik>
References: <20230111132550.15587-1-akumar@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230111132550.15587-1-akumar@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setreuid04.c: Rewrite using new LTP API
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

Hi Avinesh,

> -/*
> - * Test that root can change the real and effective uid to an
> - * unpriviledged user.
> +/*\
> + * [Description]
> + *
> + * Verify that root user can change the real and effective uid to an
> + * unprivileged user.
>   */

> -struct test_data_t {
> +static struct tcase {
>  	uid_t *real_uid;
>  	uid_t *eff_uid;
> +	uid_t *exp_real_uid;
> +	uid_t *exp_eff_uid;
nit: eff looks really strange. I'd personally use euid and uid or euid and ruid.
But it's really a detail (no need to change this).

Thanks for a nice cleanup.

Reviewed-by: Petr Vorel <akumar@suse.de>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
