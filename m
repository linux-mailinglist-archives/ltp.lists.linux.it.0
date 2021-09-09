Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 277324048BB
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 12:55:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88D633C8D65
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 12:55:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 650FF3C21F7
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 12:55:37 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 747D01A006A4
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 12:55:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 24FB022358;
 Thu,  9 Sep 2021 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631184935;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VY3oELlZo7/YZY+Wv5Kyd9ynpbtrsGWH3mxk2yUtnyk=;
 b=1P5u0oY0/vy9yscejbXNBfNUK6RXwLBDDX8Eb8VrbWxLdqcr2+5Sk67RVW4msw2d0MiA9E
 lFKnpw6ZC/pqabOVBhWafUKqO54WJIjzOS4ZlmvIoxxKzC/TcVmHCG+wxsQQFMi7JDN206
 tgsw4GvJ20e581JLlc6w5KxkbllPpns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631184935;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VY3oELlZo7/YZY+Wv5Kyd9ynpbtrsGWH3mxk2yUtnyk=;
 b=TksY3JqqZ9Mg7X1hw77VnpQs49qvghf4XRiJ5UPj3WL3j5BIIT80oxNrSrpBcPcmUs96q3
 pJhZIqp73mOjkGBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF68A13B0C;
 Thu,  9 Sep 2021 10:55:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BN0VNSboOWFhRAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 09 Sep 2021 10:55:34 +0000
Date: Thu, 9 Sep 2021 12:55:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YTnoJTqXum64Q488@pevik>
References: <20210902103740.19446-1-pvorel@suse.cz>
 <20210902103740.19446-5-pvorel@suse.cz> <YTDRzA6Vbimc69Xz@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTDRzA6Vbimc69Xz@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] doc: Update for vendored checkbashisms.pl
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

Hi Cyril,

thanks, merged up to this commit (the 5th one was replaced).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
