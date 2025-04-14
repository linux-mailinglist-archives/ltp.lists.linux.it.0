Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B53BA880D6
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Apr 2025 14:52:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F0703CB72B
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Apr 2025 14:52:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F2953C9EB0
 for <ltp@lists.linux.it>; Mon, 14 Apr 2025 14:51:58 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 96B2D200C19
 for <ltp@lists.linux.it>; Mon, 14 Apr 2025 14:51:57 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6ECE81F7B8;
 Mon, 14 Apr 2025 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1744635116;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D8/SvbmUWuDRpQcqTIyfAnv0D2hrv89dcZZuFWawjIg=;
 b=Td6T9OKtSZ4qRMnj6EdQYPLHQa+94TYnmXLJxCnbp6o4hhRdlnwYSezwYAuadc2q95lr/M
 11bv66iTgz8OxoEyqpbnMEYJthi7AQuxhE2rVkETg9JIplIOXP7vNF9Yjj8W56+OQjS5QW
 p3JmEW0dQwc1KVH76YiAfyB1mXAEcas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1744635116;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D8/SvbmUWuDRpQcqTIyfAnv0D2hrv89dcZZuFWawjIg=;
 b=8OygPQZ9gdU0NEQf+MBc6SHmwDRoj+zwazjPEnYnL2x8joWe2ath7gEV5l8eFb98CtuW38
 Z6AhX94fb3OF+sCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1744635116;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D8/SvbmUWuDRpQcqTIyfAnv0D2hrv89dcZZuFWawjIg=;
 b=Td6T9OKtSZ4qRMnj6EdQYPLHQa+94TYnmXLJxCnbp6o4hhRdlnwYSezwYAuadc2q95lr/M
 11bv66iTgz8OxoEyqpbnMEYJthi7AQuxhE2rVkETg9JIplIOXP7vNF9Yjj8W56+OQjS5QW
 p3JmEW0dQwc1KVH76YiAfyB1mXAEcas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1744635116;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D8/SvbmUWuDRpQcqTIyfAnv0D2hrv89dcZZuFWawjIg=;
 b=8OygPQZ9gdU0NEQf+MBc6SHmwDRoj+zwazjPEnYnL2x8joWe2ath7gEV5l8eFb98CtuW38
 Z6AhX94fb3OF+sCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DBB81336F;
 Mon, 14 Apr 2025 12:51:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hV9gEewE/WfdcAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 14 Apr 2025 12:51:56 +0000
Date: Mon, 14 Apr 2025 14:51:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <20250414125150.GA443040@pevik>
References: <20250411114326.526-1-andrea.cervesato@suse.de>
 <20250411114326.526-2-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411114326.526-2-andrea.cervesato@suse.de>
X-Spam-Score: -3.50
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 ARC_NA(0.00)[]; RCPT_COUNT_TWO(0.00)[2]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 1/4] ci: install dependences for patchwork-ci
 script
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

> +++ b/ci/debian.sh
> @@ -4,7 +4,7 @@

>  # workaround for missing oldstable-updates repository
>  # W: Failed to fetch http://deb.debian.org/debian/dists/oldstable-updates/main/binary-amd64/Packages
> -grep -v oldstable-updates /etc/apt/sources.list > /tmp/sources.list && mv /tmp/sources.list /etc/apt/sources.list
> +grep -v oldstable-updates /etc/apt/sources.list >/tmp/sources.list && mv /tmp/sources.list /etc/apt/sources.list

Could you please drop (before merge) this unrelated change? It's not necessary
nor related to the change.

>  apt update

> @@ -23,6 +23,8 @@ pkg_minimal="
>  	debhelper
>  	devscripts
>  	clang
> +	curl
> +	jq
>  	gcc
>  	git
>  	iproute2
> @@ -47,18 +49,18 @@ pkg_nonessential="
>  "

>  case "$ACTION" in
> -	minimal)
> -		echo "=== Installing only minimal dependencies ==="
> -		$install $pkg_minimal
> -		;;
> -	remove-nonessential)
> -		echo "=== Make sure devel libraries are removed ==="
> -		$remove $pkg_nonessential
> -		;;
> -	*)
> -		echo "=== Installing dependencies ==="
> -		$install $pkg_minimal $pkg_nonessential
> -		;;
> +minimal)
> +	echo "=== Installing only minimal dependencies ==="
> +	$install $pkg_minimal
> +	;;
> +remove-nonessential)
> +	echo "=== Make sure devel libraries are removed ==="
> +	$remove $pkg_nonessential
> +	;;
> +*)
> +	echo "=== Installing dependencies ==="
> +	$install $pkg_minimal $pkg_nonessential
> +	;;
Also this whitespace cleanup should not be part of the change.

With this fixed:
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
