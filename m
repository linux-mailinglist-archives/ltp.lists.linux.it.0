Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F93D7E71E
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 02:20:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E88C3C2028
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 02:20:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D59EB3C1DFC
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 02:19:58 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8B3191400749
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 02:19:57 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x720EqpT019585;
 Fri, 2 Aug 2019 00:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=rhayChBIMMzjZ70I+yc6wMOnu1t5fS2GeqE4wEB9Te4=;
 b=rWLGD0OaoOoaAslcOWB2HzRfswas+mJggdZOkHEauekipNN2JRNWnX+/txtXLvDnhSP7
 xLiJVzQi3max1BjPpDmtIiOn0nen11OV1Xpn7rGY3JTLR5/U9WNZpoxTqg1d3XtsblN8
 BFeq8utObBQERQwTNXYEi0M/W4U91kA94uwW2SbTMyMQWir+kTEIOPSyHkjZ9V83ixbD
 dqRYPNsh0CplPqrEhtHgbtuOC2VYZA8srcGoJp8ixoliEPzzxxWOobIsQb7U6Jlp16GH
 CKpWcMsvtfF937cfjuooB/pF6mM9L7YE8UkxXQ+Ka9auLH5xGDT1uC0K5Cule5x9/vss aw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2u0e1u71bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Aug 2019 00:19:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x720Hm5f132175;
 Fri, 2 Aug 2019 00:19:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2u349eg2ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Aug 2019 00:19:44 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x720JhFe006332;
 Fri, 2 Aug 2019 00:19:43 GMT
Received: from [192.168.1.222] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 01 Aug 2019 17:19:42 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Li Wang <liwang@redhat.com>
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
 <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
 <CAEemH2d=vEfppCbCgVoGdHed2kuY3GWnZGhymYT1rnxjoWNdcQ@mail.gmail.com>
 <a65e748b-7297-8547-c18d-9fb07202d5a0@oracle.com>
Message-ID: <27a48931-aff6-d001-de78-4f7bef584c32@oracle.com>
Date: Thu, 1 Aug 2019 17:19:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a65e748b-7297-8547-c18d-9fb07202d5a0@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9336
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908020000
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9336
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908020000
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
Cc: xishi.qiuxishi@alibaba-inc.com, mhocko@kernel.org,
 Linux-MM <linux-mm@kvack.org>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/30/19 5:44 PM, Mike Kravetz wrote:
> A SIGBUS is the normal behavior for a hugetlb page fault failure due to
> lack of huge pages.  Ugly, but that is the design.  I do not believe this
> test should not be experiencing this due to reservations taken at mmap
> time.  However, the test is combining faults, soft offline and page
> migrations, so the there are lots of moving parts.
> 
> I'll continue to investigate.

There appears to be a race with hugetlb_fault and try_to_unmap_one of
the migration path.

Can you try this patch in your environment?  I am not sure if it will
be the final fix, but just wanted to see if it addresses issue for you.

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ede7e7f5d1ab..f3156c5432e3 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3856,6 +3856,20 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
 
 		page = alloc_huge_page(vma, haddr, 0);
 		if (IS_ERR(page)) {
+			/*
+			 * We could race with page migration (try_to_unmap_one)
+			 * which is modifying page table with lock.  However,
+			 * we are not holding lock here.  Before returning
+			 * error that will SIGBUS caller, get ptl and make
+			 * sure there really is no entry.
+			 */
+			ptl = huge_pte_lock(h, mm, ptep);
+			if (!huge_pte_none(huge_ptep_get(ptep))) {
+				ret = 0;
+				spin_unlock(ptl);
+				goto out;
+			}
+			spin_unlock(ptl);
 			ret = vmf_error(PTR_ERR(page));
 			goto out;
 		}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
