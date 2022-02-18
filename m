Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AED94BB2B3
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Feb 2022 07:50:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A7583CA0F3
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Feb 2022 07:50:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C44DE3C9893
 for <ltp@lists.linux.it>; Fri, 18 Feb 2022 07:50:30 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 433BF200239
 for <ltp@lists.linux.it>; Fri, 18 Feb 2022 07:50:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B1B0210F2;
 Fri, 18 Feb 2022 06:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645167029;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ws+xxMKEgNMx+rSNl1TkQFpWj9fgW8uaI/D71aBNhZM=;
 b=ng2J0Z77elowUUZfxbD9TBX4OqnpZgzZQuRxrbaUO8wNsP8qZbsaTL7xBfwMRpdN9+8OKt
 xHwQRjldWxQAylru2NbMKLte5H/hmb13bkV+92bUe8RqxAOGeYyepUfiBLcXTez2syzxDI
 hYq2dkAxryGDdHH77ATIJVfFBTiT78E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645167029;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ws+xxMKEgNMx+rSNl1TkQFpWj9fgW8uaI/D71aBNhZM=;
 b=PkzLifuPIdiRqgrdx354103PA4l8asitAwNk+KXTtrRXp+OYpZr8ZIx7BXQUKPXjK0chtf
 mGvaVd3t8iG68VAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD7A013A15;
 Fri, 18 Feb 2022 06:50:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VpUxNLRBD2JEKAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 18 Feb 2022 06:50:28 +0000
Date: Fri, 18 Feb 2022 07:50:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <Yg9Bs81ZehfgFZ38@pevik>
References: <1645005868-2373-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1645005868-2373-5-git-send-email-xuyang2018.jy@fujitsu.com>
 <Yg6oZLaYz6Dj1FY4@pevik> <620F1768.7060100@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <620F1768.7060100@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/5] syscalls/pidfd_getfd02: add basic error test
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> > and get more info.
> I will look Cyril's patch and wait.
Thx!

> >> +	if (!TST_PASS)
> >> +		tst_brk(TFAIL | TTERRNO, "pidfd_open failed");

> > @Cyril: would it be possible to to allow using also tst_brk() in macros in
> > tst_test_macros.h?

> Maybe can add SAFE_PIDFD_OPEN.
I was thinking about it. But you use TFAIL - part of testing.
But using just SAFE_PIDFD_OPEN() even it's using TBROK might be best.

Kind regards,
Petr

> > Having TST_*_BRK() (i.e. TST_EXP_FD_SILENT_BRK()) looks too complicated

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
