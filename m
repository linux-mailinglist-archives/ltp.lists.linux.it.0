Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF3B1E3DF9
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 11:49:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31D543C324E
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 11:49:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B70FC3C3222
 for <ltp@lists.linux.it>; Wed, 27 May 2020 11:49:24 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F38A31000367
 for <ltp@lists.linux.it>; Wed, 27 May 2020 11:49:23 +0200 (CEST)
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MlNgz-1jAZ0Y0tmn-00loDB for <ltp@lists.linux.it>; Wed, 27 May 2020
 11:49:23 +0200
Received: by mail-qv1-f51.google.com with SMTP id f89so10870329qva.3
 for <ltp@lists.linux.it>; Wed, 27 May 2020 02:49:23 -0700 (PDT)
X-Gm-Message-State: AOAM531w3MnQqjkk3ExMgggfRoDE6+T5SSR6yT3tXSIXxE3G8M9ucNjx
 CyKFNU4wnlR02IU5gwrqb6X9vtjA/xbBpdO2wbo=
X-Google-Smtp-Source: ABdhPJy5bgUt/du3KZ97RW9xPRkSj+qdRH1mi+FnFsaV4s20f3xRlgUV9XR/aMrWSjtrIVinCtdFzJvMbkAqHbihDT4=
X-Received: by 2002:a05:6214:370:: with SMTP id
 t16mr24209844qvu.197.1590572962153; 
 Wed, 27 May 2020 02:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <c5428a9c88d18fac80e364281cfd4e3aefa38d2c.1590130423.git.viresh.kumar@linaro.org>
 <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
In-Reply-To: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 11:49:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3cj7Dd3dUsONPcOSr_cuDqgsjAZQgPgx=Wm75YW9OmtQ@mail.gmail.com>
Message-ID: <CAK8P3a3cj7Dd3dUsONPcOSr_cuDqgsjAZQgPgx=Wm75YW9OmtQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:bIaQ1AirZZeVoJu6GqeIp7N+vusih+3EYXRBazXVX9PfknO1O81
 89YElyXSBj4M186DM3h9pKvTPAsPTNeQJqAaUMpZIBeKp1jnR4pjMkemNIufAqiKKUTmNqx
 DhAVGyA0M5OT8EZToKvvQTHF917WK4r+beMvbUfEcgd8gDMy0leMhlzD1Du+UX3KqIlIcWi
 7HP43tyiwl76xg0ZnMnyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y5L6gLyx0yA=:Gp+7iXU+e8IvDGNHRKZ29l
 qWvey8wxvcEFZhCj3TqZxz9wGyMo3rTfkh75F4yPigZpsDpbCYnf58g8Hw7eq9lJzM4vR2txp
 rKR0zXJVkgqj0p7IKSLil6QAOfdzzNwLkzAAyZFjDWrf/bYtqrNDXzM93D+r0j9fG9jS8dVey
 o99urzGWaRb1lHXY4GBAiz2Q15VQWw7brvDgFMctIOvkiEPlI9RgFoj6VSGKCmqnmeKkDwR/a
 zxPJkVM1znBDcdaY/CqEvuB3PkVf15SexFoTaXhvyTyqHywb9nZNRqwupz97lQDaVBs5IpUhR
 Q9C+682Py+flkP6pY8zLplgjDI9lD60yl4QYCg2sSo1zLRNdie376Uc8PT+6uoluJG8xb5dO9
 nxdT9pgD6hDrackHYeC2GMegF0y94hXoRxLt8WoSTfrimhasPYOBFKz5T2AyK+vBQpi5sKuCk
 cEGz0srdCj5yEXWJIZrDDJmMEwtk9NgEDTNFOFI3XTBQyE/1Z0S+0ZRFO7AOTHWXasJS6NVNR
 K+5xMo/hWmhsM7FoOyFS8drnXSbtPt35oqHFa1ss8mWn3Z+qSRtrkROidHND9GDl608Co3Ogt
 gHpxQkYKvl7BDDPemLWwIso2D1tKJt5/9Lodx3bWixlj8BwVZ6EgtLKJL9xrdqu1HmlFMVh28
 VgAPTPaUITgyWLSOVMvJvQi1O4uQeQ1fZA1q4sMmp21Iqg2Pk4JCOg/57mci75FKlk+QCRnUY
 orf2/z/zKFW/wsv74rxm6WmnJ/0AgCUcG3ocpb9loDk7tB7dPIBiWNvR3X/G/BEwW2CxzQDrX
 xiBUfIlctfKMoo3MLxMswW+PIbBwMXlq1Y8dEgpliTA4QANP/s=
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 5/6] syscalls: Don't pass struct timespec to
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, May 27, 2020 at 11:43 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> There are compatibility issues here as we are calling the direct
> syscalls (with tst_syscall()) with the "struct timespec" (which is a
> libc definition). Over that, an architecture may not define
> __NR_clock_getres (for example) and so we must have the fallback version
> in place.
>
> This updates the tst_clock_*() routines in core libraries and adds
> support for different syscall variants.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

I would have expected this to be simpler without going through struct
tst_ts, but the implementation looks correct, and I suppose this
is more consistent.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
