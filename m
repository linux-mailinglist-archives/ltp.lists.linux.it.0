Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7743A3C4
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 22:01:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E638F3C65EE
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 22:01:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6D97D3C0958
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 22:01:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4488B200B74
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 22:01:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8FB501FD4A;
 Mon, 25 Oct 2021 20:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635192073;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4yKf4gQxTIFt+TNEw9BurQwesiv4BlfIuUtdUX2sXQ0=;
 b=hQhcEDrryPfm5FdEZSP34oHU9bu7e8mTbdTBSIROnL9gKAHi1mUCgRH778vhwd1S7t3f4t
 ZmvBlyTcQLXTCWYL2oAEsLpjHSlbfJWr0ydLxD5QZBAs/ZjkNmBh9o3ZaPKJmZ7a+M1g5K
 zQkAi7Pqez9qQ4KE8rsmHAD5fJfrz34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635192073;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4yKf4gQxTIFt+TNEw9BurQwesiv4BlfIuUtdUX2sXQ0=;
 b=P5gCv0QI5rIsuOomuKGh/fOlw38hpMU2T17hLVebo6k7Gr5IR/xuqJw1qG3MclsnD32bBK
 cYU9NBYYI/ulQtCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60B7B13C6E;
 Mon, 25 Oct 2021 20:01:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YEQtFQkNd2GWDQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 25 Oct 2021 20:01:13 +0000
Date: Mon, 25 Oct 2021 22:01:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YXcM/Bloi1UCKjPu@pevik>
References: <20211018154800.11013-1-chrubis@suse.cz>
 <20211018154800.11013-3-chrubis@suse.cz> <YXKjeNPKKpv8ybh0@pevik>
 <YXaoYlybezAlTIdP@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXaoYlybezAlTIdP@rei>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] docparse: Add tests
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

> Hi!
> > It'd be nice, if this was run by make test.

> > Also I'm quite surprised by this behavior:

> > $ cd docparse/tests/ && make test
> > cat test.sh >test 
> > chmod a+x test

> > When this was added?

> There is no Makefile in that directory, this does not even make any
> sense. I guess that this is GNU Make pulling default rules out of thin
> air...
GNU make again surprised me :) OK, let's ignore this funny default target.
But it'd be nice to have these tests run in CI and in make test target by
default.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
