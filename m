Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E11353F2
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 08:58:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B415A3C23CC
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 08:58:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 773D43C23AF
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 08:58:38 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EEE681A00F5E
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 08:58:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F1B3EAEBF;
 Thu,  9 Jan 2020 07:58:36 +0000 (UTC)
Date: Thu, 9 Jan 2020 08:58:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Steve Dickson <SteveD@redhat.com>
Message-ID: <20200109075835.GB12486@dell5510>
References: <20191230201122.9749-1-petr.vorel@gmail.com>
 <e01fdaab-617b-dfc3-021c-ea04d0ab42cf@RedHat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e01fdaab-617b-dfc3-021c-ea04d0ab42cf@RedHat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] rpc-tirpc: Remove authdes related tests
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
Cc: libtirpc-devel@lists.sourceforge.net, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Steve,

...
> > or is it safe to expect that authdes is compiled out when authdes_create() returning NULL?
> This was the way the glibc people suggested I do it... 
Thanks for info (deprecating features in library is new thing to me).

> > I also decided to remove tests because authdes is deprecated and uClibc
> > and musl does not provide DES authentication.

> > FYI I've sent patch to libtirpc to add authdes_seccreate() interface [1].
> > [1] https://sourceforge.net/p/libtirpc/mailman/message/36889142/
> This is fixed in tag libtirpc-1-2-6-rc1 which I just pushed upstream.
Thanks!

> Is there anything else from my side that is needed?
Hope distros will backport the fix soon.

Can you please either ack this patch or request we detect authdes support
support (i.e. libtirpc < 1.2.5) and keep tests in this case?
(I'd be for removing these tests, but if you consider them useful for testing,
I'll do the detection).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
