Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 552F678BDD
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 14:36:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 239453C1D22
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 14:36:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C8EEE3C1CFD
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 14:35:58 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 70B31600954
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 14:36:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 32652AE8C
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 12:35:57 +0000 (UTC)
Date: Mon, 29 Jul 2019 14:35:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190729123557.GA9131@dell5510>
References: <20190729120222.4717-1-pvorel@suse.cz>
 <20190729121719.GA25075@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729121719.GA25075@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/clock_gettime: Ported
 clock_gettime03.c to new API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > NOTE: test is still a mess, even after porting it.
> > Cleaning it up would probably be its own patch as the best
> > solution would be to rewrite it from scratch.

> The patch looks good, acked.

> There are couple of things that could be done to make the code cleaner.
> For instance we should make use of the .restore_wallclock flag in the
> test structure. But let's do that in a subsequent patches.
+1

> Also I'm not 100% sure that this test belongs under the clock_gettime/
> directory, we do call clock_gettime() in the main test function but the
> whole test is about inserting leap second. Maybe we should keep the test
> under the clock_gettime directory and rename it to leapsec01.c or
> something like this, but I'm not 100% sure about this.
+1 Before 0051eab23 it was called leapsec_timer.c. I also consider leapsec01.c
as more descriptive. Anyone else against renaming it?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
