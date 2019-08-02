Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 031C57EB14
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 06:16:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D4EC3C1E01
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 06:16:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6C7A03C1DCE
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 06:16:40 +0200 (CEST)
Received: from tyo161.gate.nec.co.jp (tyo161.gate.nec.co.jp [114.179.232.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5F50C60B781
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 06:16:41 +0200 (CEST)
Received: from mailgate01.nec.co.jp ([114.179.233.122])
 by tyo161.gate.nec.co.jp (8.15.1/8.15.1) with ESMTPS id x724GSWF011582
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 2 Aug 2019 13:16:28 +0900
Received: from mailsv01.nec.co.jp (mailgate-v.nec.co.jp [10.204.236.94])
 by mailgate01.nec.co.jp (8.15.1/8.15.1) with ESMTP id x724GS2O028837;
 Fri, 2 Aug 2019 13:16:28 +0900
Received: from mail03.kamome.nec.co.jp (mail03.kamome.nec.co.jp [10.25.43.7])
 by mailsv01.nec.co.jp (8.15.1/8.15.1) with ESMTP id x724F8vc002261; 
 Fri, 2 Aug 2019 13:16:28 +0900
Received: from bpxc99gp.gisp.nec.co.jp ([10.38.151.150] [10.38.151.150]) by
 mail02.kamome.nec.co.jp with ESMTP id BT-MMP-7342834;
 Fri, 2 Aug 2019 13:15:59 +0900
Received: from BPXM23GP.gisp.nec.co.jp ([10.38.151.215]) by
 BPXC22GP.gisp.nec.co.jp ([10.38.151.150]) with mapi id 14.03.0439.000; Fri, 2
 Aug 2019 13:15:58 +0900
From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Thread-Topic: =?utf-8?B?W01NIEJ1Zz9dIG1tYXAoKSB0cmlnZ2VycyBTSUdCVVMgd2hpbGUgZG9pbmcg?=
 =?utf-8?B?dGhl4oCLIOKAi251bWFfbW92ZV9wYWdlcygpIGZvciBvZmZsaW5lZCBodWdl?=
 =?utf-8?Q?page_in_background?=
Thread-Index: AQHVRc0JEN0QZXp8lkC2QA8h/0i/bKbhXVuAgADAW4CAATIAAIADHcSAgABCA4A=
Date: Fri, 2 Aug 2019 04:15:57 +0000
Message-ID: <20190802041557.GA16274@hori.linux.bs1.fc.nec.co.jp>
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
 <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
 <CAEemH2d=vEfppCbCgVoGdHed2kuY3GWnZGhymYT1rnxjoWNdcQ@mail.gmail.com>
 <a65e748b-7297-8547-c18d-9fb07202d5a0@oracle.com>
 <27a48931-aff6-d001-de78-4f7bef584c32@oracle.com>
In-Reply-To: <27a48931-aff6-d001-de78-4f7bef584c32@oracle.com>
Accept-Language: en-US, ja-JP
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.34.125.150]
Content-ID: <976644284DBF884BBF6BD709A3EA8805@gisp.nec.co.jp>
MIME-Version: 1.0
X-TM-AS-MML: disable
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
 "mhocko@kernel.org" <mhocko@kernel.org>, Linux-MM <linux-mm@kvack.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Aug 01, 2019 at 05:19:41PM -0700, Mike Kravetz wrote:
> On 7/30/19 5:44 PM, Mike Kravetz wrote:
> > A SIGBUS is the normal behavior for a hugetlb page fault failure due to
> > lack of huge pages.  Ugly, but that is the design.  I do not believe this
> > test should not be experiencing this due to reservations taken at mmap
> > time.  However, the test is combining faults, soft offline and page
> > migrations, so the there are lots of moving parts.
> > 
> > I'll continue to investigate.
> 
> There appears to be a race with hugetlb_fault and try_to_unmap_one of
> the migration path.
> 
> Can you try this patch in your environment?  I am not sure if it will
> be the final fix, but just wanted to see if it addresses issue for you.
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index ede7e7f5d1ab..f3156c5432e3 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3856,6 +3856,20 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
>  
>  		page = alloc_huge_page(vma, haddr, 0);
>  		if (IS_ERR(page)) {
> +			/*
> +			 * We could race with page migration (try_to_unmap_one)
> +			 * which is modifying page table with lock.  However,
> +			 * we are not holding lock here.  Before returning
> +			 * error that will SIGBUS caller, get ptl and make
> +			 * sure there really is no entry.
> +			 */
> +			ptl = huge_pte_lock(h, mm, ptep);
> +			if (!huge_pte_none(huge_ptep_get(ptep))) {
> +				ret = 0;
> +				spin_unlock(ptl);
> +				goto out;
> +			}
> +			spin_unlock(ptl);

Thanks you for investigation, Mike.
I tried this change and found no SIGBUS, so it works well.

I'm still not clear about how !huge_pte_none() becomes true here,
because we enter hugetlb_no_page() only when huge_pte_none() is non-null
and (racy) try_to_unmap_one() from page migration should convert the
huge_pte into a migration entry, not null.

Thanks,
Naoya Horiguchi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
