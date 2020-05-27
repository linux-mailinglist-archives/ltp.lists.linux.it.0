Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 806F21E3FAF
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 13:18:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB7463C321F
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 13:18:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6DF003C223E
 for <ltp@lists.linux.it>; Wed, 27 May 2020 13:18:30 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8D05D6011EC
 for <ltp@lists.linux.it>; Wed, 27 May 2020 13:17:59 +0200 (CEST)
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MVe9i-1jTxwX069U-00RZra for <ltp@lists.linux.it>; Wed, 27 May 2020
 13:18:29 +0200
Received: by mail-qt1-f170.google.com with SMTP id a23so18818994qto.1
 for <ltp@lists.linux.it>; Wed, 27 May 2020 04:18:28 -0700 (PDT)
X-Gm-Message-State: AOAM533AIZER7vKe/y0YaqEhOg7qRKdOt4c2WfYoeEqrWrD1t4TT28lN
 tW5EYjy5+w8A95/XvaJceqeS/8pIAjdF53vRy5Q=
X-Google-Smtp-Source: ABdhPJyRYwDfE9yLKqZMfrc11bO7sytwJHxjrrJYpFN51W71KTNJqXM/5xoyO2kw2QwcG2oGNUJlA8NmzhzRyq+IrC4=
X-Received: by 2002:ac8:691:: with SMTP id f17mr3569839qth.204.1590578307776; 
 Wed, 27 May 2020 04:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <70417fdc55c750e8b13d7124e66a7e8a59182e75.1590494889.git.viresh.kumar@linaro.org>
In-Reply-To: <70417fdc55c750e8b13d7124e66a7e8a59182e75.1590494889.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 13:18:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a13aJ3joRBE=P06fX8fxS-yroHx=T=bG0ZtdjhWE3RAJg@mail.gmail.com>
Message-ID: <CAK8P3a13aJ3joRBE=P06fX8fxS-yroHx=T=bG0ZtdjhWE3RAJg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:FDcrPkPuZoC6fISwlNJMkaOX8//SDZ6ge6P2CAkNK2T6IcmdvMK
 /VEQnnvCN8bE6m5PyqINzjQVA+WfKzgMsIP9U3UcPV319BTn0bYWyWm3wjEHg52n005ykK3
 WzcELFU30w5fyl1X/alfwAHpEEYzShVKj7o7dphSgdkvIG5VMy+9sVcZOa92pTuUNMxUTCF
 hWwcHYfItBC1prEuejGlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jaKm2eWCrHA=:b7kgGjZsF5rwWf7MhJ4P/z
 YaX44gSaSmQzFlG9F6/YAq/SvYIkKXVRIF7aZ8aejxX+O+zwgFMZpv2Wkj02akcD4iLGo3Ube
 pAZdQWJAYMBWNFXvzZ9Hi5Mmi5CcPyKR1y2dwbYxRYg2X4Hwo9Qw5hh/VKptmBLgPXwLZuzlc
 +S2ubVw6SY7Zdz+6mGWMBbLvXR+AY4enTfXrimpHz8TZd2dYnEnza0r1ciRj4HDB/yZwtrLk3
 EVSCNlx8ejZ0vwxNgV28QeK5hJiVcXsXcuFjSmb6W7ATC2N8QPv98FUwr68YZ8M2nc3xgbkkg
 1auCHl8Fv9bgsLCVhuB5lA9Kwe8eeLyKWoqNwIM6JvQRnCf6EFSJVhuk3jH5c1or7QQMhUA3y
 RMTVhXXUj6jR1NvTczDN1YNtrJJOhg36o6Nf0DYOYqyeCk1UzJZ7XR8tKZ+Icjiuo20Gaom2V
 Btb/Woijz2jmYp8J24v+AAlB5YPqdB1doY3f5I+G61BSTh4FKHI+ImIFD+RZRK17GE78oMMXD
 jZytYNBdD9HgLAl+JzywemBcC8099yqb9E0Aaa3yw6R26yTNlv80uRFB8Jgs6NDmSaT1fweG8
 HD4/iJ9uBawH254GKyKIUfqEBkvsBwItntiP3XzPI4Qt0gSbw5t2MrrdKgMQdLUl14WeNkhED
 fyhR0gyifTUXGuHkV3wolDeCFB6nqueWY3S1DyDPRa4f2g/zG/yK3DhC6DvkvoCTp3XmTZggh
 xj+g4tlJeMW/Hs6JoJUOZr496A0uxqzJyii1P0cJ038PAKE6bg7wtTwmUnSZy7mBcwERD8Xx2
 +/fBc7vS9IM62q/H8sRBCBiUTtFgc80UZHM4NoOCh29exwWZjc=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: clock_settime: Add test around y2038
 vulnerability
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

On Tue, May 26, 2020 at 2:10 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This adds a test around the y2038 vulnerability, it sets the system time
> to just before y2038 time (i.e. max value that can be stored in s32),
> and adds a timer to expire just after crossing it.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Nice!
> +static struct test_variants {
> +       int (*clock_settime)(clockid_t clk_id, void *ts);
> +       int (*timer_settime)(timer_t timerid, int flags, void *its,
> +                            void *old_its);
> +       enum tst_ts_type type;
> +       char *desc;
> +} variants[] = {
> +#if (__NR_clock_settime != __LTP__NR_INVALID_SYSCALL)
> +       { .clock_settime = sys_clock_settime, .timer_settime = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
> +#endif
> +
> +#if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
> +       { .clock_settime = sys_clock_settime64, .timer_settime = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
> +#endif

I think the first one has to be guarded so we do not try to set
the time to just before the end with sys_clock_settime() on
32-bit machines, as kernels that don't fully support 64-bit
time_t behave in unpredictable ways when you do that and
are likely to crash.

However, we probably do want to test this on 64-bit kernels
with sys_clock_settime() anyway.

> +       tst_ts_set_sec(&ts, time);
> +       tst_ts_set_nsec(&ts, 0);
> +
> +       ret = tv->clock_settime(CLOCK_REALTIME, tst_ts_get(&ts));
> +       if (ret == -1)
> +               tst_brk(TBROK | TERRNO, "clock_settime() failed");
> +
> +       tst_its_set_time(&its, time + EXPIREDELTA, 0, 0, 0);

I suspect this is where it fails for the 32-bit time_t case, as the expiration
date for timer_settime wraps to year 1902.

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
