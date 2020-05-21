Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A13F1DCDD8
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 15:21:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BADC3C4D3B
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 15:21:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 391083C25E9
 for <ltp@lists.linux.it>; Thu, 21 May 2020 15:21:06 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D56D71400063
 for <ltp@lists.linux.it>; Thu, 21 May 2020 15:21:04 +0200 (CEST)
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MFb38-1jpZio0SFi-00H7OV for <ltp@lists.linux.it>; Thu, 21 May 2020
 15:21:04 +0200
Received: by mail-qk1-f182.google.com with SMTP id w3so1601305qkb.6
 for <ltp@lists.linux.it>; Thu, 21 May 2020 06:21:03 -0700 (PDT)
X-Gm-Message-State: AOAM533LDVslSE3TpFOulEvDBEomG/Gmu5rVoPnycvqEy+hdBgKC20Bp
 fTOTbsaswL6nXKZQsR03sCHDv25q4cnXCcudxH4=
X-Google-Smtp-Source: ABdhPJxpSLXKcEKZ7P431TvgIRXNGDd38UCRUlLVVOE98yWOc7lxcVqr1VAbx0EGGpq46YT9hdd4lrsY6ldBFqCc220=
X-Received: by 2002:a37:4c48:: with SMTP id z69mr8909729qka.138.1590067262927; 
 Thu, 21 May 2020 06:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <5d502fbc7070644ed83c423713941b457c3a7aff.1590057824.git.viresh.kumar@linaro.org>
In-Reply-To: <5d502fbc7070644ed83c423713941b457c3a7aff.1590057824.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 May 2020 15:20:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0pxv5wauMcf223n=_7zNJ4mn1Y0WvcssFC13pcvz9wmQ@mail.gmail.com>
Message-ID: <CAK8P3a0pxv5wauMcf223n=_7zNJ4mn1Y0WvcssFC13pcvz9wmQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:d+TCICzGxhlscOal3QUAB4yWw6X2RSboHcw9ESbQqbcurJfZ0Os
 6p/NuGY/EopF+RwkosCh0jTumf1RBFF39ZpAQTfmjPvj8lCOddAcbxxuFvnpnhZkwBeio7J
 fvoWVF/cX+sX4D2M3JinFFkkU4T9nGle31UTLxXQILO5YwDwz/pU/XZNRgKv/HSVGWQOknw
 zQMPBWuaCgFJrCCAzKIug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RRhbG19nEi0=:8JpAQ+8CZbbRQXpMnjzM2q
 CU939ktV5+g9/h9zJa0zuGAwnL2raSpQRRylMK8ACjuxOeouujsPCXLluxAAnUp8DCtkcvDWp
 I/hJKpK+3iG1CUkBmnH+yayCe3rbvsa2XCca+m3+FQ+wxXaQQXYPRpaUt4bZG0uT1aVdfeA/w
 fayBuHxIMWXcApOB8gXqaNwZppefF4xPYEL/jqhguKuBGmKcVrHRCliIgHSSk7Z5v530XZxFc
 5G5vUYSAAY4wB5WCv4oqhnJmulU6lGHvzW3LYC4P08APx2SAGzgDMJ+8rsuaiVc3Gp/BIskzI
 6INVx1RFxqoJg0JX0SKFyu9+SpZXMgXf543fDYGUt1U60/04FA2uWNK53CPgjFjWCVIjBTTdR
 VSZxg9k4TFmS2mhiNBbL7mVc/oVDLPQ7hwlLreBTNfbVTEDb0HB8yM1R7DZ5MO4D67xsRgI96
 1/Red29kS7Y0DgnQVSNPHrR1BuscMh7WFNWGpxADb199GIehKlJN0rD7OYZ49zg2ZBwRwxakJ
 Cnex2Gapfzsp+8ltLylyfBwMQ4lFmtJl7niB2JubzKsuY89qlCK+vCB4tpbqiFDJ3GvNB4gms
 Bgo5AepN9MLaDku1mjsNOWHtG3KwwykYiCNtfGXs4h77TKwccEiKkW7bS8Z8vLy8bhv0Hsnpi
 JBfGy3zIq/42WdTmPDky9iWvMsH/deT52scyBg6GdasBgR5Z9AHknV1CYlrWdtAyxOhRs7BnI
 BW2iA3FN+5ofIE8PC3o2N0jGeAGdHcalRIKzNiGwclbysU4/LSmtv2udTOzw+u09NeGNOUxVs
 MsJsp5kvYF7OGRQdbug4jVnkLPEZm2pFztFtN57o8KsmlIHSSo=
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls: semctl: Add new test to verify the
 _time_high fields
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

On Thu, May 21, 2020 at 12:48 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> The _time_high fields must be reset by the kernel, add a test to verify
> that.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Right, here you do need to copy the struct definitions since I forgot
to add a way to detect the presence in the kernel header files,
sorry about that.

Possibly you could just have a check in the Makefile that lets
skips the test if it fails to build because of old kernel headers?
Or maybe check LINUX_VERSION_CODE to see if the headers
are at least from linux-4.19?

>  configure.ac                                  |   1 +
>  include/sembuf.h                              | 234 ++++++++++++++++++
>  runtest/syscalls                              |   1 +
>  runtest/syscalls-ipc                          |   1 +
>  testcases/kernel/syscalls/ipc/msgctl/msgctl05 | Bin 0 -> 498784 bytes

stale file

> +       /* get an IPC resource key */
> +       key = GETIPCKEY();
> +
> +       semid = semget(key, 1, SEM_RA | IPC_CREAT);
> +       if (semid == -1)
> +               tst_brk(TBROK | TERRNO, "couldn't create semaphore");
> +
> +       arg.buf = (struct semid_ds *)&buf_ds;
> +       TEST(semctl(semid, 0, IPC_STAT, arg));
> +       if (TST_RET == -1)
> +               tst_brk(TFAIL | TTERRNO, "semctl() failed");
> +
> +       if (buf_ds.sem_otime_high || buf_ds.sem_ctime_high)
> +               tst_res(TFAIL, "time_high fields aren't cleared by the kernel");
> +       else
> +               tst_res(TPASS, "time_high fields cleared by the kernel");
> +
> +       if (semctl(semid, 0, IPC_RMID, arg) == -1)
> +               tst_res(TINFO, "WARNING: semaphore deletion failed.");
> +}

The test looks good to me.

If we wanted to get fancy, you could check that the time is actually
correct when setting the system clock past y2038 with clock_settime64()
at the start and then setting it back at the end.
That might risk crashing the system though, depending what else
is running at the same time that relies on the time fitting into
a 32-bit time_t.

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
