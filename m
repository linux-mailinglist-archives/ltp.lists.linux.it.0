Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP9aHuMMl2mTuAIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 14:15:15 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2FF15EF3E
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 14:15:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CC1D3D0767
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 14:15:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 902EE3C26C6
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 14:15:05 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0478C10007E3
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 14:15:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 237515BCC2;
 Thu, 19 Feb 2026 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771506904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y1hkiWb61sX8imBKRSpIMRjYCmI/YzHC8MTg5n/XlUI=;
 b=R+i/XPQ8BNp5qvIy9wYH4AVYFQHh5sUBuSoMJT706mlTs28Tcknhe+UhBPDhmykfJ75PR8
 JHfN58NUmCZkZ1Tp2ggCsntDdy7iuxFGTGAE10bpCn9qu+c8c2tOZ7mrO+0XLcv99aryhL
 /j623bFxvpJR5I1UbK4uznFVLqFX6dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771506904;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y1hkiWb61sX8imBKRSpIMRjYCmI/YzHC8MTg5n/XlUI=;
 b=iFtodyStbyP/gRO2fD7wiz8WD37js49nIIgjV5lbjxnUGY/NC+REVhLHxuHPf6XqeUfWhx
 LzXymZ9kujXvJtCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="R+i/XPQ8";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=iFtodySt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771506904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y1hkiWb61sX8imBKRSpIMRjYCmI/YzHC8MTg5n/XlUI=;
 b=R+i/XPQ8BNp5qvIy9wYH4AVYFQHh5sUBuSoMJT706mlTs28Tcknhe+UhBPDhmykfJ75PR8
 JHfN58NUmCZkZ1Tp2ggCsntDdy7iuxFGTGAE10bpCn9qu+c8c2tOZ7mrO+0XLcv99aryhL
 /j623bFxvpJR5I1UbK4uznFVLqFX6dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771506904;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y1hkiWb61sX8imBKRSpIMRjYCmI/YzHC8MTg5n/XlUI=;
 b=iFtodyStbyP/gRO2fD7wiz8WD37js49nIIgjV5lbjxnUGY/NC+REVhLHxuHPf6XqeUfWhx
 LzXymZ9kujXvJtCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 093D63EA65;
 Thu, 19 Feb 2026 13:15:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rzIZAdgMl2mhIQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 19 Feb 2026 13:15:04 +0000
Date: Thu, 19 Feb 2026 14:15:05 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <aZcM2fHSzZby7cpw@yuki.lan>
References: <20260218135026.159676-1-rbranco@suse.de>
 <DGIUIYEL9H07.TK6CF1O2WP7H@suse.com> <aZby3eA2UvAnpWzd@yuki.lan>
 <DGIWIUQKM6Y6.OPA1D526RIVV@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DGIWIUQKM6Y6.OPA1D526RIVV@suse.com>
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] userfaultfd: Add test using UFFDIO_POISON
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
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.cz:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,linux.it:url,checkpatch.pl:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 0F2FF15EF3E
X-Rspamd-Action: no action

Hi!
> > This one is wrong, volatile is correct for variables changed for syscall
> > handlers.
> 
> If this is wrong, we should verify checkpatch.pl configuration.

It's only correct in very special situations such as signal handlers. I
do not think that we can catch that with checkpatch.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
