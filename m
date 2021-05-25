Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515C3903A2
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:13:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF0D43C77CF
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:13:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1F8303C1A80
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:13:54 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9666910007B2
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:13:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621952033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e9T5+cesxivjevY6+rfQujB9XMxVzj1Bdy3CuXfX4OM=;
 b=kJ7ZBV2LIYWmtEKcRetJK8Xz9JnmTanj9rlPExe5U403hNa8dxD+zw+olr81EIFqPHQFVm
 82ClFUYQbwZelRypnHmgDpPs8Bv0Dt+KAryMUWpq2q8BGoQwt3yXO7eFCMKh9lgOJSjibn
 s+ByuOuUlFoXC6OKZimU0qULT2/p2UY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621952033;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e9T5+cesxivjevY6+rfQujB9XMxVzj1Bdy3CuXfX4OM=;
 b=gWzZROAxJ/srDmy9RZvePX7SuvKd2696VLiavBzhTKiShesMUM8J4wA2fVhnubBxzyefje
 2mp5ROjcmQTD+nCA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED308AEAB
 for <ltp@lists.linux.it>; Tue, 25 May 2021 14:13:52 +0000 (UTC)
Date: Tue, 25 May 2021 15:47:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YK0ABlx8wyHPp0Xf@yuki>
References: <20210524144745.10887-1-rpalethorpe@suse.com>
 <YKzp0rxGfaxL1blw@yuki> <87sg2akj01.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sg2akj01.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/4] Auto review and Coccinelle
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
> > I guess that having it in travis as a post commit check would be better
> > than nothing.
> >
> > Pre commit hook would be ideal but requiring coccinelle installed for
> > LTP development would increase the bar for contribution too much I
> > guess.
> 
> I fear this defeats my primary goal of giving very quick feedback
> without involving patch submission. This makes me think of clang-tidy
> (clang-tools?) again. It will probably be more difficult to write LTP
> specific checks, but I guess every desktop Linux distro less than 10
> years old has Clang?

As far as I can tell clang is generally present on modern distributions
while coccinelle tends to be problematic on some distributions. It's a
great tool but it seems that there is a shortage of maintainers that can
maintain ocaml packages.

> I don't think there is much else I can do than try writing the same
> check in clang as well. See how that goes...

If that works well enough I would vote to a switch to clang-tidy.

> Anyway, we could copy the kernel to some extent. Make it so running
> 
> make coccicheck
> 
> or
> 
> make clang-tidy
> 
> or more generic
> 
> make check
> 
> Will recursively run the checks on the files under the current
> directory?

Sounds like a good plan.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
