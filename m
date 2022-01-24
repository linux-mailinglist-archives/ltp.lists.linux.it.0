Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5611749955F
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jan 2022 22:10:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62D533C93FE
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jan 2022 22:10:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 230DC3C65E6
 for <ltp@lists.linux.it>; Mon, 24 Jan 2022 22:10:16 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9818E600832
 for <ltp@lists.linux.it>; Mon, 24 Jan 2022 22:10:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B27101F380;
 Mon, 24 Jan 2022 21:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643058614;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MeP5XoGIJZfAr4l8T4aIdYDVR2IGQc5pZeq+l9Xp2Rg=;
 b=uTd00DQ7w6zCc3/MYqPgfOSrTRcaqhEPC8eduQbTjZQlTEmOTvXKAjNHU2gH89pBtZIWOV
 Btgc6Kbl1NBbdyowgJ9u45gRQF5SKrEw9R5GxLWEdDQrSO//huoXNb2qsajWv5Qa9IhAyb
 /QVE4lexMkwhbshHMjIOGFEeg2+kLG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643058614;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MeP5XoGIJZfAr4l8T4aIdYDVR2IGQc5pZeq+l9Xp2Rg=;
 b=Tqqn3xtOYeKgNiq7JzTUdBbK4aAIhucTXTGCMOA1TZLznROx3FB6WWhuLaZ1RkI6+ByHKF
 7h5OxISbWxG2FqAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EA1B13CC8;
 Mon, 24 Jan 2022 21:10:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AvgkGLYV72G/PgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 24 Jan 2022 21:10:14 +0000
Date: Mon, 24 Jan 2022 22:10:12 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
Message-ID: <Ye8VtDoKBxoV+zGf@pevik>
References: <20220124065937.17383-1-pvorel@suse.cz>
 <d566cf35-7e73-5052-4f77-2bbe05ba8904@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d566cf35-7e73-5052-4f77-2bbe05ba8904@virtuozzo.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] rpc_lib.sh: Check for running RPC
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
Cc: NeilBrown <neilb@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > Nikita, does it really fix your case? Or there needs to be 2 rpcinfo -p
> > calls with sleep in between?

> Yes, it fixes that.

> Btw, easy test is:
>   systemctl stop rpcbind.service
>   runltp -f net.rpc

> After applying your patch, that results in no TCONF from rcp01.sh, because
> rpcbind.socket is still there, and systemd restarts rpcbind on request.

FYI merged, with fixing $x variable to $services.
Again, thanks both for your work.

Kind regards,
Petr

> Nikita

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
