Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 697138C9FD0
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2024 17:39:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 266093CFF32
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2024 17:39:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C8C533CFCD7
 for <ltp@lists.linux.it>; Mon, 20 May 2024 17:39:12 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 94D991400070
 for <ltp@lists.linux.it>; Mon, 20 May 2024 17:39:11 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D12420E27;
 Mon, 20 May 2024 15:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1716219550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6sh4tYtfGbSqCtLO4F4rvqNJK2XdKIcYYs1mXd0GAaU=;
 b=YJyId0ceTthU7FghuT+9XfGSpu4WRp3phw6Us2yWbJU0v4cfYxDb+QOcnDsExESm0zmhiD
 OP5LYW9xlHu9wtT0wDAHTaFfTtEsdKp75KP4Tw58lC3Z0+J3U7sy+9670fHkCoesIQgFa6
 YeHgoywHKJRyeLCZoI+btklp6zigM30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1716219550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6sh4tYtfGbSqCtLO4F4rvqNJK2XdKIcYYs1mXd0GAaU=;
 b=ffQMK30BLwmVLr5lLq2/36JlqwZl2CdzlTiw+k7Gj50tHn33I/3VOuPlShSUfbyeFzIq8h
 Llrbh4exhYO8kODA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=YJyId0ce;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=ffQMK30B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1716219550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6sh4tYtfGbSqCtLO4F4rvqNJK2XdKIcYYs1mXd0GAaU=;
 b=YJyId0ceTthU7FghuT+9XfGSpu4WRp3phw6Us2yWbJU0v4cfYxDb+QOcnDsExESm0zmhiD
 OP5LYW9xlHu9wtT0wDAHTaFfTtEsdKp75KP4Tw58lC3Z0+J3U7sy+9670fHkCoesIQgFa6
 YeHgoywHKJRyeLCZoI+btklp6zigM30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1716219550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6sh4tYtfGbSqCtLO4F4rvqNJK2XdKIcYYs1mXd0GAaU=;
 b=ffQMK30BLwmVLr5lLq2/36JlqwZl2CdzlTiw+k7Gj50tHn33I/3VOuPlShSUfbyeFzIq8h
 Llrbh4exhYO8kODA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7DD7D13A6B;
 Mon, 20 May 2024 15:39:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NBKbHZ5uS2aNZAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 20 May 2024 15:39:10 +0000
Date: Mon, 20 May 2024 17:38:17 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Zktuab9EaIpC1qDe@yuki>
References: <20240516005558.253199-1-pvorel@suse.cz>
 <20240516005558.253199-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240516005558.253199-3-pvorel@suse.cz>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.77 / 50.00]; BAYES_HAM(-2.76)[98.94%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 8D12420E27
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.77
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/3] lib: Add .skip_in_32bit
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
> @@ -494,6 +497,7 @@ struct tst_ulimit_val {
>  	unsigned int skip_in_lockdown:1;
>  	unsigned int skip_in_secureboot:1;
>  	unsigned int skip_in_compat:1;
> +	unsigned int skip_in_32bit:1;

I was thinking about this and maybe it would make more sense to make
this more generic. If we ever need to add flags for a test to be skipped
on 64bit ABI we would have to add another flag. One example would be an
EOVERFLOW error from mmap() that can happen only on 32bit.

So maybe it would make sense to change this to be .needs_abi_bits and
the possible values would be 32 and 64.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
