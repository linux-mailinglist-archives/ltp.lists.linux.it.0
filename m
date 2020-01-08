Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4035133FD9
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 12:03:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 637A33C246E
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 12:03:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id CC4833C224E
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 12:03:46 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EE14A1401B8D
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 12:03:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4833FAD75;
 Wed,  8 Jan 2020 11:03:45 +0000 (UTC)
Date: Wed, 8 Jan 2020 12:03:43 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200108110343.GA3318@rei.lan>
References: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1576577571-3668-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200107133913.GE26408@rei.lan>
 <e6cada30-fb4e-a2e0-72e9-cdfc796361cb@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6cada30-fb4e-a2e0-72e9-cdfc796361cb@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/4] syscalls/capset03: add new EPERM error
 test without CAP_SETPCAP
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> +static void setup(void)
> >> +{
> >> +	pid_t pid;
> >> +
> >> +	pid = getpid();
> >> +	header.pid = pid;
> >> +	if (geteuid() == 0) {
> >> +		TEST(tst_syscall(__NR_capset, &header, data));
> >> +		if (TST_RET == -1)
> >> +			tst_brk(TBROK | TTERRNO, "capset data failed");
> >> +	}
> > 
> > Please don't do that. If tests needs root (even for a subset of the
> > test) just set the .needs_root flag.
> > 
> This test doesn't need root. These code is designed to create a 
> envrionment for root user to generate this type EPERM 
> error??new_Inheritable is not a subset of old_Inheritable and 
> old_Permitted without CAP_SETPCAP??.
> root user:
> old pI: CAP_KILL
> old pP: CAP_KILL
> new pI: CAP_KILL + CAP_NET_RAW
> 
> other user:
> old pI: 0
> old pP: 0
> new pI: CAP_KILL + CAP_NET_RAW
> 
> other user also met condition and can generate this EPERM error.

Hmm, we are testing different things under root and non-root then. When
the test is executed under a regular user we assert that the system
default is sane + the capset assertion, while under the root we test
only capset.

It would make sense to run the test only under root to make sure that we
are consistent.

Also the CAP_DROP in the tst_test structure seems to be useless to me.


Looking at man 7 capabilities, there are also transitions defined for
what is supposed to happen when we change user id. It would make sense
to write tests that capabilities are correctly dropped when UID changes
from 0 to nonzero. Which is what this test is testing when executed as
non-root, since the transition from 0 to nonzero must have happened
somewhere when user has logged in.

> ps: In capset03, getpid() is useless, we can use pid = 0 to replace.
> Also, if we can use pid =0 in error test, maybe we don't need to test 
> pid =0 in capget01/capset01.c . What do you think about it?

Sure. We can use 0 in all tests if we have a least one for each syscall
that tests it with pid != 0.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
