Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A96F48B2B5
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 10:43:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 607A43C1CF3
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 10:43:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E30843C0300
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 10:43:22 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2A6E6600805
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 10:43:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53120AB92;
 Tue, 13 Aug 2019 08:43:19 +0000 (UTC)
Date: Tue, 13 Aug 2019 10:43:17 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20190813084317.GD17933@dhcp22.suse.cz>
References: <416ee59e-9ae8-f72d-1b26-4d3d31501330@oracle.com>
 <20190808185313.GG18351@dhcp22.suse.cz>
 <20190808163928.118f8da4f4289f7c51b8ffd4@linux-foundation.org>
 <20190809064633.GK18351@dhcp22.suse.cz>
 <20190809151718.d285cd1f6d0f1cf02cb93dc8@linux-foundation.org>
 <20190811234614.GZ17747@sasha-vm>
 <20190812084524.GC5117@dhcp22.suse.cz>
 <39b59001-55c1-a98b-75df-3a5dcec74504@suse.cz>
 <20190812132226.GI5117@dhcp22.suse.cz>
 <20190812153326.GB17747@sasha-vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812153326.GB17747@sasha-vm>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
 linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, ltp@lists.linux.it,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon 12-08-19 11:33:26, Sasha Levin wrote:
[...]
> I'd be happy to run whatever validation/regression suite for mm/ you
> would suggest.

You would have to develop one first and I am afraid that won't be really
simple and useful.

> I've heard the "every patch is a snowflake" story quite a few times, and
> I understand that most mm/ patches are complex, but we agree that
> manually testing every patch isn't scalable, right? Even for patches
> that mm/ tags for stable, are they actually tested on every stable tree?
> How is it different from the "aplies-it-must-be-ok workflow"?

There is a human brain put in and process each patch to make sure that
the change makes sense and we won't break none of many workloads that
people care about. Even if you run your patch throug mm tests which is
by far the most comprehensive test suite I know of we do regress from
time to time. We simply do not have a realistic testing coverage becuase
workload differ quite a lot and they are not really trivial to isolate
to a self contained test case. A lot of functionality doesn't have a
direct interface to test for because it triggers when the system gets
into some state.

Ideal? Not at all and I am happy to hear some better ideas. Until then
we simply have to rely on gut feeling and understanding of the code
and experience from workloads we have seen in the past.
-- 
Michal Hocko
SUSE Labs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
