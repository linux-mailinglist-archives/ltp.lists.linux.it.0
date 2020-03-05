Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF66B17A284
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 10:53:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D98A3C6501
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 10:53:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C0CE63C64E0
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 10:53:49 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 9115660071C
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 10:53:46 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,517,1574092800"; d="scan'208";a="85868875"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Mar 2020 17:53:44 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E124B406AB15
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 17:43:48 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 5 Mar 2020 17:53:41 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 5 Mar 2020 17:53:50 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 5 Mar 2020 17:53:43 +0800
Message-ID: <1583402023-22461-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: E124B406AB15.ABD57
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] hugeshmctl01: Revert "hugeshmctl: Use loop from the
 API"
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

Currently, when I run this case, it failed as below:
./hugeshmctl01 -i 2
tst_test.c:1229: INFO: Timeout per run is 0h 05m 00s
mem.c:817: INFO: set nr_hugepages to 128
hugeshmctl01.c:198: PASS: pid, size, # of attaches and mode are correct - pass #0
hugeshmctl01.c:198: PASS: pid, size, # of attaches and mode are correct - pass #1
hugeshmctl01.c:263: PASS: new mode and change time are correct
hugeshmctl01.c:280: PASS: shmctl in func_rmid() failed as expected,...
tst_checkpoint.c:149: BROK: hugeshmctl01.c:152: tst_checkpoint_wait(0, 10000):ETIMEDOUT (110)

dmesg
hugeshmctl01[12232]: segfault at 7fe9d0000000 ip 0000000000404041 sp
00007fff69d8a8e0 error 6 in hugeshmctl01[400000+21000]

addr2line -e hugeshmctl01 -f  0000000000404041
stat_setup
/root/ltp/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c:139 (discriminator 4)

test = (stat_time == FIRST) ? set_shmat() : set_shared;

			/* do an assignement for fun */
139line			*(int *)test = i;

Case doesn't reset STAT_TIME(test used a null set_shared, and then test got value from
a null pointer), so it got segfault.

Also, if I reset this STAT_TIME in test_hugeshmctl when i is equal to 0, this case
still fails because shm_id_1 is disabled in func_rmid. If I don't disable shm_id_1,
it will report the following warning
WARNING: shared memory deletion failed
hugetlb.c:150: INFO: WARNING: shared memory deletion failed.
hugetlb.c:151: INFO: This could lead to IPC resource problems.

So I think reverting patch "hugeshmctl: Use loop from the API " for this case maybe a
good choice because old hugeshmctl works fine.

ps: If I am wrong, please correct me.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../mem/hugetlb/hugeshmctl/hugeshmctl01.c     | 53 ++++++++++---------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
index e6cf8bf09..03dd46ea7 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2004
- * Copyright (c) Linux Test Project, 2004-2020
+ * Copyright (c) Linux Test Project, 2004-2017
  */
 
 /*
@@ -73,20 +73,37 @@ struct tcase {
 	{IPC_RMID, func_rmid, NULL}
 };
 
-static void test_hugeshmctl(unsigned int i)
+static void test_hugeshmctl(void)
 {
+	unsigned int i;
+
+	/* initialize stat_time */
+	stat_time = FIRST;
+
 	/*
-	 * if needed, set up any required conditions by
-	 * calling the appropriate setup function
+	 * Create a shared memory segment with read and write
+	 * permissions.  Do this here instead of in setup()
+	 * so that looping (-i) will work correctly.
 	 */
-	if (tcases[i].func_setup != NULL)
-		(*tcases[i].func_setup) ();
+	shm_id_1 = shmget(shmkey, shm_size,
+			SHM_HUGETLB | IPC_CREAT | IPC_EXCL | SHM_RW);
+	if (shm_id_1 == -1)
+		tst_brk(TBROK | TERRNO, "shmget #main");
 
-	if (shmctl(shm_id_1, tcases[i].cmd, &buf) == -1) {
-		tst_res(TFAIL | TERRNO, "shmctl #main");
-		return;
+	for (i = 0; i < ARRAY_SIZE(tcases); i++) {
+		/*
+		 * if needed, set up any required conditions by
+		 * calling the appropriate setup function
+		 */
+		if (tcases[i].func_setup != NULL)
+			(*tcases[i].func_setup) ();
+
+		if (shmctl(shm_id_1, tcases[i].cmd, &buf) == -1) {
+			tst_res(TFAIL | TERRNO, "shmctl #main");
+			continue;
+		}
+		(*tcases[i].func_test) ();
 	}
-	(*tcases[i].func_test)();
 }
 
 /*
@@ -296,19 +313,6 @@ void setup(void)
 	shm_size = hpage_size * hugepages / 2;
 	update_shm_size(&shm_size);
 	shmkey = getipckey();
-
-	/* initialize stat_time */
-	stat_time = FIRST;
-
-	/*
-	 * Create a shared memory segment with read and write
-	 * permissions.  Do this here instead of in setup()
-	 * so that looping (-i) will work correctly.
-	 */
-	shm_id_1 = shmget(shmkey, shm_size,
-			SHM_HUGETLB | IPC_CREAT | IPC_EXCL | SHM_RW);
-	if (shm_id_1 == -1)
-		tst_brk(TBROK | TERRNO, "shmget #main");
 }
 
 void cleanup(void)
@@ -318,12 +322,11 @@ void cleanup(void)
 }
 
 static struct tst_test test = {
-	.tcnt = ARRAY_SIZE(tcases),
 	.needs_root = 1,
 	.forks_child = 1,
 	.options = options,
 	.setup = setup,
 	.cleanup = cleanup,
-	.test = test_hugeshmctl,
+	.test_all = test_hugeshmctl,
 	.needs_checkpoints = 1,
 };
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
