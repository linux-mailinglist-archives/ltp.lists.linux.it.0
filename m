Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D437D4DB3
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 08:49:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BBCE3C235D
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 08:49:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 954E73C220E
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 08:49:38 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 95EAC1A0100E
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 08:49:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A3FC869089;
 Sat, 12 Oct 2019 06:49:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BCA56017E;
 Sat, 12 Oct 2019 06:49:20 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D3974E589;
 Sat, 12 Oct 2019 06:49:20 +0000 (UTC)
Date: Sat, 12 Oct 2019 02:49:20 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <23965038.5952515.1570862960195.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2f2_5wNfNB=a-+=E+KevFOVvjCQ0sjBEG-eS27dwQxarw@mail.gmail.com>
References: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
 <8c5d507fd19bc3110561ed1c666b7ac47442e09e.1570632125.git.jstancek@redhat.com>
 <CAEemH2d82pP2mwHnw42h-17HipGsVeYesfzg7o4axvCiRKU0=Q@mail.gmail.com>
 <CAEemH2eYc1VVtavWKTE-x1gqY6q7qyMVZ-bETXJytPkdvHJriw@mail.gmail.com>
 <1445930938.5951899.1570861051806.JavaMail.zimbra@redhat.com>
 <CAEemH2f2_5wNfNB=a-+=E+KevFOVvjCQ0sjBEG-eS27dwQxarw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.28, 10.4.195.10]
Thread-Topic: read_all: retry to queue work for any worker
Thread-Index: GSFlqV7cpVshMyRT1Qk18i8OzTrPGA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Sat, 12 Oct 2019 06:49:20 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] read_all: retry to queue work for any worker
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> On Sat, Oct 12, 2019 at 2:17 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> >
> >
> > ----- Original Message -----
> > > Hi Jan,
> > >
> > > On Fri, Oct 11, 2019 at 4:24 PM Li Wang <liwang@redhat.com> wrote:
> > >
> > > >
> > > >
> > > > On Wed, Oct 9, 2019 at 10:43 PM Jan Stancek <jstancek@redhat.com>
> > wrote:
> > > >
> > > >> read_all is currently retrying only for short time period and it's
> > > >> retrying to queue for same worker. If that worker is busy, it easily
> > > >> hits timeout.
> > > >>
> > > >> For example 'kernel_page_tables' on aarch64 can take long time to
> > > >> open/read:
> > > >>   # time dd if=/sys/kernel/debug/kernel_page_tables of=/dev/null
> > count=1
> > > >> bs=1024
> > > >>   1+0 records in
> > > >>   1+0 records out
> > > >>   1024 bytes (1.0 kB, 1.0 KiB) copied, 13.0531 s, 0.1 kB/s
> > > >>
> > > >>   real    0m13.066s
> > > >>   user    0m0.000s
> > > >>   sys     0m13.059s
> > > >>
> > > >> Rather than retrying to queue for specific worker, pick any that can
> > > >> accept
> > > >> the work and keep trying until we succeed or hit test timeout.
> > > >>
> > > >
> > > RFC:
> > >
> > > Base on your patch, I'm thinking to achieve a new macro TST_INFILOOP_FUNC
> > > which can repeat the @FUNC infinitely. Do you feel it satisfies your
> > > requirements to some degree or meaningful to LTP?
> >
> > I'm OK with concept. I'd like more some variation of *RETRY* for name.
> > Comments below.
> >
> 
> Thanks, what about naming: TST_INFI_RETRY_FUNC?

Or just keep TST_RETRY_FUNC and add parameter to it?

> 
> And do you mind use it to replace your function work_push_retry()? I know
> it may be not smarter than work_push_retry() but it looks tiny for code.

It may need some wrapper, because work_push_retry() may be passing different
argument to function on each retry, which was one of reasons for the patch.

> 
> > ...
> > > +#define TST_INFILOOP_FUNC(FUNC, ERET) \
> > > +       TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, -1)
> > > +
> > >  #define TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, MAX_DELAY)        \
> > > -({     int tst_delay_ = 1;                                             \
> > > +({     int tst_delay_ = 1, tst_max_delay_ = MAX_DELAY;                 \
> > > +       if (MAX_DELAY < 0)                                              \
> > > +                tst_max_delay_ *= MAX_DELAY;                           \
> >
> > Shouldn't this be just times (-1). For -5 you get 25 as max sleep time.
> >
> 
> Agree.
> 
> >
> > >         for (;;) {                                                      \
> > >                 typeof(FUNC) tst_ret_ = FUNC;                           \
> > >                 if (tst_ret_ == ERET)                                   \
> > >                         break;                                          \
> > > -               if (tst_delay_ < MAX_DELAY * 1000000) {                 \
> > > -                       usleep(tst_delay_);                             \
> > > +               usleep(tst_delay_);                                     \
> > > +               if (tst_delay_ < tst_max_delay_ * 1000000) {            \
> > >                         tst_delay_ *= 2;                                \
> > >                 } else {                                                \
> > > -                       tst_brk(TBROK, #FUNC" timed out");              \
> > > +                        if (MAX_DELAY > 0)                             \
> >
> > pastebin has this condition backwards, but here it looks ok
> 
> Sorry for the typo in pastebin.
> 
> --
> Regards,
> Li Wang
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
