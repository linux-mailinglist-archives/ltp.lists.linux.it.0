Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F99Av0zg2kwjAMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 12:56:45 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DA0E55DA
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 12:56:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D23C3CE10E
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Feb 2026 12:56:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D20473CACD1
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 12:56:41 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2DF006008F0
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 12:56:41 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78A323E705;
 Wed,  4 Feb 2026 11:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770206200;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SBgNc68nksvKSrv98nT1pTUOCKkBbzqQ+nqaSnfdGa4=;
 b=c0oYQFUR3R0vc5bWAajtWh9nVA9g3K3w+Ib7ko2EzaSHFyZxzcP3Z3TZg4PdK3vs/kelS0
 yphRd6h9eDVZl9xvvNKiSUIV2+I3Hz4aupwkym3fBK1UW8iG2A3k4iVtXl4IwklaoeJ61w
 Jen16ZxQu0lfEOrBJWWOXr6fPfFksys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770206200;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SBgNc68nksvKSrv98nT1pTUOCKkBbzqQ+nqaSnfdGa4=;
 b=bLVgJ1XT1QhztZIOuTTiJZi3VvuiVwGqgSTsP6+tRlCHS5g8EKTwwG66ZDN6F2sJBgFFv7
 HajVmPRRFPouidAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=c0oYQFUR;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=bLVgJ1XT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770206200;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SBgNc68nksvKSrv98nT1pTUOCKkBbzqQ+nqaSnfdGa4=;
 b=c0oYQFUR3R0vc5bWAajtWh9nVA9g3K3w+Ib7ko2EzaSHFyZxzcP3Z3TZg4PdK3vs/kelS0
 yphRd6h9eDVZl9xvvNKiSUIV2+I3Hz4aupwkym3fBK1UW8iG2A3k4iVtXl4IwklaoeJ61w
 Jen16ZxQu0lfEOrBJWWOXr6fPfFksys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770206200;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SBgNc68nksvKSrv98nT1pTUOCKkBbzqQ+nqaSnfdGa4=;
 b=bLVgJ1XT1QhztZIOuTTiJZi3VvuiVwGqgSTsP6+tRlCHS5g8EKTwwG66ZDN6F2sJBgFFv7
 HajVmPRRFPouidAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DF433EA63;
 Wed,  4 Feb 2026 11:56:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id t0yREfgzg2lqOQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 04 Feb 2026 11:56:40 +0000
Date: Wed, 4 Feb 2026 12:56:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20260204115638.GA224465@pevik>
References: <20260203094317.685385-1-vasileios.almpanis@virtuozzo.com>
 <DG596JIOEG2S.14PUR2IXLFTC5@suse.com> <aYMQ63RcLp5KdlVt@yuki.lan>
 <aYMXDMKoSJkRWUrE@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYMXDMKoSJkRWUrE@redhat.com>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] runltp: fix regex for disabled testcases
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
Cc: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>, ltp@lists.linux.it
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
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:replyto,ozlabs.org:url];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: A5DA0E55DA
X-Rspamd-Action: no action

> > Kirk has been stable for some time, I suppose that it's about the time
> > we finally remove runltp from LTP.

> +1

Very good point, patchset posted:
https://lore.kernel.org/ltp/20260204115339.224261-1-pvorel@suse.cz/T/#t
https://patchwork.ozlabs.org/project/ltp/list/?series=490958&state=*

Kind regards,
Petr

> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
