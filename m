Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F701D969C
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 14:48:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C1D03C4E66
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 14:48:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B371E3C1F2A
 for <ltp@lists.linux.it>; Tue, 19 May 2020 14:48:07 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2292910028B5
 for <ltp@lists.linux.it>; Tue, 19 May 2020 14:48:07 +0200 (CEST)
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M2OIy-1jdmYK29fC-003twm for <ltp@lists.linux.it>; Tue, 19 May 2020
 14:48:06 +0200
Received: by mail-qt1-f169.google.com with SMTP id v4so10965753qte.3
 for <ltp@lists.linux.it>; Tue, 19 May 2020 05:48:06 -0700 (PDT)
X-Gm-Message-State: AOAM533Y5txDsKxmlW/hrrd/agDQeWXWlhPVzVVLe+6klsyac7kJN+ow
 BEl1WMILSzcL9v/gKd0oGHhCGzuvysQzm2sqeB4=
X-Google-Smtp-Source: ABdhPJy/uwK4mqoZHkbXlaSBiDaIsdXoyejQzLxNkGMjg/WW3TJE9fQYUnrJEXD8M/hzi8xKOGSiyP/oz0rkcVrOY6o=
X-Received: by 2002:aed:2441:: with SMTP id s1mr22153112qtc.304.1589892485432; 
 Tue, 19 May 2020 05:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <931bddab3d92f73f07f32dd7e1770078fdc07e0e.1589877853.git.viresh.kumar@linaro.org>
 <20200519121617.GA16008@yuki.lan>
In-Reply-To: <20200519121617.GA16008@yuki.lan>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 May 2020 14:47:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2WQ+pU2ao1ERM8f9Vy3_6ASc3ijBDSD6id2aZoio+o5w@mail.gmail.com>
Message-ID: <CAK8P3a2WQ+pU2ao1ERM8f9Vy3_6ASc3ijBDSD6id2aZoio+o5w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Provags-ID: V03:K1:9MWG3d3PrOh9i2aHPcQdenxyz/APiyga/iKlWlDm+gKHrQVUMu8
 ujlP9QTW+XGmztzLHUkBMO8/BMOtHBOZnj+T/5cpRQgwrpnKH8ioXBqN3MePj8i62vjRPiv
 2Sm8z5ZoQ79J1gp7utya1XlqfaNgUKW2CFUjyyGMxh97LoCHfxLHja4CSNzig/Bg5mj6wIr
 ZImf0dHQ2kreuvNCupfTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JQ7n8w0Ww9c=:F/dZfRlW1qsohvC4WLWpG8
 Tt4hubCyf+NTvsDxPsBytWan1zBM2fMXJf1EaV55i/9xjbWEhdVHPkPuNrkrR8pcmmh4Q4QTp
 xuQQqxHN9Uzz8R6fmXR2TN35eu4V0JUkd4zi5Cc8UkIiJPjV6QXi6aML/fzi4y1VV2ESQFIiq
 1TZ0TfKOZRIEYWpgFq23fMfM43YFxO7sz4x9cqGigeD7fyNh+Tk+383ANg6GAGKzZnauCEUz4
 CIDRy77XUDs1eJ3U1o9x7xG+Z6NChvK4+TtyXub8VqtEiG3z1ZZqnuN2sYzxyl5XMKgAXdoXT
 T3lKZjGoHxLmKNmlE0YFtsfwmBjtxSbTwNx7INHyvqtbrpB2s35+bMYaHsCCgFVhTd863AdGl
 nfU/puJtlK51lktSJ1x8k3ldT3O+SUrBMM24Uw6a5osobYiMMCj0uF1Rrq+gxhjzEFIU9zDRW
 IeYnbl9ZQ7PcWtXLKVFQ9AhFCo3XJVOfHt8qtceRKf5shykjQr4HyDRXmeVtdQ66IWnopXO+Z
 PKknRdHIa5/FTg7BTY55E+7UFZEif8VKwNs8Q12UMNhh4zmWd5AF+1WuKyWB7S238rhQh9LMp
 wWiqc99HEnoTUIASbdjlkIL1xylkteF7V/y7XTtF5sG6OSNCRWTZ3S4dXxajunPSKzT/fAqIy
 Zbl+plVdVkPhGsCyPHaji8UM6EeXik+gPUIhKZ5PcAgyZ8Pev5Dyae2mXdybnsHlLk0wQ/bpc
 wDDQYWa2vHzBNN4kGOtb2AX78YeGKODAsX+1FmUl6y0CldWbOb3TW9hjh1TzW8WwnxPX+Xp6U
 B7hHXxU17yhfE+VUNFzKy2JF+LwPkVzhhl+hX0qj9YjZlYsflk=
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, May 19, 2020 at 2:15 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> You can set the .restore_wallclock flag in the tst_test structure for
> these two tests and remove the setup() and cleanup() as well.
>
> Also in the settimeofday02 I would be inclined to just remove the clock
> restoration code, since there is no way the tim will be changed unless
> the kernel is buggy.

Ah, I did not realize that LTP actually does try to set the clock and then
set it back. If it does that, it may be very interesting to test the behavior
across the y2038 overflow, e.g. set the time ot just after the 2038-01-19
expiration and ensure the kernel still behaves as expected, or set the
timer to just before the overflow and set a timer just after, and see that
the timer triggers.

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
