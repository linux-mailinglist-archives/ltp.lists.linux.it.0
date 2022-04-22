Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC5550AE8C
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Apr 2022 05:37:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E52593CA6E2
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Apr 2022 05:37:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E40723CA581
 for <ltp@lists.linux.it>; Fri, 22 Apr 2022 05:37:06 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5CD806005CE
 for <ltp@lists.linux.it>; Fri, 22 Apr 2022 05:37:03 +0200 (CEST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Kl0SD56G9z1J9vl
 for <ltp@lists.linux.it>; Fri, 22 Apr 2022 11:36:12 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 22 Apr 2022 11:36:59 +0800
Received: from ubuntu1804.huawei.com (10.67.174.55) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 22 Apr 2022 11:36:58 +0800
To: <ltp@lists.linux.it>
Date: Fri, 22 Apr 2022 11:35:52 +0800
Message-ID: <20220422033552.257763-1-threefifteen.wangkunfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] kernel/hugemmap05.c: Skip test when default
 Hugepagesize 1G
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
From: Wang Kunfeng via ltp <ltp@lists.linux.it>
Reply-To: Wang Kunfeng <threefifteen.wangkunfeng@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The kernel is not allow to change the file that
/proc/sys/vm/nr_overcommit_hugepages,
when default Hugepagesize 1G,so the testcase
will be fail when close it.

Signen-off-by: Wang Kunfeng <threefifteen.wangkunfeng@huawei.com>
---
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c
index 40d3bd8da..5c78d0635 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c
@@ -61,6 +61,7 @@ static int key = -1, shmid = -1, fd = -1;
 static int mounted, restore_shmmax, restore_overcomm_hgpgs;
 static long hugepagesize, nr_overcommit_hugepages;
 static long size = NR_HPAGES, length = (NR_HPAGES + NR_HPAGES/2) * 2;
+static long default_hugepagesize = 1048576;

 char *opt_sysfs;
 char *opt_alloc;
@@ -188,6 +189,10 @@ static void setup(void)
 	if (tst_hugepages != NR_HPAGES)
 		tst_brk(TCONF, "Not enough hugepages for testing!");

+	hugepagesize = SAFE_READ_MEMINFO("Hugepagesize:");
+	if (hugepagesize == default_hugepagesize)
+		tst_brk(TCONF, "system hugepagesize default 1G,the testcase not support!");
+
 	hugepagesize = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
 	init_sys_sz_paths();


2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
