Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D378C4B20D3
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 09:59:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69A1A3C9EF5
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 09:59:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 82E023C9B4B
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 09:59:18 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8410910007FF
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 09:59:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 139351F385;
 Fri, 11 Feb 2022 08:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644569956;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FZTMMpebvO10BlJso/4ZNpLDBi4V/gxFF1k4c2EOzXA=;
 b=X59Bl6S2RyJ14vtgB/vRTv76A8cQvRcNI5cyH81BMxvLJhe59nkGIXRaAzoC9+gCOUqv7/
 H/UJcahMf/5MdRxpR66N0kvMCeYFSezoschvH7mmRAut1AMDH9qxcP8zUbVqiNnKF9DFtB
 FotTtEXzRnqaIKAxCxLQFjJzLBHtl6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644569956;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FZTMMpebvO10BlJso/4ZNpLDBi4V/gxFF1k4c2EOzXA=;
 b=vNeiFnOQtGjv5tDUHtpQhhyclf2BkUHDA9ZGvlwlxvY8iXLvjA5olOwfsmhxXyf7GhXRdY
 gMUSlM/75PyH4cCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C97F813345;
 Fri, 11 Feb 2022 08:59:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RWqGL2MlBmIyBgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 11 Feb 2022 08:59:15 +0000
Date: Fri, 11 Feb 2022 09:59:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YgYlYoi0AC1flHlT@pevik>
References: <20220210133812.13368-1-bogdan.lezhepekov@suse.com>
 <YgU5QvQnzmcCgKq7@yuki>
 <CAEemH2c71jsd5VDZ05pCEGJMHtdxK2_T2MXaK5P73qttBd-gLQ@mail.gmail.com>
 <6205BA38.7070903@fujitsu.com>
 <VI1PR04MB49587421680CE7C6AA8599CD93309@VI1PR04MB4958.eurprd04.prod.outlook.com>
 <62061EC1.2040206@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62061EC1.2040206@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] mem/swapping01: Make sure swap is supported by
 kernel
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi Bogdan
> > Hi all,

> > I didn't go for CONFIG_SWAP just because wanted to be aligned with
> > syscalls/swapon/swapon03.c and to not multiply patterns.

> > If you see CONFIG_SWAP more beneficial for docparser, I can make another
> > patch.

> > Should I?
> IMO, yes, but let's listen voice from other maintainers.
> @Petr,@Cyril

We have 3 options.

1) keep check access("/proc/swaps", F_OK)
2) use .needs_config for "CONFIG_SWAP=y"
3) Add .needs_swap flag to struct tst_test

To be honest, I'm not sure, what's the best, probably .needs_config.
I worried little bit about .needs_config forcing config to be available in the
past, but that should be solved KCONFIG_SKIP_CHECK added by Xu.

Kind regards,
Petr

> Best Regards
> Yang Xu

> > Cheers,
> > Bogdan
> > ------------------------------------------------------------------------
> > *From:* ltp <ltp-bounces+bogdan.lezhepekov=suse.com@lists.linux.it> on
> > behalf of xuyang2018.jy@fujitsu.com <xuyang2018.jy@fujitsu.com>
> > *Sent:* Friday, February 11, 2022 3:21
> > *To:* Li Wang <liwang@redhat.com>
> > *Cc:* LTP List <ltp@lists.linux.it>
> > *Subject:* Re: [LTP] [PATCH v1] mem/swapping01: Make sure swap is
> > supported by kernel
> > Hi Li


> >>  On Fri, Feb 11, 2022 at 12:09 AM Cyril Hrubis <chrubis@suse.cz
> >>  <mailto:chrubis@suse.cz>> wrote:

> >>  Hi!
> >>  Applied, thanks.

> >>  I guess that the SAFE_OPEN() caused TBROK on machines without
> >>  CONFIG_SWAP, right?


> >>  If so, why not go fix with .needs_config for "CONFIG_SWAP=y" ?
> > +1, it is also friendly to docparse.

> > ps: I never listen user complaint for the lack of CONFIG_PORC, so only
> > using .needs_config for "CONFIG_SWAP=y" can work well.

> > Best Regards
> > Yang Xu

> >>  --
> >>  Regards,
> >>  Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
