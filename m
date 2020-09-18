Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87811270050
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Sep 2020 16:57:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81F5C3C4E6E
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Sep 2020 16:57:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 989C73C4E57
 for <ltp@lists.linux.it>; Fri, 18 Sep 2020 16:57:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E3E701000A62
 for <ltp@lists.linux.it>; Fri, 18 Sep 2020 16:57:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C7CEAD2F;
 Fri, 18 Sep 2020 14:57:58 +0000 (UTC)
Date: Fri, 18 Sep 2020 16:57:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "Bird, Tim" <Tim.Bird@sony.com>
Message-ID: <20200918145752.GA16897@yuki.lan>
References: <20200908073138.GB2475@yuki.lan> <20200910084554.GA21741@dell5510>
 <20200914111543.GE5524@yuki.lan>
 <CY4PR13MB117529F882F68FED2C60AD09FD230@CY4PR13MB1175.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR13MB117529F882F68FED2C60AD09FD230@CY4PR13MB1175.namprd13.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I don't think that it should be very many.  Otherwise, people will get
> the idea that it is useful for actual device testing. ;-)
> 
> The current 'quickhit' runtest file has 107 tests.  With the exception of
> qmm01 (which calls mmap001 with '-n 1') and a bunch of tests that do sub-tests
> of symlink01 (12 of them), the remaining test definitions
> just consist of the test name and the test executable (with the same names).
> I only see binary programs - no tests using shell scripts.  So there's really not much variety
> here.
> 
> Apparently a pipe is allowed in the command invocation line for a test, but there's only
> one example of this in all of the runtests, in syscalls:
> splice02 seq 1 2000 | splice02

Actually the logic in LTP pan is:

* If the command part is single string the test is executed by execve()

* Otherwise it's passed as a command to run to /bin/sh

I'm not sure it we would want to retain that behaivor for a future
though.

> Really, as an infrastructure test, I only need to run a few testcases to validate that Fuego's
> plumbing around runltp (and ltp-pan) works properly.  And it would be nice if
> the run was very short, so I could do the check quickly.
> 
> Do you want me to create a runtest for a framework/LTP integration test, by picking a
> few different "representative" tests, as a replacement for quickhit?
> 
> IMHO, the selected tests should behave the same on all possible systems, to avoid
> getting results that are inconsistent due to the system under test, rather than a
> problem with the integration between the framework and LTP.
> 
> Should I add some outlier cases:
>  - something that times out
>  - something that always fails
>  - tests that return TBROK, TCONF, TWARN, etc.
>  - something where the command doesn't exist
> 
> This would be helpful for checking that my parsing for different results works.
> 
> Do you have a preferred name for the runtest file?  My proposal, just off the top
> of my head, is: "ltp-selftest-quick", but I'm open to other suggestions.

Maybe we should call it smoketest, but I'm okay selftest as well.

> I'm also open to suggestions for possible tests.  I'd like a shell script command
> to add to the list of binary programs.  Here is what I've chosen so far:
> access01 access01
> chdir01 chdir01
> fork01 fork01
> time01 time01
> wait02 wait02
> write01 write01
> symlink01 symlink01
> stat04 symlink01 -T stat04
> utime01A symlink01 -T utime01
> rename01A symlink01 -T rename01
> splice02 seq 1 20 | splice02
> 
> This takes about 5 seconds on one of my test machines.

So I will add a network test to the set and push that before a patch
that removes quickhit.

It would be nice to have the outliners, but that is a bit more
complicated change, so I would like to add these after a release, is
that okay?

> P.S. Maybe, if you're moving away from runltp and ltp-pan, it's a little late to be
> adding some selftests to make sure they work correctly.  But Fuego is using them.
> I don't know what other frameworks use when they invoke LTP to perform
> tests.

I do expect that we will have ltp-pan included for compatibility reasons
at least for a year or two once the replacement would be in place
anyways, so having a smoketest wouldn't harm at all.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
