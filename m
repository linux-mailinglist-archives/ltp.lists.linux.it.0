Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E70860FCE
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Feb 2024 11:48:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3E283CF136
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Feb 2024 11:48:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ADA433CCD58
 for <ltp@lists.linux.it>; Fri, 23 Feb 2024 11:48:34 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 48C0C140E7A0
 for <ltp@lists.linux.it>; Fri, 23 Feb 2024 11:48:32 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2F3A01F802;
 Fri, 23 Feb 2024 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1708685312;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iyousnmzxeqIDm/qcNBARBfFX/bui4b2ci3Qmg52eBU=;
 b=JwQawpiGEf+FL2JyYUepgVARhZzPsCNHfGuzpGOsGCSoWlZC53NUqeCvPPZYdBsleilbav
 gg0I0L/+x0cqvzmDbJvmj/7zrG5LWFcRyLdhTwQcsAuAsCu7UFvWFqVEd9Jh8jpNh3tGKp
 CFC+JQQirE15ljljeRu1PmYGCk2U1Ys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1708685312;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iyousnmzxeqIDm/qcNBARBfFX/bui4b2ci3Qmg52eBU=;
 b=i04ePKlgmR/ycM1UaASI5Twe/gqeT8iq1Mmb27+a6rvszyJam2v9lrrZxfJInJ6kKOfa10
 GiJ543tLQbXhSFDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1708685312;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iyousnmzxeqIDm/qcNBARBfFX/bui4b2ci3Qmg52eBU=;
 b=JwQawpiGEf+FL2JyYUepgVARhZzPsCNHfGuzpGOsGCSoWlZC53NUqeCvPPZYdBsleilbav
 gg0I0L/+x0cqvzmDbJvmj/7zrG5LWFcRyLdhTwQcsAuAsCu7UFvWFqVEd9Jh8jpNh3tGKp
 CFC+JQQirE15ljljeRu1PmYGCk2U1Ys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1708685312;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iyousnmzxeqIDm/qcNBARBfFX/bui4b2ci3Qmg52eBU=;
 b=i04ePKlgmR/ycM1UaASI5Twe/gqeT8iq1Mmb27+a6rvszyJam2v9lrrZxfJInJ6kKOfa10
 GiJ543tLQbXhSFDQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0629B13419;
 Fri, 23 Feb 2024 10:48:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id ++ENAAB42GUUVQAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Fri, 23 Feb 2024 10:48:31 +0000
Date: Fri, 23 Feb 2024 11:48:30 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <20240223104830.GG1423688@pevik>
References: <20240220074218.13487-1-xuyang2018.jy@fujitsu.com>
 <20240220074218.13487-5-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220074218.13487-5-xuyang2018.jy@fujitsu.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.36
X-Spamd-Result: default: False [-2.36 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-1.86)[94.18%]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 5/7] swapon/Makefile: Remove useless section
 for MAX_SWAPFILES
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

Hi Yang Xu,

> It seems this section doesn't affect anything, btw it is useless,
> so remove it.

...
> +++ b/testcases/kernel/syscalls/swapon/Makefile
> @@ -1,11 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # Copyright (c) International Business Machines Corp., 2001

> -NEEDSPECIAL	:= $(shell echo MAX_SWAPFILES | $(CC) -E -xc -include linux/swap.h 2>/dev/null - | tail -n 1 | grep 32; echo $?)
> -ifneq ($(strip $(NEEDSPECIAL)),)
> -export CFLAGS	+= -DOLDER_DISTRO_RELEASE

Yeah, OLDER_DISTRO_RELEASE macro is not used at all.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
