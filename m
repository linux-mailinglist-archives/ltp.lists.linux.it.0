Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D56D2B2E
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 15:22:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1E743C1CB4
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 15:22:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E10FE3C1CB4
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 15:22:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4A7C6601715
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 15:22:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 717F5AED6;
 Thu, 10 Oct 2019 13:22:51 +0000 (UTC)
Date: Thu, 10 Oct 2019 15:22:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <20191010132249.GB9416@rei.lan>
References: <20191009142446.6997-1-rpalethorpe@suse.com>
 <CACT4Y+b0tTAQ0r_2gCVjjRh--Xwv=aLzh6MY=ciXMMrK+cAQsA@mail.gmail.com>
 <20191009145416.GA5014@rei.lan>
 <CACT4Y+ZL8ocQPpwR-_8+0PdF=r3AkFZKvOR==+P0y0GF67w1Vg@mail.gmail.com>
 <20191009180447.GD15291@rei.lan>
 <CACT4Y+ZABX2z4Lxrvokf5DHz351xTys-gJPNhFjP+Zx6Qd2zsg@mail.gmail.com>
 <20191010093011.GA2508@rei.lan>
 <CACT4Y+ZARc3gK9rweQnLr26Aa_8j9OrpAs-wfTVP2owqmXm+kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZARc3gK9rweQnLr26Aa_8j9OrpAs-wfTVP2owqmXm+kQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] LTP Wrapper for Syzkaller reproducers
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
Cc: automated-testing@yoctoproject.org, kernelci@groups.io,
 George Kennedy <george.kennedy@oracle.com>,
 syzkaller <syzkaller@googlegroups.com>,
 "open list : KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Cyril Hrubis <chrubis@suse.com>, shuah <shuah@kernel.org>, ltp@lists.linux.it,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > > > > Indeed, it's removed recursively by the test library.
> > > > >
> > > > > :popcorn:
> > > > >
> > > > > It took me several years to figure out how to more or less reliably
> > > > > remove dirs after the fuzzer ;)
> > > > > (no, unlink won't do ;))
> > > >
> > > > I guess that there are things such as immutable file attributes that has
> > > > to be cleared and many more. Do you have piece of code somewhere that we
> > > > can look into to spare us from reinventing the wheel?
> > >
> > > Here is what we have:
> > > https://github.com/google/syzkaller/blob/c4b9981b5f5b70dc03eb3f76c618398510101a1d/executor/common_linux.h#L2358-L2461
> > > Maybe it can be simplified, but that's what we ended up with after
> > > some organic evolution. At least the comments may give some hints as
> > > to what may go wrong.
> >
> > Thanks a lot!
> >
> > Also I see that you are using namespaces, and much more, to sandbox the
> > fuzzer, I was wondering if we should do that, at least separate user and
> > pid namespace sounds like a good idea to me.
> 
> I don't know how far you want to go. This sandboxing definitely helps
> us to isolate processes and make tests more repeatable by avoiding
> interference (I don't know if LTP, say, runs tests in parallel).

Not yet, but we are slowly getting to a point where LTP tests could be
run in parallel. It's a bit more complicated for functional tests, since
there are number of constraints, for which tests should not be run in
parallel. And for number of these sandboxing wouldn't help either, since
it's more of a matter of available resources than isolation.

I'm close to solving first half of the problem, i.e. propagating the
test constraints from tests to the testrunner. I also wrote a blog post
about this, you can read it at:

https://people.kernel.org/metan/towards-parallel-kernel-test-runs

But even without running tests in parallel there are resources that have
kernel persistence and will outlive the process, such as SysV IPC. So I
guess that at least some sandboxing has to be done even for non-parallel
runs.

> mount namespaces are useful to later drop all of test mounts at once,
> this would solve a significant part of the remote_dir logic. If the
> temp dir is on tmpfs in the mount namespace as well, then it will be
> automatically dropped altogether with all contents.

Again, thanks for the hint!

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
