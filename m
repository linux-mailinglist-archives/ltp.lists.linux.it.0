Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2707082412
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2019 19:37:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D77433C1D1B
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2019 19:37:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 69E303C1D1B
 for <ltp@lists.linux.it>; Mon,  5 Aug 2019 19:37:17 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5804A600285
 for <ltp@lists.linux.it>; Mon,  5 Aug 2019 19:37:16 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x75HNUZP152617;
 Mon, 5 Aug 2019 17:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=hT6KvXWHsB1KFIxDjmguE5kZ2emdManS6SuK/ap0TkI=;
 b=OiLr8mXLp9u31cORyoaaREIyIKORwjH13EN6bFCVbvclkkezmlDizBdBEBu80X0kZjPU
 6mdIL2E/cEOnc3TE/qhc12FFff7EJdbvMBpF5ksrqkiJ9R0ZZ9mFkHlo4ZNFHTzsOivK
 FgsDPX6yJI57BsElVQA6iGSPDLeQDZMQsXRw1+SDeHaGs1h33GOXnio164dS2DHbtcwd
 wfJidCKwoYcPLiY5RHvmdUKJcbXU+/NzQXxkXYbZjL9DebV+0i27Gr7zaipblc4Okx3Z
 pBlVaXQtentfLeoD93kLiCyCOUrJIrSTQcmhF8yWbRR1EJqCl1JVq8V5QmOBZCw2MNyL OQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2u527pgnch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 05 Aug 2019 17:37:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x75HR43h045369;
 Mon, 5 Aug 2019 17:37:03 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2u50abyfq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 05 Aug 2019 17:37:03 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x75Havpg013594;
 Mon, 5 Aug 2019 17:36:57 GMT
Received: from [192.168.1.222] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 05 Aug 2019 10:36:56 -0700
To: Michal Hocko <mhocko@suse.com>
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
 <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
 <CAEemH2d=vEfppCbCgVoGdHed2kuY3GWnZGhymYT1rnxjoWNdcQ@mail.gmail.com>
 <a65e748b-7297-8547-c18d-9fb07202d5a0@oracle.com>
 <27a48931-aff6-d001-de78-4f7bef584c32@oracle.com>
 <20190802041557.GA16274@hori.linux.bs1.fc.nec.co.jp>
 <54a5c9f5-eade-0d8f-24f9-bff6f19d4905@oracle.com>
 <20190805085740.GC7597@dhcp22.suse.cz>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <7d78f6b9-afb8-79d1-003e-56de58fded00@oracle.com>
Date: Mon, 5 Aug 2019 10:36:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190805085740.GC7597@dhcp22.suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9340
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908050186
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9340
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908050186
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

On 8/5/19 1:57 AM, Michal Hocko wrote:
> On Fri 02-08-19 10:42:33, Mike Kravetz wrote:
>> On 8/1/19 9:15 PM, Naoya Horiguchi wrote:
>>> On Thu, Aug 01, 2019 at 05:19:41PM -0700, Mike Kravetz wrote:
>>>> There appears to be a race with hugetlb_fault and try_to_unmap_one of
>>>> the migration path.
>>>>
>>>> Can you try this patch in your environment?  I am not sure if it will
>>>> be the final fix, but just wanted to see if it addresses issue for you.
>>>>
>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>> index ede7e7f5d1ab..f3156c5432e3 100644
>>>> --- a/mm/hugetlb.c
>>>> +++ b/mm/hugetlb.c
>>>> @@ -3856,6 +3856,20 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
>>>>  
>>>>  		page = alloc_huge_page(vma, haddr, 0);
>>>>  		if (IS_ERR(page)) {
>>>> +			/*
>>>> +			 * We could race with page migration (try_to_unmap_one)
>>>> +			 * which is modifying page table with lock.  However,
>>>> +			 * we are not holding lock here.  Before returning
>>>> +			 * error that will SIGBUS caller, get ptl and make
>>>> +			 * sure there really is no entry.
>>>> +			 */
>>>> +			ptl = huge_pte_lock(h, mm, ptep);
>>>> +			if (!huge_pte_none(huge_ptep_get(ptep))) {
>>>> +				ret = 0;
>>>> +				spin_unlock(ptl);
>>>> +				goto out;
>>>> +			}
>>>> +			spin_unlock(ptl);
>>>
>>> Thanks you for investigation, Mike.
>>> I tried this change and found no SIGBUS, so it works well.
>>>
>>> I'm still not clear about how !huge_pte_none() becomes true here,
>>> because we enter hugetlb_no_page() only when huge_pte_none() is non-null
>>> and (racy) try_to_unmap_one() from page migration should convert the
>>> huge_pte into a migration entry, not null.
>>
>> Thanks for taking a look Naoya.
>>
>> In try_to_unmap_one(), there is this code block:
>>
>> 		/* Nuke the page table entry. */
>> 		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
>> 		if (should_defer_flush(mm, flags)) {
>> 			/*
>> 			 * We clear the PTE but do not flush so potentially
>> 			 * a remote CPU could still be writing to the page.
>> 			 * If the entry was previously clean then the
>> 			 * architecture must guarantee that a clear->dirty
>> 			 * transition on a cached TLB entry is written through
>> 			 * and traps if the PTE is unmapped.
>> 			 */
>> 			pteval = ptep_get_and_clear(mm, address, pvmw.pte);
>>
>> 			set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
>> 		} else {
>> 			pteval = ptep_clear_flush(vma, address, pvmw.pte);
>> 		}
>>
>> That happens before setting the migration entry.  Therefore, for a period
>> of time the pte is NULL (huge_pte_none() returns true).
>>
>> try_to_unmap_one holds the page table lock, but hugetlb_fault does not take
>> the lock to 'optimistically' check huge_pte_none().  When huge_pte_none
>> returns true, it calls hugetlb_no_page which is where we try to allocate
>> a page and fails.
>>
>> Does that make sense, or am I missing something?
>>
>> The patch checks for this specific condition: someone changing the pte
>> from NULL to non-NULL while holding the lock.  I am not sure if this is
>> the best way to fix.  But, it may be the easiest.
> 
> Please add a comment to explain this because this is quite subtle and
> tricky. Unlike the regular page fault hugetlb_no_page is protected by a
> large lock so a retry check seems unexpected.

Will do.

Fixing up hugetlbfs locking is still 'on my list'.  There are known issues.
The last RFC/attempt was this:
http://lkml.kernel.org/r/20190201221705.15622-1-mike.kravetz@oracle.com
I believe that patch would have handled this issue.

However, as mentioned above it may better to just patch this issue exposed
by LTP and work on the more comprehensive change in the background.
-- 
Mike Kravetz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
