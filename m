Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF5A1F366E
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 10:52:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F9063C2E62
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 10:52:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9F3183C2E44
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 10:52:08 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D099010014A8
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 10:52:07 +0200 (CEST)
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N7zJl-1ivTjI0FJT-014zIu for <ltp@lists.linux.it>; Tue, 09 Jun 2020
 10:52:07 +0200
Received: by mail-qt1-f172.google.com with SMTP id z1so16993772qtn.2
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 01:52:06 -0700 (PDT)
X-Gm-Message-State: AOAM533lwE7xdOVU3EfeVrX+z7Gh6Z7hzaqMV7iWP2/Ssq8L3cS3A/2n
 knU5tQGZpjZge9aZeR8/xFwnF9O4DMnS79IU1GM=
X-Google-Smtp-Source: ABdhPJyQs9R3TmFRU+kzzWmbHdkzkAykHx0pVHIjqXKJZ3grLoOVaVVOINnKSUcxZI/+fthKsmYzlmfqhyNQyBmwqpg=
X-Received: by 2002:ac8:7417:: with SMTP id p23mr23830482qtq.204.1591692725813; 
 Tue, 09 Jun 2020 01:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
 <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
 <20200608100900.c4fi7pw7euie6tnt@vireshk-i7>
 <CAK8P3a004cavRhyWx+uXYYteBi1LviahAv11+9JyGadN-vo8og@mail.gmail.com>
 <20200608112000.sjrbvmqjciifgyub@vireshk-i7>
 <CAK8P3a0PqtFWTZr9hvSy5Y0ZZOSNgfzw0x1DTTyuzfsfROpAvw@mail.gmail.com>
 <20200609070535.iym6m5n2v5urykbc@vireshk-i7>
 <CAK8P3a0giS2A=4Hc4SO7cVn_nOU4rz-KzbSkQJcddM2Hc=KRxg@mail.gmail.com>
 <20200609083219.5473zf2tq4tmjxac@vireshk-i7>
In-Reply-To: <20200609083219.5473zf2tq4tmjxac@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 9 Jun 2020 10:51:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2BaLtcyyfNQUJq-gvO6C_53hvLaNhajcpREwqHCEBYqg@mail.gmail.com>
Message-ID: <CAK8P3a2BaLtcyyfNQUJq-gvO6C_53hvLaNhajcpREwqHCEBYqg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:E23CnSyw9iGuMjHoO2FUgX0a4paUmIf55VcttjhkkEIspcC2e36
 J04FA9lSCG2VYnyJ2UNlzfpf9y/7Rq9IonWPtu/2yA4F8ifJuK+sH2dvyIMKgDc4zSeyLKM
 sefVcdQbnQBALHIIo0WVQ44VjnzFWmOklW39zjREVErPMRqwLU26nr8fTmF7NaxZhqWThT8
 aKTaSeS06QA2eAdxeQF7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Qsrhd/diyE=:GQQZ/3IH+tTvNYp2YmeZIQ
 rpsKdaaKYhKxtwNp/2gGUU4YAmwocbhuDb+8gjiOiJU/QN/iPrSlOrmCmSp7uxTyxYfAOyjNu
 o/IGngmkW+rSpEG5OY78bClKJF63mNN45Swmc6qGR2kvGX9H803GtmIu2SC4n9G1p4vY3Lvw/
 ZYpOWCsnW4k638MM+xHWWOC3qIQEjdDJzAGN9di1uMU0mzmxXPwPM4d/VFp7qQ45dJiLQolOH
 QT5x4KgrhzfuFLQx82blzK7Q9MKiN80QBJrUz94k5jgff2kM0PiY2xVOlGztlGB5Z0usMspU+
 502sHuXWe77AMyGsh9Nzle1jdXztG4lEjKFc13MqN4cqYyRmVdvDfX+njPB8tp9enLvHU/eVn
 N78VEbBd97nuE4kbDYlfGCMt7TMh+dPwFwFWkYQ2Tu8KKL569/QnCkc92tkepCA50Ssy41g8I
 598LB0FTSoKZ9bbarh0GwlgrUDvf1zNxaaoQVHydEFvJiH1FS4s6CjKd8HfPMMtxa1soaqZqF
 59yZOxvcj+KK0MgzidpdlXMsVhqDfS4ylTvtSgD3nxv00NHltwudK9yvKo5x583Au+TctIOzQ
 QM9jMHNwaT9E/DSwuK2zgB78ukngxPAG/0SrETiqhM5EZhcQ86iJ/0WsWoHneZVSeJN4zYJes
 8O974o+GiIeHBmNegBbb1aSiehz5xyurv3pBQxCrDZbvLLRAb4gBOE3nl942rqIw+EN2RoEuc
 QwN2WstZIqZVyh2+DNMdgSA2zDgsGAKWGIkftr46yvb3+m04BS5O86h4SJI0X/Rc8rknv6laL
 QROMMQa9FPHEt0QhhkkO+ObhpUG8ieKb5d3PBBqN4H0T/ApYdk=
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

On Tue, Jun 9, 2020 at 10:32 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 09-06-20, 09:43, Arnd Bergmann wrote:
> > On Tue, Jun 9, 2020 at 9:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 08-06-20, 16:51, Arnd Bergmann wrote:
> > > > You already have a special case for gettimeofday(), so just round down
> > > > the 'start' value to the previous microsecond when you are in that
> > > > case.
> > >
> > > Since this will also affect the next reading as well (as we will loose
> > > values < 1 us), I tried to do it a bit differently.
> > >
> > > @@ -78,6 +78,13 @@ static void run(unsigned int i)
> > >                         tv->gettime(clks[i], tst_ts_get(&ts));
> > >                         end = tst_ts_to_ns(ts);
> > >
> > > +                       /*
> > > +                        * gettimeofday() doesn't value less than 1 us, copy
> > > +                        * that from start.
> > > +                        */
> > > +                       if (tv->gettime == my_gettimeofday && end < start)
> > > +                               end += start % 1000;
> >
> > This looks like it should work correctly, but it feels a bit more fragile than
> >
> >                        if (tv->gettime == my_gettimeofday)
> >                                start -= start % 1000;
> >
> > which would bring the start and end values to the same resolution
> > rather than making up values that were never read.
>
> This sounds better, will pick it up.
>
> > Your approach however has the advantage of adding less overhead
> > as the % operator on a 64-bit integer is going to turn into a very
> > expensive calculation on most 32-bit processors that itself can
> > skew the timing.
>
> I am not sure of what you meant here, both the approaches are using
> the % operation.

Yours only needs it when the nanoseconds are actually lower, which
is only the case if no the actual time has not crossed into the next
microsecond. If the gettimeofday() call itself takes over a microsecond
to complete, then it usually will have wrapped, but this is highly
hardware specific as the amount of time it takes to read the current
clock registers can be anywhere from 'almost free' to 'several
microseconds'.

Doing a division would be the same as the modulo operator.

Using a 32-bit modulo or division on the tv_nsec portion instead
of doing it on the 64-bit nanoseconds is much faster but also
a little more complex.

Another option would be to allow up to 999 nanoseconds of
time going backwards before printing an error for the case
of gettimeofday() after clock_gettime(), like

if ((tv->gettime == my_gettimeofday)
    slack = 999;
else
    slack = 0;

if (start + slack < end)
      failure();

This is much faster as it avoids the division but does not catch
the corner case of gettimeofday() returning a value that is
slightly before the previous clock_gettime() but that is actually
in the previous microsecond interval.

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
