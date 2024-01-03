Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5782294C
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jan 2024 09:05:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85D1E3CE769
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jan 2024 09:05:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 26AFA3C8928
 for <ltp@lists.linux.it>; Wed,  3 Jan 2024 09:05:14 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 68D031400E02
 for <ltp@lists.linux.it>; Wed,  3 Jan 2024 09:05:13 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6656A1F797;
 Wed,  3 Jan 2024 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1704269112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WGcbw3rvTR2Ld6aqvwwzw+7Jf0vakMAAY1hsseRN4hI=;
 b=UWH2dHaae2YV2l+ISYddx5ia8KxFgTnOBVikH1ttJWZZRv3k1Pmcnh3rMSBAegH+92XNs3
 XAhm7JnAD2OXtUupeZrq1R2m7yWl/s4qNPlZ1H1bYGzFwZmmbGxRABC5K7naQhzlFcEziZ
 Ph3GUFfHb3kFCrxDceiHFSBw935lPjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1704269112;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WGcbw3rvTR2Ld6aqvwwzw+7Jf0vakMAAY1hsseRN4hI=;
 b=4V4gpIFY+OAi9OzMAaSqyvqyhEotHnRZLzFlYo1Gk9qei84qhxPPwhj3UualCNHyxWNAvr
 fkdYkgGqJtX82bCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1704269111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WGcbw3rvTR2Ld6aqvwwzw+7Jf0vakMAAY1hsseRN4hI=;
 b=bxvUgOrzHpYruhYJ6lZuhoF76D4f/p+eps1jJZP/iVXIlNHK+Vka0ln7fbMUmrC7XHM2aH
 zwgQNWsIDs/Ucs+21mFIrhMOQWOOxckNAVGleiKpyJPsw8PIHzndBzc1Wmrk6u2GW76/AK
 fuWzJoTrF7YURG4FC0lPfinUVbGT/TM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1704269111;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WGcbw3rvTR2Ld6aqvwwzw+7Jf0vakMAAY1hsseRN4hI=;
 b=QyFt7WxICJF3AmaC4vPpBjw3AJRbpxu01LHc9JaVXfqSY7YBCbfqQYrX/OQ/lp4xOTtHzd
 V9/kf7AeZ3TG8ABA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53CCD1340C;
 Wed,  3 Jan 2024 08:05:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Z3FbEzcVlWUrWAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 03 Jan 2024 08:05:11 +0000
Date: Wed, 3 Jan 2024 09:04:26 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZZUVCr2AZ6clmYIl@rei>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <ZZUTsDX8bKPimLgD@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZUTsDX8bKPimLgD@rei>
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.88
X-Spamd-Result: default: False [-0.88 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[10];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.08)[63.86%]
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/36] Remove UCLINUX from LTP
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg Ungerer <gerg@linux-m68k.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > UCLINUX is broken in LTP and nobody really cares. Actually I dare to
> > say UCLINUX is dead. Therefore I prepared patchset to remove UCLINUX
> > from LTP. We have been actively removing UCLINUX from LTP during rewrite
> > tests to new LTP API. This removes the rest from the old tests (which
> > will be sooner or later rewritten to new API).
> > 
> > Because the patchset is quite big, I did not want to send it to mailing
> > lists (but I can do it if you want).
> 
> I agree that this should be done, but I'm not sure if we want to get
> this in before the January release. I guess that such change would be
> safer to merge just after the release so that we have a few months to
> actually catch possible problems.

Looking at the actuall changes it does not look awfuly complex, so maybe
we can try to merge it before the pre-release testing and hopefully
things will not break badly.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
