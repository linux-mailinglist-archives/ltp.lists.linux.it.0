Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C5C824B3E
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jan 2024 23:57:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12C593CE6DC
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jan 2024 23:57:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EDDA43CB8F4
 for <ltp@lists.linux.it>; Thu,  4 Jan 2024 23:57:23 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D88821000A12
 for <ltp@lists.linux.it>; Thu,  4 Jan 2024 23:57:22 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8F5221DFD;
 Thu,  4 Jan 2024 22:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1704409040;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GrvF3FDvG3v1SGaUxklSQzzGnnEk6nqdumZAqTfJWlg=;
 b=vhPKRGlmwnqINUoL2uyY8EwoeBA5W9i2uBeL7o9WQHavpavdeL/TXuhqu8d1vxxwMfuCKA
 2OqDjFfKEUbupDqTxrL0dVZlOyILQjxogggttEYP5Ee7cmD4ZfIGC9Yv/cbrVMxnqXcRFD
 LzDBOK4/vN0QBduhVL9dbj9xAHQGzIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1704409040;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GrvF3FDvG3v1SGaUxklSQzzGnnEk6nqdumZAqTfJWlg=;
 b=OxHNoLshXLaVdxAgaHsT3iXBUoVZ9B99Bjn6TxpFM1gczoaAe9iXdPf9qAXhgCLRTKwGGP
 susqU9gk6nLCgABg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1704409040;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GrvF3FDvG3v1SGaUxklSQzzGnnEk6nqdumZAqTfJWlg=;
 b=vhPKRGlmwnqINUoL2uyY8EwoeBA5W9i2uBeL7o9WQHavpavdeL/TXuhqu8d1vxxwMfuCKA
 2OqDjFfKEUbupDqTxrL0dVZlOyILQjxogggttEYP5Ee7cmD4ZfIGC9Yv/cbrVMxnqXcRFD
 LzDBOK4/vN0QBduhVL9dbj9xAHQGzIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1704409040;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GrvF3FDvG3v1SGaUxklSQzzGnnEk6nqdumZAqTfJWlg=;
 b=OxHNoLshXLaVdxAgaHsT3iXBUoVZ9B99Bjn6TxpFM1gczoaAe9iXdPf9qAXhgCLRTKwGGP
 susqU9gk6nLCgABg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4098137E8;
 Thu,  4 Jan 2024 22:57:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WNYYK9A3l2UTOgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 04 Jan 2024 22:57:20 +0000
Date: Thu, 4 Jan 2024 23:57:19 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20240104225719.GA1447350@pevik>
References: <20240103115700.14585-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240103115700.14585-1-chrubis@suse.cz>
X-Spam-Level: 
X-Spam-Level: 
X-Spam-Score: -0.46
X-Rspamd-Queue-Id: D8F5221DFD
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=vhPKRGlm;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=OxHNoLsh
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.46 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 REPLYTO_EQ_FROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 URIBL_BLOCKED(0.00)[suse.cz:dkim]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.cz:+]; RCPT_COUNT_TWO(0.00)[2];
 MX_GOOD(-0.01)[]; DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.75)[84.15%]
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: TST_EXP_FAIL: Add array variants
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

Hi Cyril,

I suppose this patchset is a preparation for splice07, right?

https://lore.kernel.org/ltp/20231024093320.wsusd5qtveqt64dt@quack3/

Hopefully we could merge this and tst_fd iterator API before the release.

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
