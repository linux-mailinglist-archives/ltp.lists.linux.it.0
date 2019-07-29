Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D11A78873
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 11:31:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC6A23C1D4B
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 11:31:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2E6563C1D0D
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 11:31:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3FD9010006C2
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 11:31:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 01F17B60D;
 Mon, 29 Jul 2019 09:31:50 +0000 (UTC)
Date: Mon, 29 Jul 2019 11:31:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190729093154.GA20376@dell5510>
References: <20190725211119.239938-1-smuckle@google.com>
 <20190729085606.GA25517@dell5510> <20190729090140.GA22913@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729090140.GA22913@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/sendmmsg: add new test
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Steve,

> > > Changes since v3:
> > >  - drop resending of messages on partially successful sendmmsg()
> > >  - drop use of pthreads, do message creation and port management in
> > >    setup/cleanup

> > The only thing left in v4 is duplicate LTP_CHECK_MMSGHDR call.
> > + I'd use lapi/socket.h also in cve-2016-7117.c (as Cyril pointed out)
> > in this commit (this change is simple enough).

> > So I'd be for merging v4 with diff below.

> There is also leftover -pthread in CFLAGS in Makefile since we dropped
> pthreads from the test. Other than that and the minor issues you have
> pointed it looks good to me as well.

Cyril, thanks for pointing this out. Merged with these fixes and your ack.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
