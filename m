Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A181618F1D4
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:31:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4FD93C4E48
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:31:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 40F7A3C0430
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:31:14 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7517B1A01113
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:31:13 +0100 (CET)
Received: from mail-lf1-f43.google.com ([209.85.167.43]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N9dbx-1jM4X72gp3-015YFa for <ltp@lists.linux.it>; Mon, 23 Mar 2020
 10:31:12 +0100
Received: by mail-lf1-f43.google.com with SMTP id j15so9632740lfk.6
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 02:31:12 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0Vqrj1IZG8z5HBNA51DewD5YuZZQIwJiMFgNvJ45+iBvtSbX4a
 XgeZ2PqgM071KB9qgD82NhbgRKQmUFw/GwCRBqc=
X-Google-Smtp-Source: ADFU+vs3nW03G+o6bhwSAdTBrzGeiUYvHLFUhyN4Vu3tb3Z2Zz5YkHM6kkDGleQDb/hi4kaKwYX7GenUGqibrlAeNVI=
X-Received: by 2002:a05:6512:4cf:: with SMTP id
 w15mr12340316lfq.147.1584955872129; 
 Mon, 23 Mar 2020 02:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAKohpokaPiyGFkAXgG2oy_f5UGMCtsVUUAf4vA3Npa2ixAbNig@mail.gmail.com>
In-Reply-To: <CAKohpokaPiyGFkAXgG2oy_f5UGMCtsVUUAf4vA3Npa2ixAbNig@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 23 Mar 2020 10:30:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3nsCq5Ma4KN1bVpOhAkzjMEbXH_qL_2rsZ89aOW03KoA@mail.gmail.com>
Message-ID: <CAK8P3a3nsCq5Ma4KN1bVpOhAkzjMEbXH_qL_2rsZ89aOW03KoA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:rpV0U41R9q4IJQUYWJ3nL9Xgw68I+HJRJUUtCst+STaluTn4Kd1
 xNnOUvtdvJdyRk5Z6J+kxqU516FD8JvOnGnadJTpeqYLPpqC0CpcbogFAd6MqMtdOoMSVNp
 TypiseFDzgLC7upsK8tIsJssQEyf3/GPLCJ9MYfWKtXQj9e8VJirPD7as1oWTaNisXnuSHY
 99L7jtrEDedk/8r+2Dq0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j1M55GeXkks=:2uRdfIcNkT4/if3kv5oFgF
 w/++wOzYzHPHckiBIxGECOZ6/ZaAeAEGc/eMNGGZrwJ4eyClFFfm6n7ktzh8b1kDS71la0rI/
 0ins3y18T/m6Sf0bt1SBVjVw9ubJrgTCTGgP3Zko0AjtcGAUo2lYIt0+NpK+83Mcltb22/C49
 fQImq3tGUkaAu0+lhlGgXwVDXoSPMBZGBoE5dXmuaWrx4rda54UltHntfcKrQ2q7ZdXoPOmt4
 GMODXhx5jQ0ZYd7HWwvQHQ4OSao2MXwQ9BdvAR0+uOhZfeWSL9LLJJ+QBbT06YDUFnjL+qmb7
 TTikd6uD7t9/uvUeVXiwu/Nx0qSvLAVgE7NqXEWUPFXDtN5CqCRY1mxE5i/gX+PpBfgpiL2p9
 xeHYYhfMDfCTwo6qPdXmdsT+IpgViR1vFKNgvWigbaLv4iOaG1UnBi+nq2TLrdVPUeL1CibEL
 9sBv0fyLoP88nLF9MQ7vZubRZFan+rqEUGjVg/13GdVYtZ9LHsSXQk2Ps3pcQOLoCR9Hn10su
 L9ir07aK9a4pJ+c3JJ/Fj5gh1mgtoZCehwUy2aPrnUvlULtPFMGy8gj3ZyK7zHLPLds/OE0zJ
 IcLBbT6PWoMebFe4tWncLuZ7jXjMcJX7C88wyb79RT4YcsuwQuODyAEkzpVuNVB0lP0Fb/JKi
 DfMflTN28bNntN3ihHXmNFh8tDQQyEpNkNJYUnOtWfVqLIHwysY+LjudgWTbA8f//qSgTv/7D
 nreaGgGf7nZiyz7ieXH6oi98J0PdPvMtSMKwxSjyW+Qo4QZTtHv8JV0EubPOMX21tQCm+nAGq
 9mlnWtGMNSQ0yYkZTpfRjaAX0/skUCdE65T3s+wehsyxAL4ED8=
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Query: Supporting time64 syscalls
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

On Mon, Mar 23, 2020 at 10:12 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hi guys,
>
> I was looking to start working on the time64 syscalls
> (like clock_gettime64, timerfd_settime64, etc) and
> was looking for your suggestions on how to proceed on
> the same.
>
> AFAIU, the only difference is that the argument is 64 bit now
> instead of 32 bit and so I don't think I should be adding new
> tests but reusing the existing ones for both 32 bit and 64 bit
> variants.

I agree the tests should generally be the same in both cases.
However, there are a couple of other considerations:

- at the moment (at least when I last checked in summer 2019),
  there are two sets of tests: one for the libc interfaces and one
  for the low-level kernel interfaces.

- the low-level kernel interface tests use the type definitions from
  libc, which are wrong when building with 64-bit time_t, making
  all those tests fail or hang.

- I think we need to test all four combinations,
  - the existing 32-bit time_t libc interfaces (only on 32-bit architectures)
    with -D_TIME_BITS=32
  - the new 64-bit time_t libc interfaces with -D_TIME_BITS=64
  - the low-level kernel syscalls with 'typedef long __kernel_old_time_t'
    if the non-_time64 syscall numbers are defined
  - the low-level kernel syscalls with ''typedef long long __kernel_time64_t'
    if the _time64 syscall numbers are defined

- there may be some useful tests one can do on the _time64 syscalls
  to ensure that they actually work with the expected ranges, such as
  .tv_sec = 0x100000000ll' or .tv_sec = '0x7fffffffffffffffll', or explicitly
  bogus data in the padding field around .tv_nsec.

        Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
