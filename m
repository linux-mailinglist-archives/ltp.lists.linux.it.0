Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOxAE3b8hWnUIwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 15:36:38 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D7877FF0DE
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 15:36:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04DB73CC89E
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Feb 2026 15:36:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E3A393CC816
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 15:36:26 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7958260076A
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 15:36:26 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2DA8E3E6D4;
 Fri,  6 Feb 2026 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770388585;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kT7Ll/h4LOFlZcL6naszhkDRxPoL+7Or41mhoC6rkZM=;
 b=nB2oC8jVTrycqwK6A7DdLiHMid4v2H0nA2vHAa1o6V3MVqlksulsi2MBe1UJwuKyPlY7pU
 TOtN10vY6QJmtFk7T8aXMyAS3aAkyqpfOUSiMTpwWDZWwT5TNeKPxEWRmtpAOQpLOpyCUh
 nkPS8UNJVINhbS8mmHnv69g6oi4ZcB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770388585;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kT7Ll/h4LOFlZcL6naszhkDRxPoL+7Or41mhoC6rkZM=;
 b=FD65yJBduKJQvYwz8PZ5NgXev0meXiLm5AJZvrJAh/5CdZy4dhV9mA9uHh27CmZ5IWJ0r5
 bx8b+g5vmoEFLNBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770388585;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kT7Ll/h4LOFlZcL6naszhkDRxPoL+7Or41mhoC6rkZM=;
 b=nB2oC8jVTrycqwK6A7DdLiHMid4v2H0nA2vHAa1o6V3MVqlksulsi2MBe1UJwuKyPlY7pU
 TOtN10vY6QJmtFk7T8aXMyAS3aAkyqpfOUSiMTpwWDZWwT5TNeKPxEWRmtpAOQpLOpyCUh
 nkPS8UNJVINhbS8mmHnv69g6oi4ZcB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770388585;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kT7Ll/h4LOFlZcL6naszhkDRxPoL+7Or41mhoC6rkZM=;
 b=FD65yJBduKJQvYwz8PZ5NgXev0meXiLm5AJZvrJAh/5CdZy4dhV9mA9uHh27CmZ5IWJ0r5
 bx8b+g5vmoEFLNBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8DF63EA63;
 Fri,  6 Feb 2026 14:36:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IZINJ2j8hWkjTAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 06 Feb 2026 14:36:24 +0000
Date: Fri, 6 Feb 2026 15:36:22 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
Message-ID: <20260206143622.GB402479@pevik>
References: <20260206125818.319190-1-vasileios.almpanis@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206125818.319190-1-vasileios.almpanis@virtuozzo.com>
X-Spam-Score: -7.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/2] pty: use correct protocol in pty04 based on
 line discipline
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,linux.it:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: D7877FF0DE
X-Rspamd-Action: no action

Hi Vasileios,

> Hi,

> during testing of the LTP pty test pty04, we observed intermittent
> failures caused by unexpected IPv6 packets being received.

> The test currently filters packets using ETH_P_ALL. As a result,
> packets with protocols other than the expected one (e.g. IPv6) may be
> received, leading to data corruption reports such as:

> TFAIL: Corrupt data (max 64 of 8191 bytes shown): data[0..64] =
> TFAIL: 60 00 00 00 00 24 00 01 00 00 00 00 00 00 00 00
> TFAIL: 00 00 00 00 00 00 00 00 ff 02 00 00 00 00 00 00
> TFAIL: 00 00 00 00 00 00 00 16 3a 00 05 02 00 00 01 00
> TFAIL: 8f 00 6e 8a 00 00 00 01 04 00 00 00 ff 02 00 00

nit: IMHO useful info, it'd be nice to have it in the commit itself (otherwise
it will be lost). But no need to repost.

Kind regards,
Petr

> This patch series addresses the issue by selecting the protocol based
> on the configured line discipline.

> Patch 1 adds a compatibility definition for ETH_P_CAN to the LAPI
> headers. Patch 2 updates pty04 to choose the appropriate protocol,
> avoiding reception of unrelated packets.

> Signed-off-by: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>

> Vasileios Almpanis (2):
>   add ETH_P_CAN compat macro to LAPI headers
>   pty04: use the correct protocol per line discipline to avoid extra
>     packets

>  include/lapi/if_ether.h      |  4 ++++
>  testcases/kernel/pty/pty04.c | 15 ++++++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
