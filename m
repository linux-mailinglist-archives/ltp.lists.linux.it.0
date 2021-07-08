Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 619613C1458
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 15:37:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 364903C7931
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 15:37:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C025E3C681B
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 15:37:08 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E61851A0153C
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 15:37:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 34EAF2214A;
 Thu,  8 Jul 2021 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625751427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eWdpntnilM0ePQZcHJf9AQkpy4on2kv0FhjRFqN8XnU=;
 b=R9vsI+v7tjQQH4V/xnEG3FxI5UK3klBXqXsSXPSF3xiZ23SCpgA5ivDPrid6oWo1gFqUEj
 JCneB3PZSStqL+bzy7X1u42qfVL1d/dfhsfdIuYNhaWhA6txM7kf5T+0Sk+6Dvv/kZG22E
 9v+ge8iGTCd9dym0x1qSY1/rFA317cs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625751427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eWdpntnilM0ePQZcHJf9AQkpy4on2kv0FhjRFqN8XnU=;
 b=8HwKf8N30P8VNSjCO/K9luZk1l/584gcfVPII6BWpnPnoPNf9J6J5XVR27WBpCZaMDoTIr
 15Wmiy2LgEFnEsBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16EF013B00;
 Thu,  8 Jul 2021 13:37:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K7g7BIP/5mDubgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 08 Jul 2021 13:37:07 +0000
Date: Thu, 8 Jul 2021 15:11:31 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YOb5g66KfDWx77Hr@yuki>
References: <20210629072710.23800-1-rpalethorpe@suse.com>
 <20210629072710.23800-4-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210629072710.23800-4-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] meltdown: Set CFLAGS for check targets
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
> The include set in the CFLAGS is necessary for Sparse to parse the
> test source. If a specific target has variables set on it. Then these
> won't be available to the corresponding check-target. Usually this is
> not a problem because most variables set on a target are just for
> linking and the checker doesn't need them.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  testcases/cve/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
> index ddf8b6fe1..7b011b6c9 100644
> --- a/testcases/cve/Makefile
> +++ b/testcases/cve/Makefile
> @@ -19,6 +19,7 @@ cve-2014-0196:  LDLIBS += -lutil
>  endif
>  
>  meltdown: CFLAGS += -I$(abs_srcdir)/../realtime/include
> +check-meltdown: CFLAGS += -I$(abs_srcdir)/../realtime/include

Uff, this will likely bite us in a different ways later on.

I guess that it would be cleaner to move the libtsc.h into top level
include so that it's clear that the header is used in several tests.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
