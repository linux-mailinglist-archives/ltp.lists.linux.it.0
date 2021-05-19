Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13966388CB9
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 13:24:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FBD33C55CE
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 13:24:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 051F13C1B0F
 for <ltp@lists.linux.it>; Wed, 19 May 2021 13:24:32 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 76D766008C3
 for <ltp@lists.linux.it>; Wed, 19 May 2021 13:24:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CC0DAEC6;
 Wed, 19 May 2021 11:24:31 +0000 (UTC)
Date: Wed, 19 May 2021 13:24:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YKT1bTfLGsiedaya@pevik>
References: <20210518173039.4657-1-pvorel@suse.cz> <YKP+KakyxIuGc/fo@yuki>
 <YKQRyk/6SNiqUryH@pevik> <YKTR12JzOJiFOaPv@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKTR12JzOJiFOaPv@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH v2 1/1] doc: Add supported
 distros (kernel, libc, toolchain)
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, automated-testing@yoctoproject.org,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > > > +but users are encouraged to move to a newer distro.
> > > > +
> > > > +If latest LTP cannot be compiled even with some amount of workarounds,
> > > > +you may result to older LTP releases, however these are _not_ supported
> > > > +in any way. Also if you are trying to run LTP on more than 10 years old
> > > > +distribution you may as well reconsider you life choices.

> > > So in the end you haven't changed this for the nicer version I've
> > > proposed?
> > I decided to keep it. We're saying similar thing in previous paragraph
> > ("but users are encouraged to move to a newer distro") and it's actually the
> > truth (life choice to maintain ancient version). But feel free to suggest
> > further improvements over these 2 paragraphs.

> Nah, looks good enough, Acked with the typos and grammar fixes.

OK, thanks, merged!

And put into wiki:
https://github.com/linux-test-project/ltp/wiki/Supported-kernel,-libc,-toolchain-versions

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
