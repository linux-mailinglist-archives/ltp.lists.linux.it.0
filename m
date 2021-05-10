Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E72DC377F7C
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 11:37:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 962993C654B
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 11:37:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 328DF3C4F4F
 for <ltp@lists.linux.it>; Mon, 10 May 2021 11:37:54 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8BB6820015C
 for <ltp@lists.linux.it>; Mon, 10 May 2021 11:37:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B846BB1D0;
 Mon, 10 May 2021 09:37:52 +0000 (UTC)
Date: Mon, 10 May 2021 11:11:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YJj4wftakLE7PECd@yuki>
References: <YJOYgZNL7/qp5YCN@yuki> <YJPo4L0QnXHU7xks@pevik>
 <YJVPP64LuDK7O564@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJVPP64LuDK7O564@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>, ltp@lists.linux.it,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > also solving Shell API timeout sleep orphan processes would be good [1]
> > There is already C patch [2] + Li suggested to fix the shell implementation
> > using trap in subshell [3].
> OK there is shell implementation to fix orphan processes [4] from Joerg, which
> would be worth do fix it, Li already did a review, I'll look into it today.

I would like to get to a git freeze soon. I will have a look as well but
if it's not ready in the first half of this week I would just postpone
it rather than rush it.

> I'd like to rebase and send to ML IMA dm-crypt test for testing. If Mimi, Tushar
> or Lakshmi find time to test it, I'd like to have it in the release.

Here as well, if things are tested and ready soon enough then go ahead
and apply it.

I would like to freeze the git and start pre release testing, if
possible, in the second half of this week. If there is anything else
that should be fixed please speak up now.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
