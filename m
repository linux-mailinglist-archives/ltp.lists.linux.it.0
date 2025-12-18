Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C46CCC20B
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Dec 2025 14:55:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CB653CFBC9
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Dec 2025 14:55:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F3FB23CFB26
 for <ltp@lists.linux.it>; Thu, 18 Dec 2025 14:55:30 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 97A941000D2F
 for <ltp@lists.linux.it>; Thu, 18 Dec 2025 14:55:23 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0EFAB33724;
 Thu, 18 Dec 2025 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1766066122;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lyQ+aiRZa7XyUGHysH51JmiqBEGTaJ5KvOHHTQ59i4E=;
 b=qpLHx6vW6KU7jo+Y4lkuCkYLtHpdAmsfByfe2fYUQjyv1fQYKG02h7G1rM8EaeG7d97qF/
 KYxol8BlrDUpZvI39X4v9GrlZaVLxYRCkl2Fwf4f12OS5W0Tppbf+3iLgHcV2yi6mX9nty
 AhG9bqySAnRw7zOnSJs4UmDv/g5M+xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1766066122;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lyQ+aiRZa7XyUGHysH51JmiqBEGTaJ5KvOHHTQ59i4E=;
 b=GqTPE5oHu85rjCcxiymlJm/ldEI6c1A/anCQDqn9itqoFM2sYxlGGEzmp9syQAnX2Ymwm9
 tskSKMAR7r0uSlDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1766066121;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lyQ+aiRZa7XyUGHysH51JmiqBEGTaJ5KvOHHTQ59i4E=;
 b=mDFfkNkIgUqcF6icReZt/Z4UzFBRsbGuA6BaBoHxDyX8hPYarhnpopbjSq4fiBAbt2aX4u
 LEdofb3/xjKDpyiNFWo4a1e2ymTNBB0apl4J/tcfTLoSfXz7NMaPu27Z/fja4n3PHy6jJr
 3HdUYjfWttYXYENCwCMq0Nvae5VcCLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1766066121;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lyQ+aiRZa7XyUGHysH51JmiqBEGTaJ5KvOHHTQ59i4E=;
 b=YQ9FzDpsTDlcuI+eG9VkKbgoHUG9p2DCAR4eSQoSp8GY7bmcwn7OsEgm1k2U3d0o7qfdLl
 nq6lsxXiXwaR70DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFE5A3EA63;
 Thu, 18 Dec 2025 13:55:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oBP0LMgHRGkBCgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 18 Dec 2025 13:55:20 +0000
Date: Thu, 18 Dec 2025 14:55:15 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <20251218135515.GB98183@pevik>
References: <20251120161957.331580-1-pvorel@suse.cz>
 <DF1BK22BZF5P.1NEXGMJPZOFMH@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DF1BK22BZF5P.1NEXGMJPZOFMH@suse.com>
X-Spam-Score: -3.50
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.996]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[tst_loader.sh:url,suse.cz:replyto,imap1.dmz-prg2.suse.org:helo];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] tst_env.sh: Backport common functions from
 tst_test.sh
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

Hi Andrea,

> Hi!

> Is this still needed even if thermal test was rejected?

Yes, it's not needed now.

The fact we haven't needed ROD is that there is only vma05.sh which is using
tst_loader.sh.  Once we decide to rewrite at least some of LTP network tests to
shell loader (these will probably will not be converted to C) it will be needed.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
