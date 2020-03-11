Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED66218159C
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 11:15:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE0943C5F28
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 11:15:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C31683C5F4A
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 11:15:22 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 921D0200DEB
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 11:15:20 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,540,1574092800"; d="scan'208";a="86165302"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Mar 2020 18:15:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 459CC50A9983
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 18:05:20 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 11 Mar 2020 18:15:18 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Mar 2020 18:15:19 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 11 Mar 2020 18:15:12 +0800
Message-ID: <1583921712-9008-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583921712-9008-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1583921712-9008-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 459CC50A9983.AA766
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] hugetlb: remove useless function
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

After using .request_hugepages api, cases in hugetlb don't call
these functions. So remove them.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/mem/hugetlb/lib/hugetlb.c | 43 ----------------------
 testcases/kernel/mem/hugetlb/lib/hugetlb.h |  4 --
 2 files changed, 47 deletions(-)

diff --git a/testcases/kernel/mem/hugetlb/lib/hugetlb.c b/testcases/kernel/mem/hugetlb/lib/hugetlb.c
index 83b85f325..cd1b27eb3 100644
--- a/testcases/kernel/mem/hugetlb/lib/hugetlb.c
+++ b/testcases/kernel/mem/hugetlb/lib/hugetlb.c
@@ -39,49 +39,6 @@
 #include <pwd.h>
 #include "hugetlb.h"
 
-static long orig_hugepages = -1;
-
-long save_nr_hugepages(void)
-{
-	check_hugepage();
-
-	orig_hugepages = get_sys_tune("nr_hugepages");
-
-	return orig_hugepages;
-}
-
-void restore_nr_hugepages(void)
-{
-	if (orig_hugepages != -1)
-		set_sys_tune("nr_hugepages", orig_hugepages, 0);
-}
-
-void limit_hugepages(long *hpages)
-{
-	long mem_avail, max_hpages;
-
-	if (FILE_LINES_SCANF("/proc/meminfo",
-			"MemAvailable: %ld", &mem_avail)) {
-		/*
-		 * Dropping caches and using "MemFree:" on kernel
-		 * that doesn't have "MemAvailable:" in Meminfo
-		 */
-		tst_res(TINFO, "MemAvailable: not found in /proc/meminfo");
-
-		SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");
-		mem_avail = SAFE_READ_MEMINFO("MemFree:");
-	}
-
-	max_hpages = mem_avail / SAFE_READ_MEMINFO("Hugepagesize:");
-
-	if (*hpages > max_hpages) {
-		tst_res(TINFO, "Requested number of hugepages too large, "
-				"limiting to 80%% of the max hugepage count %ld",
-				max_hpages);
-		*hpages = max_hpages * 0.8;
-	}
-}
-
 /*
  * getipckey() - generates and returns a message key used by the "get"
  *		 calls to create an IPC resource.
diff --git a/testcases/kernel/mem/hugetlb/lib/hugetlb.h b/testcases/kernel/mem/hugetlb/lib/hugetlb.h
index 66ad324ab..7c03a317c 100644
--- a/testcases/kernel/mem/hugetlb/lib/hugetlb.h
+++ b/testcases/kernel/mem/hugetlb/lib/hugetlb.h
@@ -42,9 +42,5 @@ void rm_shm(int shm_id);
 
 char *nr_opt;
 char *Hopt;
-void check_hugepage(void);
-long save_nr_hugepages(void);
-void restore_nr_hugepages(void);
-void limit_hugepages(long *hpages);
 
 #endif /* hugetlb.h */
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
