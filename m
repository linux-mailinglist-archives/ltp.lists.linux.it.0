Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B0E36AC12
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 08:17:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B6113C66D0
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 08:17:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BFE093C27D9
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 08:17:07 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 65F9C600945
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 08:17:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42462B08C;
 Mon, 26 Apr 2021 06:17:06 +0000 (UTC)
Date: Mon, 26 Apr 2021 08:17:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <YIZa4Ph81LmkEkLZ@pevik>
References: <20210422072609.9938-1-sujiaxun@uniontech.com>
 <YIZSzNd9uK8kItYb@pevik>
 <20210426055556.dmcogdykez2ddxn3@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426055556.dmcogdykez2ddxn3@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix the 64-bit macro definition of mips
 architecture
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
Cc: ltp@lists.linux.it, sujiaxun <sujiaxun@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

...
> > > -#if defined(__arch64__)
> > > +#if defined(__mips64)
> > So __arch64__ is not defined for mips 64 bit? (as it's defined for sparc 64bit?)
> > __mips64 is obviously correct and better readable, but is it really required?

> I am not sure what you meant by "is it really required?" The #ifdef hackery here
> ? It is as can be seen in include/uapi/asm-generic/shmbuf.h in Linux source.
I mean if #if defined(__mips__) && defined(__arch64__) detect 64bit mips
the patch would not be needed (although IMHO __mips64 is more descriptive than
__arch64__, for which you need to search for which architecture it was defined).

But I'm not sure myself if __arch64__ is defined for mips 64bit.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
