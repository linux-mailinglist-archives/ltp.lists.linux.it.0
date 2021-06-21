Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7EC3AE53C
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 10:48:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BD693C7051
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 10:48:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A58B93C7047
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 10:48:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 19D2B20025E
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 10:48:40 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 794A01FD34;
 Mon, 21 Jun 2021 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624265320;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lG+2kJ+mA87uYc1QF6e7eE7VeLJhqkHL+t0H/MyMVI0=;
 b=mLqEGl5uEbCUgnFlkGBmumhfX2BwMQUduvurbd2ccez7QmPq4dGVpbrbJ/HrekkUDclTyR
 PJ9j4moCoBrOZxQBei1EnQOy6nBA1JD7pBbxPuxHRK3SJU048B/pcV/G2eXKT2X1hH+Ffb
 R2270jDlMn7TrMTCA81cE/HeW2JYUc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624265320;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lG+2kJ+mA87uYc1QF6e7eE7VeLJhqkHL+t0H/MyMVI0=;
 b=3FLRZyDBcha12IYftXZpfV6Jke5CbccGGGw+ZeMuFMUEKliZRQQOCTvFVHDOnPjTYPCVlm
 5siig6GiIgxCrwBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 40C06118DD;
 Mon, 21 Jun 2021 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624265320;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lG+2kJ+mA87uYc1QF6e7eE7VeLJhqkHL+t0H/MyMVI0=;
 b=mLqEGl5uEbCUgnFlkGBmumhfX2BwMQUduvurbd2ccez7QmPq4dGVpbrbJ/HrekkUDclTyR
 PJ9j4moCoBrOZxQBei1EnQOy6nBA1JD7pBbxPuxHRK3SJU048B/pcV/G2eXKT2X1hH+Ffb
 R2270jDlMn7TrMTCA81cE/HeW2JYUc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624265320;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lG+2kJ+mA87uYc1QF6e7eE7VeLJhqkHL+t0H/MyMVI0=;
 b=3FLRZyDBcha12IYftXZpfV6Jke5CbccGGGw+ZeMuFMUEKliZRQQOCTvFVHDOnPjTYPCVlm
 5siig6GiIgxCrwBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id qpR2DmhS0GBYMwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 21 Jun 2021 08:48:40 +0000
Date: Mon, 21 Jun 2021 10:48:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YNBSZrDdiXxfrVnl@pevik>
References: <20210618191252.12403-1-pvorel@suse.cz>
 <87a6nj4njt.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a6nj4njt.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/1] make: Add make test{, -c, -c-run,
 -shell-run} targets
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

> Hello,

> Petr Vorel <pvorel@suse.cz> writes:

> > For testing C and shell API.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi all,

> > another attempt for make test target.

> > In a long term, I'd like to wrap the execution with some script, as I
> > suppose there will be some metadata in test, allowing to run tests which
> > don't TPASS or TBROK (we have quite a lot of them). Then the summary
> > would be even more useful.

> For each test you could have an tcl/expect (or equivalent Perl/shell if
> we don't already require tcl) script which matches the output including
> return value and stderr/stdout.
I'd prefer to avoid tcl/expect. FYI There was some effort [1], based on my
previous work [1], I plan to get back to it.

> For most tests it would just call a common function to check for
> TPASS/TBROK. For tests where we want to look for a given message, it
> could match the output. If we sometimes expect TCONF then it could
> perform a check to verify that it really should return TCONF.
As I noted in [2] today, I might create very simple library for these test
wrappers (small subset of things needed in test wrappers like
lib/newlib_tests/shell/test_timeout.sh).

> I guess you could just put some data in a comment. I think that is
> likely to be harder though. At least with the number of tests we current
> have.
Yep, that's what was used in [1].

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/ce675759672af52bea02c11d51bd7d10f0bcb5cb.1566500817.git.clanig@suse.com/
[2] https://lists.linux.it/pipermail/ltp/2021-June/023306.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
