Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id a1X0I8YZk2lg1gEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Feb 2026 14:21:10 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2221E143C46
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Feb 2026 14:21:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4A113D0521
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Feb 2026 14:21:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D480D3CB91D
 for <ltp@lists.linux.it>; Mon, 16 Feb 2026 14:20:59 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 654C51A00272
 for <ltp@lists.linux.it>; Mon, 16 Feb 2026 14:20:59 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9F7173E8BE;
 Mon, 16 Feb 2026 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771248058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cXn1JrwSNt9ov8dPlPnT5/LwSYjBf9BwaOHGVkAyb/o=;
 b=C6wQ/EGthm+PNZ9dkLhwjItUNKAWspQF1cp3Qm/G8FrhcyuYutcMuxju9AkTJCfay3WXWC
 Rs9kWstZi7NkrL9aJMrEA4p2ISrlMaqfrxQJmNWZXza87AHmSBsKyE2rfv1L3Mei8AcOOS
 uKL5vAbq9swlVYHN6Jh3xdbQV4GNUsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771248058;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cXn1JrwSNt9ov8dPlPnT5/LwSYjBf9BwaOHGVkAyb/o=;
 b=rdn1oxqoKUrVwqHeaal4aQ4Z32M+2u+URbM2rBzXly8tqyi/odaHbn4dTerQBudod6nCjS
 TP3n9DBeJl7DjSAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771248058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cXn1JrwSNt9ov8dPlPnT5/LwSYjBf9BwaOHGVkAyb/o=;
 b=C6wQ/EGthm+PNZ9dkLhwjItUNKAWspQF1cp3Qm/G8FrhcyuYutcMuxju9AkTJCfay3WXWC
 Rs9kWstZi7NkrL9aJMrEA4p2ISrlMaqfrxQJmNWZXza87AHmSBsKyE2rfv1L3Mei8AcOOS
 uKL5vAbq9swlVYHN6Jh3xdbQV4GNUsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771248058;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cXn1JrwSNt9ov8dPlPnT5/LwSYjBf9BwaOHGVkAyb/o=;
 b=rdn1oxqoKUrVwqHeaal4aQ4Z32M+2u+URbM2rBzXly8tqyi/odaHbn4dTerQBudod6nCjS
 TP3n9DBeJl7DjSAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 355333EA62;
 Mon, 16 Feb 2026 13:20:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9x4FDboZk2lbZQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 16 Feb 2026 13:20:58 +0000
Date: Mon, 16 Feb 2026 14:20:55 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <aZMZt4FTvGNLsv6U@yuki.lan>
References: <20260127-fork_refactoring-v1-0-e3e21ff1a4f7@suse.com>
 <20260127-fork_refactoring-v1-3-e3e21ff1a4f7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260127-fork_refactoring-v1-3-e3e21ff1a4f7@suse.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 3/3] syscalls: refactor vfork02 using new API
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
Cc: Linux Test Project <ltp@lists.linux.it>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.cz:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-]
X-Rspamd-Queue-Id: 2221E143C46
X-Rspamd-Action: no action

Hi!
This is actually too fleshed out that it no longer does the test.

The original test actually set the SIGUSR1 to hold and then send the
signal to itself and also checked that it's pending in the test setup.
That is the part that is missing after the rewrite.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
