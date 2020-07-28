Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C22304DC
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 10:02:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86CA73C2681
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 10:02:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A25DC3C176D
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 10:02:36 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E70B91A01760
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 10:02:35 +0200 (CEST)
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mk0e8-1kg1350smm-00kQuB for <ltp@lists.linux.it>; Tue, 28 Jul 2020
 10:02:35 +0200
Received: by mail-qk1-f171.google.com with SMTP id 11so17875382qkn.2
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 01:02:34 -0700 (PDT)
X-Gm-Message-State: AOAM532r33zVR+fPP/AR6vVqvaQWArsG9pQkLONvsK2eo2TxG69je6Bk
 88MQFK1pEPbDLYrzuZZ4Jh7ITmmzvP7Q1QVVq9E=
X-Google-Smtp-Source: ABdhPJxe/hcItSZ7pxt0Nb2clT/OANcAfgwxku7KmeU4MVPcPkSHFBfsn3AXaManQyOnbV2UwQvMEPnsQ03E7+CCLno=
X-Received: by 2002:a37:9004:: with SMTP id s4mr26287161qkd.286.1595923353974; 
 Tue, 28 Jul 2020 01:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <883a188e83c201b23074bf0ac974b41d89d818c7.1593152309.git.viresh.kumar@linaro.org>
 <20200727094030.GB7863@yuki.lan>
 <20200728072357.22lyy2b4auyqqmvs@vireshk-mac-ubuntu>
In-Reply-To: <20200728072357.22lyy2b4auyqqmvs@vireshk-mac-ubuntu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Jul 2020 10:02:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a24BOOnKoiEQbbihp_m34NZXfQgb=Xcrg+TmLHTLO9Cbg@mail.gmail.com>
Message-ID: <CAK8P3a24BOOnKoiEQbbihp_m34NZXfQgb=Xcrg+TmLHTLO9Cbg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:/xSNypvejY04jdK9sa1LlOuNMSRHy/rAVhTTsQSWP+LeUebwNmL
 LtggdRQJ2Oq6QSNvFJM64PaaNr6iQ7MFt/ccV4nlvUAvEMSi7eW1tuqcdEJ5mexEkkjyQbf
 dGDZ15CTumuwN0rW8YhccZYxLWDXWb9gEcWXyu0tUVbPUGBfpOi7Rx17/IAoeQeES6Zy6H7
 MfirVYvGVkg8Ztr0jcuOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1zqdTkJ7ObY=:+ffMqC9IltMsCAFe2MRfuv
 A8z4MFuuBf4w9BF8/tiBvRO2B8y1C8vPimitvedB9HMHAUbzEHQmryWNn6NIr1UHAPY3a9ZjJ
 CaF/d6WX4Oqap1kC6LjuN02XFMcylzSmWVWhJGM/ccmcfV2Ooj4GeT395fy2AP32AIv7NwmH/
 V4zEOpbn+IkJcMV8C7K6iH05jf+To0l+IlLJ+TVf5Cy+dj/k1viVOQgEM/zdK5xqoUjwBGZik
 xmrxJWiFHpzaDFSGzTA6XW1y/Kll33SjWyCDqTodVYGxPKQGeAUKyJoLwHQBuwnwb/EaekUYu
 eJmkoFj4kqW/dUbhNpfpqRLh3nNDSdddjScwoP+1YjPsZ+XU+/0gKli67ltTQ0daxEMgkXUmY
 h19c2VW+kQ6T5CXP7rRCrgb/+8tx+aUjBjVsqZkXKnKWKjja6fOmnM8PlWmcRKds17Ddl8smr
 nJDGwd2XqS/yvdmrMmh43gIKVvoaY9AVmJ/RS6nSXkinbVr8JE33b0xU7/hLPC3CgQsfv2eJB
 hRny/OyEDli4XSLoFsKWtcuhFW35mCqe3x5NIA0q2wyhr0PiJDnkF4I5ez5xF8cpYdZ87+KJI
 vfXxYfamtOMOCeHTg9lDbJYsJfVIMsUmePPCyxpAyRvDRWWcRuLOsEX7s/TmK6eyxgy8W8jF1
 KVhxsNpOWvie/67Y9kd7SKvjH+NJSSQ1qFzx0Yzx63u2ClciCHcMPaAuRzkl/uFnrI61ImjKJ
 qH0E7CyoY3XvSMJZuyPvymOAEsXDppyZju9CIEuvamaR6OHHv+hiwnQeqAuiqPLX/yvqH8/yw
 8o7KLcuByauXCnHDF/yMlI7Jl8aSa/lKy1WAB7ulTFI+PDaAf2CP//s2/hCKv8JAj85IlqeHg
 blWATEBEa0JW2lK2xNfWncRCnHUpHzuGCbpb8FuMMX0KkeAv6bH4ZQTJrLL/ngrDliPCgiq1l
 +aSoAi6kAjuCCnd4gdUA9CzEAM11A32XPtAIuNe2JERz5IVuqlBIQ
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 14/19] syscalls/select6: Add support for time64
 tests
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

On Tue, Jul 28, 2020 at 9:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 27-07-20, 11:40, Cyril Hrubis wrote:
> > > @@ -38,7 +39,7 @@ static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
> > >     }
> > >     case 2: {
> > >             int ret;
> > > -           struct timespec ts = {
> > > +           struct __kernel_old_timespec ts = {
> > >                     .tv_sec = timeout->tv_sec,
> > >                     .tv_nsec = timeout->tv_usec * 1000,
> > >             };
> >
> > I'm a bit lost here, should we actually pass the __kernel_old_timespec
> > to all the tst_syscall() fuctions here?
>
> select, pselect6, pselect6_time64, and newselect, all have different
> requirements, some take timespec and others take timeval.
>
> Though after looking again at kernel sources I feel pselect6 may need
> __kernel_timespec instead of __kernel_old_timespec, which is different than what
> we did with other syscalls.
>
> Arnd, can you confirm this please ?

On the kernel side, there is '__NR_pselect6', which refers to the syscall
that takes a 'struct __kernel_old_timespec'., while 32-bit architectures
have another syscall with the number __NR_pselect6_time64 that
takes a 'struct __kernel_timespec'.

The kernel implementation internally uses sys_pselect6_time32()
for the entry point that takes a 32-bit time_t (__NR_pselect6 on
32-bit architectures), and sys_pselect6() for the entry point
that passes a 64-bit time_t (__NR_pselect6 on 64-bit architectures
or __NR_pselect6_time64 on 32-bit architectures).

> > I guess that the only function that would take the argument as struct
> > timeval is the select() glibc function, or do I miss something?
>
> select in kernel also takes old timeval.

Correct, though most modern architectures do not implement this
and only provide pselect6 (and pselect6_time64).

> > > @@ -72,11 +88,14 @@ static void select_info(void)
> > >             tst_res(TINFO, "Testing SYS_pselect6 syscall");
> > >     break;
> > >     case 3:
> > > +           tst_res(TINFO, "Testing SYS_pselect6 time64 syscall");
> > > +   break;
> > > +   case 4:
> > >             tst_res(TINFO, "Testing SYS__newselect syscall");
> > >     break;
> > >     }
> > >  }
> > >
> > > -#define TEST_VARIANTS 4
> > > +#define TEST_VARIANTS 5
> >
> > Also lastly but not least we should clean up the rest of the select
> > tests and add support for the different variants there as well.
>
> Maybe not. IIUC only pselect6 got changed to adapt to different timespec
> structures and the other ones aren't.
>
> Arnd: Can you confirm this as well ?

Yes, this is correct. __NR__newselect (sys_select) and __NR_select
(sys_old_select or sys_select) are both considered obsolete and only
provided on older architectures for backwards compatibility with old libc
versions.

       Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
