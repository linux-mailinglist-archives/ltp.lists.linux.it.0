Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A58D61FCD35
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 14:21:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 451813C2CB7
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 14:21:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7A7A23C2CA7
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 14:21:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 392741A0118F
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 14:21:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A024AAD8C;
 Wed, 17 Jun 2020 12:21:55 +0000 (UTC)
Date: Wed, 17 Jun 2020 14:22:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200617122206.GB8389@yuki.lan>
References: <cover.1590130423.git.viresh.kumar@linaro.org>
 <c5428a9c88d18fac80e364281cfd4e3aefa38d2c.1590130423.git.viresh.kumar@linaro.org>
 <CAK8P3a2B35hUF3rSdJpS=M-Wekm+wUx-skekgw3CiQR=wodqXw@mail.gmail.com>
 <20200522084205.hvkx4maxujzb2s2y@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522084205.hvkx4maxujzb2s2y@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 5/6] syscalls: Don't pass struct timespec to
 tst_syscall()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > >  int tst_clock_getres(clockid_t clk_id, struct timespec *res)
> > >  {
> > > -       return tst_syscall(__NR_clock_getres, clk_id, res);
> > > +       int (*func)(clockid_t clk_id, void *ts);
> > > +       struct tst_ts tts = { 0, };
> > > +       int ret;
> > > +
> > > +#if defined(__NR_clock_getres_time64)
> > > +       tts.type = TST_KERN_TIMESPEC;
> > > +       func = sys_clock_getres64;
> > > +#elif defined(__NR_clock_getres)
> > > +       tts.type = TST_KERN_OLD_TIMESPEC;
> > > +       func = sys_clock_getres;
> > > +#else
> > > +       tts.type = TST_LIBC_TIMESPEC;
> > > +       func = libc_clock_getres;
> > > +#endif
> > > +
> > > +       ret = func(clk_id, tst_ts_get(&tts));
> > 
> > This is not enough to run on old kernels that have __NR_clock_getres
> > but don't have __NR_clock_getres_time64,
> 
> What about reversing the order of the two ? Check __NR_clock_getres
> first ?
>
> > you need a runtime fallback
> > instead of a compile-time fallback.
> 
> Why so ?

The existence of the __NR_... does not mean that particular syscall is
supported or even exists. As said previously LTP defines unimplemented
syscalls to -1 to avoid #ifdef hell.

Also even if the 64bit syscall is defined in headers on particular 32bit
platform calling it on old kernel will still fail because the
functionality is simply not there.

Hence we have to select the right function on the first call to the
tst_clock_* functions.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
