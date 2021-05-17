Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1697E382494
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 08:42:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D99D73C30F0
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 08:42:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 945F23C1DEA
 for <ltp@lists.linux.it>; Mon, 17 May 2021 08:42:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0F6A61A002C9
 for <ltp@lists.linux.it>; Mon, 17 May 2021 08:42:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 204C0AC5B;
 Mon, 17 May 2021 06:42:56 +0000 (UTC)
Date: Mon, 17 May 2021 08:42:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YKIQbr8nI0VhFmUg@pevik>
References: <20210514132639.4181-1-pvorel@suse.cz> <YJ6A0gcR9L+P9IXm@yuki>
 <CAASaF6ytbCjwOSOywR4JUToJb_u9fOe2a2y4zE7_n99cgre5TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6ytbCjwOSOywR4JUToJb_u9fOe2a2y4zE7_n99cgre5TQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Add supported kernel, libc versions
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
Cc: automated-testing <automated-testing@yoctoproject.org>,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
> > Older distributions are not officially supported, which means that it
> > may or may not work. It all depends on your luck. It should be possible
> > to compile latest LTP even on slightly older distributions than we
> > support with a few manual tweaks, e.g. disabling manually tests for
> > newly added syscalls manually, etc.

> > If latest LTP cannot be compiled even with some amount of workarounds,
> > you may result to older LTP releases, however these are _not_ supported
> > in any way. Also if you are trying to run LTP on more than 10 years old
> > distribution you may as well reconsider you life choices.

> Should we also give some hint about accepting patches/wokrarounds for
> very old distros?
> For example: "Trivial fixes/workarounds may be accepted, but users are
> encouraged to move to newer distro."

+1. I'd add it at the end of first paragraph. Or anyone feel free to express it
differently.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
