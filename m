Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8F58A7F48
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Apr 2024 11:10:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BAB63CFB28
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Apr 2024 11:10:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E1C763CFAE9
 for <ltp@lists.linux.it>; Wed, 17 Apr 2024 11:10:04 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3D7B114060CB
 for <ltp@lists.linux.it>; Wed, 17 Apr 2024 11:10:03 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9EDF133A2F;
 Wed, 17 Apr 2024 09:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713345002;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NWLo7r3rdrd8TurBwJWvkULmBq73sC8e17dPkq0MBy8=;
 b=V2j2Tl6gMUk5piqQhyoz3OLqNob9UTPyzrjrYoaFJxG3i1PZ+xZ/Ax0dS4GZ1aDeqjboW8
 hFxi9xdAl1Tas5zqknqRi+NZcK/9hm71rYDYGglv4ZHDZCR5T/gKwrviMzUmqfNQcC0nmU
 mjWgmSG52QO3dLnxuzMcnDTb1lwDXMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713345002;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NWLo7r3rdrd8TurBwJWvkULmBq73sC8e17dPkq0MBy8=;
 b=iFgB6yX8ZOiD/KvHrn/RYVIxxmH5+ku5AKhDFGNlgw91nbuGYPCpAF/PFHI613T8cE/vtu
 7EXkbcwtnrcmFeAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=reeUFAfD;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=+LvmAgX4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713345001;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NWLo7r3rdrd8TurBwJWvkULmBq73sC8e17dPkq0MBy8=;
 b=reeUFAfDGDf0J8S08d/t32dpxwHMlyguVnSFsWUOr+Un9Pck1hAMOP09sa81oCJYeX8CTP
 7oLG3bsHB+xkXLoEqazyZX9DXkTZYH/4N9aUJBlbmJMIDNBGHjHJkQArtP4bOFF5D9Ylbr
 T+mLLqcsv2+N3uDxN1Kdhwd700kDs3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713345001;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NWLo7r3rdrd8TurBwJWvkULmBq73sC8e17dPkq0MBy8=;
 b=+LvmAgX4G5ZpNGr8pEyCml6O/OQDWmRuaEcsMaNomfLY8YS4EEVCjTq26LWrhPXbjd7rKX
 UgkoZs1XG2ESCGAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 895F713957;
 Wed, 17 Apr 2024 09:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZjmwIOmRH2aYUQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 17 Apr 2024 09:10:01 +0000
Date: Wed, 17 Apr 2024 11:10:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20240417091000.GA708026@pevik>
References: <20240417090222.707302-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240417090222.707302-1-pvorel@suse.cz>
X-Spam-Score: -3.71
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9EDF133A2F
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email,suse.cz:replyto,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] libswap: Change TWARN message to TINFO
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> This is hit on systems with 64kb page size (e.g. on aarch64 with
> CONFIG_ARM64_64K_PAGES=y or on ppc64le with CONFIG_PAGE_SIZE_64KB=y).
> Using TINFO causes test not "failing" with non-zero exit code.

Also, sometimes we use:
tst_res(TINFO, "WARNING: ...",
e.g. TWARN which would still keep the test exiting 0 (I know, i bit strange).

Maybe we would need some specific TWARN_NOFAIL, which would print as TWARN
(=> more visible) but test exit code would be 0.

Kind regards,
Petr

> Fixes: f987ffff5 ("libswap: add two methods to create swapfile")
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  libs/libltpswap/libswap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/libs/libltpswap/libswap.c b/libs/libltpswap/libswap.c
> index 313a15f24..6d4184ef9 100644
> --- a/libs/libltpswap/libswap.c
> +++ b/libs/libltpswap/libswap.c
> @@ -160,7 +160,7 @@ int make_swapfile_(const char *file, const int lineno,

>  	/* To guarantee at least one page can be swapped out */
>  	if (blk_size * blocks < pg_size) {
> -		tst_res(TWARN, "Swapfile size is less than the system page size. "
> +		tst_res(TINFO, "Swapfile size is less than the system page size. "
>  			"Using page size (%lu bytes) instead of block size (%lu bytes).",
>  			(unsigned long)pg_size, blk_size);
>  		blk_size = pg_size;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
