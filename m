Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC5898EF
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 10:45:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22E893C1CF5
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 10:45:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0D0FD3C1C81
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 10:45:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E771114011A9
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 10:45:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4681AD46;
 Mon, 12 Aug 2019 08:45:25 +0000 (UTC)
Date: Mon, 12 Aug 2019 10:45:24 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20190812084524.GC5117@dhcp22.suse.cz>
References: <20190808000533.7701-1-mike.kravetz@oracle.com>
 <20190808074607.GI11812@dhcp22.suse.cz>
 <20190808074736.GJ11812@dhcp22.suse.cz>
 <416ee59e-9ae8-f72d-1b26-4d3d31501330@oracle.com>
 <20190808185313.GG18351@dhcp22.suse.cz>
 <20190808163928.118f8da4f4289f7c51b8ffd4@linux-foundation.org>
 <20190809064633.GK18351@dhcp22.suse.cz>
 <20190809151718.d285cd1f6d0f1cf02cb93dc8@linux-foundation.org>
 <20190811234614.GZ17747@sasha-vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811234614.GZ17747@sasha-vm>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, ltp@lists.linux.it,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sun 11-08-19 19:46:14, Sasha Levin wrote:
> On Fri, Aug 09, 2019 at 03:17:18PM -0700, Andrew Morton wrote:
> > On Fri, 9 Aug 2019 08:46:33 +0200 Michal Hocko <mhocko@kernel.org> wrote:
> > 
> > > > Maybe we should introduce the Fixes-no-stable: tag.  That should get
> > > > their attention.
> > > 
> > > No please, Fixes shouldn't be really tight to any stable tree rules. It
> > > is a very useful indication of which commit has introduced bug/problem
> > > or whatever that the patch follows up to. We in Suse are using this tag
> > > to evaluate potential fixes as the stable is not reliable. We could live
> > > with Fixes-no-stable or whatever other name but does it really makes
> > > sense to complicate the existing state when stable maintainers are doing
> > > whatever they want anyway? Does a tag like that force AI from selecting
> > > a patch? I am not really convinced.
> > 
> > It should work if we ask stable trees maintainers not to backport
> > such patches.
> > 
> > Sasha, please don't backport patches which are marked Fixes-no-stable:
> > and which lack a cc:stable tag.
> 
> I'll add it to my filter, thank you!

I would really prefer to stick with Fixes: tag and stable only picking
up cc: stable patches. I really hate to see workarounds for sensible
workflows (marking the Fixes) just because we are trying to hide
something from stable maintainers. Seriously, if stable maintainers have
a different idea about what should be backported, it is their call. They
are the ones to deal with regressions and the backporting effort in
those cases of disagreement.

-- 
Michal Hocko
SUSE Labs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
