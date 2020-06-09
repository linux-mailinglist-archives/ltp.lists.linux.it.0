Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B181F3535
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 09:43:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B00E3C2E75
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 09:43:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 24EC63C094D
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 09:43:41 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 123AC1000DFD
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 09:43:40 +0200 (CEST)
Received: from mail-qv1-f46.google.com ([209.85.219.46]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mbkac-1j5dnW095q-00dGwK for <ltp@lists.linux.it>; Tue, 09 Jun 2020
 09:43:40 +0200
Received: by mail-qv1-f46.google.com with SMTP id e2so9629365qvw.7
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 00:43:39 -0700 (PDT)
X-Gm-Message-State: AOAM5313sQcPNKHbzjc2qHzXh2bBTSbPMJ3AOaWMsknJonYBvnvJ08uy
 Cpo/T09EyA1u3c9SZpQBzvrlGhRJMoQf7M21SHE=
X-Google-Smtp-Source: ABdhPJwacSeIEKJ03RttetNMFN+3nEkHD0bu2vjh4j6rU0QOTeVgGVr7wrL5rBDr9SB8rLtRqSqUGR7n8KWGm7oZKWY=
X-Received: by 2002:a05:6214:1842:: with SMTP id
 d2mr2515515qvy.197.1591688618525; 
 Tue, 09 Jun 2020 00:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
 <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
 <20200608100900.c4fi7pw7euie6tnt@vireshk-i7>
 <CAK8P3a004cavRhyWx+uXYYteBi1LviahAv11+9JyGadN-vo8og@mail.gmail.com>
 <20200608112000.sjrbvmqjciifgyub@vireshk-i7>
 <CAK8P3a0PqtFWTZr9hvSy5Y0ZZOSNgfzw0x1DTTyuzfsfROpAvw@mail.gmail.com>
 <20200609070535.iym6m5n2v5urykbc@vireshk-i7>
In-Reply-To: <20200609070535.iym6m5n2v5urykbc@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 9 Jun 2020 09:43:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0giS2A=4Hc4SO7cVn_nOU4rz-KzbSkQJcddM2Hc=KRxg@mail.gmail.com>
Message-ID: <CAK8P3a0giS2A=4Hc4SO7cVn_nOU4rz-KzbSkQJcddM2Hc=KRxg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:KjlQiD68NRHn3q8XNM75A49wLKDXGrexsG6Pojdhs3d4lMypVRQ
 bQESzkXXRkxlYQCc5neAoLuaPvOmyxex7coxhT4b+RZA74EoRAjAchHrGlKqtLDEoFfHj9H
 HMYh4IVDso8/jLuTiYN5M/mHLYU2MSQtHCPSxYhUhwocz+qQh9rsf9u2UVsfyT+9WwKykc7
 XaQLAe2h6IWTAQiH7Ky5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zO5dhyv3Md8=:Pqq2Cz675e1UTgG2p/B7S0
 4GGIO9Wpu2oeoKQ0qpQy1ihbJM5M5ydAcgRLpcRgDB1cp67RF0tjfTZmulsV2n9boc6X76uK/
 eA8xKmuhbf6Z4/2sbZBkp1Yo3LLeTt8F+T4Cp1Mf4ySmdsqya3WYrQUn6jAt6BlhHNTdIe610
 gzcQZsw1/l3cFzBPyKYCPh0XuqydLGsu4VnXbgdqY37QLKl88YZ9kB9Bu60EHY+wiHfF223Mh
 TgQCvgkmZ3Hvz2G5cMbU3jJ75btqVkdaESQgL7YJKLJ4dkgZcTMVSAM0aYKHvGUqqFhBjIiMQ
 OVIkfi4qYhoSS2RpjZ2u3Gg2DxT/+oiwyu7vsa3ZEX850UwrfI9HJGbGnfX8Bw+F8mRIpJFd0
 T51AeRDCjQJ5mr07YYhitHfoJXDeeklWxWeiSSjc4e4VfIpmm7F8F1207ATNhTKpIoN6laG4m
 Lb5932tGOCmCj9T6vNqUw9whQM75cGLLSpYRquiahQ5v6H8HpdJbKWE1tLVUB/oruFR5XWNeK
 6caBCdHGTlpyokKvZg+jH7uKCat8oE0yqMI4OZwVOse6IZBhJp8Qj3dhb7g5v65p89dkDxoQP
 tXvEcAtdx7ENEEFMK4ffy+oYKGm9i1SVISWFlB0uubEeu70fIzaIUf53aG8GYnKscXBuppefX
 qUJGVoxycAXMVi9Pu9Twl56lQ5SZtqJDWWV2Xxhbk7JXXlOaT73rhs9uI45jU3Az9meHPgFyK
 QGtWRLWKIWkWfff56NmAHcn+gAteWkdD29EE8N3QnU09QWBd0kcW+tApr+uiVB0tzZYYO/Psx
 XVn35B2x34qh4Vhg2qKeiRxB83g980lcI4K7Jd3dChUL84qSjU=
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/clock_gettime: Add test to check bug
 during successive readings
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

On Tue, Jun 9, 2020 at 9:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 08-06-20, 16:51, Arnd Bergmann wrote:
> > You already have a special case for gettimeofday(), so just round down
> > the 'start' value to the previous microsecond when you are in that
> > case.
>
> Since this will also affect the next reading as well (as we will loose
> values < 1 us), I tried to do it a bit differently.
>
> @@ -78,6 +78,13 @@ static void run(unsigned int i)
>                         tv->gettime(clks[i], tst_ts_get(&ts));
>                         end = tst_ts_to_ns(ts);
>
> +                       /*
> +                        * gettimeofday() doesn't value less than 1 us, copy
> +                        * that from start.
> +                        */
> +                       if (tv->gettime == my_gettimeofday && end < start)
> +                               end += start % 1000;

This looks like it should work correctly, but it feels a bit more fragile than

                       if (tv->gettime == my_gettimeofday)
                               start -= start % 1000;

which would bring the start and end values to the same resolution
rather than making up values that were never read.

Your approach however has the advantage of adding less overhead
as the % operator on a 64-bit integer is going to turn into a very
expensive calculation on most 32-bit processors that itself can
skew the timing.

> > > +                       /* Skip comparison on first traversal */
> > > +                       if (count == 10000 && !j)
> > > +                               continue;
>
> I am skipping diff for the first iteration..
>
> > > +
> > > +                       diff = end - start;
> >
> > I think on the first iteration, 'start' is wrong here as well, and needs to
> > be initialized once, as you did in the earlier versions.
>
> And so this won't be a problem.

Ok.

        Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
