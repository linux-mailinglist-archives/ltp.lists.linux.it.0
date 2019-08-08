Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84E85897
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 05:41:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB1F63C1D1F
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 05:41:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A5BC83C1826
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 05:41:00 +0200 (CEST)
Received: from tyo161.gate.nec.co.jp (tyo161.gate.nec.co.jp [114.179.232.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1F17C100095E
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 05:40:49 +0200 (CEST)
Received: from mailgate02.nec.co.jp ([114.179.233.122])
 by tyo161.gate.nec.co.jp (8.15.1/8.15.1) with ESMTPS id x783efIu030575
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 8 Aug 2019 12:40:41 +0900
Received: from mailsv02.nec.co.jp (mailgate-v.nec.co.jp [10.204.236.94])
 by mailgate02.nec.co.jp (8.15.1/8.15.1) with ESMTP id x783efAY003936;
 Thu, 8 Aug 2019 12:40:41 +0900
Received: from mail02.kamome.nec.co.jp (mail02.kamome.nec.co.jp [10.25.43.5])
 by mailsv02.nec.co.jp (8.15.1/8.15.1) with ESMTP id x783eeEd020078; 
 Thu, 8 Aug 2019 12:40:41 +0900
Received: from bpxc99gp.gisp.nec.co.jp ([10.38.151.148] [10.38.151.148]) by
 mail02.kamome.nec.co.jp with ESMTP id BT-MMP-7505107;
 Thu, 8 Aug 2019 12:36:24 +0900
Received: from BPXM23GP.gisp.nec.co.jp ([10.38.151.215]) by
 BPXC20GP.gisp.nec.co.jp ([10.38.151.148]) with mapi id 14.03.0439.000; Thu, 8
 Aug 2019 12:36:23 +0900
From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Thread-Topic: [PATCH] hugetlbfs: fix hugetlb page migration/fault race
 causing SIGBUS
Thread-Index: AQHVTX0N0YwnRs9J50WW+DT6/gmNh6bwAwsA
Date: Thu, 8 Aug 2019 03:36:22 +0000
Message-ID: <20190808033622.GA28751@hori.linux.bs1.fc.nec.co.jp>
References: <20190808000533.7701-1-mike.kravetz@oracle.com>
In-Reply-To: <20190808000533.7701-1-mike.kravetz@oracle.com>
Accept-Language: en-US, ja-JP
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.34.125.150]
Content-ID: <BB43671309A3D0478266CADD63E511C9@gisp.nec.co.jp>
MIME-Version: 1.0
X-TM-AS-MML: disable
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: "xishi.qiuxishi@alibaba-inc.com" <xishi.qiuxishi@alibaba-inc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Aug 07, 2019 at 05:05:33PM -0700, Mike Kravetz wrote:
> Li Wang discovered that LTP/move_page12 V2 sometimes triggers SIGBUS
> in the kernel-v5.2.3 testing.  This is caused by a race between hugetlb
> page migration and page fault.
> 
> If a hugetlb page can not be allocated to satisfy a page fault, the task
> is sent SIGBUS.  This is normal hugetlbfs behavior.  A hugetlb fault
> mutex exists to prevent two tasks from trying to instantiate the same
> page.  This protects against the situation where there is only one
> hugetlb page, and both tasks would try to allocate.  Without the mutex,
> one would fail and SIGBUS even though the other fault would be successful.
> 
> There is a similar race between hugetlb page migration and fault.
> Migration code will allocate a page for the target of the migration.
> It will then unmap the original page from all page tables.  It does
> this unmap by first clearing the pte and then writing a migration
> entry.  The page table lock is held for the duration of this clear and
> write operation.  However, the beginnings of the hugetlb page fault
> code optimistically checks the pte without taking the page table lock.
> If clear (as it can be during the migration unmap operation), a hugetlb
> page allocation is attempted to satisfy the fault.  Note that the page
> which will eventually satisfy this fault was already allocated by the
> migration code.  However, the allocation within the fault path could
> fail which would result in the task incorrectly being sent SIGBUS.
> 
> Ideally, we could take the hugetlb fault mutex in the migration code
> when modifying the page tables.  However, locks must be taken in the
> order of hugetlb fault mutex, page lock, page table lock.  This would
> require significant rework of the migration code.  Instead, the issue
> is addressed in the hugetlb fault code.  After failing to allocate a
> huge page, take the page table lock and check for huge_pte_none before
> returning an error.  This is the same check that must be made further
> in the code even if page allocation is successful.
> 
> Reported-by: Li Wang <liwang@redhat.com>
> Fixes: 290408d4a250 ("hugetlb: hugepage migration core")
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> Tested-by: Li Wang <liwang@redhat.com>

Thanks for the work and nice description.

Reviewed-by: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>

> ---
>  mm/hugetlb.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index ede7e7f5d1ab..6d7296dd11b8 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3856,6 +3856,25 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
>  
>  		page = alloc_huge_page(vma, haddr, 0);
>  		if (IS_ERR(page)) {
> +			/*
> +			 * Returning error will result in faulting task being
> +			 * sent SIGBUS.  The hugetlb fault mutex prevents two
> +			 * tasks from racing to fault in the same page which
> +			 * could result in false unable to allocate errors.
> +			 * Page migration does not take the fault mutex, but
> +			 * does a clear then write of pte's under page table
> +			 * lock.  Page fault code could race with migration,
> +			 * notice the clear pte and try to allocate a page
> +			 * here.  Before returning error, get ptl and make
> +			 * sure there really is no pte entry.
> +			 */
> +			ptl = huge_pte_lock(h, mm, ptep);
> +			if (!huge_pte_none(huge_ptep_get(ptep))) {
> +				ret = 0;
> +				spin_unlock(ptl);
> +				goto out;
> +			}
> +			spin_unlock(ptl);
>  			ret = vmf_error(PTR_ERR(page));
>  			goto out;
>  		}
> -- 
> 2.20.1
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
