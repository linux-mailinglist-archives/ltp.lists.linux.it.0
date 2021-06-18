Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E52873ACA81
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 14:00:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8791A3C2C6B
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 14:00:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B79043C2308
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 14:00:26 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A79AC1A01548
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 14:00:25 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC0011FD8F;
 Fri, 18 Jun 2021 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624017624;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7VmdxI3TAmhYpDg9+F1FQE0NPHiO7vridY2uPkMiQgg=;
 b=1GM79Nmt1PTV2dhXGtI2qwpipiC0Fr+AkzFLjpiLLL8BanawtU0oVSXVPi2oZrWfuptUQ3
 2y067UGN/n6JOCNjpl+5Mee4R/gj1XjPP8tHzTgNu52z9klesxUU7+Ao8NHmgm7ElcFbK0
 fRcWded6XtkjTOJEs7kf0sChXIkF+ak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624017624;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7VmdxI3TAmhYpDg9+F1FQE0NPHiO7vridY2uPkMiQgg=;
 b=V591KjyoI58VIziGiNG+WmIVitgCdxHqq/SaX600GT0/rN/gA/6ovqmqgRdDYiGqKGfvr4
 sKxoFdZHol37GbAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 9DF8F118DD;
 Fri, 18 Jun 2021 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624017624;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7VmdxI3TAmhYpDg9+F1FQE0NPHiO7vridY2uPkMiQgg=;
 b=1GM79Nmt1PTV2dhXGtI2qwpipiC0Fr+AkzFLjpiLLL8BanawtU0oVSXVPi2oZrWfuptUQ3
 2y067UGN/n6JOCNjpl+5Mee4R/gj1XjPP8tHzTgNu52z9klesxUU7+Ao8NHmgm7ElcFbK0
 fRcWded6XtkjTOJEs7kf0sChXIkF+ak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624017624;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7VmdxI3TAmhYpDg9+F1FQE0NPHiO7vridY2uPkMiQgg=;
 b=V591KjyoI58VIziGiNG+WmIVitgCdxHqq/SaX600GT0/rN/gA/6ovqmqgRdDYiGqKGfvr4
 sKxoFdZHol37GbAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 975JJNiKzGAdCAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 18 Jun 2021 12:00:24 +0000
Date: Fri, 18 Jun 2021 14:00:23 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YMyK1/MluG2RHy+s@pevik>
References: <1623997931-18117-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623997931-18117-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Makefile: simplify code
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

Hi,

> When these target use CFLAGS or LDLIBS, they can be in one line instead of separate lines.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
