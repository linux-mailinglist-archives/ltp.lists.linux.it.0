Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDB21DAF5C
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 11:52:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D41653C4E25
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 11:52:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B5C5C3C4E00
 for <ltp@lists.linux.it>; Wed, 20 May 2020 11:52:21 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1A99C2003B1
 for <ltp@lists.linux.it>; Wed, 20 May 2020 11:52:21 +0200 (CEST)
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Myb09-1iq5GL1rnp-00yzBz for <ltp@lists.linux.it>; Wed, 20 May 2020
 11:52:20 +0200
Received: by mail-qk1-f173.google.com with SMTP id s1so2881676qkf.9
 for <ltp@lists.linux.it>; Wed, 20 May 2020 02:52:20 -0700 (PDT)
X-Gm-Message-State: AOAM5330d1DicNn0aNwjIF+rpydbrfBVZ3bwkTm0amWd95JglV4YGWM2
 GD8mo3+c92hNk5B+nYGvzPjcxLkQ3XDDjNS1mUA=
X-Google-Smtp-Source: ABdhPJzO5CjopkfQUD8LBM9kj6Ezg7F4xv7vWi/4vEgOxpbpV0/A/yoA7S+vk8DMQCI68X68dXERFJK21ZG0G+yJsq0=
X-Received: by 2002:a37:46c9:: with SMTP id t192mr923304qka.3.1589968339249;
 Wed, 20 May 2020 02:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <a6c2c59a9cffb86d751b911384a560803e723623.1589877853.git.viresh.kumar@linaro.org>
 <20200519122155.GB16008@yuki.lan> <20200520073151.y5xttqnqeqe4jmka@vireshk-i7>
 <CAK8P3a3kS-_ZynTR=o9FVAXEyr9VcAaigOcnG-_Se+wA_+jQoA@mail.gmail.com>
 <20200520090530.eabgbtpxlmnwbrpm@vireshk-i7>
 <CAK8P3a0DHENYhT3R6Xuygf2DiS8LLCCCfL025ESxqf6Rvth7ZA@mail.gmail.com>
 <20200520093947.4vwmc4jdyqte67ua@vireshk-i7>
In-Reply-To: <20200520093947.4vwmc4jdyqte67ua@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 May 2020 11:52:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2HW5WLLfyTY-nFpge-Ht1r1ZhtA+wFXDuws79yDjTfKw@mail.gmail.com>
Message-ID: <CAK8P3a2HW5WLLfyTY-nFpge-Ht1r1ZhtA+wFXDuws79yDjTfKw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:bbK74V7idUPd4mCfkWrPDv7jeBGN3qEt8n7D5ZJ6MO6REuLXQLS
 pnF7Cc641niyBQ7uN4hvdxlkQeflJ361ajWmOs7eSJhOLi2TIZaJCsHUwxHifkpb0WDBpd5
 gF8DarsLS2F26S/Ga+PYu7GIpPy4Z+GokxZLCLHjjlkWZBO/H3FE/iAsuf7FRXH4jtZua2Q
 p9UcYaJyJexBjMnmBpvXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2/ijlmQ50Eg=:zdbypaCzDDgtJGH6Rz75E3
 0gkjB+EHZsgtZcAe0NrGQRZjY+UxDxgesyTyd7uDTpe0L9WGFjZHhZv8NEiD9U1uq21LuAhrj
 j7ELZnR8WNQt209YWc/xd0OCoeLTlJqQe4DU52ELdI05W9rO2OYg96h6N6pts8DirIJEXULvn
 x6mkzbGTmKNATCQBe6sguXJu2Iii5q7Izx29ZFbLCOe1meTJ9ThTM2mHboYB7Hards072noOz
 269/08cugwQyiRJRc9U6DemIoD/jw+r0/rSmWgr/SNicGxXaMY9lEZYGTKEIsMrGeIEGVwjd2
 rKPO3HdgRS3+EaPqLFAvKeAToXKAH/d13XjDRaVVI3OS18qtYt9pUvuJTMlY/LZSk5wsQLNP6
 8i7AXXnPDKPtVTdWeg9cszSh9kMDln7SqWWVHXK/eA7Tsc/pELz6sbKsvTY+j5N7oQPkVEiI5
 kwnwtzVcdDXPMkNcvoofYS51FUcpEwIcr8ecTxo0STgUNihQV6elcA4N92VaGknOF+gTYhhAt
 Qr0QvwTaWYF1xy2owVBuRYyoPwF2F7Mm32CsYzcz0BBfthSLU3+VpqqDbR+Y7SEQt5yefviY/
 RQs+HQqveDb4TKA6Q39a8HS2bqAdV6gZSega/MCvjxOL+qfC5uAkctRfBMemoGN86wJ+ZH3+u
 A54TszECr8FA9rpHqQC3CBczuAjqYSaoz0CwMYhVVX7igsX3abnMYj2QgwY91eR/0wlq47U/G
 l6yWaQ6JhjHKR7BwMfSU7PRhcspK0fWdQttCjaGdHbwTiUMXIwomcK8mdvasZ78aTwB1rVU7m
 FDrR+QnkOsYNaUcsmV6A/lYsvxk5UMTnxvLBYizWW8xIKNr61M=
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] syscalls: Don't pass struct timespec to
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

On Wed, May 20, 2020 at 11:39 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 20-05-20, 11:35, Arnd Bergmann wrote:
> > On Wed, May 20, 2020 at 11:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > On 20-05-20, 10:47, Arnd Bergmann wrote:
> > > > On Wed, May 20, 2020 at 9:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > > int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
> > > >  {
> > > >        int ret;
> > > >
> > > > #ifdef(__NR_clock_gettime64)
> > > >         struct __kernel_timespec newts;
> > > >         ret = tst_syscall(__NR_clock_gettime64, clk_id, &newts);
> > > >         *ts = (struct timespec) { .tv_sec = newts.tv_sec, .tv_nsec =
> > > > newts.tv_nsec };
> > > >         if (ret != -ENOSYS)
> > > >               return ret;
> > > > #endif
> > > >
> > > > #ifdef __NR_clock_gettime
> > > >         struct __kernel_old_timespec oldts;
> > > >         ret = tst_syscall(__NR_clock_gettime, clk_id, &oldts);
> > > >         *ts = (struct timespec) { .tv_sec = oldts.tv_sec, .tv_nsec =
> > > > oldts.tv_nsec };
> > > >         if (ret != -ENOSYS)
> > > >               return ret;
> > > > #endif
> > > >
> > > >        /* fallback for prehistoric linux */
> > > >         struct timeval tv;
> > > >         ret = gettimeofday(&tv, NULL);
> > > >         *ts = (struct timespec) { .tv_sec = newts.tv_sec, .tv_usec =
> > > > newts.tv_nsec / 1000};
> > > >
> > > >         return ret;
> > > > }
> > >
> > > This is used only for the internal working of the library and so we may not need
> > > to support all these timespec types TBH and make it complex.
> >
> > Well, the point here is that you need the function to reliably return the
> > current time in the right format, and I don't think a simpler implementation
> > would be correct. In fact, I just realized that your patch version cannot work
> > on riscv32 since it only has __NR_clock_gettime64 but not __NR_clock_gettime.
>
> I am wondering that there would be lots of such issues across LTP, all existing
> ones btw, and should we try to fix them or not ? No one ever ran it on Risk I
> believe, otherwise they would have seen it.

I tried running LTP last year on an arm kernel that I configured to behave the
same way as rv32 (disabling CONFIG_COMPAT_32BIT_TIME) and I did
run into these problems, but I don't think they were too hard to work around.

           Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
