Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F7D81486
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2019 10:57:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B27E73C206F
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2019 10:57:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 48AED3C1A4E
 for <ltp@lists.linux.it>; Mon,  5 Aug 2019 10:57:46 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7701B200DD1
 for <ltp@lists.linux.it>; Mon,  5 Aug 2019 10:57:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 761DDAD22;
 Mon,  5 Aug 2019 08:57:43 +0000 (UTC)
Date: Mon, 5 Aug 2019 10:57:40 +0200
From: Michal Hocko <mhocko@suse.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <20190805085740.GC7597@dhcp22.suse.cz>
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
 <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
 <CAEemH2d=vEfppCbCgVoGdHed2kuY3GWnZGhymYT1rnxjoWNdcQ@mail.gmail.com>
 <a65e748b-7297-8547-c18d-9fb07202d5a0@oracle.com>
 <27a48931-aff6-d001-de78-4f7bef584c32@oracle.com>
 <20190802041557.GA16274@hori.linux.bs1.fc.nec.co.jp>
 <54a5c9f5-eade-0d8f-24f9-bff6f19d4905@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54a5c9f5-eade-0d8f-24f9-bff6f19d4905@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=5BMM_Bug=3F=5D_mmap=28=29_triggers_SIGBUS_while?=
 =?utf-8?b?IGRvaW5nIHRoZeKAiyDigItudW1hX21vdmVfcGFnZXMoKSBmb3Igb2ZmbGlu?=
 =?utf-8?q?ed_hugepage_in_background?=
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
Cc: "xishi.qiuxishi@alibaba-inc.com" <xishi.qiuxishi@alibaba-inc.com>,
 Linux-MM <linux-mm@kvack.org>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri 02-08-19 10:42:33, Mike Kravetz wrote:
> On 8/1/19 9:15 PM, Naoya Horiguchi wrote:
> > On Thu, Aug 01, 2019 at 05:19:41PM -0700, Mike Kravetz wrote:
> >> There appears to be a race with hugetlb_fault and try_to_unmap_one of
> >> the migration path.
> >>
> >> Can you try this patch in your environment?  I am not sure if it will
> >> be the final fix, but just wanted to see if it addresses issue for you.
> >>
> >> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> >> index ede7e7f5d1ab..f3156c5432e3 100644
> >> --- a/mm/hugetlb.c
> >> +++ b/mm/hugetlb.c
> >> @@ -3856,6 +3856,20 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
> >>  
> >>  		page = alloc_huge_page(vma, haddr, 0);
> >>  		if (IS_ERR(page)) {
> >> +			/*
> >> +			 * We could race with page migration (try_to_unmap_one)
> >> +			 * which is modifying page table with lock.  However,
> >> +			 * we are not holding lock here.  Before returning
> >> +			 * error that will SIGBUS caller, get ptl and make
> >> +			 * sure there really is no entry.
> >> +			 */
> >> +			ptl = huge_pte_lock(h, mm, ptep);
> >> +			if (!huge_pte_none(huge_ptep_get(ptep))) {
> >> +				ret = 0;
> >> +				spin_unlock(ptl);
> >> +				goto out;
> >> +			}
> >> +			spin_unlock(ptl);
> > 
> > Thanks you for investigation, Mike.
> > I tried this change and found no SIGBUS, so it works well.
> > 
> > I'm still not clear about how !huge_pte_none() becomes true here,
> > because we enter hugetlb_no_page() only when huge_pte_none() is non-null
> > and (racy) try_to_unmap_one() from page migration should convert the
> > huge_pte into a migration entry, not null.
> 
> Thanks for taking a look Naoya.
> 
> In try_to_unmap_one(), there is this code block:
> 
> 		/* Nuke the page table entry. */
> 		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
> 		if (should_defer_flush(mm, flags)) {
> 			/*
> 			 * We clear the PTE but do not flush so potentially
> 			 * a remote CPU could still be writing to the page.
> 			 * If the entry was previously clean then the
> 			 * architecture must guarantee that a clear->dirty
> 			 * transition on a cached TLB entry is written through
> 			 * and traps if the PTE is unmapped.
> 			 */
> 			pteval = ptep_get_and_clear(mm, address, pvmw.pte);
> 
> 			set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
> 		} else {
> 			pteval = ptep_clear_flush(vma, address, pvmw.pte);
> 		}
> 
> That happens before setting the migration entry.  Therefore, for a period
> of time the pte is NULL (huge_pte_none() returns true).
> 
> try_to_unmap_one holds the page table lock, but hugetlb_fault does not take
> the lock to 'optimistically' check huge_pte_none().  When huge_pte_none
> returns true, it calls hugetlb_no_page which is where we try to allocate
> a page and fails.
> 
> Does that make sense, or am I missing something?
> 
> The patch checks for this specific condition: someone changing the pte
> from NULL to non-NULL while holding the lock.  I am not sure if this is
> the best way to fix.  But, it may be the easiest.

Please add a comment to explain this because this is quite subtle and
tricky. Unlike the regular page fault hugetlb_no_page is protected by a
large lock so a retry check seems unexpected.

Thanks!
-- 
Michal Hocko
SUSE Labs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
