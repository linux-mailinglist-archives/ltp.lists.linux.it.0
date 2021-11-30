Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA6C463610
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Nov 2021 15:06:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6A763C6F5D
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Nov 2021 15:06:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9CDBC3C5AF0
 for <ltp@lists.linux.it>; Tue, 30 Nov 2021 15:06:41 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C99F2600BF6
 for <ltp@lists.linux.it>; Tue, 30 Nov 2021 15:06:40 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 15C091FD58
 for <ltp@lists.linux.it>; Tue, 30 Nov 2021 14:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638281200;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=txcKdrUP1rxOw8A+P+E8YLZ2MthWSsIDupZ7DqvNKk0=;
 b=qrPBoKlktXI+veDRYT9z66DhYMKZ3oJ7ShekC+2sVzHF+5q8UkBzhymb7QQey8l78ZWXN/
 HZYj+yuRQn/669wAn4YvmtFHdw1SUUNO4IYrmiXzj+sf2Pm2n4QmqaSq1C7q6QQPGwrOvI
 i4EdTkz4id5UXJPwqMB3b4m+OyroMY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638281200;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=txcKdrUP1rxOw8A+P+E8YLZ2MthWSsIDupZ7DqvNKk0=;
 b=EDNLkJzQ/GaP8IHumyzHKtxrUJMwVe+FoyiXoUxdeW832nDaQ/D/hWSeoJPdu1ALttOvWs
 ErIwYQVIm2HMjPDQ==
Received: from g78 (rpalethorpe.udp.ovpn1.nue.suse.de [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D5530A3B87;
 Tue, 30 Nov 2021 14:06:39 +0000 (UTC)
References: <20211130114527.5942-1-chrubis@suse.cz>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 30 Nov 2021 13:56:47 +0000
In-reply-to: <20211130114527.5942-1-chrubis@suse.cz>
Message-ID: <87ilw9lour.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] sparse: Skip TCID and TST_TOTAL
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Since these are part of the old library API.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  tools/sparse/sparse-ltp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/sparse/sparse-ltp.c b/tools/sparse/sparse-ltp.c
> index b1677d336..1a3b4089a 100644
> --- a/tools/sparse/sparse-ltp.c
> +++ b/tools/sparse/sparse-ltp.c
> @@ -98,6 +98,9 @@ static void check_symbol_visibility(const struct symbol *const sym)
>  	if (!(mod & MOD_TOPLEVEL))
>  		return;
>  
> +	if (!strcmp(name, "TCID") || !strcmp(name, "TST_TOTAL"))
> +		return;

Would it be better to print a warning that old library crap has been
detected?

My expectation is that 'make check' will produce a lot of noise if ran
on tests which haven't even been converted to the new library. Also it's
possible someone may forget to remove TCID etc.

> +
>  	if (has_lib_prefix && (mod & MOD_STATIC) && !(mod & MOD_INLINE)) {
>  		warning(sym->pos,
>  			"LTP-003: Symbol '%s' has the LTP public library prefix, but is static (private).",
> -- 
> 2.32.0


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
