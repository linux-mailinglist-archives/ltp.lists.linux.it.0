Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D2A1D736E
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 11:03:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56A383C4F0B
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 11:03:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D7A4F3C0331
 for <ltp@lists.linux.it>; Mon, 18 May 2020 11:03:03 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 088BA600853
 for <ltp@lists.linux.it>; Mon, 18 May 2020 11:03:02 +0200 (CEST)
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MMX9b-1jJkwb0u5n-00Jbze for <ltp@lists.linux.it>; Mon, 18 May 2020
 11:03:02 +0200
Received: by mail-qk1-f172.google.com with SMTP id i5so9308413qkl.12
 for <ltp@lists.linux.it>; Mon, 18 May 2020 02:03:01 -0700 (PDT)
X-Gm-Message-State: AOAM533JD8p27YdGdDnJL8kkbSCa0pbZ5bta1p7b8lzlo57D93gOWL2S
 KssaCM70VZ6MeGRMUp430THDBiZCCIv+dBZW43A=
X-Google-Smtp-Source: ABdhPJys+0xDfDuHZnvIifoUpEk9hBKaXiTy5edR2wJe/spDiJen1Wv+ZzuCrnGC/TuzSZQ6h7YI8MTaUCvdLZsO1+g=
X-Received: by 2002:a37:c96:: with SMTP id 144mr14961919qkm.138.1589792580945; 
 Mon, 18 May 2020 02:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589789487.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1589789487.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 May 2020 11:02:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3aP5S_w_FFv=UvJRSRTjcoNVy_W6ycm4OTct-7Q_5_xg@mail.gmail.com>
Message-ID: <CAK8P3a3aP5S_w_FFv=UvJRSRTjcoNVy_W6ycm4OTct-7Q_5_xg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:ZvNTyTNJRCwggDEiainVfV5RX9V95vIz5xZ7KOUYHJTYmo3mCh8
 yNeYWp2Z9M+D4OpMUacPPwC1iHHs0x+RJgX8x1ZF2+kMV4TjEw3a93dDJvBlfWdUlodIzxk
 YAngthuzsFPknO8LgMHynbt1+1odt8wwWaSr6E6cmcRRumZkdLRO/zpoF4E+0B7w5lM5Tck
 1XwN2InYd/qvYu+3L9pxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hB/QUC2rOt0=:YqfiV3uoZE9fpujnYTA+vp
 DBveaZIR1dGA+2qYI85LBo9bpx7nHtaSd24rnpv3jVYbNLG7HcnmR2qSlIPoGAPdg7USlS9RM
 pf2em3AuUgRnrA/3O/WsSL/sJk9fl3el4PdlRdy5Vzwy/0IHUBijeg0LWWdqfDjqnIWBpdMzQ
 M8fO75Eo1m20EFhx2OW5VWLsoad897FRCe0rWEgdaI+HR8ijse3XGClE+hU6feRTZZ0NdgKLx
 fPLFhxbfRsfyOzjHfBb5FPyBQk3tfQ17DAupU5Uzoqf6sGxZnZynU4LuRhKk1Xdh91E2+BxKm
 1kWSwNaREcbKIKI+SVMOzNCZRdImvB2X5mFg4Qm0JZFahA/Ui8qbc3yiJ/s+eeVL8n0EK31u+
 NW2tt9DRWhZ2GtzeL3yoisYyEyeo8/FJqMf56Zk3paGNdh46UOxFoo6CZbBeGHcZABfgGvYqo
 x/VhLAbauI4zIc7Zt3s7bxJ7RmVqAHzCJL/mrkWb+EQcdiXWVkYxlqTkcT+Wm/QmTw5qsHiBH
 rrsa7wJdrmHQuk8tkF3NhNplbxlDy7vKbtj4EFjwLSgP6MrL3Vbt3nq8kH+0HhEGBRUyH4Vx4
 jZtl59ijzo/sgnFl6QGLvDSRx8elTjy85A2y+CwRuxVC2StZMfgNGxoN3FHoGoXCXqW/HmdQ0
 rQfVBQaw084TIa/zqYOTpeBo6+toqoFRxft8rsYErAybLVJQ84G4La8R1tj/MHOk7K53g7PuR
 Yd9NIKLwQusyWEVqLJYBR6fjvdxdmKSaOOq05zAe+t8CNqQEkTu0//2zzGVwnZSmXXVQ2BsN5
 nXH6SM3MXXooQM0EOur4Jb0FWqRB51IQWdsuOqJUNNjCn31NSY=
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

On Mon, May 18, 2020 at 10:15 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hi,
>
> This updates the pending syscall tests that lacked the time64 updates.
>
> V3:
> - Fix issues related to passing incorrect timespec type to syscalls.
> - Take care of futex and semtimedop tests where the architecture
>   provides the syscall number, but doesn't implement it.
> - Other improvements and cleanups.

Hi Viresh,

These all look good to me.

I cross-referenced it with my list of syscall changes, and found that this
set of patches does not contain
clock_{gettime,settime,adjtime,getres,nanosleep},
waitid, statx and msgctl/semctl/shmctl. Did you cover all of those in a previous
patches, or are they planned for a follow-up?

There is also a list of syscalls that may need to get updates to their tests
because passing a timeval/timespec into them is now broken and they need
to receive the __kernel_old_* variants:

time, stime, gettimeofday, settimeofday, adjtimex, nanosleep,
alarm, select, old_select, io_getevents, utime, utimes, futimesat,
oldstat/oldlstat/oldfstat, newstat/newlstat/newfstat/newfstatat,
stat64/lstat64/fstat64/fstatat64, and wait4/waitid/getrusage.

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
