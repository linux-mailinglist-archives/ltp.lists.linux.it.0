Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD3019242F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 10:34:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DB743C4BF6
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 10:34:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 84C623C4BA4
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 10:34:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1679360007C
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 10:34:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2CACCAD0F;
 Wed, 25 Mar 2020 09:34:29 +0000 (UTC)
Date: Wed, 25 Mar 2020 10:34:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
Message-ID: <20200325093427.GA23023@dell5510>
References: <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
 <20200323113738.GA4807@dell5510>
 <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
 <20200323160415.GC15673@dell5510> <20200324235150.GC4521@yuki.lan>
 <20200324172102.GA1307@dell5510> <20200325015324.GA15127@yuki.lan>
 <CAEemH2doL4m4-TLBBWTHygTRPSTa68dkoAFjZJrDmzrkmgUrSQ@mail.gmail.com>
 <20200325170739.GA2461@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325170739.GA2461@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Metan,

> > And this makes me think more of the '.request_hugepages' story. The
> > needs_foo flags require the foo to be present on the system as hard
> > requirements. In some situations(i.e copy_file_range02.c), we probably need
> > to handle the soft situation, which means, the commands are only part of
> > the test requirement. So if it writing with .needs_cmds="xxx", it might
> > skip the whole test in setup() phase.
+1. This is similar to a general problem how to structure tests when you want to
use tst_brk() and cleanup function (having more unrelated tests in single C file
means one should try to avoid using tst_brk() when not needed).

> Indeed, there are couple of solutions for that, one of them would have
> all the arrays doubled and one of them would list hard requirement while
> the other soft requirements. Then we will end up with something as
> "need_cmds" and "wants_cmds". The second one would be more or less
> informative, the test may print a message "Missing foo command test
> coverage will be limited".
I was thinking about it and thought that would be too rich API (given there is
not that much external dependencies for C tests). But ok, sounds reasonable.

Also similar use case from shell tests: mostly $TST_NEEDS_CMDS is used,
which stop whole testing. But rarely (only in 3 tests and tst_net.sh) is used
tst_require_cmds() directly - it's a hard requirement, but it tries to run some
test before (or require it only when it's needed - tst_net.sh).
But that's bad from metadata point of view (you concentrate on metadata in C,
but sooner or later we'll need to handle shell as well).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
