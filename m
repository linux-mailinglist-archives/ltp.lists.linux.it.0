Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 170212168BE
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 11:02:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62C713C29CE
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 11:02:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2FAAB3C29AD
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 11:02:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6A90C625E00
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 11:02:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1B3AAF70;
 Tue,  7 Jul 2020 09:02:43 +0000 (UTC)
Date: Tue, 7 Jul 2020 11:03:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200707090301.GA3512@yuki.lan>
References: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
 <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
 <CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com>
 <20200703125927.GA11556@yuki.lan>
 <CAEemH2cN735haDmyqbNa_LwDgumFqAspYfJaKRpsOg0Rij9tEA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cN735haDmyqbNa_LwDgumFqAspYfJaKRpsOg0Rij9tEA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 5/6] syscalls: Don't pass struct timespec to
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Donghai Qiao <dqiao@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
> > index bc0bef273..c0727a34c 100644
> > --- a/lib/tst_clocks.c
> > +++ b/lib/tst_clocks.c
> > @@ -14,11 +14,11 @@
> >
> >  typedef int (*mysyscall)(clockid_t clk_id, void *ts);
> >
> > -int syscall_supported_by_kernel(mysyscall func)
> > +int syscall_supported_by_kernel(long sysnr)
> >  {
> >         int ret;
> >
> > -       ret = func(0, NULL);
> > +       ret = syscall(sysnr, func(0, NULL);
> >
> 
> This line should be: ret = syscall(sysnr, 0, NULL);

This is obvious typo, sorry.

> >         if (ret == -1 && errno == ENOSYS)
> >                 return 0;
> >
> > @@ -32,13 +32,13 @@ int tst_clock_getres(clockid_t clk_id, struct timespec
> > *res)
> >         int ret;
> >
> >  #if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)
> > -       if (!func && syscall_supported_by_kernel(sys_clock_getres64)) {
> > +       if (!func && syscall_supported_by_kernel(__NR_clock_getres64)) {
> 
> 
> if (!func && syscall_supported_by_kernel(__NR_clock_getres_time64 )) {

Huh, how come the syscall is called clock_getres_time64 while the rest
has only 64 appended such as clock_gettime64 and clock_settime64?

That's really strange...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
