Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A10F8C81
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:11:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2C1A3C24A7
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:11:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8A9833C17A1
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 11:10:58 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D0CCE1A01A2D
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 11:10:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 66BBDB3F2;
 Tue, 12 Nov 2019 10:10:55 +0000 (UTC)
Date: Tue, 12 Nov 2019 11:10:54 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191112101054.GA9373@rei.lan>
References: <20191108142434.GA5913@rei>
 <1573462752-6679-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191111163144.GB16894@rei.lan>
 <43e4f419-0100-dc52-7159-2355e9de1639@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43e4f419-0100-dc52-7159-2355e9de1639@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/prctl02: add more error tests
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
> > 1) Add fallback definitions to lapi
> > 2) Ensure these tests does not fail on older kernels
> >
> >     We do expect EINVAL in these cases anyways, which is what we would
> >     get if the prctl() option is unknown to the kernel anyways, so here
> >     we can just get rid of these ifdefs and things should work fine.
> 
> For me, a fallback definitions into the lapi header is only for fixing undefined error on old kernel.
> 
> IMO, we only test options that kernel supports.
> If we test an unsupported option, our case reports EINVAL that will give user a false impression(kernel
> supports it, but argument or environment is bad). I think we should check they whether supported before run
> (ifdef is a way).

However using ifdefs to assert kernel features never worked at all. The
kernel headers usally lag behind the installed kernel in distribution
and it's even more wrong when you are testing latest kernel on any given
distro.

If you want to check for kernel support the best thing is to use the
tst_kvercmp() that checks the kernel version and even that does not work
100% reliably.

> ps: If we test EPERM error(cap is not in PI or PP) of PR_CAP_AMBIENT on old kernel,  they will report EINVAL.
> So, I think ifdef is needed.

No, ifdefs are never solution here. It will still fail if you compiled
the test on newer distro and booted it up with older kernel.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
