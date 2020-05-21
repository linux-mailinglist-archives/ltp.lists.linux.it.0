Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AB81DCFA7
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 16:24:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1DE63C4D47
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 16:24:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4C8803C256C
 for <ltp@lists.linux.it>; Thu, 21 May 2020 16:24:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E1250200D38
 for <ltp@lists.linux.it>; Thu, 21 May 2020 16:24:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DB601ACCE;
 Thu, 21 May 2020 14:24:44 +0000 (UTC)
Date: Thu, 21 May 2020 16:25:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200521142510.GD7833@yuki.lan>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <CAK8P3a2N-J5LoNPHa7hjRPcOR0ytNfZQ678pFuCJaJJHGYS--A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2N-J5LoNPHa7hjRPcOR0ytNfZQ678pFuCJaJJHGYS--A@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/5] syscalls: Add tests to verify the _time_high
 fields
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > This patchset adds a new test to three syscalls to verify that the
> > extended fields, _time_high, are cleared by the kernel. This was
> > suggested by Arnd.
> >
> > I did run them, but on a 64 bit machine. Please see if you can check
> > that they work properly on 32 bit machines, where we really want to test
> > them. This is rebased over ltp master.
> >
> > Cyril, This conflicts a bit with my other time64 syscall tests, I will
> > rebase one of these, after you apply any of these first :)
> 
> The known bugs we had here were actually on 64-bit machines running
> compat 32-bit user space. You should be able to test this on most
> 64-bit distros using the compat libraries and building ltp against the
> 32-bit version (not sure what the best way is to configure that, but it
> should not be hard).

We run LTP compiled with -m32 in our automation in SUSE precisely
because of these reasons. Not sure if somebody else does that.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
