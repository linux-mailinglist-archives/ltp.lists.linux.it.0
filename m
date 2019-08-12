Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EAB89F8C
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 15:22:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A475D3C1D2E
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 15:22:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 778583C0886
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 15:22:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 83E42200DE8
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 15:22:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B855DAF5A;
 Mon, 12 Aug 2019 13:22:27 +0000 (UTC)
Date: Mon, 12 Aug 2019 15:22:26 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <20190812132226.GI5117@dhcp22.suse.cz>
References: <20190808074607.GI11812@dhcp22.suse.cz>
 <20190808074736.GJ11812@dhcp22.suse.cz>
 <416ee59e-9ae8-f72d-1b26-4d3d31501330@oracle.com>
 <20190808185313.GG18351@dhcp22.suse.cz>
 <20190808163928.118f8da4f4289f7c51b8ffd4@linux-foundation.org>
 <20190809064633.GK18351@dhcp22.suse.cz>
 <20190809151718.d285cd1f6d0f1cf02cb93dc8@linux-foundation.org>
 <20190811234614.GZ17747@sasha-vm>
 <20190812084524.GC5117@dhcp22.suse.cz>
 <39b59001-55c1-a98b-75df-3a5dcec74504@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39b59001-55c1-a98b-75df-3a5dcec74504@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Cc: Sasha Levin <sashal@kernel.org>, xishi.qiuxishi@alibaba-inc.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, ltp@lists.linux.it,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon 12-08-19 15:14:12, Vlastimil Babka wrote:
> On 8/12/19 10:45 AM, Michal Hocko wrote:
> > On Sun 11-08-19 19:46:14, Sasha Levin wrote:
> >> On Fri, Aug 09, 2019 at 03:17:18PM -0700, Andrew Morton wrote:
> >>> On Fri, 9 Aug 2019 08:46:33 +0200 Michal Hocko <mhocko@kernel.org> wrote:
> >>>
> >>> It should work if we ask stable trees maintainers not to backport
> >>> such patches.
> >>>
> >>> Sasha, please don't backport patches which are marked Fixes-no-stable:
> >>> and which lack a cc:stable tag.
> >>
> >> I'll add it to my filter, thank you!
> > 
> > I would really prefer to stick with Fixes: tag and stable only picking
> > up cc: stable patches. I really hate to see workarounds for sensible
> > workflows (marking the Fixes) just because we are trying to hide
> > something from stable maintainers. Seriously, if stable maintainers have
> > a different idea about what should be backported, it is their call. They
> > are the ones to deal with regressions and the backporting effort in
> > those cases of disagreement.
> 
> +1 on not replacing Fixes: tag with some other name, as there might be
> automation (not just at SUSE) relying on it.
> As a compromise, we can use something else to convey the "maintainers
> really don't recommend a stable backport", that Sasha can add to his filter.
> Perhaps counter-intuitively, but it could even look like this:
> Cc: stable@vger.kernel.org # not recommended at all by maintainer

I thought that absence of the Cc is the indication :P. Anyway, I really
do not understand why should we bother, really. I have tried to explain
that stable maintainers should follow Cc: stable because we bother to
consider that part and we are quite good at not forgetting (Thanks
Andrew for persistence). Sasha has told me that MM will be blacklisted
from automagic selection procedure.

I really do not know much more we can do and I really have strong doubts
we should care at all. What is the worst that can happen? A potentially
dangerous commit gets to the stable tree and that blows up? That is
something that is something inherent when relying on AI and
aplies-it-must-be-ok workflow.
-- 
Michal Hocko
SUSE Labs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
