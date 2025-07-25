Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6A2B11971
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jul 2025 09:59:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B2B53CCE3F
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jul 2025 09:59:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 388443C1E21
 for <ltp@lists.linux.it>; Fri, 25 Jul 2025 09:59:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 00AB61A0048F
 for <ltp@lists.linux.it>; Fri, 25 Jul 2025 09:59:51 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A10E2199D;
 Fri, 25 Jul 2025 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1753430390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ccTda8dvuQvj3HZ2wu6UUOIpSyHSPgfSvVG8liR9Tgc=;
 b=wP+2/SnJ97UZGIqDgToSPIWzweInv0wFzodNJMeVdd26/f1kDZIPknwPLmaICmbYCP2Z1z
 39AVSYaenVc2OHayG7IGc+U2cImDR0Ql2nQIJSL5d4IrXQ+lmkd7Pu+XhVGMd5unEDcuUr
 alxkejUeWUVpqFORd/h+BD7ND4l4lWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1753430390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ccTda8dvuQvj3HZ2wu6UUOIpSyHSPgfSvVG8liR9Tgc=;
 b=qr622hchP9sgplCZuG452KIDkyI+zRetOtP/d4VHoCD8OdZWNiZ/hSnjVRyHvcFg228iw8
 XJuEosR0gX42wQAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1753430390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ccTda8dvuQvj3HZ2wu6UUOIpSyHSPgfSvVG8liR9Tgc=;
 b=wP+2/SnJ97UZGIqDgToSPIWzweInv0wFzodNJMeVdd26/f1kDZIPknwPLmaICmbYCP2Z1z
 39AVSYaenVc2OHayG7IGc+U2cImDR0Ql2nQIJSL5d4IrXQ+lmkd7Pu+XhVGMd5unEDcuUr
 alxkejUeWUVpqFORd/h+BD7ND4l4lWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1753430390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ccTda8dvuQvj3HZ2wu6UUOIpSyHSPgfSvVG8liR9Tgc=;
 b=qr622hchP9sgplCZuG452KIDkyI+zRetOtP/d4VHoCD8OdZWNiZ/hSnjVRyHvcFg228iw8
 XJuEosR0gX42wQAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58A441373A;
 Fri, 25 Jul 2025 07:59:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FvVFFHY5g2ieVAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 25 Jul 2025 07:59:50 +0000
Date: Fri, 25 Jul 2025 10:00:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <aIM5op4uuHdee6Sy@yuki.lan>
References: <20250724190946.338828-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724190946.338828-1-petr.vorel@gmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; MISSING_XM_UA(0.00)[]; ARC_NA(0.00)[];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCPT_COUNT_FIVE(0.00)[5]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FREEMAIL_TO(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email]
X-Spam-Score: -2.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] tlibio: Restore uclibc-ng support
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

Hi!
> uclibc-ng does not implement <aio.h>. Requiring it for the core LTP
> library breaks the build. Restore unintentional removal in fed3e3ee63.

Can we instead of hardcoding UCLIBC add a proper configure check for the
aio.h header? That way it would work on any libc that does not include
aio.h...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
