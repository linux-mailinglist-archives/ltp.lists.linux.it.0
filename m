Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5566E5BAD89
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Sep 2022 14:39:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB4ED3CACA0
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Sep 2022 14:39:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EB11A3CAC39
 for <ltp@lists.linux.it>; Fri, 16 Sep 2022 14:39:45 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C28D9603296
 for <ltp@lists.linux.it>; Fri, 16 Sep 2022 14:39:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3695533CA6;
 Fri, 16 Sep 2022 12:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663331983;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3cNptvTbU6VMBt6LeFVczuPvNFATyEnlumQv0itoss=;
 b=ibOF13W2p5qDOgFoi9HZYFY+o+Zlz9g/G9dp5Csl9owht08m/EliLRn+Cu3k6BP/N5Z4AH
 f6opslnrx+JNwsbd+ch10tpaf1ITUIrMf2Mydn1qmRvnIkOOB3bAfgqimGui0MUDquo71O
 v6Xz5fewuWH4kZedYrlycAfIOsE/gu0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663331983;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3cNptvTbU6VMBt6LeFVczuPvNFATyEnlumQv0itoss=;
 b=tjq9NhnkwhhnWKaWFrTGmvrRdVC03Y01PwbCuG3Aq0tDVsKhCKCwRzxGEEcDyvSnygNenR
 U3oifLc6lJr5eSAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E91861332E;
 Fri, 16 Sep 2022 12:39:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2IXNNo5uJGMnLQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 16 Sep 2022 12:39:42 +0000
Date: Fri, 16 Sep 2022 14:39:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YyRujPRK3cNHQpfa@pevik>
References: <20220915093639.2261-1-pvorel@suse.cz>
 <20220915093639.2261-4-pvorel@suse.cz> <YyRhxDnUoIDG0OCa@yuki>
 <YyRnjASQiGnww/ld@pevik> <YyRr4a9/oLNHd0ZK@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YyRr4a9/oLNHd0ZK@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 3/8] tst_supported_fs: Support skip list when
 query single fs
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > Shouldn't there be an getopt option to decide?
> > e.g. by default both skip list and mkfs (no matter if -s is passed) and with
> > option (e.g. -o) check only for a list? This is not needed when checking all
> > filesystems, only for testing single filesystem, so I wonder if I should
> > implement it for all filesystems mode.

> > But as this is not needed I'm ok to implement what you suggest:
> > tst_supported_fs -s skiplist foo would check only if the used filesystem is not
> > filtered by skip list (used in tst_test.sh).

> > tst_supported_fs foo would check only for mkfs.foo (used in prepare_lvm.sh).

> > What do you prefer?

> I guess that I do not care that much what exact API we do have here as
> long was we can check for just skiplist or just support separatelly.

OK, atm we don't need the third option (skip list + both), so that I will not
care about it.

I might do this only for mode when single fs is being queried (haven't decided
yet) as that's IMHO not needed atm.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
