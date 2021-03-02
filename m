Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 018373299CC
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:26:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5963F3C5730
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:26:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A181D3C56C2
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:26:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1CB00600C35
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:26:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CBAFB07D;
 Tue,  2 Mar 2021 10:26:12 +0000 (UTC)
Date: Tue, 2 Mar 2021 11:26:10 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YD4SwkQYyBxMWaay@pevik>
References: <20210301220222.22705-1-pvorel@suse.cz>
 <20210301220222.22705-6-pvorel@suse.cz>
 <CAEemH2cr0TFvFiis_05Fh4bEe1ZUmFtMO5ysYFped5ZQYucvAg@mail.gmail.com>
 <YD4Ny76lh0+ydBqQ@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YD4Ny76lh0+ydBqQ@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/7] tst_test.sh: Introduce
 tst_set_timeout(timeout)
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > > +tst_set_timeout()
> > > +{
> > > +       TST_TIMEOUT="$1"


> > Not sure if we should check "$1" is valid again before using it.

> > I guess in most scenarios, the function is invoked by tests, so
> > just needs to guarantee $1 > $TST_TIMEOUT, otherwise, it
> > looks meaningless to reset TST_TIMEOUT?
> > (especially to avoid people set a smaller value by a typo)

> I can image where it may make sense to set the timeout smaller than
> default dynamically. If we had a test that consists of many iterations
> whose number depends on the actuall system we run on (the same as the
> supported filesystem) but if the iterations are rather quick we may end
> up in a situation where we run only one iteration and we will attempt to
> set a timeout smaller than default in the setup() which wouldn't be
> wrong.
+1, I couldn't agree more.

> Hence I would check that the value is greater than zero here instead.
I'd allow also to disable timeout with -1. And the rest of the checks
(i.e. int -1 or > 0) is in _tst_setup_timer().

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
