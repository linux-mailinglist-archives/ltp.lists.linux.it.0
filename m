Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B46483FF8E
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jan 2024 09:03:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3D2E3CE11A
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jan 2024 09:03:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0367C3CE117
 for <ltp@lists.linux.it>; Mon, 29 Jan 2024 09:03:18 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 10F741001F29
 for <ltp@lists.linux.it>; Mon, 29 Jan 2024 09:03:17 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D0DBE1FCEE;
 Mon, 29 Jan 2024 08:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706515396;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zk0OwyQqiREQeB7mlAUBqdQaTGwWEHS+EUd+LlTynBM=;
 b=aUGT7qqTwqR53d6u59G+gOxpRum5fh1Za3O58/kz9FTnCEYeMHkX6z82JsZFPl0EYzhDNp
 ahK0bProYIyOQe0bVzX84qObvOS6znKBgm54Ll3Qx6Z7aPGrEqFgvOGVnTzLIOEPO4Ml9m
 XoWcNQvruR8fRZC0iIcl0DSjXPoHwk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706515396;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zk0OwyQqiREQeB7mlAUBqdQaTGwWEHS+EUd+LlTynBM=;
 b=uXEbSklL1WjrHjEViI5ayFN8ToAXXI1wI6eQSu+wsbygQHEY7Ih02XHdhbqKYFWW7TWaox
 5gyL51FvewdjXjBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706515396;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zk0OwyQqiREQeB7mlAUBqdQaTGwWEHS+EUd+LlTynBM=;
 b=aUGT7qqTwqR53d6u59G+gOxpRum5fh1Za3O58/kz9FTnCEYeMHkX6z82JsZFPl0EYzhDNp
 ahK0bProYIyOQe0bVzX84qObvOS6znKBgm54Ll3Qx6Z7aPGrEqFgvOGVnTzLIOEPO4Ml9m
 XoWcNQvruR8fRZC0iIcl0DSjXPoHwk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706515396;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zk0OwyQqiREQeB7mlAUBqdQaTGwWEHS+EUd+LlTynBM=;
 b=uXEbSklL1WjrHjEViI5ayFN8ToAXXI1wI6eQSu+wsbygQHEY7Ih02XHdhbqKYFWW7TWaox
 5gyL51FvewdjXjBQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B8077132FA;
 Mon, 29 Jan 2024 08:03:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id enIOK8Rbt2WXLwAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Mon, 29 Jan 2024 08:03:16 +0000
Date: Mon, 29 Jan 2024 09:03:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20240129080314.GA581064@pevik>
References: <20240128024838.2699248-1-liwang@redhat.com>
 <20240128024838.2699248-9-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240128024838.2699248-9-liwang@redhat.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-2.30 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
X-Spam-Score: -2.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 8/8] libswap: Refactor is_swap_supported
 function to return status
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

> This updates the is_swap_supported function in the libltpswap
> to return an integer status instead of void, allowing the function
> to communicate success or failure to the caller. It introduces
> checks and returns 0 on various failure conditions while logging
> the failure without aborting the test case.

> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  include/libswap.h         |  2 +-
>  libs/libltpswap/libswap.c | 28 ++++++++++++++++++----------
>  2 files changed, 19 insertions(+), 11 deletions(-)

> diff --git a/include/libswap.h b/include/libswap.h
> index e67d65756..1e09db031 100644
> --- a/include/libswap.h
> +++ b/include/libswap.h
> @@ -20,5 +20,5 @@ int make_swapfile(const char *swapfile, int blocks, int safe);
>   * Check swapon/swapoff support status of filesystems or files
>   * we are testing on.
>   */
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks for further improving it. Few comments to fix old issues, when we are at
it (and plan to merge after the release). But feel free to ignore.

BTW do you plan to use it somewhere?

testcases/kernel/syscalls/swapoff/swapoff01.c

nit: I would comment here the return code.
Also maybe use bool (from stdbool.h)? The advantage is that we don't think what
the return code is (sometimes we use syscalls approach when 0 is success,
otherwise - like here - 0 is failure). Slowly converting to bool would be the
best.

> -void is_swap_supported(const char *filename);
> +int is_swap_supported(const char *filename);
>  #endif /* __LIBSWAP_H__ */
> diff --git a/libs/libltpswap/libswap.c b/libs/libltpswap/libswap.c
> index 8aecad48d..14b7d9e3a 100644
> --- a/libs/libltpswap/libswap.c
> +++ b/libs/libltpswap/libswap.c
> @@ -168,7 +168,7 @@ int make_swapfile(const char *swapfile, int blocks, int safe)
>   * Check swapon/swapoff support status of filesystems or files
>   * we are testing on.
>   */
nit: Although I did not like doc being just at the header, I now prefer it now
to have it just at the header because we don't have to sync the same text on two
places.

Kind regards,
Petr

> -void is_swap_supported(const char *filename)
> +int is_swap_supported(const char *filename)
>  {
>  	int i, sw_support = 0;
>  	int ret = make_swapfile(filename, 10, 1);
...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
