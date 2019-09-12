Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B765B0EDD
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 14:29:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FAEF3C20B9
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 14:29:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3D9073C0507
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 14:29:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 64C9661665B
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 14:29:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB880ACC3;
 Thu, 12 Sep 2019 12:29:49 +0000 (UTC)
Date: Thu, 12 Sep 2019 14:29:48 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "Xu, Yang/??? ???" <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190912122948.GB7714@rei.lan>
References: <1560250815-2308-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5D2D681D.1050909@cn.fujitsu.com> <5D440CAA.9080701@cn.fujitsu.com>
 <5D6CC86E.5020009@cn.fujitsu.com> <20190911133315.GA21378@rei.lan>
 <5b2b7314-5d0a-1bc6-11ff-7088171b86e6@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b2b7314-5d0a-1bc6-11ff-7088171b86e6@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cgroup_regression_test.sh: fix test_5 possible
 mount failure because of cgroup hierarchy
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
> > I'm looking at the original reproducer at:
> >
> > https://lists.openvz.org/pipermail/devel/2009-January/016345.html
> >
> > And as far as I can tell the test_5() was never actually doing what it
> > takes to reproduce the bug, as far as I can tell the test was bogus to
> > begin with. The main point of the reproducer is that the cgroup is
> > unmounted while there is task in the group, then remounted again. As we
> > cannot unmount the cgroup these days I would just go for removing the
> > test instead of applying band aid over the code.
> 
> Hi Cyril
> 
> why we can't unmount the cgroup these days?

It's a bit more complicated, you can't decide on which controllers to
put into your hierarchy as it's mounted already (by a systemd). You can
mount them exactly the way systemd mounts them (a few controllers are
put into combined hierarchies but most of them are separated) but to a
different mount point. Also once controller is in use in v2 it cannot be
used by v1, which is going to be problem soon. As we are in transition
period between v1 and v2 doing anything portable with cgroups is going
to be nightmare.

>  From kernel commit 839ec545("cgroup: fix root_count when mount fails due to busy subsystem"),
> it should be reproduced as the following step
> 1)mount two subsystem(A and B) mntpoint
> 2)mount one subsystem(A) mntpoint, it will get EBUSY error
> 3)without kernel commit, kill this process and task is still in cgroup, kernel will call cgroup_kill_sb()
> to decrement root_count, then kernel crashes.
> 
> Is it right?

This does not seem to match the original reproducer but it may be
another way how to reproduce the bug. Also I'm not sure that this
reproducer makes sense, since the code in kernel has been rewritten
completely since the 2.6 days. Generally I would say that we may need
completely new tests for cgroups, but I doubt that we should make much
effort for the v1 anyways. In the v2 you get all controllers in an
unified hierachy and you can't mount them in a different way.

If the only point is to get EBUSY on mount, then have a process exit
while in the cgroup we should as well simplify the test. There is no
point in mounting the subsystems together in the first step, as a matter
of fact on modern distributions the test just checks that the two
subsystems are mounted already then attempts to mount them combined,
which fails. Why can't we mount the two controllers seperatelly in the
case that nothing is mounted as well?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
