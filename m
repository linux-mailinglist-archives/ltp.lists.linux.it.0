Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D93A3AB6DCB
	for <lists+linux-ltp@lfdr.de>; Wed, 14 May 2025 16:05:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A38133CC0DC
	for <lists+linux-ltp@lfdr.de>; Wed, 14 May 2025 16:05:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF8153CAEFB
 for <ltp@lists.linux.it>; Wed, 14 May 2025 16:05:40 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 81121600925
 for <ltp@lists.linux.it>; Wed, 14 May 2025 16:05:39 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE7301F7D4;
 Wed, 14 May 2025 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1747231536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZlIpCjDtfXeCaOWcRgFx/Q7e8kFIi9lcjnQ7Vrjs1OU=;
 b=bWDVto+xEIaRsO74J0d1wG69RoDxXo/3w2MZ9Cw4CNCMa6P2HKwPlUIWe40JmTUy4k03zl
 jHkDpBXZkFfMs+icO2E1m7r8+lh/MvjYM4CAiDveZi6kV8pIXmR3bsPG1WEMZvnRPzE2M2
 9+pDk7CapB0JBJbczru2SQFxrcCs3XY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1747231536;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZlIpCjDtfXeCaOWcRgFx/Q7e8kFIi9lcjnQ7Vrjs1OU=;
 b=z5Xs7/Nv2zVlTDQ2oeVZAU86M7C7l2ZtmibIN/FZybM4vBzqiaDy6g6sn22aw9MQYB+YPR
 4Mg7Vr7Hr4FBBNCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1747231536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZlIpCjDtfXeCaOWcRgFx/Q7e8kFIi9lcjnQ7Vrjs1OU=;
 b=bWDVto+xEIaRsO74J0d1wG69RoDxXo/3w2MZ9Cw4CNCMa6P2HKwPlUIWe40JmTUy4k03zl
 jHkDpBXZkFfMs+icO2E1m7r8+lh/MvjYM4CAiDveZi6kV8pIXmR3bsPG1WEMZvnRPzE2M2
 9+pDk7CapB0JBJbczru2SQFxrcCs3XY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1747231536;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZlIpCjDtfXeCaOWcRgFx/Q7e8kFIi9lcjnQ7Vrjs1OU=;
 b=z5Xs7/Nv2zVlTDQ2oeVZAU86M7C7l2ZtmibIN/FZybM4vBzqiaDy6g6sn22aw9MQYB+YPR
 4Mg7Vr7Hr4FBBNCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9407C13306;
 Wed, 14 May 2025 14:05:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BXEcIzCjJGgJDQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 14 May 2025 14:05:36 +0000
Date: Wed, 14 May 2025 16:06:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwan@redhat.com>
Message-ID: <aCSjU4JRMZZa-XdE@yuki.lan>
References: <08c85cf64d703dfaba31398ab9d9b480488fe338.1747227481.git.jstancek@redhat.com>
 <CAEemH2eK5S=xbr-guG9cQiah5CyjAFPpN3X3H+jfCXhF6hiamA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eK5S=xbr-guG9cQiah5CyjAFPpN3X3H+jfCXhF6hiamA@mail.gmail.com>
X-Spam-Score: -8.30
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MISSING_XM_UA(0.00)[]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] syscalls/mmap22: set also memory.swap.max
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
> Acked-by: Li Wang <liwang@redhat.com>
> 
> And I vote to merge this one before the LTP May release.

Yes please.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
