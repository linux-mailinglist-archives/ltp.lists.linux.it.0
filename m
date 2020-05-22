Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BCF1DE280
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 10:58:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 111133C4CE9
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 10:58:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 54C153C4CD6
 for <ltp@lists.linux.it>; Fri, 22 May 2020 10:58:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D8E9910006A1
 for <ltp@lists.linux.it>; Fri, 22 May 2020 10:58:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 267ABB1D8D;
 Fri, 22 May 2020 08:58:14 +0000 (UTC)
Date: Fri, 22 May 2020 10:58:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200522085839.GA2446@yuki.lan>
References: <cover.1590130423.git.viresh.kumar@linaro.org>
 <c5428a9c88d18fac80e364281cfd4e3aefa38d2c.1590130423.git.viresh.kumar@linaro.org>
 <CAK8P3a2B35hUF3rSdJpS=M-Wekm+wUx-skekgw3CiQR=wodqXw@mail.gmail.com>
 <20200522084205.hvkx4maxujzb2s2y@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522084205.hvkx4maxujzb2s2y@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 5/6] syscalls: Don't pass struct timespec to
 tst_syscall()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > This is not enough to run on old kernels that have __NR_clock_getres
> > but don't have __NR_clock_getres_time64,
> 
> What about reversing the order of the two ? Check __NR_clock_getres
> first ?

Moreover the __NR_ constants are always defined in order to avoid need
for excessive #ifdefs and the missing syscalls are defined to -1 in LTP.

So this will not work at all.

> > you need a runtime fallback
> > instead of a compile-time fallback.
> 
> Why so ?

Given that 32bit syscalls can be disabled in kernel config we cannot
really tell which ones are supported before we attempt to call the
syscall.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
