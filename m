Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF8D856B8
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 02:06:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 851A23C1D1E
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 02:06:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 644C03C1C7E
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 02:06:09 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E559D6019D5
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 02:06:07 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7803VSY194693;
 Thu, 8 Aug 2019 00:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2018-07-02; bh=I2Hc/6m77d4hpaNBr8SFkiuWXjVZymWAJofoezwBLnA=;
 b=P0m1eST+/I2izEuD8KcsWz+2ub6H8FBzrm3ZhwxxjC7qoCzv+CLqWmhFsDkX0leIpido
 THsd4c3eH+U+wbKI+8X9e2swFdd30OTgnaAqDSMbfnFUwdN0dpTkCax+8N9tu6tMZNrI
 GGlhL1VdBlemkOuocM7VcdQ7r51iopSZmRMS/qvgafHCk0O/4qPQXm1bPBqr+e4jqDFY
 1NzsxYg9LAXeohz2xFlTGo4bANlm8fOzQwgL6jy/mdeOSw/nTwFRmoRkjugMVaSi7ggL
 NGgp6gj4Y7dC9e8InHHVwLoRdqcuXTvihvekZyO6SwF9ttWOZ5cdNaxex4BijcQSJ3Nz Lg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2u52wrf95t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Aug 2019 00:05:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7802nQf053058;
 Thu, 8 Aug 2019 00:05:53 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2u7578e6m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Aug 2019 00:05:53 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7805kbB031716;
 Thu, 8 Aug 2019 00:05:46 GMT
Received: from monkey.oracle.com (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 07 Aug 2019 17:05:45 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ltp@lists.linux.it
Date: Wed,  7 Aug 2019 17:05:33 -0700
Message-Id: <20190808000533.7701-1-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908070214
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908070214
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] hugetlbfs: fix hugetlb page migration/fault race
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
Cc: xishi.qiuxishi@alibaba-inc.com, Michal Hocko <mhocko@kernel.org>,
 Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Li Wang discovered that LTP/move_page12 V2 sometimes triggers SIGBUS
in the kernel-v5.2.3 testing.  This is caused by a race between hugetlb
page migration and page fault.

If a hugetlb page can not be allocated to satisfy a page fault, the task
is sent SIGBUS.  This is normal hugetlbfs behavior.  A hugetlb fault
mutex exists to prevent two tasks from trying to instantiate the same
page.  This protects against the situation where there is only one
hugetlb page, and both tasks would try to allocate.  Without the mutex,
one would fail and SIGBUS even though the other fault would be successful.

There is a similar race between hugetlb page migration and fault.
Migration code will allocate a page for the target of the migration.
It will then unmap the original page from all page tables.  It does
this unmap by first clearing the pte and then writing a migration
entry.  The page table lock is held for the duration of this clear and
write operation.  However, the beginnings of the hugetlb page fault
code optimistically checks the pte without taking the page table lock.
If clear (as it can be during the migration unmap operation), a hugetlb
page allocation is attempted to satisfy the fault.  Note that the page
which will eventually satisfy this fault was already allocated by the
migration code.  However, the allocation within the fault path could
fail which would result in the task incorrectly being sent SIGBUS.

Ideally, we could take the hugetlb fault mutex in the migration code
when modifying the page tables.  However, locks must be taken in the
order of hugetlb fault mutex, page lock, page table lock.  This would
require significant rework of the migration code.  Instead, the issue
is addressed in the hugetlb fault code.  After failing to allocate a
huge page, take the page table lock and check for huge_pte_none before
returning an error.  This is the same check that must be made further
in the code even if page allocation is successful.

Reported-by: Li Wang <liwang@redhat.com>
Fixes: 290408d4a250 ("hugetlb: hugepage migration core")
Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
Tested-by: Li Wang <liwang@redhat.com>
---
 mm/hugetlb.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ede7e7f5d1ab..6d7296dd11b8 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3856,6 +3856,25 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
 
 		page = alloc_huge_page(vma, haddr, 0);
 		if (IS_ERR(page)) {
+			/*
+			 * Returning error will result in faulting task being
+			 * sent SIGBUS.  The hugetlb fault mutex prevents two
+			 * tasks from racing to fault in the same page which
+			 * could result in false unable to allocate errors.
+			 * Page migration does not take the fault mutex, but
+			 * does a clear then write of pte's under page table
+			 * lock.  Page fault code could race with migration,
+			 * notice the clear pte and try to allocate a page
+			 * here.  Before returning error, get ptl and make
+			 * sure there really is no pte entry.
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
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
