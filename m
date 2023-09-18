Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB267A4633
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 11:41:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BCFA3CE4E9
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 11:41:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C49E23C9D45
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 11:41:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 25326601563
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 11:41:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 749101F8C1;
 Mon, 18 Sep 2023 09:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695030082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2TSFICm8QwEGsb+ALO801LMLIDFos4SwO5yOvJCZo4=;
 b=UtplMVAdyhNmIhONoRXw/WVqUcY/I0L+MkKb0Xia8KPPhLi8Y1qEwHhI/Cn4m8EWH6IRXA
 CNMn3KAZ3bqBma+8EkMoas2cyOFw5qz9D3vVVuSWcUT5RtCH5YtwYjONWEA4A0Vz6mQ8sV
 N/sl5IWkqD3v/rhXh4QlWbmCs9n7rlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695030082;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2TSFICm8QwEGsb+ALO801LMLIDFos4SwO5yOvJCZo4=;
 b=66GWqgsI8j15pc1chjquVQlRWdx+rUuSs0SMoRxR/6w5IqpBCB4xoi/bKZZhtTy9UX9RLC
 tEdlkVKVMpq5jqCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62D1013480;
 Mon, 18 Sep 2023 09:41:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dz7WFkIbCGUQHwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 18 Sep 2023 09:41:22 +0000
Date: Mon, 18 Sep 2023 11:42:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZQgbbx2MEsJaKWwR@yuki>
References: <20230918082506.17464-1-andrea.cervesato@suse.de>
 <20230918082506.17464-3-andrea.cervesato@suse.de>
 <20230918091756.GB30304@pevik> <ZQgarkBUEyDd4lxF@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQgarkBUEyDd4lxF@yuki>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] Add Linux Test eXecutor inside tools
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
> Unfortunately this does not work well either because the ltx does not
> have install targed and trying to install a file from a subdirectory is
> not possible with the LTP build system. I've tried that and it didn't
> work.
> 
> Let's merge this version that works, we can try to do make things better
> later on.

Also one more point $(MAKE) -C ltx-src does not support out-of-tree
build and while it's probably fine for 'make check' not to support it,
since that is a developer tooling, it should work fine for ltx that is
going to be packaged/installed on the SUT.

So I suppose that we are stuck with the LTP ltx Makefile unless we:

- add support for out-of-tree build to ltx/Makefile
- drop out-of-tree build support from LTP

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
