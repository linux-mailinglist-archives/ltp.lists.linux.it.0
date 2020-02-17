Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4024F160F04
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:43:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED3EB3C23EC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:43:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4E94A3C23B0
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:43:51 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 04002200DF0
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:43:50 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51C93B208;
 Mon, 17 Feb 2020 09:43:50 +0000 (UTC)
Date: Mon, 17 Feb 2020 10:43:48 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200217094348.GB13398@dell5510>
References: <20200207144105.19947-1-pvorel@suse.cz>
 <20200207144105.19947-2-pvorel@suse.cz>
 <CAEemH2f0db1i7Tpg-4jqa5h5j9KZpH+d4aRg-M3Xn3Mw9NU1eA@mail.gmail.com>
 <20200216131723.GA2725117@x230>
 <CAEemH2ewgh=OnRzEs+1X4rvsiChrLRRMxeK-ChZL3wDqco_iLg@mail.gmail.com>
 <1181359180.7790231.1581931018783.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1181359180.7790231.1581931018783.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/2] syscalls/fsmount01: Add test for new mount
 API v5.2
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

...
> > > BTW, I like the way Viresh Kumar gives in his fsmount.h, it looks more
> > > tidy
> > > > and clean.
> > > > http://lists.linux.it/pipermail/ltp/2020-February/015413.html
> > > Hm, competing implementations.
> > > Both tries to handle preventing redefinitions (e.g. FSOPEN_CLOEXEC) once
> > > the API hits libc headers (at least in musl it might be soon).
> > > Zorro tries to bind them to function check (e.g. #ifndef HAVE_FSMOUNT,
> > > #ifndef
> > > HAVE_MOVE_MOUNT), Viresh just use single check #ifndef OPEN_TREE_CLONE.
> > > I slightly prefer Viresh way (it's unlikely that libc headers would
> > > include just

> > +1 Viresh way.


> > > part of the new mount API definitions, although obviously the most safest
> > > way
> > > would be to either guard with #ifndef each definition or just give up on
> > > testing
> > > header and copy whole include/uapi/linux/mount.h (+ avoid using
> > > sys/mount.h;
> > > that's the way used for include/lapi/bpf.h).


> > @Cyril, @Jan, any else suggestion?

> I'd go with additions to lapi, and avoid copying entire linux/mount.h. And use
> #ifndef for each definition. v7 is currently not doing that, but it's easy
> to add if we run into problems later, when/if there are additions to mount API.
OK, I'm also for single guard with OPEN_TREE_CLONE until anything else is
needed. I'll add your ack for lapi commit.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
