Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F2476AD03D1
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Jun 2025 16:17:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 920CD3CA30A
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Jun 2025 16:17:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A54813C9B27
 for <ltp@lists.linux.it>; Fri,  6 Jun 2025 16:17:28 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E14C310009F3
 for <ltp@lists.linux.it>; Fri,  6 Jun 2025 16:17:27 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E112D336A1;
 Fri,  6 Jun 2025 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1749219447;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wvbydb60t7jQnWQvRLKVUUl/yiKc/Oz35+H28NTYhJo=;
 b=g3RPGRCl+M5XZODj3cMNcnJYvUeK3wozKtC3moHWx+5MXUucjPcnUDdUeboIQ0pkdZQyOb
 dL+pymDoYIWVYFE6D0JO8DCqJNini05+TP0yj785nLLxNdor7bMIqgY7u/vOkxOA5swe2k
 KV3V8relruF1ONtQjawE+c86LKjBY0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1749219447;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wvbydb60t7jQnWQvRLKVUUl/yiKc/Oz35+H28NTYhJo=;
 b=Pl/c3HtBvHb4URNCDbHXTiKn0jPXdW6ZcWIe11cNpsURD+qCBxCSnpX+g3sff7KMr1FpEt
 tpTqS20PtYjQJsAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=0L1JrODP;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=+78cTiop
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1749219446;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wvbydb60t7jQnWQvRLKVUUl/yiKc/Oz35+H28NTYhJo=;
 b=0L1JrODPjskycI8pSEY21T6Yi6RBAHAqgbhslg59JqrE3qkgVVgz+FfF74X+w7yDKr4F4o
 agSvtQpEAenEkBwQ2a6jR2q9h/C91RXERciyB7jX1xtVOCTirBMEzSzhW+Joa6xKi47VYE
 oxkVKBsWr2mr98AdMC9m0yZC9+ifCJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1749219446;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wvbydb60t7jQnWQvRLKVUUl/yiKc/Oz35+H28NTYhJo=;
 b=+78cTiopLBSOhRFIQe30A9cprTiwxnobLNaOImRaXAXI4K88OpiHr0//mCBKr3PmBboVIS
 0uN0toDmedHAn0AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99CAC1369F;
 Fri,  6 Jun 2025 14:17:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 522PIHb4Qmi0EgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 06 Jun 2025 14:17:26 +0000
Date: Fri, 6 Jun 2025 16:17:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20250606141725.GB1312985@pevik>
References: <20250606110541.220472-1-liwang@redhat.com>
 <20250606110541.220472-3-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606110541.220472-3-liwang@redhat.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E112D336A1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; REPLYTO_EQ_FROM(0.00)[];
 RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 3/3] lib: moves test infrastructure states into
 a shared context structure
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

Hi Li,

...
> +	if (context->tdebug)
> +		tst_res(TINFO, "tst_reinit(): restored metadata for PID %d", getpid());

nit: Could you please before merge remove "tst_reinit(): "? tst_res() prints it
itself, it'd be there twice.

		tst_res(TINFO, "restored metadata for PID %d", getpid());

Otherwise LGTM, thanks for your improvement!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
