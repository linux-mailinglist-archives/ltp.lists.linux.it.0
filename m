Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 385CD16FA8E
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 10:20:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E23093C2555
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 10:20:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8126A3C251E
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 10:20:46 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2E4686008DD
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 10:20:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9A6F4AD5E;
 Wed, 26 Feb 2020 09:20:45 +0000 (UTC)
Date: Wed, 26 Feb 2020 10:20:43 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200226092043.GB2215@dell5510>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <e12560056ebc632918426194172a6cba48953d4e.1582612624.git.viresh.kumar@linaro.org>
 <20200225135709.GC62318@gacrux.arch.suse.de>
 <20200226022758.ls35mblsetg4nk6f@vireshk-i7>
 <20200226074729.GA15207@dell5510>
 <20200226082318.eq5ozhgg2myscpqt@vireshk-i7>
 <20200226085303.GA30488@dell5510>
 <20200226085927.xuwos7nbcfehfckj@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226085927.xuwos7nbcfehfckj@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 08/10] syscalls/move_mount: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> > > I don't think that is the case. tst_res(TBROK, ...) shouldn't (and
> > > isn't for me) result in skipping of tests.
> > Correct, tst_res() itself doesn't exit the test. But the fact it uses TBROK
> > without reporting any result previously leads to tst_brk from the library:

> > tst_test.c:1036: BROK: Test haven't reported results!

> Ahh, I missed this part then.

> > > Right, but in my case I can't put all setup stuff in setup() callback
> > > and some of the setup bits stay in run() callback as well.
> > Sure. But as a result of it I'd personally use tst_res(TFAIL).
> > But maybe I'm wrong and others will correct me.

> FWIW, I am the least educated guy here in terms of LTP stuff :)
You're doing well :).

> I just want to make sure I don't need to do it again and so wanted to
> better understand TBROK vs TFAIL thing.
+1.

> So the conclusion is that in the run() callback we should always use
> TFAIL ?
I'd wait on the outcome of the discussion here
https://patchwork.ozlabs.org/patch/1244781/

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
