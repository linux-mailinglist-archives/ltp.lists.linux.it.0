Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E46A1182D1F
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 11:11:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C88D3C5E7E
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 11:11:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 125EB3C5E6F
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 11:11:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 17B9A1001D8F
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 11:11:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3F4EAAC67;
 Thu, 12 Mar 2020 10:11:29 +0000 (UTC)
Date: Thu, 12 Mar 2020 11:11:28 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200312101127.GA3803@rei.lan>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <495a95969c63d67868b82d2b15bd663f19780d0e.1582779464.git.viresh.kumar@linaro.org>
 <20200306131046.GC3375@rei.lan>
 <20200311072502.hpj5bycslu6ygk74@vireshk-i7>
 <20200312081153.GA16928@dell5510>
 <20200312100316.7w67e5salel3dfue@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312100316.7w67e5salel3dfue@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 04/10] syscalls/fsopen: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > > I gues sthat the SAFE_UMOUNT() should be inside of the if here and in
> > > > the rest of the testcases.
> > 
> > > Petr had a similar comment earlier and here is my explanation to it.
> > 
> > > There should always be a unmount() in response to a successful call to
> > > mount() APIs. What if, because of some other bugs in the kernel or
> > > testsuite, tst_is_mounted() returns 0? We should still do the
> > > unmount() part as the mount() API didn't return an error.
> > But IMHO if device is not mounted we get TBROK due EINVAL in safe_umount().
> 
> But why won't move_mount() fail if device isn't mounted ? Why do we
> need the tst_is_mounted() helper at all ? Just to catch a case where
> move_mount() is buggy and doesn't report the failure properly, right ?
> In case of that bug, isn't it possible that move_mount() allocates
> some resources which must be freed with a call to umount()
> nevertheless ?

We can't really clean things up when something in kernel is misbehaving.
If there is a bug we enter the wast lands of undefined behavior where
anything is possible and any attempt to restore the system in a defined
state is doomed to fail anyways.

So in the end I do not care here as long as we clean up properly when
things work as expected, so either way is fine. It only looks a bit
strange when we attempt to umount things that are possibly not mounted.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
