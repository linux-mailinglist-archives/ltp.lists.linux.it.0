Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A74D1278CCE
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 17:33:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A48A3C307A
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 17:33:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 051723C078F
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 17:33:48 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2ACD014001E2
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 17:33:46 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,302,1596470400"; d="scan'208";a="99620573"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Sep 2020 23:33:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id EFD8A48990CB
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 23:33:42 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Sep 2020 23:33:43 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 25 Sep 2020 23:33:39 +0800
Message-ID: <1601048019-2758-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EFD8A48990CB.ADA7D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] thp04: Add linux tag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When I test this case on cenots7.8GA, thp04 will trigger ltp default timeout
and it can't be killed even its process stat is R(running). After looking code
and documentation, I found it also triggers another kernel bug(infinite loop).
commit 8310d48b125d ("mm/huge_memory.c: respect FOLL_FORCE/FOLL_COW for thp")
fix this.

Also, when I backport cve-2017-1000405 patch into centos7.8ga, this case still
passed and it is not enough to cover the another bug. I will add a new test case
to test the another bug.

Adding a url to make user know huge dirty cow bug easily.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/mem/thp/thp04.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/testcases/kernel/mem/thp/thp04.c b/testcases/kernel/mem/thp/thp04.c
index e71261c1d..985394dc3 100644
--- a/testcases/kernel/mem/thp/thp04.c
+++ b/testcases/kernel/mem/thp/thp04.c
@@ -14,6 +14,16 @@
  *  Date:   Mon Nov 27 06:21:25 2017 +0300
  *
  *   mm, thp: Do not make page table dirty unconditionally in touch_p[mu]d()
+ *
+ * More details see the following URL
+ * https://medium.com/bindecy/huge-dirty-cow-cve-2017-1000405-110eca132de0
+ *
+ * On old kernel such as 4.9, it has fixed the Dirty Cow bug but a similar check
+ * in huge_memory.c was forgotten.  As a result, remote memory writes to ro regions
+ * of memory backed by transparent huge pages cause an infinite loop in the kernel.
+ * While in this state the process is stil SIGKILLable, but little else works.
+ * It is also a regression test about kernel
+ * commit 8310d48b125d("huge_memory.c: respect FOLL_FORCE/FOLL_COW for thp").
  */
 
 #include <sys/mman.h>
@@ -155,6 +165,7 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "a8f97366452e"},
+		{"linux-git", "8310d48b125d"},
 		{"CVE", "2017-1000405"},
 		{}
 	}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
