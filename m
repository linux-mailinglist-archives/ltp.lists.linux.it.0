Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D86021659B4
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 10:02:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79F473C2244
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 10:02:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 83BDA3C1840
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 10:02:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E61782014D3
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 10:02:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F4073AEF6;
 Thu, 20 Feb 2020 09:02:20 +0000 (UTC)
Date: Thu, 20 Feb 2020 09:51:29 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200220085129.GA11465@gacrux.arch.suse.de>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <aab7ae7e324c40e8e995ff381384a402d2aba8f5.1582104018.git.viresh.kumar@linaro.org>
 <CAEemH2f7eezS27odRq9qvAN=BCskpvvELECr7+Nsdd+Z_7sofA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f7eezS27odRq9qvAN=BCskpvvELECr7+Nsdd+Z_7sofA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 04/10] syscalls/fsopen: New tests
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > +static struct tcase {
> > +       char *name;
> > +       unsigned int flags;
> > +} tcases[] = {
> > +       {"Flag 0", 0},
> > +       {"Flag FSOPEN_CLOEXEC", FSOPEN_CLOEXEC},


> Maybe better to remove the 'Flag' keywords from here and add it to the
> print sentence.
+1. BTW if you remove bogus text, you can use macro to not repeat the flag,
see testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
#define TYPE_NAME(x) .ttype = x, .desc = #x
(just a suggestion, nothing really important)

> > +static void run(unsigned int n)
> > +{
> > ...
> > +
> > +       if (!tst_ismount(MNTPOINT))
> > +               tst_res(TPASS, "%s: fsopen() passed", tc->name);


> tst_res(TPASS, "Flag %s: fsopen() passed", tc->name);

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
