Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6C1DD0D3
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 17:11:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C0923C2532
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 17:11:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 50AC93C2556
 for <ltp@lists.linux.it>; Thu, 21 May 2020 17:11:08 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 667ED60163E
 for <ltp@lists.linux.it>; Thu, 21 May 2020 17:11:08 +0200 (CEST)
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mq2vU-1jF7I92dfu-00nCpR for <ltp@lists.linux.it>; Thu, 21 May 2020
 17:11:07 +0200
Received: by mail-qk1-f180.google.com with SMTP id w3so1996054qkb.6
 for <ltp@lists.linux.it>; Thu, 21 May 2020 08:11:07 -0700 (PDT)
X-Gm-Message-State: AOAM533RID8SUpMK2KAdJFZVCWud0V/kj2fd4jHHpuBlWXflk7PWFTEl
 HjeT30aqF5MxjrFrLtl5iyOPXYWEzfSOEoWyaQs=
X-Google-Smtp-Source: ABdhPJz/WPIRyKuKvv0qsC5AXJygc11C6sZh4XzItQmvLkiTDy92M70pf11X8NtBtgodo7a4dxyxEsVTaszkBSC+So8=
X-Received: by 2002:a37:46c9:: with SMTP id t192mr7105775qka.3.1590073866415; 
 Thu, 21 May 2020 08:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <3f3b7d669d47ae701385b43deb8280a353dd231e.1589877853.git.viresh.kumar@linaro.org>
 <20200519122347.GC16008@yuki.lan>
 <CAK8P3a2PgjYyijH=VoNGhs_xk1VvFN6ZNvNM-W4TopWY6jJNbA@mail.gmail.com>
 <20200519134511.GD16008@yuki.lan> <20200520071948.qtuzbfesqvcnsizd@vireshk-i7>
 <20200521142037.GC7833@yuki.lan>
In-Reply-To: <20200521142037.GC7833@yuki.lan>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 May 2020 17:10:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3gQwrO6iirirwaN4LiWw6AyShh42S3Ap+Jk_2TFK0PtA@mail.gmail.com>
Message-ID: <CAK8P3a3gQwrO6iirirwaN4LiWw6AyShh42S3Ap+Jk_2TFK0PtA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Provags-ID: V03:K1:SW0I0FkvlnVWrulIMx6Qnt+8xdGSikN9xTqmrEt5WC9ZtM46ZC4
 z4188SNae+WsL/tLpx2rSbas7PYUBJutYDMdu5Ld5VfZq/rlJ4fHDjbLImze8LnLyZDk5MY
 51rHmBKjm56cc1CTvIk13gR1IyvF1pTiyhqSzzStIWnKoXt6ImEh0HkAteP6ydmuVlb0/0W
 vJ2pmox2c1zSEMDMME8Ew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p9LCVp0a+mE=:cb3/5VPGaff0Y1bpXuh1dB
 FarUNjIdlXnF6FHVXFKbK0YlufdAuDPChyZ0ZZhTQgrZ6Zzk5sFxHf/6rqEFIc7bigIVFxZ/B
 FG49Jy8uFolT01mQDanvCAl+BXo2myT7gGKzCdw/0/E/R5rtu0Oph8BmCX76LqwrDGjWt86IA
 LXHQr+iQgMrxrjL5SjMgq69KDagCqQvXZKkBM5huESdp7+9uP+o/sX90a5nnZxc8TM3fFBh5P
 SYkzEKLjLi8krNfhUU+htHvsYVOUguz8bb0G5boE0T7B+6fIQ9aSr6tTWhkzL3Qd24l6L8R4w
 9e3fyjt3278NHXVR3mF8IFr2AETXvSMfOZtx+N0IK5/h2dBgU+EsgqvZDknjYZNV1FeazeVES
 EFZoxRwqyevEBEbdHuO21aYtKF4gCCQSG7u04Jc8loUWq2i49Q3kiLoD3gk2lpgf4wTvlWWfq
 pCiuX+HBtv9hikJCly8xCz7dEhawCeVSRvtiMrn4FzlZ+/jG/NqgGfzJ33OAN8L83jaqSBTjc
 EU0rhuuAqk4Ux3S9GH5Lasgt72AoBihsGafjYQvavIbc1v1uUTLr2Au7c4P4PqnT7eV/4o1kT
 tpHK68nOrlTL37dv2jx8wAAmP8BVx3lUHxM/EYUtUNg2jHQbWO0eebo9Rm9Jo97VeNZWkFrGn
 9w0ZD9aHfB+KK2chhwO1o4pHgkn5T/Tdjk37O/svcqdCy81RloZpDNU0YQpbIieuUZHzrjuwE
 1eEAvlnZ+J6vCgpz52NL3V21XmV3PHFn5pwVsGPpjekH1dK6UC5dLd/KP5KNXaSMPiXNuPfSn
 s38NRT9WXRd/53jgHCXYK0ED5mjrt1vdYVSt4kgSxr5dq6kJtU=
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls: Don't use tst_syscall()
 unnecessarily
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

On Thu, May 21, 2020 at 4:20 PM Cyril Hrubis <chrubis@suse.cz> wrote:
> > > I guess that at the current time we do support distros that are at max
> > > 10 years old, mostly because enterprise support cycles are about 10
> > > years in lenght.
> > >
> > > The issue here is that glibc needed -lrt passed to linker couple of
> > > years ago and we wanted to avoid the need of linking everything with
> > > -lrt, as calling the raw syscall was just easier fix.
> >
> > To conclude the discussion, is this patch okay or not ? The reason why I am
> > asking this is because this file still uses the old test framework and so can't
> > include tst_timer.h, and so doesn't have access to struct __kernel_old_timespec.
> >
> > What do you suggest I do here ?
>
> Well if it was only about __kernel_old_timespec we could easily just
> declare it locally in the file and be done with it.
>
> But I guess that newer 32bit architectures will have only the 64 bit
> syscall present, I think that somebody pointed out that this is the case
> for 32bit RiscV. If that's true we will have to have a fallback for that
> case as well.

Yes, that is correct. Also, the 32-bit time_t syscalls can be disabled
on newer kernels when you have a libc implementation that
uses the 64-bit calls exclusively.

I guess the fallback to to libc gettimeofday() isn't really needed
unless it needs to run on ancient kernels.

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
