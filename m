Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390E80C0B4
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Dec 2023 06:29:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E83E13C9DB1
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Dec 2023 06:29:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F19683C9611
 for <ltp@lists.linux.it>; Mon, 11 Dec 2023 06:28:50 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 20BAD60083B
 for <ltp@lists.linux.it>; Mon, 11 Dec 2023 06:28:49 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D2D21221CB;
 Mon, 11 Dec 2023 05:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1702272528;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oh9kHuMfbgGh9+YUaGeagHnzfGdum7HkareEZhMiN/8=;
 b=k3BgxXUEH80EG+iCVQNJxCiBwB5igJt92ovbPrhF0XYam50S8uZLER8FtwSyRiATUP+Wgs
 vPGxVYUU4VGRUZtbZ2BaV4l0yqvNHz1jDhFzsPXCYGsDlolJrvuvBt3/7dmQZwl/ZLteSh
 eMPZMy+WKV2MEQheRM9TidEBJiUt+OI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1702272528;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oh9kHuMfbgGh9+YUaGeagHnzfGdum7HkareEZhMiN/8=;
 b=8E16ddBquuKc8fTdx2CuZEa54nrQa/vnJMf97lgR88SEv7osNymnIHAHt2w9pY8Z3apMoT
 DvzL0Gklj4xhBkCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1702272528;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oh9kHuMfbgGh9+YUaGeagHnzfGdum7HkareEZhMiN/8=;
 b=k3BgxXUEH80EG+iCVQNJxCiBwB5igJt92ovbPrhF0XYam50S8uZLER8FtwSyRiATUP+Wgs
 vPGxVYUU4VGRUZtbZ2BaV4l0yqvNHz1jDhFzsPXCYGsDlolJrvuvBt3/7dmQZwl/ZLteSh
 eMPZMy+WKV2MEQheRM9TidEBJiUt+OI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1702272528;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oh9kHuMfbgGh9+YUaGeagHnzfGdum7HkareEZhMiN/8=;
 b=8E16ddBquuKc8fTdx2CuZEa54nrQa/vnJMf97lgR88SEv7osNymnIHAHt2w9pY8Z3apMoT
 DvzL0Gklj4xhBkCQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id AE148138FF;
 Mon, 11 Dec 2023 05:28:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 9DGPKRCedmWiaAAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Mon, 11 Dec 2023 05:28:48 +0000
Date: Mon, 11 Dec 2023 06:28:47 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20231211052847.GA439656@pevik>
References: <20231011160822.578637-1-pvorel@suse.cz>
 <20231011160822.578637-4-pvorel@suse.cz> <ZXM-KwDvvNOpm64O@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXM-KwDvvNOpm64O@yuki>
X-Spam-Score: 15.18
X-Spamd-Result: default: False [14.29 / 50.00];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 REPLYTO_EQ_FROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAM_FLAG(5.00)[]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 R_SPF_SOFTFAIL(4.60)[~all]; DMARC_NA(1.20)[suse.cz];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.cz:+]; MX_GOOD(-0.01)[];
 NEURAL_SPAM_LONG(3.50)[1.000]; NEURAL_SPAM_SHORT(3.00)[1.000];
 DWL_DNSWL_HI(-3.50)[suse.cz:dkim]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]
X-Spamd-Bar: ++++++++++++++
X-Rspamd-Server: rspamd1
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D2D21221CB
X-Spam-Score: 14.29
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=k3BgxXUE;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=8E16ddBq;
 spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of pvorel@suse.cz)
 smtp.mailfrom=pvorel@suse.cz; dmarc=none
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] libltpswap: TCONF on EPERM
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

commit merged, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
