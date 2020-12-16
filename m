Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B186A2DBE44
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:10:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 606653C671B
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:10:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C693F3C2B2B
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:09:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 56ECE600101
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:09:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02004AF2F
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 10:09:18 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 11:10:12 +0100
Message-Id: <20201216101012.14644-6-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216101012.14644-1-chrubis@suse.cz>
References: <20201216101012.14644-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] syscalls/move_pages12: Add one more kernel git
 hash
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

+ Reformat the comment to asciidoc

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../kernel/syscalls/move_pages/move_pages12.c | 52 ++++++++++++-------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/testcases/kernel/syscalls/move_pages/move_pages12.c b/testcases/kernel/syscalls/move_pages/move_pages12.c
index c906acbe3..d209426c7 100644
--- a/testcases/kernel/syscalls/move_pages/move_pages12.c
+++ b/testcases/kernel/syscalls/move_pages/move_pages12.c
@@ -7,16 +7,17 @@
  *  Ported: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
  */
 
-/*
- * Description:
+/*\
+ * [DESCRIPTION]
+ *
+ * *Test 1*
  *
- * Test #1:
- *  This is a regression test for the race condition between move_pages()
- *  and freeing hugepages, where move_pages() calls follow_page(FOLL_GET)
- *  for hugepages internally and tries to get its refcount without
- *  preventing concurrent freeing.
+ * This is a regression test for the race condition between move_pages()
+ * and freeing hugepages, where move_pages() calls follow_page(FOLL_GET)
+ * for hugepages internally and tries to get its refcount without
+ * preventing concurrent freeing.
  *
- *  This test can crash the buggy kernel, and the bug was fixed in:
+ * This test can crash the buggy kernel, and the bug was fixed in:
  *
  *   commit e66f17ff71772b209eed39de35aaa99ba819c93d
  *   Author: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
@@ -24,25 +25,25 @@
  *
  *   mm/hugetlb: take page table lock in follow_huge_pmd()
  *
- *  Test #2:
- *   #2.1:
- *   This is a regression test for the race condition, where move_pages()
- *   and soft offline are called on a single hugetlb page concurrently.
+ * *Test 2.1*
  *
- *   This bug can crash the buggy kernel, and was fixed by:
+ * This is a regression test for the race condition, where move_pages()
+ * and soft offline are called on a single hugetlb page concurrently.
+ *
+ * This test can crash the buggy kernel, and was fixed by:
  *
  *   commit c9d398fa237882ea07167e23bcfc5e6847066518
  *   Author: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
  *   Date:   Fri Mar 31 15:11:55 2017 -0700
  *
- *   mm, hugetlb: use pte_present() instead of pmd_present() in
- *   follow_huge_pmd()
+ *   mm, hugetlb: use pte_present() instead of pmd_present() in follow_huge_pmd()
+ *
+ * *Test 2.2*
  *
- *   #2.2:
- *   This is also a regression test for an race condition causing SIGBUS
- *   in hugepage migration/fault.
+ * This is also a regression test for an race condition causing SIGBUS
+ * in hugepage migration/fault.
  *
- *   This bug was fixed by:
+ * This bug was fixed by:
  *
  *   commit 4643d67e8cb0b3536ef0ab5cddd1cedc73fa14ad
  *   Author: Mike Kravetz <mike.kravetz@oracle.com>
@@ -50,7 +51,17 @@
  *
  *   hugetlbfs: fix hugetlb page migration/fault race causing SIGBUS
  *
- */
+ * *Test 2.3*
+ *
+ * The madvise() in the do_soft_online() was also triggering cases where soft
+ * online returned EIO when page migration failed, which was fixed in:
+ *
+ *    commit 3f4b815a439adfb8f238335612c4b28bc10084d8
+ *    Author: Oscar Salvador <osalvador@suse.de>
+ *    Date:   Mon Dec 14 19:11:51 2020 -0800
+ *
+ *    mm,hwpoison: return -EBUSY when migration fails
+\*/
 
 #include <errno.h>
 #include <unistd.h>
@@ -334,6 +345,7 @@ static struct tst_test test = {
 		{"linux-git", "e66f17ff7177"},
 		{"linux-git", "c9d398fa2378"},
 		{"linux-git", "4643d67e8cb0"},
+		{"linux-git", "3f4b815a439a"},
 		{}
 	}
 };
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
