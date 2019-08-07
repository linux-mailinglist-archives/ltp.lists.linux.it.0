Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C284F81
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 17:10:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8841A3C1D39
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 17:10:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2984D3C1D1B
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 17:10:41 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4746914016DB
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 17:10:40 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x77FANI8161267;
 Wed, 7 Aug 2019 15:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=r5hYy0y7ReIvBBGIGF8JhtoWuvMamCNlmDIGrsGw3Ds=;
 b=aEUlb5wIH9S5rzPKUC7S8GI7QZ0KJ3RFmchbm+rawRIhZBTgNBLAbEos0YKxw7F4nuK5
 KodWcMJ35Z+iHDFKKIJd5ICJpOhVm9lWPs9yaVL7HLRpjctzEYNcRjq+p3svxGYHd/1v
 xgft/+a8dSGx5Vj+pDOCUEdx/HYoGUNu+A8WR0UPAlepzh5y6wrdlxWjSc9d3E30wdqg
 biEJ78AWog3IsjJIpLTh6yx+Ax+pyQkwBEImXStJEnMCPy4ScpnHXcaO7KtPoFj77uv5
 BwiR17Iaie6u51h6oDTVDbea5ewTdcqPA9Voz7ukTIAfhHw96QTsSaZG6fsKubDZHrhg 5w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2u52wrcyka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Aug 2019 15:10:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x77FA9Ii172827;
 Wed, 7 Aug 2019 15:10:31 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2u763j04ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Aug 2019 15:10:30 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x77FATHA014733;
 Wed, 7 Aug 2019 15:10:29 GMT
Received: from [192.168.1.222] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 07 Aug 2019 08:10:28 -0700
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
 <3c104b29-ffe2-07cb-440e-cb88d8e11acb@oracle.com>
 <20190807073909.GL11812@dhcp22.suse.cz>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <d2bb2c10-a08c-dfde-a51b-827a85b50946@oracle.com>
Date: Wed, 7 Aug 2019 08:10:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190807073909.GL11812@dhcp22.suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908070160
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908070160
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

On 8/7/19 12:39 AM, Michal Hocko wrote:
> On Tue 06-08-19 17:07:25, Mike Kravetz wrote:
>> On 8/5/19 10:36 AM, Mike Kravetz wrote:
>>>>>>> Can you try this patch in your environment?  I am not sure if it will
>>>>>>> be the final fix, but just wanted to see if it addresses issue for you.
>>>>>>>
>>>>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>>>>> index ede7e7f5d1ab..f3156c5432e3 100644
>>>>>>> --- a/mm/hugetlb.c
>>>>>>> +++ b/mm/hugetlb.c
>>>>>>> @@ -3856,6 +3856,20 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
>>>>>>>  
>>>>>>>  		page = alloc_huge_page(vma, haddr, 0);
>>>>>>>  		if (IS_ERR(page)) {
>>>>>>> +			/*
>>>>>>> +			 * We could race with page migration (try_to_unmap_one)
>>>>>>> +			 * which is modifying page table with lock.  However,
>>>>>>> +			 * we are not holding lock here.  Before returning
>>>>>>> +			 * error that will SIGBUS caller, get ptl and make
>>>>>>> +			 * sure there really is no entry.
>>>>>>> +			 */
>>>>>>> +			ptl = huge_pte_lock(h, mm, ptep);
>>>>>>> +			if (!huge_pte_none(huge_ptep_get(ptep))) {
>>>>>>> +				ret = 0;
>>>>>>> +				spin_unlock(ptl);
>>>>>>> +				goto out;
>>>>>>> +			}
>>>>>>> +			spin_unlock(ptl);
>>>>>>
>>>>>> Thanks you for investigation, Mike.
>>>>>> I tried this change and found no SIGBUS, so it works well.
>>
>> Here is another way to address the issue.  Take the hugetlb fault mutex in
>> the migration code when modifying the page tables.  IIUC, the fault mutex
>> was introduced to prevent this same issue when there were two page faults
>> on the same page (and we were unable to allocate an 'extra' page).  The
>> downside to such an approach is that we add more hugetlbfs specific code
>> to try_to_unmap_one.
> 
> I would rather go with the hugetlb_no_page which is better isolated.

Sounds good.

And, after more thought modifying try_to_unmap_one will not work.  Why?
It violates lock ordering.  Current ordering is hugetlb_mutex, page lock
then page table lock.  The page lock is taken before calling try_to_unmap_one.
In addition, try_to_unmap is unmapping from multiple vmas so we can not
know the values for hugetlb hash before taking page lock as the hash values
are vma specific.  So, without many modifications we can not add hugetlb
fault mutex to this code path.
-- 
Mike Kravetz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
