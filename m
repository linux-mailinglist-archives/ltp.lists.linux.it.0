Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDDtKPBHg2mMkwMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 14:21:52 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50808E6573
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 14:21:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E935F3CE0C8
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Feb 2026 14:21:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7B3413CA660
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 14:21:49 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E93E31000A2E
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 14:21:46 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC64E3E73B;
 Wed,  4 Feb 2026 13:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770211305;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0L2jo1FTVz8sKsreoP8mlxjapxRX04cT0Cu89u6eMWM=;
 b=MpwqNZswz1V/O1Nc/acNFYNeTUqOxZ6/lL8gx3YXExGlpD8Pi1SmT+emDRi93vwhMoOzdd
 3nVgJMQh2KeymU3lxIqkkNA2HdvOhy0v+wZOe5xz0Jrp75MNHQs90zQQ+i0fyxjnWKXfSF
 3lLWOQjemSRWMw2tyRBEVgys0ZJXia8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770211305;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0L2jo1FTVz8sKsreoP8mlxjapxRX04cT0Cu89u6eMWM=;
 b=5xI9FwQclIWFF3wf/qIJkVrOb+z9idoKMbx20xejrnWlUi4CDzsGdEcneJa8z0CDFIVfHY
 b6l7w8krJ7TqjxCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=MpwqNZsw;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=5xI9FwQc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770211305;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0L2jo1FTVz8sKsreoP8mlxjapxRX04cT0Cu89u6eMWM=;
 b=MpwqNZswz1V/O1Nc/acNFYNeTUqOxZ6/lL8gx3YXExGlpD8Pi1SmT+emDRi93vwhMoOzdd
 3nVgJMQh2KeymU3lxIqkkNA2HdvOhy0v+wZOe5xz0Jrp75MNHQs90zQQ+i0fyxjnWKXfSF
 3lLWOQjemSRWMw2tyRBEVgys0ZJXia8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770211305;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0L2jo1FTVz8sKsreoP8mlxjapxRX04cT0Cu89u6eMWM=;
 b=5xI9FwQclIWFF3wf/qIJkVrOb+z9idoKMbx20xejrnWlUi4CDzsGdEcneJa8z0CDFIVfHY
 b6l7w8krJ7TqjxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BBFD3EA63;
 Wed,  4 Feb 2026 13:21:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7GiRDelHg2mbfgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 04 Feb 2026 13:21:45 +0000
Date: Wed, 4 Feb 2026 14:21:43 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20260204132143.GA209672@pevik>
References: <20260204115339.224261-1-pvorel@suse.cz>
 <20260204115339.224261-4-pvorel@suse.cz>
 <aYNGgCJmEhv5nXYL@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYNGgCJmEhv5nXYL@redhat.com>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 3/4] runltp: Remove
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
 Tim Bird <Tim.Bird@sony.com>, Julien Olivain <ju.o@free.fr>,
 ltp@lists.linux.it, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,virtuozzo.com,sony.com,free.fr,lists.linux.it,lists.yoctoproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	DKIM_TRACE(0.00)[suse.cz:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 50808E6573
X-Rspamd-Action: no action

> Petr Vorel wrote:

> > It was replaced with kirk.

> > https://github.com/linux-test-project/kirk

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  Makefile |   2 +-
> >  runltp   | 959 -------------------------------------------------------

> Perhaps we could create a symbolic link in the root directory pointing
> to /tool/kirk/kirk-src/kirk?

> Otherwise, people might be confused because they can't find the LTP
> runner in the root dir.

We have /opt/ltp/kirk. Andrea suggested under 4th patch to symlink it to runltp, 
but it'd be good to modify it to print warning it's not runltp, but kirk. See:
https://lore.kernel.org/ltp/20260204124640.GA244528@pevik/

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
