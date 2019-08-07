Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C36B83E24
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 02:09:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C66523C1CFC
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 02:09:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E78163C1860
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 02:09:38 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BD4B21000DBF
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 02:09:31 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7703ipf027165;
 Wed, 7 Aug 2019 00:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=AIsoL8wBQu2vc4iTjiuL85c4WFOrTsYj/OoeOmTUV04=;
 b=3R53FdYbnHq32gvkH6ecMl+MlL5GANPBFc19pvu9hyqrxYTQWCLG8jeNPjzmbRQL6g7G
 4qTGPck/phr3GDQVMyDpQTnDDB2Rm+VwoI262envxmPpzb9Q7en61rSwBB054TJWJ4+T
 KX+/iJuEr9GFF3CXyknL9YVcBFzder8rzMQhg73cTBGHqsWlZH4go6+w5AXom5KpsA78
 z5RiBP2zH0/szCYPWEw0gnTzcYLThESfeH9sBfVsZwlGSGgV6FcBHNYE60b7awBvGwaJ
 ucufm/WYbBEAXEDlWdxG9FTkOP0ntHIuVQQmY73+RoZJnNomcQwvB3RMVuB0HBQI2Lh0 FA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2u52wr94y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Aug 2019 00:07:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7702gsf048603;
 Wed, 7 Aug 2019 00:07:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2u766716ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Aug 2019 00:07:31 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7707R3E003180;
 Wed, 7 Aug 2019 00:07:27 GMT
Received: from [192.168.1.222] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 06 Aug 2019 17:07:26 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Michal Hocko <mhocko@suse.com>
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
 <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
 <CAEemH2d=vEfppCbCgVoGdHed2kuY3GWnZGhymYT1rnxjoWNdcQ@mail.gmail.com>
 <a65e748b-7297-8547-c18d-9fb07202d5a0@oracle.com>
 <27a48931-aff6-d001-de78-4f7bef584c32@oracle.com>
 <20190802041557.GA16274@hori.linux.bs1.fc.nec.co.jp>
 <54a5c9f5-eade-0d8f-24f9-bff6f19d4905@oracle.com>
 <20190805085740.GC7597@dhcp22.suse.cz>
 <7d78f6b9-afb8-79d1-003e-56de58fded00@oracle.com>
Message-ID: <3c104b29-ffe2-07cb-440e-cb88d8e11acb@oracle.com>
Date: Tue, 6 Aug 2019 17:07:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7d78f6b9-afb8-79d1-003e-56de58fded00@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9341
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908060212
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9341
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908060212
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

On 8/5/19 10:36 AM, Mike Kravetz wrote:
>>>>> Can you try this patch in your environment?  I am not sure if it will
>>>>> be the final fix, but just wanted to see if it addresses issue for you.
>>>>>
>>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>>> index ede7e7f5d1ab..f3156c5432e3 100644
>>>>> --- a/mm/hugetlb.c
>>>>> +++ b/mm/hugetlb.c
>>>>> @@ -3856,6 +3856,20 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
>>>>>  
>>>>>  		page = alloc_huge_page(vma, haddr, 0);
>>>>>  		if (IS_ERR(page)) {
>>>>> +			/*
>>>>> +			 * We could race with page migration (try_to_unmap_one)
>>>>> +			 * which is modifying page table with lock.  However,
>>>>> +			 * we are not holding lock here.  Before returning
>>>>> +			 * error that will SIGBUS caller, get ptl and make
>>>>> +			 * sure there really is no entry.
>>>>> +			 */
>>>>> +			ptl = huge_pte_lock(h, mm, ptep);
>>>>> +			if (!huge_pte_none(huge_ptep_get(ptep))) {
>>>>> +				ret = 0;
>>>>> +				spin_unlock(ptl);
>>>>> +				goto out;
>>>>> +			}
>>>>> +			spin_unlock(ptl);
>>>>
>>>> Thanks you for investigation, Mike.
>>>> I tried this change and found no SIGBUS, so it works well.

Here is another way to address the issue.  Take the hugetlb fault mutex in
the migration code when modifying the page tables.  IIUC, the fault mutex
was introduced to prevent this same issue when there were two page faults
on the same page (and we were unable to allocate an 'extra' page).  The
downside to such an approach is that we add more hugetlbfs specific code
to try_to_unmap_one.

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index edf476c8cfb9..df0e74f9962e 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -485,6 +485,17 @@ static inline int hstate_index(struct hstate *h)
 	return h - hstates;
 }
 
+/*
+ * Convert the address within this vma to the page offset within
+ * the mapping, in pagecache page units; huge pages here.
+ */
+static inline pgoff_t vma_hugecache_offset(struct hstate *h,
+			struct vm_area_struct *vma, unsigned long address)
+{
+	return ((address - vma->vm_start) >> huge_page_shift(h)) +
+		(vma->vm_pgoff >> huge_page_order(h));
+}
+
 pgoff_t __basepage_index(struct page *page);
 
 /* Return page->index in PAGE_SIZE units */
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ede7e7f5d1ab..959aed5b7969 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -615,17 +615,6 @@ static long region_count(struct resv_map *resv, long f, long t)
 	return chg;
 }
 
-/*
- * Convert the address within this vma to the page offset within
- * the mapping, in pagecache page units; huge pages here.
- */
-static pgoff_t vma_hugecache_offset(struct hstate *h,
-			struct vm_area_struct *vma, unsigned long address)
-{
-	return ((address - vma->vm_start) >> huge_page_shift(h)) +
-			(vma->vm_pgoff >> huge_page_order(h));
-}
-
 pgoff_t linear_hugepage_index(struct vm_area_struct *vma,
 				     unsigned long address)
 {
diff --git a/mm/rmap.c b/mm/rmap.c
index e5dfe2ae6b0d..f8c95482c23e 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1350,6 +1350,7 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 	bool ret = true;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)arg;
+	u32 hugetlb_hash = 0;
 
 	/* munlock has nothing to gain from examining un-locked vmas */
 	if ((flags & TTU_MUNLOCK) && !(vma->vm_flags & VM_LOCKED))
@@ -1377,6 +1378,19 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 				min(vma->vm_end, address +
 				    (PAGE_SIZE << compound_order(page))));
 	if (PageHuge(page)) {
+		struct hstate *h = hstate_vma(vma);
+
+		/*
+		 * Take the hugetlb fault mutex so that we do not race with
+		 * page faults while modifying page table.  Mutex must be
+		 * acquired before ptl below.
+		 */
+		hugetlb_hash = hugetlb_fault_mutex_hash(h,
+					vma->vm_file->f_mapping,
+					vma_hugecache_offset(h, vma, address),
+					address);
+		mutex_lock(&hugetlb_fault_mutex_table[hugetlb_hash]);
+
 		/*
 		 * If sharing is possible, start and end will be adjusted
 		 * accordingly.
@@ -1659,6 +1673,8 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 	}
 
 	mmu_notifier_invalidate_range_end(&range);
+	if (PageHuge(page))
+		mutex_unlock(&hugetlb_fault_mutex_table[hugetlb_hash]);
 
 	return ret;
 }


Michal, Naoya any preferences on how this should be fixed?  I'll send a
proper patch if we agree on an approach.
-- 
Mike Kravetz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
