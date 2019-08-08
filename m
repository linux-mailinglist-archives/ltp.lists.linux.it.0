Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9D885BF5
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 09:47:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20DA13C1D1E
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 09:47:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id BFF7F3C1833
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 09:47:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3747A201109
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 09:47:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77326B11C;
 Thu,  8 Aug 2019 07:47:36 +0000 (UTC)
Date: Thu, 8 Aug 2019 09:47:36 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <20190808074736.GJ11812@dhcp22.suse.cz>
References: <20190808000533.7701-1-mike.kravetz@oracle.com>
 <20190808074607.GI11812@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808074607.GI11812@dhcp22.suse.cz>
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

On Thu 08-08-19 09:46:07, Michal Hocko wrote:
> On Wed 07-08-19 17:05:33, Mike Kravetz wrote:
> > Li Wang discovered that LTP/move_page12 V2 sometimes triggers SIGBUS
> > in the kernel-v5.2.3 testing.  This is caused by a race between hugetlb
> > page migration and page fault.
> > 
> > If a hugetlb page can not be allocated to satisfy a page fault, the task
> > is sent SIGBUS.  This is normal hugetlbfs behavior.  A hugetlb fault
> > mutex exists to prevent two tasks from trying to instantiate the same
> > page.  This protects against the situation where there is only one
> > hugetlb page, and both tasks would try to allocate.  Without the mutex,
> > one would fail and SIGBUS even though the other fault would be successful.
> > 
> > There is a similar race between hugetlb page migration and fault.
> > Migration code will allocate a page for the target of the migration.
> > It will then unmap the original page from all page tables.  It does
> > this unmap by first clearing the pte and then writing a migration
> > entry.  The page table lock is held for the duration of this clear and
> > write operation.  However, the beginnings of the hugetlb page fault
> > code optimistically checks the pte without taking the page table lock.
> > If clear (as it can be during the migration unmap operation), a hugetlb
> > page allocation is attempted to satisfy the fault.  Note that the page
> > which will eventually satisfy this fault was already allocated by the
> > migration code.  However, the allocation within the fault path could
> > fail which would result in the task incorrectly being sent SIGBUS.
> > 
> > Ideally, we could take the hugetlb fault mutex in the migration code
> > when modifying the page tables.  However, locks must be taken in the
> > order of hugetlb fault mutex, page lock, page table lock.  This would
> > require significant rework of the migration code.  Instead, the issue
> > is addressed in the hugetlb fault code.  After failing to allocate a
> > huge page, take the page table lock and check for huge_pte_none before
> > returning an error.  This is the same check that must be made further
> > in the code even if page allocation is successful.
> > 
> > Reported-by: Li Wang <liwang@redhat.com>
> > Fixes: 290408d4a250 ("hugetlb: hugepage migration core")
> > Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> > Tested-by: Li Wang <liwang@redhat.com>
> 
> Acked-by: Michal Hocko <mhocko@suse.com>

Btw. is this worth marking for stable? I haven't seen it triggering
anywhere but artificial tests. On the other hand the patch is quite
straightforward so it shouldn't hurt in general.
-- 
Michal Hocko
SUSE Labs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
