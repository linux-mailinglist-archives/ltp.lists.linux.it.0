Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC5A22C947
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 17:32:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C32B63C4CFF
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 17:32:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2CFD83C061B
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 17:32:10 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8061E100274A
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 17:32:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3367B620
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 15:32:16 +0000 (UTC)
Date: Fri, 24 Jul 2020 17:32:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200724153205.GA28471@dell5510>
References: <20200724125052.20973-1-mdoucha@suse.cz>
 <20200724125052.20973-2-mdoucha@suse.cz>
 <20200724133247.GC24626@dell5510>
 <08409821-c9d4-d8a6-3393-b33dfa79fea4@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08409821-c9d4-d8a6-3393-b33dfa79fea4@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Add chdir() test for unprivileged user
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

Hi Martin,

> >> +++ b/runtest/syscalls
> >> @@ -54,6 +54,7 @@ capset04 capset04
> >>  cacheflush01 cacheflush01

> >>  chdir01 chdir01
> >> +chdir02 chdir02
> >>  chdir01A symlink01 -T chdir01
> >>  chdir04 chdir04
> > You missed to add chdir02 to runtest/quickhit. I guess this was deliberate,
> > right?
> > (I wonder if we really need runtest/quickhit anyway).

> Yes, this was deliberate since only chdir02 was there originally (the
> one that was checking only chdir("/"); and chdir("/etc");.
Understand, thanks for info.

> > I like both tests (nice work, thanks!), just don't like the duplicity. Isn't
> > there a way to use getopt parameter for one of the variants and have just single
> > test? But understand if you don't bother with it (maybe better duplicity but
> > simpler code).

> > Other that that LGTM.
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> I could add a second set of expected values to the test case list and do
> it like this:

> static void run(unsigned int n) {
> 	TEST(chdir(tc->name));
> 	/* result validation here */
> 	SAFE_SETEUID(ltpuser->pw_uid);
> 	TEST(chdir(tc->name));
> 	SAFE_SETEUID(0);
> 	/* result validation here */
> }
LGTM, thank you!

> Should I resubmit that as v3?
Yes, please.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
