Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C4D135968
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 13:41:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 572103C2485
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 13:41:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3D00D3C2456
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 13:41:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5FA861401194
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 13:41:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A2F14B2294;
 Thu,  9 Jan 2020 12:41:02 +0000 (UTC)
Date: Thu, 9 Jan 2020 13:41:01 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200109124101.GE31981@rei.lan>
References: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1576577571-3668-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200107133913.GE26408@rei.lan>
 <e6cada30-fb4e-a2e0-72e9-cdfc796361cb@cn.fujitsu.com>
 <20200108110343.GA3318@rei.lan>
 <cb1878f7-a00a-f5d1-c55f-6f80ff01cb6b@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb1878f7-a00a-f5d1-c55f-6f80ff01cb6b@cn.fujitsu.com>
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
> > Also the CAP_DROP in the tst_test structure seems to be useless to me.
> > 
> > 
> > Looking at man 7 capabilities, there are also transitions defined for
> > what is supposed to happen when we change user id. It would make sense
> > to write tests that capabilities are correctly dropped when UID changes
> > from 0 to nonzero. Which is what this test is testing when executed as
> > non-root, since the transition from 0 to nonzero must have happened
> > somewhere when user has logged in.
> In man 7 capabilities " Effect of user ID changes on capabilities",
> I see transitions between 0 and nonzero user IDs. But it is about 
> capabilities??not about capset syscall. I think we should add these 
> cases(user ID changes on capabilities) into kernel/security (such as 
> cap_bound or filecaps). In capset, we can only test capset various EPERM 
> error as kernel sercurity/commoncap.c  cap_capset function.
> ---------------------------------
>       if (cap_inh_is_capped() &&
>              !cap_issubset(*inheritable,
>                            cap_combine(old->cap_inheritable,
>                                        old->cap_permitted)))
>                  /* incapable of using this inheritable set */
>                  return -EPERM;
> 
>          if (!cap_issubset(*inheritable,
>                            cap_combine(old->cap_inheritable,
>                                        old->cap_bset)))
>                  /* no new pI capabilities outside bounding set */
>                  return -EPERM;
> 
>          /* verify restrictions on target's new Permitted set */
>          if (!cap_issubset(*permitted, old->cap_permitted))
>                  return -EPERM;
> 
>          /* verify the _new_Effective_ is a subset of the _new_Permitted_ */
>          if (!cap_issubset(*effective, *permitted))
>                  return -EPERM;
> ---------------------------------

Indeed these does not belog under setcap(). Maybe we could add these
checks under setuid tests, since we are testing side efect of setuid.
But having these under security/ would work as well.

> Also, if we only run under root, CAP_DROP(CAP_SETPCAP) is needed  to 
> reproduce this EPERM error.

Isn't the first thing that the test does to remove all capabilities but
CAP_KILL? Why do we need to drop anything beforehand?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
