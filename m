Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 293811E5BE5
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 11:31:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CE2B3C31CB
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 11:31:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 327CC3C2033
 for <ltp@lists.linux.it>; Thu, 28 May 2020 11:31:36 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8526E61B8C6
 for <ltp@lists.linux.it>; Thu, 28 May 2020 11:31:04 +0200 (CEST)
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N7Qt9-1ix3Pf3KaD-017nIU for <ltp@lists.linux.it>; Thu, 28 May 2020
 11:31:35 +0200
Received: by mail-qv1-f50.google.com with SMTP id v15so12597382qvr.8
 for <ltp@lists.linux.it>; Thu, 28 May 2020 02:31:34 -0700 (PDT)
X-Gm-Message-State: AOAM5311Ln5szHZ8czHWFJ1G9330wHD7NCDWVAsQSJ4B++AZ2BWGPacO
 KqMBieJfu8/yU6wzlzX6DQKRCLIOgzexSzRQIcM=
X-Google-Smtp-Source: ABdhPJxppq5VAWb9TJCFXBx8PHUiYbmWaxE/AeX+OxecNnsIoVvw4iMTkdDN19kLA38P1Q6pLlw7gTYMCnc6SZswJWo=
X-Received: by 2002:a05:6214:370:: with SMTP id
 t16mr2067337qvu.197.1590658293510; 
 Thu, 28 May 2020 02:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <70417fdc55c750e8b13d7124e66a7e8a59182e75.1590494889.git.viresh.kumar@linaro.org>
 <86a36c7d5919a966e077cb76f0d8710f31bcc60a.1590649002.git.viresh.kumar@linaro.org>
 <CAK8P3a11aWYdBtgV=T91_BOVR_hX-OZTAVhr806nbTFtCE+3MQ@mail.gmail.com>
 <20200528091148.3afrkdjqzjer4vqh@vireshk-i7>
In-Reply-To: <20200528091148.3afrkdjqzjer4vqh@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 May 2020 11:31:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Y4P-aLCEYmYiLGqNcccyXCcGfHJkoPAEzxFz8p2yocw@mail.gmail.com>
Message-ID: <CAK8P3a3Y4P-aLCEYmYiLGqNcccyXCcGfHJkoPAEzxFz8p2yocw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:BQbBxoGspTv25hnEIJKu3cXFMVm15tEv8LictUnEX7Cyid8r4Ba
 dGOvacvjF2ABk5keThnkwH3vnmD+GRvIav6+OQWudToaYCciMhmhBXPghaRYElEf70T8+zj
 wp9c7rmK/YUb+px8POBtHHjIoQqSxqccXprAbEUMxscxFL1nii7Z2kINbWO8qsLdl0sNl4n
 tDV/fF9b0PJOIf0Ab0c/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:an2S4SFqukk=:08RsXJBtiS7lRjYPcNGfzO
 A69F5qJ9Y15Oc62ril2jsw3rzmEnvYzg6duEq2NErOQKNRnPBPbhC50V23EtUf5E5zSyG4Kca
 bbL+cf6eMuAj7eUhOIgMcfZmv+qJcH7JIi0OMG9qkJqT9TtZcFdVCMSGYwvbAQPd1KCDWXKmL
 IELATbp+fzU5k1s4+hU1YWn+OnWZMPdxHxIWtXorR+ftxVAoChZLPXH1oiwZk5KF/CyUYk2Ba
 wP7uhvAtzUQ/Gq4UZHChwRwMyxrTwKfB8b5U+lWln7eHYE81hoJcfgXmbOtECrGAp5+hBH3rK
 4feGoj8eR5uDbtc+ST6M29qJb0YneSobtB+nYDFvk/tgq3ea3tTG0TemII3Jv9TgNdFbDus4s
 Fo3dpBadX1MOBlR1KtFCAKsHhh6r8FdMTcEMB3pPA4oNZ2VrDHmRbvKJWHHPhLgp4Oog2RjIy
 9IVeoNErDWcSX5fLqT5iVY2UTcv90F8hMHm8CjPGPWUQdkyF/zOXoKKjQobB9pErRrf6Iajvi
 BAcaNkhE8TD6jW4fBxUV/3z/P7T/Ia+cZyOJMhAcNGm4vAOXGLMnw6qbhCzr+y6eZvEVBJKwP
 xRsERVhXjsMI7Ve0Xq+yXtLv9SERSao9faRmxBexz0ecj1g6nY8nh8NAzWoTAAt5Viu/1wmTM
 T0No5tpDekryBeB1yJDG0zLSyRVSLDsMY3Xl/B49HVaCQ4zrMHmSqrpb7PkH/wRAKzA2MCEGy
 HS7Zc+J0Z3h1eyzZSWlqeSnKMaJqKjDtVHzuWsl8KrzA5QjzjfJqqoWDHcB67J56IqYEKnQrG
 88kSflf8hpucHWthNmgmo4VvQ5fZ+ElFkcI/M3B80mAKBixTcY=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls: clock_settime: Add test around y2038
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

On Thu, May 28, 2020 at 11:11 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 28-05-20, 10:27, Arnd Bergmann wrote:
> > On Thu, May 28, 2020 at 8:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > > +       ret = tv->clock_settime(CLOCK_REALTIME, tst_ts_get(&ts));
> > > +       if (ret == -1)
> > > +               tst_brk(TBROK | TERRNO, "clock_settime() failed");
>
> But I noticed that even this version may not be good enough, as I am
> still doing the same thing in setup(), i.e. setting time to just
> before y2038 to test if it is y2038 safe or not. I believe even that
> isn't fine ?

Good point. I see you have this check above that:

+       /* Check if the kernel is y2038 safe */
+       if (tv->type != TST_KERN_OLD_TIMESPEC)
+               return;
+

So that part should prevent it from doing something bad, but I now
see it's still not great because it also prevents the test case from running
on 64-bit architectures. If you change the condition to also check for
sizeof(__kernel_old_timespec) it should be ok.

> diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime03.c b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
> index 9e316378b1cc..876651a5d537 100644
> --- a/testcases/kernel/syscalls/clock_settime/clock_settime03.c
> +++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
> @@ -72,6 +71,7 @@ static void run(void)
>                 .sigev_notify = SIGEV_SIGNAL,
>                 .sigev_signo = SIGABRT,
>         };
> +       struct tst_ts diff;
>         timer_t timer;
>         sigset_t set;
>         int sig, ret;
> @@ -105,7 +105,16 @@ static void run(void)
>         if (sigwait(&set, &sig) == -1)
>                 tst_brk(TBROK, "sigwait() failed");
>
> +       ret = tv->clock_gettime(CLOCK_REALTIME, tst_ts_get(&end));
> +       if (ret == -1)
> +               tst_brk(TBROK | TERRNO, "clock_gettime() failed");
> +
>         if (sig == SIGABRT) {
> +               diff = tst_ts_diff(end, ts);
> +
> +               if (tst_ts_get_sec(diff) != EXPIREDELTA)
> +                       tst_res(TINFO, "Test slept longer than it should have, expected:%d, actual:%lld",
> +                               EXPIREDELTA, tst_ts_get_sec(diff));
>                 tst_res(TPASS, "clock_settime(): Y2038 test passed");
>                 return;

Yes, I think that should print a warning when something goes wrong,
but it can be improved:

- don't say it slept longer when it could also have slept shorter, or not
  slept at all. It's probably enough to say that the expired time is not what
  was expected and leave the interpretation to a person

- comparing only the seconds means that you warn when the elapsed
  time was less than expected or more than 1000000000 nanoseconds
  longer than expected, but that is a fairly long and arbitrary interval.
  Maybe make it something like 50ms and use a constant for it, so it
  can be adjusted if necessary.

        Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
