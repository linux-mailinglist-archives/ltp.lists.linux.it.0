Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LP0GI/vkmkQ0QEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Feb 2026 11:21:03 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0353614249D
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Feb 2026 11:21:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B88D43D0523
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Feb 2026 11:21:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2B7823C7BB1
 for <ltp@lists.linux.it>; Mon, 16 Feb 2026 11:20:51 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8C48C1400776
 for <ltp@lists.linux.it>; Mon, 16 Feb 2026 11:20:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 959963E6D0;
 Mon, 16 Feb 2026 10:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771237249;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ljc7A3v0SG6MxJbbnyXE/bGkGpD8an5eUl+shBtLkB8=;
 b=dBk/Sgf6a+t5aHN3+j8G4TrJ5zbj71PapWh6eMyHt62Z0coSfGUn110R+pInofQL+AuJb0
 LLNEKdYfgWDWWuMLI1TqrXinIaB5d+se1SylgDmyqxudAnguLZIMzr6f0x5CfJDrKRszTf
 yp7KOleSeenUOavqUrnD/ZH/qFutTHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771237249;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ljc7A3v0SG6MxJbbnyXE/bGkGpD8an5eUl+shBtLkB8=;
 b=2s53HLWT+PjtgXmCri8UxjekP2OXeuGJm9dn8rjP+Ewhv38CifFOwDjI03rbmrd1LAnhzJ
 LCkZizowaHEDoiDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771237249;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ljc7A3v0SG6MxJbbnyXE/bGkGpD8an5eUl+shBtLkB8=;
 b=dBk/Sgf6a+t5aHN3+j8G4TrJ5zbj71PapWh6eMyHt62Z0coSfGUn110R+pInofQL+AuJb0
 LLNEKdYfgWDWWuMLI1TqrXinIaB5d+se1SylgDmyqxudAnguLZIMzr6f0x5CfJDrKRszTf
 yp7KOleSeenUOavqUrnD/ZH/qFutTHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771237249;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ljc7A3v0SG6MxJbbnyXE/bGkGpD8an5eUl+shBtLkB8=;
 b=2s53HLWT+PjtgXmCri8UxjekP2OXeuGJm9dn8rjP+Ewhv38CifFOwDjI03rbmrd1LAnhzJ
 LCkZizowaHEDoiDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 582013EA62;
 Mon, 16 Feb 2026 10:20:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9/PfE4HvkmkAMAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 16 Feb 2026 10:20:49 +0000
Date: Mon, 16 Feb 2026 11:20:39 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jinseok Kim <always.starving0@gmail.com>
Message-ID: <20260216102039.GB136260@pevik>
References: <20260214175237.13794-1-always.starving0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260214175237.13794-1-always.starving0@gmail.com>
X-Spam-Score: -3.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] inotify: cleanup - limit masks, use SAFE_ wrappers
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
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,picard.linux.it:helo,picard.linux.it:rdns];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_TRACE(0.00)[suse.cz:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 0353614249D
X-Rspamd-Action: no action

Hi Jinseok Kim,

> Replace IN_ALL_EVENTS with minimal relevant masks and manual read/write
> with SAFE_READ/SAFE_WRITE for better stability and consistency.

> inotify12.c intentionally unchanged: raw read() + manual EAGAIN handling
> is required to treat missing second event as IN_IGNORED (normal case).

...
> +++ b/testcases/kernel/syscalls/inotify/inotify07.c
> @@ -88,12 +88,7 @@ void verify_inotify(void)
>  	strcpy(event_set[test_cnt].name, FILE_NAME);
>  	test_cnt++;

> -	int len = read(fd_notify, event_buf, EVENT_BUF_LEN);
> -	if (len == -1 && errno != EAGAIN) {
> -		tst_brk(TBROK | TERRNO,
> -			"read(%d, buf, %zu) failed",
> -			fd_notify, EVENT_BUF_LEN);
> -	}
> +	int len = SAFE_READ(0, fd_notify, event_buf, EVENT_BUF_LEN);

I suppose this should be also kept unchanged (similar to inotify12.c).
Or any reason why to skip?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
