Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D91CA71C
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 11:24:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E93583C56EA
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 11:24:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AFA5C3C56D4
 for <ltp@lists.linux.it>; Fri,  8 May 2020 11:24:38 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 91DD41401AA8
 for <ltp@lists.linux.it>; Fri,  8 May 2020 11:24:37 +0200 (CEST)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mzhf5-1jAw573dLt-00viE6 for <ltp@lists.linux.it>; Fri, 08 May 2020
 11:24:37 +0200
Received: by mail-qk1-f170.google.com with SMTP id k81so890754qke.5
 for <ltp@lists.linux.it>; Fri, 08 May 2020 02:24:36 -0700 (PDT)
X-Gm-Message-State: AGi0PubK4syLDjcHWHEMb6R0ICFLy9NgqQYzuUyp9Wm61j9wRSP41CXA
 5x83Y421xz+5L1BRvpgzHjSNp+VBv65hILUe/LM=
X-Google-Smtp-Source: APiQypKyUEyT+A/rJn09XBWkOsWdu1VEgFunCZaeFcDXC3epfub1ws426RbaNfV+eomfYksl/+SJCfR25hRc0pXh+4w=
X-Received: by 2002:a37:b543:: with SMTP id e64mr1763608qkf.394.1588929875647; 
 Fri, 08 May 2020 02:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
 <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
 <20200508085657.ousiwqakcq7zegpo@vireshk-i7>
In-Reply-To: <20200508085657.ousiwqakcq7zegpo@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 May 2020 11:24:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0PCX_KzKLVD7ZT10xxpOXapUh8o5hhE5OOzyPjxf=GAw@mail.gmail.com>
Message-ID: <CAK8P3a0PCX_KzKLVD7ZT10xxpOXapUh8o5hhE5OOzyPjxf=GAw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:SpFZGU85ECqYrCQa512cgYeX18P7Fe3+DLR4YBsHuhkPsERvuMU
 CcATk4m1lf5Bry8uBAOURHwmfl6FwsknGYRyL5KYT9dmaTIJYxBm+4VijhkO3JOcg5a/ury
 nT9y9t+RQrltxh7Pe/xrCslSNZLZP4ngR3M1JBYztjR4siYMgWJwAakAL4xXc+1/aVnacwA
 QhasXWxhrd0W9d0+ZwZxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uHqAeoDbhUo=:frdiUTpvVGiHY3V/57FbGU
 0/iol28UADbXMtkEpXtfIAghX0plZ09pvV5wdIl5lYdGRblT7rnkmFuZ0IVOz27z0hBa5jIko
 CZHcwyGiGWuo8YycymM/E+uk25xSOai5yIqkI+LIVyoquz4BH3bIsdMyVZML7eVPepJ5tSM37
 tT8iURzbkAn5gOEJle07hN0BxSFrLYgDU/O9rAwgJOCW3mZOzHG4NUf759bexJ8bOx5563T5D
 q+lWKNiyqn6nfxcDXBd+l1oNOEZJFtvHbQyBUemXsEH4YMcg0nZBLI19190s0E0707DqTeMgX
 LThaS5WauYQUWb9r2u2Rv2NIK+c4OjJIXdy6L6Ua2FPqvOJBtSrtYZ8ZPcvGayuYVlFl+O0/Q
 V6jm95vQvb1yTB7e8UIT34cv5buPB6/5SY4n8K38ycfBrNYc7uronDA1/A2Ir8xLjumbi+Tvw
 2+2DLZ3ag4JcRgrok/SzAYNrQJT4jxCrtEippUbSEkgoTYoQ/BsNz6+1E4s80UERbWRAnaVfm
 4CINj3rBQkHaRX4WAt++K3KhftClHOd0su+X6s6UWIeKf1GdIKmEm/iIIJ9KOhmaAujpEOvbO
 yXsGjBAUB4fy19fSfzWobNDylfL5bywx7ZQf3pmQf1zBLZEAl3/2cgVYKaKgoQ6f9Yo5fYXo4
 VLMNipO6zrLy7xz0K8GHtjShKcqDbQU3Q//fWp7y5j23n5coHPOuYYU5bMeUcgCo680HIH8/Q
 AQd0v+4gYLiGRvmM2EbMoSckdht8G2mAFBZkV9SXo46Bf0VBQBkCFnDhEjhJEy0wjQnjOBfJI
 LVWc1dw66CSVepOWvgzVRcCeS/lA5Ngj18jnbcjUFkYOn5JnmX/sz1YxdhOasZjA851LK1tLX
 uFgyifp+8PmKyhCq8cKF8BY7yfSqhJPdrbsAxoS7H33YZ3dXmdIM/GKgoziIiBwssg351JVpn
 89j42BWEOeA==
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, May 8, 2020 at 10:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 08-05-20, 09:18, Arnd Bergmann wrote:
> > On Fri, May 8, 2020 at 6:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > > +
> > > +static inline int sys_semtimedop(int semid, struct sembuf *sops, size_t nsops,
> > > +               void *timeout)
> > > +{
> > > +       return tst_syscall(__NR_semtimedop, semid, sops, nsops, timeout);
> > > +}
> > > +
> > > +static inline int sys_semtimedop_time64(int semid, struct sembuf *sops,
> > > +                                       size_t nsops, void *timeout)
> > > +{
> > > +       return tst_syscall(__NR_semtimedop_time64, semid, sops, nsops, timeout);
> > > +}
> > > +
> > > +struct test_variants {
> > > +       int (*semop)(int semid, struct sembuf *sops, size_t nsops);
> > > +       int (*semtimedop)(int semid, struct sembuf *sops, size_t nsops, void *timeout);
> > > +       enum tst_ts_type type;
> > > +       char *desc;
> > > +} variants[] = {
> > > +       { .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},
> > > +#if defined(TST_ABI32)
> > > +       { .semtimedop = sys_semtimedop, .type = TST_LIBC_TIMESPEC, .desc = "semtimedop: syscall with libc spec"},
> > > +       { .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with kernel spec32"},
> > > +#endif
> > > +
> > > +#if defined(TST_ABI64)
> > > +       { .semtimedop = sys_semtimedop, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall with kernel spec64"},
> > > +#endif
> >
> >
> > It feels like this is more complicated than it need to be. The line
> >
> > semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc =
> > "semtimedop: syscall with kernel spec32"},
> >
> > should apply to any kernel that has "__NR_semtimedop !=
> > __LTP__NR_INVALID_SYSCALL",
> > regardless of any other macros set, and then you don't need the separate line
> >
> > { .semtimedop = sys_semtimedop, .type = TST_KERN_TIMESPEC, .desc =
> > "semtimedop: syscall with kernel spec64"},
>
> > which is not what the ABI is meant to be anyway (sys_semtimedop takes
> > a __kernel_old_timespec,
> > not a __kernel_timespec).
>
> There is some misunderstanding here, surely from my side. The sys_
> helpers here are the direct syscalls called from userspace with help
> of tst_syscall().
>
> AFAIU, on 32 bit systems we need to call __NR_semtimedop with the 32
> bit and 64 bit timespec (both), and on 64 bit systems which don't
> implement __NR_semtimedop_time64, we need to call __NR_semtimedop with
> the 64 bit timespec only.
>
> What you are telling now is very different from that and so I don't
> get it.

__NR_semtimedop can only be called with the 'old' timespec, which
may have either 32 or 64 members depending on the architecture.
On x32 it uses 64-bit members, and on riscv32 it does not exist at all.

I think you already have a correct __kernel_old_timespec definition,
so what I'd expect to see here is code that passes __kernel_old_timespec
into __NR_semtimedop whenever __NR_semtimedop is defined.

Passing the libc timespec into __kernel_old_timespec is a bug, as
the libc may be using either the old or the new (always 64-bit)
definition.

> >  { .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},
> >
> > should apply to both 32 and 64 bit machines
>
> Yes and so it is called without ifdef hackery. Isn't that correct ?

My mistake, I confused the lines. What I meant is that there should
be an unconditional test of the libc 'semtimedop' with the libc 'timespec'
definition.

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
