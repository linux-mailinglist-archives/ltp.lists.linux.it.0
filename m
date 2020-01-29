Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E97B14C85A
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 10:51:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0ADFD3C256E
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 10:51:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AC0A93C23E1
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 10:50:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2A2E720126D
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 10:50:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D4F77AC79;
 Wed, 29 Jan 2020 09:50:56 +0000 (UTC)
Date: Wed, 29 Jan 2020 10:50:56 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200129095055.GA21699@rei.lan>
References: <2d23f3a542bbd04179aba828e28d37f5c7be7b45.1579859350.git.viresh.kumar@linaro.org>
 <cc9d0f47db41cad97c590cf7b58e8d662a437a91.1580180304.git.viresh.kumar@linaro.org>
 <20200128134037.GB26365@rei>
 <20200129004651.pdwhyxnnwluxewb6@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129004651.pdwhyxnnwluxewb6@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 2/2] syscalls/io_pgetevents: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Pushed with one minor adjustement, thanks.
> > 
> > I've removed the tst_test.h include from the lapi header and put it into
> > the two test sources. Since that is the main header the tests should
> > include it's better when they include it explicitely.
> 
> That was a very intentional change I kept because the header should
> also take care of its dependencies. An earlier version was using few
> tst_syscall() calls in lapi header and so it should have directly
> included tst_test.h file, which I did.

The tst_syscall() is defined in lapi/syscalls.h and I doubt that this
header is incldued from tst_test.h and even if it is we should include
the lapi/syscall.h instead.

> But the same got removed in the latest version and so the same isn't
> required. Though changing the order of lapi header and tst_test.h in
> the io_pgetevents0*.c files still generate compilation errors as
> definition of syscall() isn't found as well and the header should now
> explicitly include <unistd.h>.
> 
> I have a question now :)
> 
> In the pidfd_open() lapi header I used tst_syscall() and in
> io_pgetevents() lapi header I used syscall(). Should I use
> tst_syscall() in both of them ? If yes, then I will include tst_test.h
> as well in both of them and send you a patch.

The difference between plain syscall() and tst_syscall() is twofold, it
takes care of undefined __NR_foo as well as of ENOSYS return from
kernel, so generally tst_syscall() should be used instead.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
