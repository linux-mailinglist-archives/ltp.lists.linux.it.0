Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMtYG1t4mGlrJAMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 16:06:03 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4CD168AAF
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 16:06:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3ACB3D0D8C
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 16:06:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2B1B43CC797
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 16:05:50 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 518051400268
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 16:05:49 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 487963E6CD;
 Fri, 20 Feb 2026 15:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771599949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=78E47aa/f3UlyaJbCaN5xaMJ2huX8u9AFySFASkYEjM=;
 b=zrFstXnDhIk2g4tp9m8rXDwgiuNpsm0CW9bJ/bFdr4ytd7BBbE0a72Ve7Q49t+9DDG30NS
 WFl3W2y6M+EpqU9vQdjBD49w5KOBSgYioBjJnMuvuxtND+ovaQt638nPcus+SiqzTA51tW
 1XDrUJS4FqpCxUDnSaESzIq9vKezEFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771599949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=78E47aa/f3UlyaJbCaN5xaMJ2huX8u9AFySFASkYEjM=;
 b=XUoS/cZcw/8koEaWrfO53NAoNJdy9j2s17zh9XgMQ4kesEylFwNOX1k0NdXI6Kx0wh4ptu
 2zlELsZyzbnwicBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771599949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=78E47aa/f3UlyaJbCaN5xaMJ2huX8u9AFySFASkYEjM=;
 b=zrFstXnDhIk2g4tp9m8rXDwgiuNpsm0CW9bJ/bFdr4ytd7BBbE0a72Ve7Q49t+9DDG30NS
 WFl3W2y6M+EpqU9vQdjBD49w5KOBSgYioBjJnMuvuxtND+ovaQt638nPcus+SiqzTA51tW
 1XDrUJS4FqpCxUDnSaESzIq9vKezEFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771599949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=78E47aa/f3UlyaJbCaN5xaMJ2huX8u9AFySFASkYEjM=;
 b=XUoS/cZcw/8koEaWrfO53NAoNJdy9j2s17zh9XgMQ4kesEylFwNOX1k0NdXI6Kx0wh4ptu
 2zlELsZyzbnwicBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C3CA3EA65;
 Fri, 20 Feb 2026 15:05:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tVJ/CU14mGnQSQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 20 Feb 2026 15:05:49 +0000
Date: Fri, 20 Feb 2026 16:05:50 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jinseok Kim <always.starving0@gmail.com>
Message-ID: <aZh4Tsd1V2rlgoAn@yuki.lan>
References: <aZg64qwkB4tG18ZE@yuki.lan>
 <20260220140809.3981-1-always.starving0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260220140809.3981-1-always.starving0@gmail.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] inotify: cleanup - limit masks,
 use SAFE_ wrappers
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	DKIM_TRACE(0.00)[suse.cz:-];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: DA4CD168AAF
X-Rspamd-Action: no action

Hi!
> So does this mean IN_ALL_EVENTS is used (and should stay) in all test
> files, not just inotify01.c?

Yes, sorry for not being clear enough.

> If so, do the test files that are currently not using IN_ALL_EVENTS
> need to be updated to use it, or can they stay as-is?

That is completely different question. I would expect that tests that
actually test event filtering would set subset of the bits in the mask
and make sure events are filtered. This needs to be evaluated case by
case.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
