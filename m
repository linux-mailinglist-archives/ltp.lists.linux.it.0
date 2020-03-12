Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64537182AE6
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 09:11:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 191673C5E75
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 09:11:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0CAD53C5E58
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 09:11:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 953DA2014A4
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 09:11:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B728AFA1;
 Thu, 12 Mar 2020 08:11:55 +0000 (UTC)
Date: Thu, 12 Mar 2020 09:11:53 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200312081153.GA16928@dell5510>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <495a95969c63d67868b82d2b15bd663f19780d0e.1582779464.git.viresh.kumar@linaro.org>
 <20200306131046.GC3375@rei.lan>
 <20200311072502.hpj5bycslu6ygk74@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311072502.hpj5bycslu6ygk74@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 04/10] syscalls/fsopen: New tests
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

> > > +	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
> > > +			MOVE_MOUNT_F_EMPTY_PATH));
> > > +
> > > +	SAFE_CLOSE(fsmfd);
> > > +
> > > +	if (TST_RET == -1) {
> > > +		tst_res(TFAIL | TERRNO, "move_mount() failed");
> > > +		goto out;
> > > +	}
> > > +
> > > +	if (tst_is_mounted(MNTPOINT))
> > > +		tst_res(TPASS, "%s: fsopen() passed", tc->name);
> > > +
> > > +	SAFE_UMOUNT(MNTPOINT);

> > I gues sthat the SAFE_UMOUNT() should be inside of the if here and in
> > the rest of the testcases.

> Petr had a similar comment earlier and here is my explanation to it.

> There should always be a unmount() in response to a successful call to
> mount() APIs. What if, because of some other bugs in the kernel or
> testsuite, tst_is_mounted() returns 0? We should still do the
> unmount() part as the mount() API didn't return an error.
But IMHO if device is not mounted we get TBROK due EINVAL in safe_umount().
I'd understand if this was in cleanup function where TBROK turns to TWARN.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
