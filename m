Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC03F1D9459
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 12:28:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73A793C4E66
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 12:28:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7C2B23C2240
 for <ltp@lists.linux.it>; Tue, 19 May 2020 12:28:14 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C7EED100152B
 for <ltp@lists.linux.it>; Tue, 19 May 2020 12:28:13 +0200 (CEST)
Received: from mail-qt1-f171.google.com ([209.85.160.171]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MtOT0-1imshH0ZgM-00uqeR for <ltp@lists.linux.it>; Tue, 19 May 2020
 12:28:13 +0200
Received: by mail-qt1-f171.google.com with SMTP id m64so397059qtd.4
 for <ltp@lists.linux.it>; Tue, 19 May 2020 03:28:12 -0700 (PDT)
X-Gm-Message-State: AOAM531hSSP4rmuJqWxkObdd65iD7XJJIOm5hEA07G9vwOeUu4MN7oAU
 AnE88s7zFhJabhkLb1lKsS0E6R/NnJSXTFYjTTQ=
X-Google-Smtp-Source: ABdhPJzqPvEIbEcGbtD66xnh3evDoy4/U1EEHJyYoXZmTV5K/5i0SIaBmj0JFxn8hODVxx1zx11kql2+dN0g8d0SDvk=
X-Received: by 2002:ac8:518f:: with SMTP id c15mr20557069qtn.142.1589884092025; 
 Tue, 19 May 2020 03:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589789487.git.viresh.kumar@linaro.org>
 <CAK8P3a3aP5S_w_FFv=UvJRSRTjcoNVy_W6ycm4OTct-7Q_5_xg@mail.gmail.com>
 <20200518091253.qmvqo7xub7hpeovm@vireshk-i7>
 <CAK8P3a3_dGzoGPckBByySvLYGC3FyiCSwCdfzxG8xjJsY0oXrg@mail.gmail.com>
 <20200519094201.llskyyq2jbx7onai@vireshk-i7>
In-Reply-To: <20200519094201.llskyyq2jbx7onai@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 May 2020 12:27:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0_o+pme5Ejy9L4_xfmnMO1a0j52rkp_mXDet_fPmXLYg@mail.gmail.com>
Message-ID: <CAK8P3a0_o+pme5Ejy9L4_xfmnMO1a0j52rkp_mXDet_fPmXLYg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:TEzRSRsn8lzAie+PL8elXJviHZPrA83RV1RLI8bg0RD7dHzJtG4
 wRt/oXKtiE2VMJmvcmxm7UqbpMmLb80jhjCjPAQV5QY6GjZeafWlPRRV18nlKadBM3AP5B/
 dfyEcCBoZXPBkDgLfTrrg5g86woxNt85UeJHf21SGWJh8h9mxR+wh63Mu1MpJwFRXHni/wZ
 rTn+dpeFhOsqDnCKZxsAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dCP07euHbl0=:iHJwB9jnv2FS6d0uhS+yJ7
 0Zo6nE3ynRJMUrrfD0VIDY5ymdbfc8Z8A1LDGt+XEc9il8OAkR1N5dombe/dqo8+Ve2fR6qNj
 1FY6pcjdxjISGB7gGIoUh6P62PPpH1au9T9uuGCNtbxPI+IGeu64cnnDx21koWJZRB3+/ce51
 /YmOxRg5JEFoRag1zr+Fgerpj+JMuA+GIRIzAFmlHk7HVzz0jEtpUoor5HZ9cgf8YMvN2hdTS
 +ke4sOhzdXpq8SV0XXvOwvMckqIXunwIzsdfKl8yiTd4SdSsvHH2DG5kPA/qlKlvIvG78Qr34
 8gs0wIDd/xFt6w/sAb1aZkiPgXq8M4aMLO6F6cYl7Hpz5MaTbVE1uxJEbYxYTb1kAWNYtBW7d
 +xaRO6Qa0Em4UPIG6fwApHbd5uyD5fZbYFWJ5CZQjnvvWHr2TiWh/AYcKfGj1hKnThvAOn8ce
 SxXuvwX3YgaPOD/sdvBVUSv0u6r0/osr0Op6amka5MyT7S+h/YmkXnUugxsLL3zsJ9btCRtMm
 RcVJEBKgKwPNH851FVsemREbxi8s9r6xZXLeCVax6+acziLnaX/kHj5MexrpyrhsEWuCv+cO8
 Q3W2v56tmmQdkmvyBJMvW/2+xPWlSO7X6Fy1pVgdXZjX/yWKyRbYTIMgumcOcWkmGUrOHYUtj
 Js2KkXriLxS8rMXYxbxB00cDk1vI3+nc0WERw1mp+D/CK4fJZaa95cVeGZH1XfkTbI9mrfHEI
 YGkxN+kFbihUojh3YQirP6T6QMr20/qSdL6miCZll9dnxZWppB8mM9OIBxRqhfXYeY1NxqSUd
 BdlS08/EsP/ffCyFOSx8nPLgQ88tqwnmelZYojeQg04guguj8Y=
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 00/17] Syscalls: Add support for time64 variants
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

On Tue, May 19, 2020 at 11:42 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 18-05-20, 11:21, Arnd Bergmann wrote:
> > For msgctl/semctl/shmctl, the existing syscalls were extended in a
> > compatible way, using an extended 'high' field for each 32-bit
> > seconds value. I later learned that on some architectures, the
> > 'compat' version of that failed to zero-initialize those fields, so I
> > guess all we need is a test that ensures this was fixed correctly,
> > by initializing the '*_high' to something nonzero before calling
> > the syscall, and checking that it gets zero-filled by the syscall.
>
> Okay, I see the new structure (struct semid64_ds) getting added to the
> kernel. But I am not sure how to call the 'compat' version, can you
> please help ?
>
> Do I just need to call like this ?
>
>         struct semid64_ds buf_ds = {
>                 .sem_otime_high = 1,
>                 .sem_ctime_high = 1
>         };
>         union semun arg;
>
>         arg.buf = &buf_ds;
>         semctl(semid, 0, IPC_STAT, arg);
>
> ?

Yes, and then check that the two fields now contain zeroes.

This needs to be compile-time guarded in some form to avoid
running it on 64-bit machines (which don't have the fields), or
to run into compile-time failures with old kernel headers that
don't expose the fields. Note that the struct definitions are
architecture-specific, so unfortunately you can't just provide
a copy of that definition in ltp unless you add all eight versions
that the kernel defines.
Perhaps ltp already has a way to probe whether the headers
have the latest struct definition.

    Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
