Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D57A7FFCF
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 19:42:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5151E3C1E24
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 19:42:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 351283C1E02
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 19:42:55 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 069A720A6CE
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 19:42:54 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x72HclqR169368;
 Fri, 2 Aug 2019 17:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=qQ2degySGezHPZVUFes5RH7s/QM5AOAAph4PyTsDeb4=;
 b=nOyiDmWMBdJpZJ6J8/AqC+RDETQN8h0mRNAHVtHlLGahut+ewZA7WtdQjJm+Rjlr6wae
 gxciS5F+fh+oKsckZxSaVMUofmxXB7la8lj8nqPzgn2yCfuHXaMrwcHqJt68yRz3pYWh
 dYCD+D9prsJ7Gf4CcfHjFI+SehCL8m7nj35KgCiBBWhIEJMxS3QXTzSkI7+iFWdLff5C
 w9HeW/6OwDNKJBYiwgHJS145bRDcmNLOQ20sc+h1MRlAEbnhZCahvxvN8HFHKmUaOHcp
 oT4CJ7dXEokiEIQ2Q2s8maUea8jGwyJdkYpq66bFxn4rujsgqpNMPfB8ClZGMK6vikM8 9w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2u0ejq3kd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Aug 2019 17:42:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x72HgfHn189167;
 Fri, 2 Aug 2019 17:42:41 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2u49hufg5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Aug 2019 17:42:41 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x72HgZe0001558;
 Fri, 2 Aug 2019 17:42:35 GMT
Received: from [192.168.1.222] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 02 Aug 2019 10:42:35 -0700
To: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
 <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
 <CAEemH2d=vEfppCbCgVoGdHed2kuY3GWnZGhymYT1rnxjoWNdcQ@mail.gmail.com>
 <a65e748b-7297-8547-c18d-9fb07202d5a0@oracle.com>
 <27a48931-aff6-d001-de78-4f7bef584c32@oracle.com>
 <20190802041557.GA16274@hori.linux.bs1.fc.nec.co.jp>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <54a5c9f5-eade-0d8f-24f9-bff6f19d4905@oracle.com>
Date: Fri, 2 Aug 2019 10:42:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190802041557.GA16274@hori.linux.bs1.fc.nec.co.jp>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9337
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908020185
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9337
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908020184
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
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

On 8/1/19 9:15 PM, Naoya Horiguchi wrote:
> On Thu, Aug 01, 2019 at 05:19:41PM -0700, Mike Kravetz wrote:
>> There appears to be a race with hugetlb_fault and try_to_unmap_one of
>> the migration path.
>>
>> Can you try this patch in your environment?  I am not sure if it will
>> be the final fix, but just wanted to see if it addresses issue for you.
>>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index ede7e7f5d1ab..f3156c5432e3 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -3856,6 +3856,20 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
>>  
>>  		page = alloc_huge_page(vma, haddr, 0);
>>  		if (IS_ERR(page)) {
>> +			/*
>> +			 * We could race with page migration (try_to_unmap_one)
>> +			 * which is modifying page table with lock.  However,
>> +			 * we are not holding lock here.  Before returning
>> +			 * error that will SIGBUS caller, get ptl and make
>> +			 * sure there really is no entry.
>> +			 */
>> +			ptl = huge_pte_lock(h, mm, ptep);
>> +			if (!huge_pte_none(huge_ptep_get(ptep))) {
>> +				ret = 0;
>> +				spin_unlock(ptl);
>> +				goto out;
>> +			}
>> +			spin_unlock(ptl);
> 
> Thanks you for investigation, Mike.
> I tried this change and found no SIGBUS, so it works well.
> 
> I'm still not clear about how !huge_pte_none() becomes true here,
> because we enter hugetlb_no_page() only when huge_pte_none() is non-null
> and (racy) try_to_unmap_one() from page migration should convert the
> huge_pte into a migration entry, not null.

Thanks for taking a look Naoya.

In try_to_unmap_one(), there is this code block:

		/* Nuke the page table entry. */
		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
		if (should_defer_flush(mm, flags)) {
			/*
			 * We clear the PTE but do not flush so potentially
			 * a remote CPU could still be writing to the page.
			 * If the entry was previously clean then the
			 * architecture must guarantee that a clear->dirty
			 * transition on a cached TLB entry is written through
			 * and traps if the PTE is unmapped.
			 */
			pteval = ptep_get_and_clear(mm, address, pvmw.pte);

			set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
		} else {
			pteval = ptep_clear_flush(vma, address, pvmw.pte);
		}

That happens before setting the migration entry.  Therefore, for a period
of time the pte is NULL (huge_pte_none() returns true).

try_to_unmap_one holds the page table lock, but hugetlb_fault does not take
the lock to 'optimistically' check huge_pte_none().  When huge_pte_none
returns true, it calls hugetlb_no_page which is where we try to allocate
a page and fails.

Does that make sense, or am I missing something?

The patch checks for this specific condition: someone changing the pte
from NULL to non-NULL while holding the lock.  I am not sure if this is
the best way to fix.  But, it may be the easiest.
-- 
Mike Kravetz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
