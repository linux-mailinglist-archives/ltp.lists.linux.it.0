Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7359947FD
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2024 14:04:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE3483C1B3A
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2024 14:04:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7875F3C19F3
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 14:04:14 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AB79B1000523
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 14:04:12 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C91E821B48;
 Tue,  8 Oct 2024 12:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1728389051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iYqIpsVHs0vd/C0w/dhRryzX1gd0xPOIogNft75jQ+8=;
 b=jDInvflvLeG8Mg4Au/VtDahlxc/DCE3skbzde6liFqeG7faxc/Orj0r14vimAjwem7YxGy
 RmXSSZA0/eiwc6LLyFOX49mZvWukTNxC+ajonWiUhsg2uEgg/TALEW+A9Q8sCzEURTrMA/
 kubl3ndwKOadyWydFS/BHdJhZncwRvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1728389051;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iYqIpsVHs0vd/C0w/dhRryzX1gd0xPOIogNft75jQ+8=;
 b=+39u2i2CuUY9kUUL86fw5rQGnpp5X2Z4FT9yuVib85qKfSdk/ZB75NLpCQUcWBzrpyTuX5
 iRDEzr0rCklIyRDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1728389051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iYqIpsVHs0vd/C0w/dhRryzX1gd0xPOIogNft75jQ+8=;
 b=jDInvflvLeG8Mg4Au/VtDahlxc/DCE3skbzde6liFqeG7faxc/Orj0r14vimAjwem7YxGy
 RmXSSZA0/eiwc6LLyFOX49mZvWukTNxC+ajonWiUhsg2uEgg/TALEW+A9Q8sCzEURTrMA/
 kubl3ndwKOadyWydFS/BHdJhZncwRvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1728389051;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iYqIpsVHs0vd/C0w/dhRryzX1gd0xPOIogNft75jQ+8=;
 b=+39u2i2CuUY9kUUL86fw5rQGnpp5X2Z4FT9yuVib85qKfSdk/ZB75NLpCQUcWBzrpyTuX5
 iRDEzr0rCklIyRDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA2F71340C;
 Tue,  8 Oct 2024 12:04:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 395XLLsfBWcUbQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 08 Oct 2024 12:04:11 +0000
Date: Tue, 8 Oct 2024 14:03:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <ZwUfe1rysrK2MfDi@yuki.lan>
References: <20241008-listmount_statmount-v5-0-66f4e1a9e7db@suse.com>
 <20241008-listmount_statmount-v5-11-66f4e1a9e7db@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241008-listmount_statmount-v5-11-66f4e1a9e7db@suse.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.990]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email]
X-Spam-Score: -8.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 11/16] Add statmount05 test
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
> +static void test_mount_root(void)
> +{
> +	tst_res(TINFO, "Testing STATMOUNT_MNT_ROOT");
> +
> +	char *last_root;
> +
> +	memset(st_mount, 0, SM_SIZE);
> +
> +	TST_EXP_PASS(statmount(root_id, STATMOUNT_MNT_ROOT, st_mount,
> +		SM_SIZE, 0));
> +
> +	if (!TST_PASS)
> +		return;
> +
> +	last_root = strrchr(mnt_root, '/');

Wouldn't last_root = strrchr(DIRA, '/') produce the same result?

I'm just wondering why MNT_ROOT is relative and MNT_POINT is absolute
here.

> +	TST_EXP_EQ_LI(st_mount->mask, STATMOUNT_MNT_ROOT);
> +	TST_EXP_EQ_STR(st_mount->str + st_mount->mnt_root, last_root);
> +}

Otherwise:
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
