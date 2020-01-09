Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D35135B59
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 15:28:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 031F03C2533
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 15:28:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 85A393C250E
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 15:28:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E13C52009D9
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 15:28:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 40445AC66;
 Thu,  9 Jan 2020 14:28:04 +0000 (UTC)
Date: Thu, 9 Jan 2020 15:28:02 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200109142802.GA15780@dell5510>
References: <20200109071510.11223-1-liwang@redhat.com>
 <20200109095239.GB31981@rei.lan>
 <CAEemH2eBO5WywEvBJKyEpVCky05CHp-JpwpFUSgAUjTx8GAKtQ@mail.gmail.com>
 <20200109125615.GA11609@dell5510> <20200109131056.GC22952@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109131056.GC22952@rei.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: use raw syscall in the tst_device.h
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

Hi,

> > > But shouldn't we define the _GNU_SOURCE for syscall()?  Otherwise,
> > > the _XOPEN_SOURCE 600 definitions will take effect and makes the compiler
> > > print new errors[1].
> > Correct, syscall() requires _GNU_SOURCE and <unistd.h>.

> Not really, it's guarded by _USE_MISC which is enabled by default and
> disabled by _XOPEN_SOURCE.
Yep, looking into features.h __USE_MISC is defined by _DEFAULT_SOURCE,
which is enabled if nothing or only _GNU_SOURCE is defined.

> Looks like the manual page is outdated at least.
Yes, that's what I checked this time (I usually look into sources).

> > + Not sure if <sys/syscall.h> should be used (as it's in your patch or
> > lapi/syscalls.h.

> Well, given that syncfs is old enough (2.6.39) either should work.

> > > Here I feel a little confused, or do we need to delete the _XOPEN_SOURCE
> > > definition directly for the test posix_fadvise01.c?

> > > [1]:
> > > gcc -Werror=implicit-function-declaration -g -O2 -fno-strict-aliasing -pipe
> > > -Wall -W -Wold-style-definition
> > >  -I/root/ltp2/testcases/kernel/syscalls/fadvise
> > > -I/root/ltp2/testcases/kernel/syscalls/fadvise/../utils
> > > -I../../../../include -I../../../../include -I../../../../include/old/
> > > -L../../../../lib  posix_fadvise01.c   -lltp -o posix_fadvise01
> > > In file included from ../../../../include/tst_test.h:22,
> > >                  from posix_fadvise01.c:31:
> > > ../../../../include/tst_device.h: In function ???tst_dev_sync???:
> > > ../../../../include/tst_device.h:82:9: error: implicit declaration of
> > > function ???syscall???; did you mean ???strcoll????
> > > [-Werror=implicit-function-declaration]
> > >   return syscall(__NR_syncfs, fd);
> > >          ^~~~~~~
> > >          strcoll

> > + Our syscall numbers in include/lapi/syscalls/ are outdated (syncfs is not at
> > least in include/lapi/syscalls/sparc{64,}.in and
> > include/lapi/syscalls/x86_64.in).

> The lapi/syscall.h includes sys/syscall.h so it's probably not a
> problem, since there are no distribution that are missing syncfs in the
> system headers. Note that we are only adding fallback definitions there
> and if present the system values take precedence.
Good. Sorry for wrong report (haven't notice <sys/syscall.h> inclusion).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
