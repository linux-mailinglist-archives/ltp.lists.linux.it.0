Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947750DCC7
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Apr 2022 11:35:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9E993C934C
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Apr 2022 11:35:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B7BD63C01CF
 for <ltp@lists.linux.it>; Mon, 25 Apr 2022 11:35:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 24BB5200067
 for <ltp@lists.linux.it>; Mon, 25 Apr 2022 11:35:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48DCA210E1;
 Mon, 25 Apr 2022 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650879346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1/jeedecyJL+imQC1ycaJbkHNKDS51jB/+5pPcLkiiw=;
 b=0mSDt6udA8m3u4h8ZWQDbO1G9SlASN8RiyemZflEpMdgCupNPkndRx/y7O+wwr4t5bt00Z
 0GCIbtwWkEGnLJ+ShrTlfO/8rZzztjvkj8hyyOl8tJefAMVvvrHSVgOXgrYaSITM7LWQ6A
 Kqk/0ltdGKQSYhZ2NneTHoOqQgUfuXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650879346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1/jeedecyJL+imQC1ycaJbkHNKDS51jB/+5pPcLkiiw=;
 b=2d5RJPIkYZSFBE0Z6QehN7FZfRsvea/B+pmE0KfbMXq0MOudZ9dTGt2kb9aqQDbnOA5SuU
 VOKsqt743O1ewYBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 278B213AE1;
 Mon, 25 Apr 2022 09:35:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JPgqCHJrZmIIHQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 25 Apr 2022 09:35:46 +0000
Date: Mon, 25 Apr 2022 11:35:19 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YmZrVzxghAnmxIud@rei>
References: <20220425092118.21619-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220425092118.21619-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] sighold02: Fix muslc builds by removing __SIGRTMIN
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
> The minimum real-time signal is always 32 according to
> signal(7). Meanwhile __SIGRTMIN is not defined in all lib C
> implementations.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  testcases/kernel/syscalls/sighold/sighold02.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/sighold/sighold02.c b/testcases/kernel/syscalls/sighold/sighold02.c
> index daa86192e..1cfb7688b 100644
> --- a/testcases/kernel/syscalls/sighold/sighold02.c
> +++ b/testcases/kernel/syscalls/sighold/sighold02.c
> @@ -33,7 +33,7 @@ static int sigs_map[NUMSIGS];
>  
>  static int skip_sig(int sig)
>  {
> -	if (sig >= __SIGRTMIN && sig < SIGRTMIN)
> +	if (sig >= 32 && sig < SIGRTMIN)
>  		return 1;

Looks like __SIGRTMIN is defined to 32 for all architectures glibc
supports, so this should be pretty much safe.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
