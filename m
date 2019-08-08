Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBBF86915
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 20:53:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66F813C1D78
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 20:53:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 7A73A3C1860
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 20:53:18 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C0ABD201187
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 20:53:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B533AFD4;
 Thu,  8 Aug 2019 18:53:15 +0000 (UTC)
Date: Thu, 8 Aug 2019 20:53:13 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <20190808185313.GG18351@dhcp22.suse.cz>
References: <20190808000533.7701-1-mike.kravetz@oracle.com>
 <20190808074607.GI11812@dhcp22.suse.cz>
 <20190808074736.GJ11812@dhcp22.suse.cz>
 <416ee59e-9ae8-f72d-1b26-4d3d31501330@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <416ee59e-9ae8-f72d-1b26-4d3d31501330@oracle.com>
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
Cc: xishi.qiuxishi@alibaba-inc.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 Andrew Morton <akpm@linux-foundation.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu 08-08-19 09:55:45, Mike Kravetz wrote:
> On 8/8/19 12:47 AM, Michal Hocko wrote:
> > On Thu 08-08-19 09:46:07, Michal Hocko wrote:
> >> On Wed 07-08-19 17:05:33, Mike Kravetz wrote:
> >>> Li Wang discovered that LTP/move_page12 V2 sometimes triggers SIGBUS
> >>> in the kernel-v5.2.3 testing.  This is caused by a race between hugetlb
> >>> page migration and page fault.
> <snip>
> >>> Reported-by: Li Wang <liwang@redhat.com>
> >>> Fixes: 290408d4a250 ("hugetlb: hugepage migration core")
> >>> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> >>> Tested-by: Li Wang <liwang@redhat.com>
> >>
> >> Acked-by: Michal Hocko <mhocko@suse.com>
> > 
> > Btw. is this worth marking for stable? I haven't seen it triggering
> > anywhere but artificial tests. On the other hand the patch is quite
> > straightforward so it shouldn't hurt in general.
> 
> I don't think this really is material for stable.  I added the tag as the
> stable AI logic seems to pick up patches whether marked for stable or not.
> For example, here is one I explicitly said did not need to go to stable.
> 
> https://lkml.org/lkml/2019/6/1/165
> 
> Ironic to find that commit message in a stable backport.
> 
> I'm happy to drop the Fixes tag.

No, please do not drop the Fixes tag. That is a very _useful_
information. If the stable tree maintainers want to abuse it so be it.
They are responsible for their tree. If you do not think this is a
stable material then fine with me. I tend to agree but that doesn't mean
that we should obfuscate Fixes.

-- 
Michal Hocko
SUSE Labs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
