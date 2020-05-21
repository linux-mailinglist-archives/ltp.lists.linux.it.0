Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E8D1DCF6D
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 16:20:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3EC243C4D47
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 16:20:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 42ACC3C256C
 for <ltp@lists.linux.it>; Thu, 21 May 2020 16:20:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 324F0600669
 for <ltp@lists.linux.it>; Thu, 21 May 2020 16:19:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 88CA2AB89;
 Thu, 21 May 2020 14:20:12 +0000 (UTC)
Date: Thu, 21 May 2020 16:20:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200521142037.GC7833@yuki.lan>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <3f3b7d669d47ae701385b43deb8280a353dd231e.1589877853.git.viresh.kumar@linaro.org>
 <20200519122347.GC16008@yuki.lan>
 <CAK8P3a2PgjYyijH=VoNGhs_xk1VvFN6ZNvNM-W4TopWY6jJNbA@mail.gmail.com>
 <20200519134511.GD16008@yuki.lan>
 <20200520071948.qtuzbfesqvcnsizd@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520071948.qtuzbfesqvcnsizd@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls: Don't use tst_syscall()
 unnecessarily
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
> > I guess that at the current time we do support distros that are at max
> > 10 years old, mostly because enterprise support cycles are about 10
> > years in lenght.
> > 
> > The issue here is that glibc needed -lrt passed to linker couple of
> > years ago and we wanted to avoid the need of linking everything with
> > -lrt, as calling the raw syscall was just easier fix.
> 
> To conclude the discussion, is this patch okay or not ? The reason why I am
> asking this is because this file still uses the old test framework and so can't
> include tst_timer.h, and so doesn't have access to struct __kernel_old_timespec.
> 
> What do you suggest I do here ?

Well if it was only about __kernel_old_timespec we could easily just
declare it locally in the file and be done with it.

But I guess that newer 32bit architectures will have only the 64 bit
syscall present, I think that somebody pointed out that this is the case
for 32bit RiscV. If that's true we will have to have a fallback for that
case as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
