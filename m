Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 957FD423F9B
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Oct 2021 15:50:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65F5C3C7E11
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Oct 2021 15:50:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8BAAC3C1CC3
 for <ltp@lists.linux.it>; Wed,  6 Oct 2021 15:50:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 940D81400FB4
 for <ltp@lists.linux.it>; Wed,  6 Oct 2021 15:50:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C56BB1FED9;
 Wed,  6 Oct 2021 13:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1633528247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sELNe7MB+IjPNhX9FM9yO76gAEFCOoTkT3/lsghXhqE=;
 b=XbHE6dq819EmgPgr68fZpksbOnPGDD4fXU8Oq3h1mEQ03Sr9VoxMUUnNqX0gS24DptHX3N
 upTTGu94J3cnV24FDIcyKu4qv3DY5G7w2g4Mh51yfAbXdDvoc2ZYbGPas6v7UdiYuuzG9H
 qUSkEf8DfqM1Dme6SQagjs0OBBOAJeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1633528247;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sELNe7MB+IjPNhX9FM9yO76gAEFCOoTkT3/lsghXhqE=;
 b=fg5ECevHsrg3N2fhIpFlZd7EdbiYkcF9iFYV/G08yX9Q4KblTEhnjzpqqVpG/5p8JYK5ub
 +Hv3dbAN1Yw0b8AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B12AB13C55;
 Wed,  6 Oct 2021 13:50:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t5MnKrepXWEabAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 06 Oct 2021 13:50:47 +0000
Date: Wed, 6 Oct 2021 15:51:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <YV2p2ZT6o3IcaVIF@yuki>
References: <20210930183058.5240-1-petr.vorel@gmail.com>
 <20210930183058.5240-2-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930183058.5240-2-petr.vorel@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/3] tst_netdevice.c: Drop redundant include
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
Cc: ltp@lists.linux.it, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> <linux/rtnetlink.h> is already included in lapi/rtnetlink.h.
                     ^
		     which includes <linux/netlink.h>

I suppose that you have tested this in CI and that it works fine. If
that is so:

Acked-by: Cyril Hrubis <chrubis@suse.cz>

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  lib/tst_netdevice.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
> index ba9a55b70..4a0442932 100644
> --- a/lib/tst_netdevice.c
> +++ b/lib/tst_netdevice.c
> @@ -4,7 +4,6 @@
>   */
>  
>  #include <asm/types.h>
> -#include <linux/netlink.h>
>  #include <linux/veth.h>
>  #include <sys/socket.h>
>  #include <net/if.h>
> -- 
> 2.33.0
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
