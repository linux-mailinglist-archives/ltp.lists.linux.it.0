Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 371C61D9333
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:20:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B16F03C24DD
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:20:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 844BD3C04F0
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:20:21 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5A235600B44
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:19:57 +0200 (CEST)
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MK5BG-1jMCQU1898-00LWz6 for <ltp@lists.linux.it>; Tue, 19 May 2020
 11:20:20 +0200
Received: by mail-qv1-f43.google.com with SMTP id d1so6134025qvl.6
 for <ltp@lists.linux.it>; Tue, 19 May 2020 02:20:20 -0700 (PDT)
X-Gm-Message-State: AOAM532TLfDk+Zlj6+aHpOU8u8tOIMzn1qamk2uUXKY45aAhjd7eWLJ3
 8ERh8XV2JQEZen62xWXpknT6mctk1Drrv8tZ5dI=
X-Google-Smtp-Source: ABdhPJxEytcN5Gf9PVGnmgT8kzD33gD/dpZQY0yhjf1l8H3/jKW8BXAqfS35W9eS7XnqoQpvht7SCG+3X/xg/KaCa/w=
X-Received: by 2002:a05:6214:3f0:: with SMTP id
 cf16mr20780293qvb.4.1589880019205; 
 Tue, 19 May 2020 02:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <931bddab3d92f73f07f32dd7e1770078fdc07e0e.1589877853.git.viresh.kumar@linaro.org>
In-Reply-To: <931bddab3d92f73f07f32dd7e1770078fdc07e0e.1589877853.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 May 2020 11:20:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3LkUoJs-2yj_F8LpgiGQC6auLVSSuB3QCKOr+NwUhnHQ@mail.gmail.com>
Message-ID: <CAK8P3a3LkUoJs-2yj_F8LpgiGQC6auLVSSuB3QCKOr+NwUhnHQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:VIPLTv1ZWhTNKVzd5lcmwUQB8ZbzRN9RgiuwjWxlGIcdSQn/ZsS
 Yj0qq1+fxJDc99Of64eZ5z83nIrwlMt4dfo5Vv3foQGBDKwVOUCkmgaUQ4ZC9FRpYjc5gut
 /p09es6n+ibgyuYMP3b3ovaoH077cMNw8Llh2PlLZx2Tv+uM/owk55O36pSgh3fHiSe0Um5
 PFeE2JfetRhhZtJPCYbOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gg32llQosJQ=:+o6lXmWLwvurG8r0M1cmZA
 BXnm4f9991iaoowu2jgPptM7IOeEmqnrii+EbZA3yAxQz/fk5Xb/5180FhxFxnG12oJ62Y1Dq
 jdO9RF7ee644CNtC+bsukG1/261YoXV0o0+iY8EW6bT6snHB70rCCeQFBnny9yYjGL24uReIj
 CUUOXZihzmbGx0LYVPStF0dxDOueEzqMQ4GoDE2gB56ZRn01hds3wDwPv6ElVeZBo4iV43Xk3
 0NqWf949ZYox/cn0uk3WPLbNkNKHCeMzFeQWx1b66t4uQ44S9qkURqFDg8QuzxILUmMPavN4C
 GVRyy5JbDzUzUkUp7WwWTVxCQcsMLJTPRZzZkT6Lpvk/D6+meWhu2RNOF1yWGsv7dCIDfnMK3
 TgD0LYieuRBPBB+xUBVnz0MHcQlsnEUHwH5iHYdZLJHACHZCQyG3Itf6QwRAxQ8iYiv6BhAZi
 dFouHTASL2JDZO0/QHkV60/+7M97KHi1pBnQjEqTTZLT4HczPhQmrpyFzsERMIcyqd9jYy18x
 tWZ8oVfCKNiD6s1iZGR/2f1aUAAF1SsrTUPeas24x5k52jqc0Fk5uSBRacsh2EJ2DM5I5odUv
 eq3ckHNSgfQgWfVUsR+rhtOWlqM29bxE8qH4fdBCEjAGBWVTLKWoKVhSKBh06FvWJSGhEzQ3K
 m0yCgvF5QPdYBhpC9SmAgVnRvLX0KO9YfhOOIjIK3bAiaQgykfUUBTViUfESvqddOi5PYd/uM
 I0UiNVqk5AC9NUNEUPkJmRSw/0iPsJzxOPAl6D4W678epPk09uK+9NveqxZqtlhDaLRs75J4O
 5Cp1BNA1YxUWyQMyxKUwAHz+ArLDXhyVSf99Pf0fPedEvPvvTc=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

On Tue, May 19, 2020 at 10:51 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Use gettimeofday() instead of calling it with tst_syscall().
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

I think the change makes it work reliably, but it does change what you
are testing for: instead of testing the low-level system call interface,
this will now test the libc interface, which is implemented on top
of the vdso or clock_gettime().

I think all variants (vdso, syscall(__NR_gettimeofday), libc
gettimeofday, emulation with clock_gettime syscall/vdso/libc)
need to be tested. It's possible they all are, but that should
be clarified in the changelog text.

       Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
