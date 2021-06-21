Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D102D3AE51F
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 10:41:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A4303C704F
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 10:41:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6800F3C703D
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 10:41:44 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CD2561000958
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 10:41:43 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3CE29219CD;
 Mon, 21 Jun 2021 08:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624264903;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UTPADDLTFHyMtJGuT64KYCM4cYfW/ZlAX48vx4l4i+s=;
 b=ISYfiUqEmHyi/AL4md6v6/l8rGW5qqva7yOuftGudwFsqqaX+aUuniMammbLpNAbukX/xe
 F1J6aqHm0bkL+wskXjB22mg0GMrlAbVo5k0Ug2muB/QYD3SXaaM7lQ7868Yo0JxgVMdBq0
 EpcfDz3uURVzk0hsFiOmVBW8SxyrJNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624264903;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UTPADDLTFHyMtJGuT64KYCM4cYfW/ZlAX48vx4l4i+s=;
 b=5w7JsEVyGEHgfrfADmBt3ieqMv6tbf993q1AO3Txkij52BtA3qVPuqJTSPjaSmUGKoxoba
 vy4PwzcP7hDdnLBg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B7C15A3BA2;
 Mon, 21 Jun 2021 08:41:42 +0000 (UTC)
References: <20210618191252.12403-1-pvorel@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <20210618191252.12403-1-pvorel@suse.cz>
Date: Mon, 21 Jun 2021 09:41:42 +0100
Message-ID: <87a6nj4njt.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Petr Vorel <pvorel@suse.cz> writes:

> For testing C and shell API.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi all,
>
> another attempt for make test target.
>
> In a long term, I'd like to wrap the execution with some script, as I
> suppose there will be some metadata in test, allowing to run tests which
> don't TPASS or TBROK (we have quite a lot of them). Then the summary
> would be even more useful.

For each test you could have an tcl/expect (or equivalent Perl/shell if
we don't already require tcl) script which matches the output including
return value and stderr/stdout.

For most tests it would just call a common function to check for
TPASS/TBROK. For tests where we want to look for a given message, it
could match the output. If we sometimes expect TCONF then it could
perform a check to verify that it really should return TCONF.

I guess you could just put some data in a comment. I think that is
likely to be harder though. At least with the number of tests we current
have.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
