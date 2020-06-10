Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B01F4EDC
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 09:27:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DEAE3C2E30
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 09:27:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 04DA13C0196
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 09:27:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EBA33601200
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 09:26:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 647D6AEEB;
 Wed, 10 Jun 2020 07:27:38 +0000 (UTC)
Date: Wed, 10 Jun 2020 09:27:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20200610072732.GA32619@dell5510>
References: <20200609113421.10936-1-rpalethorpe@suse.com>
 <20200609165921.GA28805@dell5510>
 <fa3b9d86-84f7-be61-f06f-c32f3ab60d3a@linuxfoundation.org>
 <CACT4Y+bYdmD7vdNUayT86oiW8yVLUBdFLOZRJ1nTi9AE99KzSg@mail.gmail.com>
 <ce8bd6c0-0abb-e09e-b21f-5e769ffd3ab3@linuxfoundation.org>
 <20200609195851.GA29515@x230>
 <8b3cbf25-83ad-42da-f3ec-e2bafdfff97c@linuxfoundation.org>
 <874krjxuby.fsf@our.domain.is.not.set>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874krjxuby.fsf@our.domain.is.not.set>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Wrapper for Syzkaller reproducers
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
Cc: Dmitry Vyukov <dvyukov@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Shuah, Richard,

> > If this patch doesn't intend to update syzkaller-repo, there is
> > nothing to do for linux-arts. I thought that this patch is for
> > Dmitry's syzkaller repo I update from and looking get this into
> > linux-arts directly.

> > Since this is LTP patch, ignore my comments. Sorry for the noise.

> > thanks,
> > -- Shuah

> No problem at all, I should have made that more clear.

> Infact I will send a seperate patch to linux-arts mentioning the LTP
> wrapper.
Thanks you both for clarifying.

@Jan, @Cyril, @Yang, @Li: any ack/objection to this patch?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
