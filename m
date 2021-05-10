Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D18337913B
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 16:47:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9CDA3C66FC
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 16:47:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C4E93C2646
 for <ltp@lists.linux.it>; Mon, 10 May 2021 16:47:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 13DD360029A
 for <ltp@lists.linux.it>; Mon, 10 May 2021 16:47:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AFC0B131;
 Mon, 10 May 2021 14:47:27 +0000 (UTC)
Date: Mon, 10 May 2021 16:47:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJlHfa/E+eNchQQE@pevik>
References: <YJOYgZNL7/qp5YCN@yuki> <YJPo4L0QnXHU7xks@pevik>
 <YJVPP64LuDK7O564@pevik> <YJj4wftakLE7PECd@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJj4wftakLE7PECd@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] LTP Release
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>, ltp@lists.linux.it,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > > also solving Shell API timeout sleep orphan processes would be good [1]
> > > There is already C patch [2] + Li suggested to fix the shell implementation
> > > using trap in subshell [3].
> > OK there is shell implementation to fix orphan processes [4] from Joerg, which
> > would be worth do fix it, Li already did a review, I'll look into it today.

> I would like to get to a git freeze soon. I will have a look as well but
> if it's not ready in the first half of this week I would just postpone
> it rather than rush it.

> > I'd like to rebase and send to ML IMA dm-crypt test for testing. If Mimi, Tushar
> > or Lakshmi find time to test it, I'd like to have it in the release.

> Here as well, if things are tested and ready soon enough then go ahead
> and apply it.
I was wrong, the last bit has not been upstreamed, thus only first commit can be
merged.

> I would like to freeze the git and start pre release testing, if
> possible, in the second half of this week. If there is anything else
> that should be fixed please speak up now.
Good to know.

I suppose you're going to merge Martin's (rt)netlink patchset [1]
(I'd prefer to get it merged).

My netns_netlink rewrite + fix for recent ip [2] would be nice to get merged.
In the future I'll add a check for that prehistoric iproute 100519.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=242146
[2] https://patchwork.ozlabs.org/project/ltp/patch/20210401141210.9536-1-pvorel@suse.cz/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
