Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 266EF1F7508
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 10:08:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C97113C2DC7
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 10:08:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 053893C22CA
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 10:08:15 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 600491A00EB6
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 10:08:15 +0200 (CEST)
Received: from mail-qt1-f171.google.com ([209.85.160.171]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N2m3G-1inXE233CG-013744 for <ltp@lists.linux.it>; Fri, 12 Jun 2020
 10:08:14 +0200
Received: by mail-qt1-f171.google.com with SMTP id e16so6538327qtg.0
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 01:08:14 -0700 (PDT)
X-Gm-Message-State: AOAM533HjRJcaSBpXf9Cyh2McKkyt97XDma6x8ukIHOVdr0Do/RPqlJ0
 c3Y6lOYB4mrm2ciix6WPPHUHOFj0m7jY1BqfyxY=
X-Google-Smtp-Source: ABdhPJzVBeSSunMtlQDebDFe9oebT0R03qT6xVway1vTYf7uOQsF+QH/nGNQ01X3A8Hy+e72IiQKqE/q8l0pR7tY6fo=
X-Received: by 2002:ac8:306d:: with SMTP id g42mr1816303qte.18.1591949293629; 
 Fri, 12 Jun 2020 01:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <cc75beb4074b62e94b8ac92cba17af41b8f5fbdc.1591864369.git.viresh.kumar@linaro.org>
 <0fb91044431a04c2787bfa121a7e5f969664fc8b.1591948595.git.viresh.kumar@linaro.org>
In-Reply-To: <0fb91044431a04c2787bfa121a7e5f969664fc8b.1591948595.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 12 Jun 2020 10:07:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3EQ2wbM=XKHaUQCK=_bhSc1pxGKCd9+oEf9y02GFs9_g@mail.gmail.com>
Message-ID: <CAK8P3a3EQ2wbM=XKHaUQCK=_bhSc1pxGKCd9+oEf9y02GFs9_g@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:oaZuAM7TbXjng0zKTdjP4hnJfu1TRk2Sj70JY8RO/cfIVakOAKj
 xtSCmJYIMYE/Lhp84ihn6mi5Y/7thOQbkA18QgZHnYKbkYeHVEgVHWsmKylNyqZTiX2dRzN
 4tv00c67vEkHszxcMejdfA3nTvoPrGHR5IWGCZnTPvhjZBpAoXULgTjMRZYfIN2PUrTsQWw
 YVqklWg+ALopK9GIG1VsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IjMRJqQas74=:baw5dCPIjm9cEcbKNTRcwL
 puijdR0l/kyS7csOJS4EHk1kWOI9nAXDxWD5J2/uQ7ngN3b+keqrb7yXYMsE2+sj1bFx9dgNG
 1G4hZYN+k/eOymqLmj62trco9c33BYmbipSAY+QuV4IIDStn2SWhnT14v/CoQEJrVzzLHvV9p
 iw/Bd+SfAtyYtgq4BMd3s0+WpWzHwhcUxnVLBegQPMyk2kIYK9W4S9tfJ17PFKUPXGcMOMVaE
 SZri9+LgUZ7tINgBngb1NbRHchKifv51/GAxFm2sPDhAmVeMxSw7bpb/K73e1BH1KQobU2B83
 ODbLmUrZNr2NMyttRbcAuB1ii5x/vIi7V55SurQD6Iv9sR/zYL25CuQ+vpvJvOHmcoIjm6YHz
 qD74YJrcoWsFcPh0QinMuAxxgWT1qEcNURQ4T6+t+W91pOFLju0uq654nhg0MokU21ldd1+H9
 wPdY3oEzkrgpeL0oM7cPkeJldNRiH7P/h9tqhbNOJIEl4AuNghUpWC4IB78jnpUJlHDXi0+Tw
 MlvBpQVIpblkyUnfsEgb0cB157I/2LLwEkuBks1BGtN5deiSiLqQfcxa7+3WzmBlUKsP+iDT5
 e24tH2Q9S2yRsW68+0vZTMH1GMQwplKpc24apb80hf1NwqthGimxkX6B840K3kLmKs62gdtcj
 CWxPhav6Xd5RoCWUHIvW+3r6B6BSRkO4nFk/bzRY7aqkjfo4eY6UaXuiTdpzSVVZlwfRWKAIB
 8SOC9wVxpuWYyXORvWJVn9HK5O5GY0Ll4RNc4Yzi0Rg4hTYmD0DFY/Lb/qXYOWkgVhWKuB/Oh
 z5COeqxhFJgKzKMs3JAUQ58I7j475mI+7GhRTzduaaSGaQYDx0=
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 2/2] syscalls/clock_gettime: Add test to check
 bug during successive readings
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

On Fri, Jun 12, 2020 at 9:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> An issue was reported recently where a bug was found during successive
> reading of 64 bit time on arm32 platforms. Add a test for that.
>
> https://github.com/richfelker/musl-cross-make/issues/96
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

There was one more thing I had originally suggested as an optional
thing to test for:

- ensure that CLOCK_REALTIME_COARSE/CLOCK_MONOTONIC_COARSE
  is at most clock_getres() nanoseconds behind
  CLOCK_REALTIME/CLOCK_MONOTONIC, and never ahead of it.

It's probably too much to put into this test, and I'm not sure we really
need to test for it. Are you still looking into this, or do you think we should
stop here?

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
