Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DA91E5D5A
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 12:47:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51A8C3C31CB
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 12:47:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id F00CC3C07CF
 for <ltp@lists.linux.it>; Thu, 28 May 2020 12:47:34 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 643731039C17
 for <ltp@lists.linux.it>; Thu, 28 May 2020 12:47:34 +0200 (CEST)
Received: from mail-qv1-f44.google.com ([209.85.219.44]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MD9jV-1jmonE2zkP-0098TP for <ltp@lists.linux.it>; Thu, 28 May 2020
 12:47:33 +0200
Received: by mail-qv1-f44.google.com with SMTP id dp10so1070896qvb.10
 for <ltp@lists.linux.it>; Thu, 28 May 2020 03:47:33 -0700 (PDT)
X-Gm-Message-State: AOAM531CcRVFkl4mxszitrKgOSp/b4lFQlKux7CcPHCizbXQnxgL51yA
 3SQxwtgeS8n7BLhYnBtAmMXdP+D/WvJs0wJ2chE=
X-Google-Smtp-Source: ABdhPJz4IYnU9rjFyby8HXN0BFhBaGZfxgkHjB2lrsOTwFR65VAEcOIjaPLH/5uYfEMFLNF9fpl7RXGtkoqvcSuKd/w=
X-Received: by 2002:a05:6214:370:: with SMTP id
 t16mr2336276qvu.197.1590662852636; 
 Thu, 28 May 2020 03:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <70417fdc55c750e8b13d7124e66a7e8a59182e75.1590494889.git.viresh.kumar@linaro.org>
 <86a36c7d5919a966e077cb76f0d8710f31bcc60a.1590649002.git.viresh.kumar@linaro.org>
 <CAK8P3a11aWYdBtgV=T91_BOVR_hX-OZTAVhr806nbTFtCE+3MQ@mail.gmail.com>
 <20200528091148.3afrkdjqzjer4vqh@vireshk-i7>
 <CAK8P3a3Y4P-aLCEYmYiLGqNcccyXCcGfHJkoPAEzxFz8p2yocw@mail.gmail.com>
 <20200528103506.rlchdwf2yppl7fhz@vireshk-i7>
In-Reply-To: <20200528103506.rlchdwf2yppl7fhz@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 May 2020 12:47:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3MVuNa32ATv+b8pnOAHBPd8+zfukm0bzy6bB3O21BT6A@mail.gmail.com>
Message-ID: <CAK8P3a3MVuNa32ATv+b8pnOAHBPd8+zfukm0bzy6bB3O21BT6A@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:8D63wkJFa/HXI7Xpr5E0fDe85joqtPMcZCE/CwgPMlbZBtzJdYK
 wsZQxhQmx0HrbUgnTYU8AU8xsQh0Oeu0UWcb9R3JaYob2RwUeQbu3+4uWWAkJCRW59hj9Ae
 EB8mf9fYSSR0K+74zuhQFs9w38Ma5mlOQp4i2Fk+tVY1fjxQl8YZBRoxrUYhTOCpAozD6tR
 pZwUGdMub5aI5kn9p67/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A0gASPZegXc=:h/ftZy7cZnnU4kZuZV3lLg
 W6OBopAKhk025QM/Zb159kUMDpqYQjOPcHnIm6RONY3GYF6SN+TRQZ3cDuqGD7ryDgY+BUdF2
 aZ3VCo5Q7l/zq0USQX/vM0GiBTwg4MG9QyMBEmBMs9E5mckcCaigFh8lIPcO0QNTxY4Kxk8iJ
 CkpnKhlKKVYXezoVEJK5p6mHsPFGFMLLwGqGj83JHcl9t5Yb07XGVkHr+fBzJa2jnsCXEb/F3
 Q8j37MeEZT6bSs7OHJD/4FMyvQadaUur+Uo8MmSmJSvV24X97tD7Tiq+zbT5Ko/EawpF4Q9XV
 70AaqB2r0wnswzdjI1R4HZPCJO/R5aiFSR9eWGE/SC9v73pKGV7EBmhI9xcsVbw8iIXs+t9MF
 8Vd+4GSTMVUXk191zGu5ilGVULTGstVgMUSvbtShvgFUvq7aDo9Dssp4Ug2bVVk1PNlWfycVa
 u/Wf8jBlOdXDlMZti3hDomsrE3nVMLCPfBEIiIRVgzneTHx736nSAFFkGRYON+gQ0m+SN1P9G
 ytVzkAPTfjRL77vGETGP2oik6kLXp8bZqMFLWQbHgsPKVTPDIWJ5CK0owXmFMNOVJjPLEWNyq
 0IEtPimkC54MoaioVgVNx5fcBP3ehetiuK4Hhze/Vtt98wBDOJpBvuJ3LFt3wx+tpgHtCZsJ1
 G4wDSADX+NYQ8ynnOVJVrcAx1Sq1YSp5WZdXicheZWClIkfLNnRJ/NR0SI8SD/znbHnYNh6pY
 /x7BGIZ5jrn45i+w17A2BhCfN0eMrxRT9Ziavg+40kwKuPSCYVIFW7r5r//ObU1oUEzIMVG2p
 hYDKk2Zt65YF9Ed4naKuKjswU2LGhHp2EAORHTiEnr+98VNePo=
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

On Thu, May 28, 2020 at 12:35 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 28-05-20, 11:31, Arnd Bergmann wrote:
> > On Thu, May 28, 2020 at 11:11 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 28-05-20, 10:27, Arnd Bergmann wrote:
> > > > On Thu, May 28, 2020 at 8:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > >
> > > > > +       ret = tv->clock_settime(CLOCK_REALTIME, tst_ts_get(&ts));
> > > > > +       if (ret == -1)
> > > > > +               tst_brk(TBROK | TERRNO, "clock_settime() failed");
> > >
> > > But I noticed that even this version may not be good enough, as I am
> > > still doing the same thing in setup(), i.e. setting time to just
> > > before y2038 to test if it is y2038 safe or not. I believe even that
> > > isn't fine ?
> >
> > Good point. I see you have this check above that:
> >
> > +       /* Check if the kernel is y2038 safe */
> > +       if (tv->type != TST_KERN_OLD_TIMESPEC)
> > +               return;
> > +
> >
> > So that part should prevent it from doing something bad,
>
> Not really. That code is part of the setup() routine and with "return"
> we will go and run the actual test run(). That code is there to avoid
> running the code on time64 implementation unnecessarily.

Ok, I see.

> > but I now
> > see it's still not great because it also prevents the test case from running
> > on 64-bit architectures. If you change the condition to also check for
> > sizeof(__kernel_old_timespec) it should be ok.
>
> What about this instead of the whole setup() changes:
>
>        /* Check if the kernel is y2038 safe */
>        if (tv->type == TST_KERN_OLD_TIMESPEC &&
>            sizeof(__kernel_old_timespec) == 8)
>                tst_brk("Invalid configuration");

Sounds good, as long as this only stops the clock_settime() run
and not all variants including the clock_settim64() one.

         Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
