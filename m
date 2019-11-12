Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C120F8C92
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:15:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7B3F3C24D4
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:15:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 23F993C249F
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 11:15:14 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 87704201598
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 11:15:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CB29BAF5D;
 Tue, 12 Nov 2019 10:15:12 +0000 (UTC)
Date: Tue, 12 Nov 2019 11:15:12 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191112101512.GB9373@rei.lan>
References: <20191108142434.GA5913@rei>
 <1573462752-6679-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191111163144.GB16894@rei.lan>
 <43e4f419-0100-dc52-7159-2355e9de1639@cn.fujitsu.com>
 <5DCA5206.3040508@cn.fujitsu.com>
 <ac6040e3-d561-cd53-e538-e3e6c8953ecc@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac6040e3-d561-cd53-e538-e3e6c8953ecc@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > 1) Can undefined error be triggered on old kernel if you use ifdef?  It seems unnecessary for ifdef method to include lapi header.
> 
> Yes. It can be triggered and it should use #if HAVE_DECL_PR_GET_SPECULATION_CTRL instead of #ifdef.
> Yes. And we should add more check( such as PR_SET_SECCOMP undefined 2.6.18-398.el5) in m4/ltp-prctl.m4 so that we cannot include lapi header.
> 
> > 2) Undfined option in glibc doesn't mean that kernel doesn't support it as well.
> 
> options definitions is in linux/prctl.h. For most distributions, I think if it is in supported in kernel-header, it should also been
> supported on kernel.

That is usually the case, but there are cons that I explained in the
previous email.

> >> IMO, we only test options that kernel supports.
> >> If we test an unsupported option, our case reports EINVAL that will give user a false impression(kernel
> >> supports it, but argument or environment is bad). I think we should check they whether supported before run
> >> (ifdef is a way).
> >>
> >> ps: If we test EPERM error(cap is not in PI or PP) of PR_CAP_AMBIENT on old kernel,  they will report EINVAL.
> >> So, I think ifdef is needed.
> > Why don't we check if the specified option is supported by calling it 
> > with correct args?(i.e. don't mix unsupported option up with wrong args).
> >
> It sounds reasonable.  I will try it in verify_prctl function if you and cyril have strong opposition to #if.

Okay, that will work. Calling it with correct parameters in test setup
is 100% correct way how to find out if kernel implements the
functionality.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
