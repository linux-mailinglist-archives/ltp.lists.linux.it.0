Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EB787258
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 08:46:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFBDC3C1D01
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 08:46:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8B2623C1C70
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 08:46:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 740AD1A014E1
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 08:46:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C910BB03B;
 Fri,  9 Aug 2019 06:46:34 +0000 (UTC)
Date: Fri, 9 Aug 2019 08:46:33 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20190809064633.GK18351@dhcp22.suse.cz>
References: <20190808000533.7701-1-mike.kravetz@oracle.com>
 <20190808074607.GI11812@dhcp22.suse.cz>
 <20190808074736.GJ11812@dhcp22.suse.cz>
 <416ee59e-9ae8-f72d-1b26-4d3d31501330@oracle.com>
 <20190808185313.GG18351@dhcp22.suse.cz>
 <20190808163928.118f8da4f4289f7c51b8ffd4@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808163928.118f8da4f4289f7c51b8ffd4@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugetlbfs: fix hugetlb page migration/fault race
 causing SIGBUS
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
Cc: xishi.qiuxishi@alibaba-inc.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 ltp@lists.linux.it, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu 08-08-19 16:39:28, Andrew Morton wrote:
> On Thu, 8 Aug 2019 20:53:13 +0200 Michal Hocko <mhocko@kernel.org> wrote:
> 
> > > https://lkml.org/lkml/2019/6/1/165
> > > 
> > > Ironic to find that commit message in a stable backport.
> > > 
> > > I'm happy to drop the Fixes tag.
> > 
> > No, please do not drop the Fixes tag. That is a very _useful_
> > information. If the stable tree maintainers want to abuse it so be it.
> > They are responsible for their tree. If you do not think this is a
> > stable material then fine with me. I tend to agree but that doesn't mean
> > that we should obfuscate Fixes.
> 
> Well, we're responsible for stable trees too.

We are only responsible as far as to consider whether a patch is worth
backporting to stable trees and my view is that we are doing that
responsible. What do stable maintainers do in the end is their business.

> And yes, I find it
> irksome.  I/we evaluate *every* fix for -stable inclusion and if I/we
> decide "no" then dangit, it should be backported.

Exactly

> Maybe we should introduce the Fixes-no-stable: tag.  That should get
> their attention.

No please, Fixes shouldn't be really tight to any stable tree rules. It
is a very useful indication of which commit has introduced bug/problem
or whatever that the patch follows up to. We in Suse are using this tag
to evaluate potential fixes as the stable is not reliable. We could live
with Fixes-no-stable or whatever other name but does it really makes
sense to complicate the existing state when stable maintainers are doing
whatever they want anyway? Does a tag like that force AI from selecting
a patch? I am not really convinced.

-- 
Michal Hocko
SUSE Labs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
