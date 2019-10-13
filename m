Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 368EBD5512
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Oct 2019 09:54:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADDED3C1D5C
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Oct 2019 09:54:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2F7C73C1CB4
 for <ltp@lists.linux.it>; Sun, 13 Oct 2019 09:54:12 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D4371600845
 for <ltp@lists.linux.it>; Sun, 13 Oct 2019 09:54:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3530C85539;
 Sun, 13 Oct 2019 07:54:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CF935D6A3;
 Sun, 13 Oct 2019 07:54:08 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 963914A460;
 Sun, 13 Oct 2019 07:54:07 +0000 (UTC)
Date: Sun, 13 Oct 2019 03:54:07 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1498901254.5980601.1570953247355.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2cuxbW55Y_mv9t0u7PEJyQVr9dgtZVFrDYKLi51MSsLmg@mail.gmail.com>
References: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
 <8c5d507fd19bc3110561ed1c666b7ac47442e09e.1570632125.git.jstancek@redhat.com>
 <CAEemH2d82pP2mwHnw42h-17HipGsVeYesfzg7o4axvCiRKU0=Q@mail.gmail.com>
 <CAEemH2eYc1VVtavWKTE-x1gqY6q7qyMVZ-bETXJytPkdvHJriw@mail.gmail.com>
 <1445930938.5951899.1570861051806.JavaMail.zimbra@redhat.com>
 <CAEemH2f2_5wNfNB=a-+=E+KevFOVvjCQ0sjBEG-eS27dwQxarw@mail.gmail.com>
 <23965038.5952515.1570862960195.JavaMail.zimbra@redhat.com>
 <CAEemH2cuxbW55Y_mv9t0u7PEJyQVr9dgtZVFrDYKLi51MSsLmg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.9]
Thread-Topic: read_all: retry to queue work for any worker
Thread-Index: 3fv/rA3FOhVCmpaFPv6iCTrcKDm1ew==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Sun, 13 Oct 2019 07:54:08 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
> On Sat, Oct 12, 2019 at 2:49 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> > ...
> > > > > Base on your patch, I'm thinking to achieve a new macro
> > TST_INFILOOP_FUNC
> > > > > which can repeat the @FUNC infinitely. Do you feel it satisfies your
> > > > > requirements to some degree or meaningful to LTP?
> > > >
> > > > I'm OK with concept. I'd like more some variation of *RETRY* for name.
> > > > Comments below.
> > > >
> > >
> > > Thanks, what about naming: TST_INFI_RETRY_FUNC?
> >
> > Or just keep TST_RETRY_FUNC and add parameter to it?
> >
> 
> Sounds better, we could add parameter @INFI to control the retry as a knob.
> 
> /* @INFI - 1: retry infinitely, 0: retry in limit times */
> 
> #define TST_RETRY_FUNC(FUNC, ERET, INFI) \
>         TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, 1, INFI)

Other option is we use directly TST_RETRY_FN_EXP_BACKOFF.

> 
> 
> > >
> > > And do you mind use it to replace your function work_push_retry()? I know
> > > it may be not smarter than work_push_retry() but it looks tiny for code.
> >
> > It may need some wrapper, because work_push_retry() may be passing
> > different
> > argument to function on each retry, which was one of reasons for the patch.
> >
> 
> I was not meaning to hack the work_push_retry() function, I mean to change
> your patch as below after we improve the TST_RETRY_FUNC.

Why not? Wouldn't we get better performance if we don't wait on specific worker
to complete?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
