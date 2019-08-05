Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DDA80FD1
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2019 02:42:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A94D43C2028
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2019 02:42:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D50383C1C64
 for <ltp@lists.linux.it>; Mon,  5 Aug 2019 02:42:19 +0200 (CEST)
Received: from tyo162.gate.nec.co.jp (tyo162.gate.nec.co.jp [114.179.232.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 285D7200A18
 for <ltp@lists.linux.it>; Mon,  5 Aug 2019 02:42:14 +0200 (CEST)
Received: from mailgate01.nec.co.jp ([114.179.233.122])
 by tyo162.gate.nec.co.jp (8.15.1/8.15.1) with ESMTPS id x750g0v8026935
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 5 Aug 2019 09:42:00 +0900
Received: from mailsv01.nec.co.jp (mailgate-v.nec.co.jp [10.204.236.94])
 by mailgate01.nec.co.jp (8.15.1/8.15.1) with ESMTP id x750g0MQ026221;
 Mon, 5 Aug 2019 09:42:00 +0900
Received: from mail02.kamome.nec.co.jp (mail02.kamome.nec.co.jp [10.25.43.5])
 by mailsv01.nec.co.jp (8.15.1/8.15.1) with ESMTP id x750eAEq025447; 
 Mon, 5 Aug 2019 09:42:00 +0900
Received: from bpxc99gp.gisp.nec.co.jp ([10.38.151.148] [10.38.151.148]) by
 mail02.kamome.nec.co.jp with ESMTP id BT-MMP-7382076;
 Mon, 5 Aug 2019 09:40:43 +0900
Received: from BPXM23GP.gisp.nec.co.jp ([10.38.151.215]) by
 BPXC20GP.gisp.nec.co.jp ([10.38.151.148]) with mapi id 14.03.0439.000; Mon, 5
 Aug 2019 09:40:43 +0900
From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Thread-Topic: =?utf-8?B?W01NIEJ1Zz9dIG1tYXAoKSB0cmlnZ2VycyBTSUdCVVMgd2hpbGUgZG9pbmcg?=
 =?utf-8?B?dGhl4oCLIOKAi251bWFfbW92ZV9wYWdlcygpIGZvciBvZmZsaW5lZCBodWdl?=
 =?utf-8?Q?page_in_background?=
Thread-Index: AQHVRc0JEN0QZXp8lkC2QA8h/0i/bKbhXVuAgADAW4CAATIAAIADHcSAgABCA4CAAOFdgIADmX4A
Date: Mon, 5 Aug 2019 00:40:42 +0000
Message-ID: <20190805004042.GA16862@hori.linux.bs1.fc.nec.co.jp>
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
 <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
 <CAEemH2d=vEfppCbCgVoGdHed2kuY3GWnZGhymYT1rnxjoWNdcQ@mail.gmail.com>
 <a65e748b-7297-8547-c18d-9fb07202d5a0@oracle.com>
 <27a48931-aff6-d001-de78-4f7bef584c32@oracle.com>
 <20190802041557.GA16274@hori.linux.bs1.fc.nec.co.jp>
 <54a5c9f5-eade-0d8f-24f9-bff6f19d4905@oracle.com>
In-Reply-To: <54a5c9f5-eade-0d8f-24f9-bff6f19d4905@oracle.com>
Accept-Language: en-US, ja-JP
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.34.125.150]
Content-ID: <9C96D525978644469080C167ED48F070@gisp.nec.co.jp>
MIME-Version: 1.0
X-TM-AS-MML: disable
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
 "mhocko@kernel.org" <mhocko@kernel.org>, Linux-MM <linux-mm@kvack.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Aug 02, 2019 at 10:42:33AM -0700, Mike Kravetz wrote:
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

Make sense to me, thanks.

> 
> The patch checks for this specific condition: someone changing the pte
> from NULL to non-NULL while holding the lock.  I am not sure if this is
> the best way to fix.  But, it may be the easiest.

Yes, I think so.

- Naoya

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
