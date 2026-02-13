Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIbhJXPwjmk5GAEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Feb 2026 10:35:47 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 460701348A9
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Feb 2026 10:35:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEE7F3CF7C8
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Feb 2026 10:35:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 04E133CF67C
 for <ltp@lists.linux.it>; Fri, 13 Feb 2026 10:35:36 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 61B0820097F
 for <ltp@lists.linux.it>; Fri, 13 Feb 2026 10:35:34 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8A6213E6D7;
 Fri, 13 Feb 2026 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770975333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zlDkK35DtBY17drznjj/ZH9stt2AhfeyFIosjNUZrGw=;
 b=SrR+scQ+RQ6n6Fe94OiP4USP9QFGi0ktX0XY7fmPOeTvdHh7kz13fJ1kyke8cT9Q7QjWK+
 94J5X62ZU80Em98rope7ynkRA7OnhKtpEAGpajDsGeDKvUMW/SzWsvo7TaXlvwZtFWRcl1
 x1tbQ5jOr6kQcs/LyzmjY48Yvnai83k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770975333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zlDkK35DtBY17drznjj/ZH9stt2AhfeyFIosjNUZrGw=;
 b=RQT2SYqJPatvMF00CeOTQc0dL9/YBKt5t+nJtndqmCZLYBP4cJAi2b0vuQtRFko8KjS/V7
 lS6UIPIILck8uTDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770975332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zlDkK35DtBY17drznjj/ZH9stt2AhfeyFIosjNUZrGw=;
 b=hxP6FrLxX24Ait7vKnw3lgRCigUFeBMbTDGhcI5MF/r9tC2BMgHvoxiERoyclGfi1xfC2q
 Gpeww8ewqakQ00e788MC25GDSdX/XkJx5xIgn3AZS/r5VeWWSBnh8IqvmU271IInOPWEPx
 WWCye01EP85iHPYLYvAUlsMICujL7rU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770975332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zlDkK35DtBY17drznjj/ZH9stt2AhfeyFIosjNUZrGw=;
 b=kh0DXS0J/ZxpHM1qMm3tmAvu2kG+6aPypxcEjhmcpxOmHCdyM3e904jKzZ8djkxhBY70DV
 9HPompKZ9J2jjQAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 708B33EA62;
 Fri, 13 Feb 2026 09:35:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jeg4GmTwjmlcRwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 13 Feb 2026 09:35:32 +0000
Date: Fri, 13 Feb 2026 10:35:35 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: kernel test robot <oliver.sang@intel.com>
Message-ID: <aY7wZwHXH2zS_Sj-@yuki.lan>
References: <202602122354.412c5e65-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202602122354.412c5e65-lkp@intel.com>
X-Spam-Score: -8.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [linux-next:master] [mount] 4f5ba37ddc: ltp.fsmount02.fail
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
Cc: Christian Brauner <brauner@kernel.org>, lkp@intel.com,
 linux-kernel@vger.kernel.org, oe-lkp@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yuki.lan:mid,suse.cz:email,linux.it:url];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_NA(0.00)[suse.cz];
	DKIM_TRACE(0.00)[suse.cz:-]
X-Rspamd-Queue-Id: 460701348A9
X-Rspamd-Action: no action

Hi!
> commit: 4f5ba37ddcdf5eaac2408178050183345d56b2d3 ("mount: add FSMOUNT_NAMESPACE")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

The relevant part of the log is:

fsmount02.c:56: TFAIL: invalid-flags: fsmount() succeeded unexpectedly (index: 1)

This is another case where new flag was added so the invalid flag value
is not invalid anymore. The test needs to be adjusted if/once the patch
hits mainline.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
