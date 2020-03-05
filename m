Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6690617ABCE
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 18:18:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B1203C6533
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 18:18:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6033B3C64DC
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 18:18:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 409681A05187
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 18:18:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A213B127;
 Thu,  5 Mar 2020 17:18:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Mar 2020 18:18:44 +0100
Message-Id: <20200305171844.24020-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] hugeshmctl01: Fix reset stat_time when looping
 with -i n
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

c7a2d296b didn't reset stat_time, thus uninitialized set_shared was
assigned to test variable and test got value from a null pointer,
which leaded to segfault.

hugeshmctl01.c:279: PASS: shmctl in func_rmid() failed as expected, shared memory appears to be removed
tst_checkpoint.c:147: BROK: hugeshmctl01.c:152: tst_checkpoint_wait(0, 10000): ETIMEDOUT (110)
mem.c:817: INFO: set nr_hugepages to 0

dmesg:
segfault at 7f73f8c00000 ip 00000000004051e1 sp 00007ffef375f9a0 error 6 in hugeshmctl01.master[404000+13000]
addr2line -e hugeshmctl01 -f  00000000004051e1
stat_setup
hugeshmctl01.c:139 (discriminator 4)

test = (stat_time == FIRST) ? set_shmat() : set_shared;

/* do an assignement for fun */
*(int *)test = i; // error here

Fixes: c7a2d296b ("hugeshmctl: Use loop from the API")

Reported-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Suggested-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Xu,

I'm sorry for introducing a regression.
Thank you for a report and fixing the test.
I'd personally prefer to keep .tcnt = ARRAY_SIZE(tcases),
but maybe others will prefer to keep loop in test_hugeshmctl()
as it was before my change.

BTW it'd be nice to have something like setup_i() and cleanup_i(),
which would be called before/after each run of whole test, when run with
-i n.

Kind regards,
Petr

 .../mem/hugetlb/hugeshmctl/hugeshmctl01.c     | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
index e6cf8bf09..3b7e14363 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
@@ -75,6 +75,20 @@ struct tcase {
 
 static void test_hugeshmctl(unsigned int i)
 {
+	stat_time = FIRST;
+
+	/*
+	 * Create a shared memory segment with read and write
+	 * permissions. Do this here instead of in setup()
+	 * so that looping (-i) will work correctly.
+	 */
+	if (i == 0) {
+		shm_id_1 = shmget(shmkey, shm_size,
+				SHM_HUGETLB | IPC_CREAT | IPC_EXCL | SHM_RW);
+		if (shm_id_1 == -1)
+			tst_brk(TBROK | TERRNO, "shmget #main");
+	}
+
 	/*
 	 * if needed, set up any required conditions by
 	 * calling the appropriate setup function
@@ -296,19 +310,6 @@ void setup(void)
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
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
