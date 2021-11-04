Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 472CD445B09
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 21:23:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE7D43C750D
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 21:23:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 951F83C7269
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 21:23:54 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E06AC200ADB
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 21:23:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 420CE218B2;
 Thu,  4 Nov 2021 20:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636057433;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TEAbTEAXNusmlQvVvekHF5W9wvoR3gu/PmsXtpenqaA=;
 b=D/C6Z/56UHzK1v2Odk7lKgIvdI4DRyovaAzzdc9hj9Auk8p4TJINtxswqQhcdUC/CPkrT+
 G1SFryUW3ovzjz9X14W1n3rhHVkdgH92EJR1JHhKEEphqCIztzlbFEKy3QfwcaF8UdZXgD
 +JbQly0wYg3GyZI2bN9nmWQyDpcLcA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636057433;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TEAbTEAXNusmlQvVvekHF5W9wvoR3gu/PmsXtpenqaA=;
 b=X+MUkVyJXQXP5ErY4VJT6KFi1b62fH3JLwYQfrrBt0qUbJeJj7NzvtMFxb7nOdGZME03hf
 Jc4jCqm4Z8p/cFDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0690113F9F;
 Thu,  4 Nov 2021 20:23:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DJZoO1hBhGE1bgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 04 Nov 2021 20:23:52 +0000
Date: Thu, 4 Nov 2021 21:23:50 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YYRBVuS+GunT5j9U@pevik>
References: <20211103120233.20728-1-chrubis@suse.cz>
 <20211103120233.20728-5-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103120233.20728-5-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/7] docparse: Implement ARRAY_SIZE()
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

Hi Cyril,

> Adds a special handlingn for ARRAY_SIZE() macro.
typo: s/handlingn/handling/

While code LGTM

Not related to this change (it's also in code in current master): return value
of parse_test_struct() is not used.

...
> +static void look_for_array_size(FILE *f, const char *arr_id, struct data_node **res)
> +{
> +	const char *token;
> +	char buf[2][2048] = {};
> +	int cur_buf = 0;
> +	int prev_buf = 1;
> +
> +	for (;;) {
> +		if (!(token = next_token2(f, buf[cur_buf], 2048, NULL)))
nit: there could be sizeof(buf[cur_buf]) instead of hardwiring 2048.

LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
