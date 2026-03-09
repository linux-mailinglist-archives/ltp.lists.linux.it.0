Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP1sOWvDrmmRIgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Mar 2026 13:56:11 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE8A239432
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Mar 2026 13:56:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 939D73DD46D
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2026 13:56:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2921B3C4C11
 for <ltp@lists.linux.it>; Mon,  9 Mar 2026 13:56:06 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E925F600827
 for <ltp@lists.linux.it>; Mon,  9 Mar 2026 13:56:05 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 471DD4D218;
 Mon,  9 Mar 2026 12:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1773060964;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ndGW2T/BLpHXtHFlijrKPFNRu9rtyYWAOAcZOkQhkA=;
 b=bAUXJ+5TIEzccygc+7TNIs+KUncvrzZoOUMwmmVhDWaKqOZOIvS7ohc3Jt3pUCB++acWwN
 6hJ6soYKr18e4vM1HG4VHZK+mi385voE2RUC/j4uWzcrNjZK5Prk5AiSzkzVaG0tae1XFS
 6vEu3yN6TtBZFEz0pmfiVCsQ2RTuNdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1773060964;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ndGW2T/BLpHXtHFlijrKPFNRu9rtyYWAOAcZOkQhkA=;
 b=A6OUUvXe0lG+TPpdVLkR0lJt04zxXw2e6tSXk1XXXlrbDmbpZsccqy+zDiKDz1rGgDGR5O
 4sT0eHi9T3Agm5Cw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=bAUXJ+5T;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=A6OUUvXe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1773060964;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ndGW2T/BLpHXtHFlijrKPFNRu9rtyYWAOAcZOkQhkA=;
 b=bAUXJ+5TIEzccygc+7TNIs+KUncvrzZoOUMwmmVhDWaKqOZOIvS7ohc3Jt3pUCB++acWwN
 6hJ6soYKr18e4vM1HG4VHZK+mi385voE2RUC/j4uWzcrNjZK5Prk5AiSzkzVaG0tae1XFS
 6vEu3yN6TtBZFEz0pmfiVCsQ2RTuNdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1773060964;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ndGW2T/BLpHXtHFlijrKPFNRu9rtyYWAOAcZOkQhkA=;
 b=A6OUUvXe0lG+TPpdVLkR0lJt04zxXw2e6tSXk1XXXlrbDmbpZsccqy+zDiKDz1rGgDGR5O
 4sT0eHi9T3Agm5Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F21DB3EEE8;
 Mon,  9 Mar 2026 12:56:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JRb3OGPDrmnmYwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 09 Mar 2026 12:56:03 +0000
Date: Mon, 9 Mar 2026 13:56:02 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Kara <jack@suse.cz>
Message-ID: <20260309125602.GA13435@pevik>
References: <20260303105510.14305-1-mdoucha@suse.cz>
 <20260306121336.GA519430@pevik>
 <t4o7qgmw3rpcslrj7gmxsqg3ugk5kwoyis7lg4fwr42kf7sfn4@26l4i43m7zbc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <t4o7qgmw3rpcslrj7gmxsqg3ugk5kwoyis7lg4fwr42kf7sfn4@26l4i43m7zbc>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] fanotify25: Trace oom_kill_process() instead of
 load_module()
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
Cc: Amir Goldstein <amir73il@gmail.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 8EE8A239432
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,linux.it:url];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.it];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.218];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Hi all,

patch merged, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
