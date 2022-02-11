Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF37B4B26E4
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 14:13:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B07463C9F03
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 14:13:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 80B2C3C945D
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 14:13:50 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 048241A0093A
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 14:13:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 18E822113A;
 Fri, 11 Feb 2022 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644585229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bf3KX1A5GP7x8ayEh1KOjC7Q9l9E76l69v/i4ca+WL4=;
 b=bYJTBhWodEDkJFux9S3a8rfc/MZKwyNy8/5wOuYqT7xPOAJeRwz2ay8M6MU2M1IxMtX9pd
 /WTVUbKsQy/gvUCAMjJ8y/QpuKRIDP0B7Fvwhlv4ifvtZxJef1ALU52htl0OLYr9LKfxm9
 4VU2tFA4Tqq0KBSc0YMU7h+mNFR2aAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644585229;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bf3KX1A5GP7x8ayEh1KOjC7Q9l9E76l69v/i4ca+WL4=;
 b=kjWG+jhQbKWoD3FIXBux1suHrqKUyZPsvFdPIIh9yUAWbddZAEmaMmExHZ2wGV/hwDbpAa
 NCj1u1W9S5Q+vQCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D492913C83;
 Fri, 11 Feb 2022 13:13:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Yn/aLgxhBmKxBwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 11 Feb 2022 13:13:48 +0000
Date: Fri, 11 Feb 2022 14:15:56 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YgZhjLc4u+Xb6Y6e@yuki>
References: <20220210133812.13368-1-bogdan.lezhepekov@suse.com>
 <YgU5QvQnzmcCgKq7@yuki>
 <CAEemH2c71jsd5VDZ05pCEGJMHtdxK2_T2MXaK5P73qttBd-gLQ@mail.gmail.com>
 <6205BA38.7070903@fujitsu.com>
 <VI1PR04MB49587421680CE7C6AA8599CD93309@VI1PR04MB4958.eurprd04.prod.outlook.com>
 <62061EC1.2040206@fujitsu.com> <YgYlYoi0AC1flHlT@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgYlYoi0AC1flHlT@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> 1) keep check access("/proc/swaps", F_OK)
> 2) use .needs_config for "CONFIG_SWAP=y"
> 3) Add .needs_swap flag to struct tst_test
> 
> To be honest, I'm not sure, what's the best, probably .needs_config.
> I worried little bit about .needs_config forcing config to be available in the
> past, but that should be solved KCONFIG_SKIP_CHECK added by Xu.

I guess that the easiest solution would be .needs_kconfig, we ended up
depending on it in quite a few testcases anyway so I would say that
nobody is runing LTP without having kernel config exproted anyways.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
