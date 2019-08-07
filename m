Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B2D84616
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 09:39:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC9DF3C1D74
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 09:39:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 654683C1773
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 09:39:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6E2F1600C24
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 09:39:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0ABDCAEFC;
 Wed,  7 Aug 2019 07:39:12 +0000 (UTC)
Date: Wed, 7 Aug 2019 09:39:09 +0200
From: Michal Hocko <mhocko@suse.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <20190807073909.GL11812@dhcp22.suse.cz>
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
 <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
 <CAEemH2d=vEfppCbCgVoGdHed2kuY3GWnZGhymYT1rnxjoWNdcQ@mail.gmail.com>
 <a65e748b-7297-8547-c18d-9fb07202d5a0@oracle.com>
 <27a48931-aff6-d001-de78-4f7bef584c32@oracle.com>
 <20190802041557.GA16274@hori.linux.bs1.fc.nec.co.jp>
 <54a5c9f5-eade-0d8f-24f9-bff6f19d4905@oracle.com>
 <20190805085740.GC7597@dhcp22.suse.cz>
 <7d78f6b9-afb8-79d1-003e-56de58fded00@oracle.com>
 <3c104b29-ffe2-07cb-440e-cb88d8e11acb@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c104b29-ffe2-07cb-440e-cb88d8e11acb@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

On Tue 06-08-19 17:07:25, Mike Kravetz wrote:
> On 8/5/19 10:36 AM, Mike Kravetz wrote:
> >>>>> Can you try this patch in your environment?  I am not sure if it will
> >>>>> be the final fix, but just wanted to see if it addresses issue for you.
> >>>>>
> >>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> >>>>> index ede7e7f5d1ab..f3156c5432e3 100644
> >>>>> --- a/mm/hugetlb.c
> >>>>> +++ b/mm/hugetlb.c
> >>>>> @@ -3856,6 +3856,20 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
> >>>>>  
> >>>>>  		page = alloc_huge_page(vma, haddr, 0);
> >>>>>  		if (IS_ERR(page)) {
> >>>>> +			/*
> >>>>> +			 * We could race with page migration (try_to_unmap_one)
> >>>>> +			 * which is modifying page table with lock.  However,
> >>>>> +			 * we are not holding lock here.  Before returning
> >>>>> +			 * error that will SIGBUS caller, get ptl and make
> >>>>> +			 * sure there really is no entry.
> >>>>> +			 */
> >>>>> +			ptl = huge_pte_lock(h, mm, ptep);
> >>>>> +			if (!huge_pte_none(huge_ptep_get(ptep))) {
> >>>>> +				ret = 0;
> >>>>> +				spin_unlock(ptl);
> >>>>> +				goto out;
> >>>>> +			}
> >>>>> +			spin_unlock(ptl);
> >>>>
> >>>> Thanks you for investigation, Mike.
> >>>> I tried this change and found no SIGBUS, so it works well.
> 
> Here is another way to address the issue.  Take the hugetlb fault mutex in
> the migration code when modifying the page tables.  IIUC, the fault mutex
> was introduced to prevent this same issue when there were two page faults
> on the same page (and we were unable to allocate an 'extra' page).  The
> downside to such an approach is that we add more hugetlbfs specific code
> to try_to_unmap_one.

I would rather go with the hugetlb_no_page which is better isolated.
-- 
Michal Hocko
SUSE Labs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
