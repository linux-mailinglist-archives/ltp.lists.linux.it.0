Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 810911D9448
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 12:24:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BC423C4E66
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 12:24:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 004853C2240
 for <ltp@lists.linux.it>; Tue, 19 May 2020 12:24:29 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E54AD14019B3
 for <ltp@lists.linux.it>; Tue, 19 May 2020 12:24:28 +0200 (CEST)
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MDgxt-1jk1yl0okx-00Aplw for <ltp@lists.linux.it>; Tue, 19 May 2020
 12:24:28 +0200
Received: by mail-qk1-f169.google.com with SMTP id y22so14219129qki.3
 for <ltp@lists.linux.it>; Tue, 19 May 2020 03:24:27 -0700 (PDT)
X-Gm-Message-State: AOAM531Qk/c11NNVxiWwLhP0/INiOf4bE12eV8Zqo3tCzSoqyfIzt84I
 SlXsguOfojxpYQcdkLYSTOHVDMWkSibn8GLkBNM=
X-Google-Smtp-Source: ABdhPJz2RCgKKBFx4Aj6SWG0mI+AJj8fjF6Z4m6ZVlI8kO7N1HDmZ2d/5Y68/vqR0CiSmOel0ei3LUhwlMu2Yfkb+i4=
X-Received: by 2002:a37:434b:: with SMTP id q72mr21163059qka.352.1589883867018; 
 Tue, 19 May 2020 03:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <931bddab3d92f73f07f32dd7e1770078fdc07e0e.1589877853.git.viresh.kumar@linaro.org>
 <CAK8P3a3LkUoJs-2yj_F8LpgiGQC6auLVSSuB3QCKOr+NwUhnHQ@mail.gmail.com>
 <20200519092539.klvwkmzduk3zkds3@vireshk-i7>
In-Reply-To: <20200519092539.klvwkmzduk3zkds3@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 May 2020 12:24:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3TuR+K7Ho28pORzp4rrtBjDfQ8ibROfCqnR0iPesFUhw@mail.gmail.com>
Message-ID: <CAK8P3a3TuR+K7Ho28pORzp4rrtBjDfQ8ibROfCqnR0iPesFUhw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:6RdFrNdsgznRabnlHSAxVDShvpGZH+ACyPCxM4/qBKh1tji1s7N
 PjIS7QY0FkyBO1Xig/CTags16E4SNQMVuEgQkMomoIlVtSNNoxcsRtwRgJbnm3feRqkQS4M
 eHMNhrxDDreFm44lu37UJlIz862eS+EGmrC//yK3UtIyO2Pn4NmwfTyf2udzfs6E4CFYFqV
 5M/V4DzLNBWSoCv95Zk6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iJZ1lSSDeRo=:dunLUo5jF6cB7+QWOQDL0d
 Ym6rIk045GPLcdM0IiPZDfefywsFp/REa2IPPky7kBQ2J+z35Hhq25Wkyi0odA8Pnbego1ZPw
 kXb9pcGkHs9QxzphpXu8xFyVXhzO7ZljZUgESOvQib5+e577ibmWVT9QEKbEr0+tYrJx9J2cD
 11jHWEBEg/pIk7dr6E0Sqtwq1jjyxBYqs0eShPzawnHxIkb98qRMfCNhYk8zBYRREh6SaBJO5
 5yY0lzo7TpyL0BeHJYLJGYgLAreQw5+putgPlNJdtUIYoprIk5YFZgYHoDGYbjT2WtBeyd1DH
 qMsU6qtlSUQkpL0hmbKC5RXD+xDLawhXawDNgazSaAeuOuuWA2esf1GYuTut2Y99ASUjHTUZ+
 KOb+A7rsPzY2GKv49y8bhyUK7LnM//VxNOghVowxpJ+jnCN+B2m4ueXKwwV002gvPSjwY5S6p
 oRrECXO0JUG/3PZZqALZpA8TNfEyQdjjlpEclCJcTQtQInnYeSVr8m+w8JBq8BO/9CzAwdMdO
 fI/WvVvpCeK2a8lJo7aC/yhlCH/6P+Z0wHPnOKoFxKjimc/J3VNDTIYJpPaFMyGL4sIQ+hTBh
 m8/0NhWK+GvEOvwYUGwT7M/OO3FNxKDRhCcfo0NvQcIDbe+ov9bQe527trrP2UBNm0dKKFagc
 dynY2V0sS91qR1lNl7O4NZDs531O4roKynHzt/t5F+fXgmX6mEqhcctNhmqK/xD49nqC00+6A
 RlY7HdOwAuFWalZauHIL40lUp5CJKPDnfk6jXfZBdKcIcZqJeLg3YOWxs8FtIXA0aManKU29D
 OyhVVtGJKgs1Z+wznp1NaBlGNZaQLTovEJgR3YK8+Ss+QcDUjo=
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/5] syscalls: settimeofday: Use gettimeofday()
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

On Tue, May 19, 2020 at 11:25 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 19-05-20, 11:20, Arnd Bergmann wrote:
> > On Tue, May 19, 2020 at 10:51 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > Use gettimeofday() instead of calling it with tst_syscall().
> > >
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > ---
> >
> > I think the change makes it work reliably, but it does change what you
> > are testing for: instead of testing the low-level system call interface,
> > this will now test the libc interface, which is implemented on top
> > of the vdso or clock_gettime().
>
> Actually the testcase was for settimeofday() and we were unnecessarily
> calling gettimeofday with tst_syscall(). And so the testcase should
> remain unaffected that way. Had this been a testcase for
> gettimeofday(), I would have agreed with you.

Ok, makes sense. Just mention in the changelog text that this fixes
running against an updated libc with 64-bit time_t in that case.

       Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
