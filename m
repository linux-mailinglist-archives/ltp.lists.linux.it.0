Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCicF0KbqWnFAwEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Mar 2026 16:03:30 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 357ED2141A3
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Mar 2026 16:03:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 290D53DB2CE
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2026 16:03:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D66F43CAF08
 for <ltp@lists.linux.it>; Thu,  5 Mar 2026 16:03:24 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 53CA2600045
 for <ltp@lists.linux.it>; Thu,  5 Mar 2026 16:03:24 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 662423F896;
 Thu,  5 Mar 2026 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772722999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AYSY8XXYPRbpr5mrPHo1VKTaK1kyJcg5xRY1KzzOb7Q=;
 b=0ISNO7jwAOIeGVDV3qHLgbSNivpp6knWnNcCL2Le2YxcrxHwCvAdetZGSrlhdcqUskc1gO
 iuClIyQ7FYjq6FkiAWtPVoHV7+R8+Unbo7nzgRbRhPO+J+1Lz/jd3SoFkvgqgQbIA1AJWt
 eIllmtHp0aavGqlxhlwWkPYxMdUAR38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772722999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AYSY8XXYPRbpr5mrPHo1VKTaK1kyJcg5xRY1KzzOb7Q=;
 b=dTh6xOsQTTTezRvqADv+Ue7py2mEy2h3J5bUH4IPgT8OSNRWr6CvPKtrYdpuXwkp2QDnmC
 9VpzD5E1Nn7UmaDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772722994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AYSY8XXYPRbpr5mrPHo1VKTaK1kyJcg5xRY1KzzOb7Q=;
 b=S1VIQ2YAW52Jg7Idg1gOm8MmFlH/g1NG3A7s5qCx5vUu3ezQkjORO+3i4UIJiAFsbXBsVV
 gbZFYYgQjQVkbBHQboCuje2GcQbKGxPoT/ZsqyrIgx5riAPX7MkAZW7B6/nkI/Me3OlltD
 9+queCDgg+9J5iQFesOGAdCh/4EmJ7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772722994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AYSY8XXYPRbpr5mrPHo1VKTaK1kyJcg5xRY1KzzOb7Q=;
 b=LF2Bj78+DXEb/K1bEdGEI4BJ1FrIUj7MXutGMMMFez3r5lUpa9GD9rYN2mrrOcdHRjafLG
 0d3Q7fb67pSOpRBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53D2F3EA68;
 Thu,  5 Mar 2026 15:03:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xW1zEzKbqWmZGgAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 05 Mar 2026 15:03:14 +0000
Date: Thu, 5 Mar 2026 16:03:24 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <aambPOCOw3eowGcp@yuki.lan>
References: <20260304-fork_refactoring-v2-0-016c47c90bc1@suse.com>
 <20260304-fork_refactoring-v2-2-016c47c90bc1@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304-fork_refactoring-v2-2-016c47c90bc1@suse.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 2/3] syscalls: refactor vfork01 using new API
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
X-Rspamd-Queue-Id: 357ED2141A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.458];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-]
X-Rspamd-Action: no action

Hi!
> -	/*
> -	 * Get the device number and the inode number of "." (current-
> -	 * working directory) for the parent process.
> -	 */
> -	if (stat(Pcwd, &Stat_cwd_Pbuf) < 0) {
> -		tst_brkm(TFAIL, cleanup, "stat(2) failed to get info. of "
> -			 "working directory in parent process");
> -	}
> +	if (p_cwd)
> +		free(p_cwd);

free(NULL) is no-op, the if () is not needed.

Otherwise:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
