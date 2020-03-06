Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBB317BA42
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 11:32:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7B9B3C63BB
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 11:32:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E0BE23C12AE
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 11:32:04 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E3ABC616623
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 11:32:02 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,521,1574092800"; d="scan'208";a="85947213"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Mar 2020 18:31:59 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id CAA97406AB15
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 18:22:02 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 6 Mar 2020 18:31:57 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 6 Mar 2020 18:31:56 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 6 Mar 2020 18:32:00 +0800
Message-ID: <1583490720-10003-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200306071221.GA13530@dell5510>
References: <20200306071221.GA13530@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: CAA97406AB15.AE167
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] hugeshmctl01: Small refactor and remove stat_time
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

Since the stat_time makes code looks a bit complex, refactor this part instead of resetting it.

Fixes: c7a2d296b ("hugeshmctl: Use loop from the API")

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../mem/hugetlb/hugeshmctl/hugeshmctl01.c     | 102 ++++++++----------
 1 file changed, 47 insertions(+), 55 deletions(-)

diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
index e6cf8bf09..3f985a1b3 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
@@ -35,8 +35,6 @@
 #include <limits.h>
 #include "hugetlb.h"
 
-#define FIRST		0
-#define SECOND		1
 #define N_ATTACH	4U
 #define NEWMODE		0066
 
@@ -44,11 +42,11 @@ static size_t shm_size;
 static int shm_id_1 = -1;
 static struct shmid_ds buf;
 static time_t save_time;
-static int stat_time;
-static void *set_shared;
+static void *attach_to_parent;
 
-static void stat_setup(void);
+static void stat_setup_1(void);
 static void stat_cleanup(void);
+static void stat_setup_2(void);
 static void set_setup(void);
 static void func_stat(void);
 static void func_set(void);
@@ -67,8 +65,8 @@ struct tcase {
 	void (*func_test) (void);
 	void (*func_setup) (void);
 } tcases[] = {
-	{IPC_STAT, func_stat, stat_setup},
-	{IPC_STAT, func_stat, stat_setup},
+	{IPC_STAT, func_stat, stat_setup_1},
+	{IPC_STAT, func_stat, stat_setup_2},
 	{IPC_SET,  func_set,  set_setup},
 	{IPC_RMID, func_rmid, NULL}
 };
@@ -76,9 +74,16 @@ struct tcase {
 static void test_hugeshmctl(unsigned int i)
 {
 	/*
-	 * if needed, set up any required conditions by
-	 * calling the appropriate setup function
+	 * Create a shared memory segment with read and write
+	 * permissions.  Do this here instead of in setup()
+	 * so that looping (-i) will work correctly.
 	 */
+	if (i == 0)
+		shm_id_1 = shmget(shmkey, shm_size,
+			SHM_HUGETLB | IPC_CREAT | IPC_EXCL | SHM_RW);
+	if (shm_id_1 == -1)
+		tst_brk(TBROK | TERRNO, "shmget #main");
+
 	if (tcases[i].func_setup != NULL)
 		(*tcases[i].func_setup) ();
 
@@ -90,9 +95,7 @@ static void test_hugeshmctl(unsigned int i)
 }
 
 /*
- * set_shmat() - Attach the shared memory and return the pointer.  Use
- *		 this seperate routine to avoid code duplication in
- *		 stat_setup() below.
+ * set_shmat() - Attach the shared memory and return the pointer.
  */
 void *set_shmat(void)
 {
@@ -106,35 +109,33 @@ void *set_shmat(void)
 }
 
 /*
- * stat_setup() - Set up for the IPC_STAT command with shmctl().
- *		  Make things interesting by forking some children
- *		  that will either attach or inherit the shared memory.
+ * stat_setup_2() - Set up for the IPC_STAT command with shmctl().
+ * 		  Attach the shared memory to parent process and
+ * 		  some children will inherit the shared memory.
  */
-static void stat_setup(void)
+static void stat_setup_2(void)
+{
+	if (!attach_to_parent)
+		attach_to_parent = set_shmat();
+	stat_setup_1();
+}
+
+/*
+ * stat_setup_1() - Set up for the IPC_STAT command with shmctl().
+ *                some children will inherit or attatch the shared memory.
+ *                It deponds on whther we attach the shared memory
+ *                to parent process.
+ */
+static void stat_setup_1(void)
 {
 	unsigned int i;
 	void *test;
 	pid_t pid;
 
-	/*
-	 * The first time through, let the children attach the memory.
-	 * The second time through, attach the memory first and let
-	 * the children inherit the memory.
-	 */
-
-	if (stat_time == SECOND) {
-		/*
-		 * use the global "set_shared" variable here so that
-		 * it can be removed in the stat_func() routine.
-		 */
-		set_shared = set_shmat();
-	}
-
 	for (i = 0; i < N_ATTACH; i++) {
 		switch (pid = SAFE_FORK()) {
 		case 0:
-			test = (stat_time == FIRST) ? set_shmat() : set_shared;
-
+			test = (attach_to_parent == NULL) ? set_shmat() : attach_to_parent;
 			/* do an assignement for fun */
 			*(int *)test = i;
 
@@ -154,6 +155,7 @@ static void stat_setup(void)
 	}
 }
 
+
 /*
  * func_stat() - check the functionality of the IPC_STAT command with shmctl()
  *		 by looking at the pid of the creator, the segement size,
@@ -162,6 +164,7 @@ static void stat_setup(void)
 static void func_stat(void)
 {
 	pid_t pid;
+	unsigned int num;
 
 	/* check perm, pid, nattach and size */
 	pid = getpid();
@@ -177,12 +180,13 @@ static void func_stat(void)
 	}
 
 	/*
-	 * The first time through, only the children attach the memory, so
-	 * the attaches equal N_ATTACH + stat_time (0).  The second time
-	 * through, the parent attaches the memory and the children inherit
-	 * that memory so the attaches equal N_ATTACH + stat_time (1).
+	 * The first case, only the children attach the memory, so
+	 * the attaches equal N_ATTACH. The second case, the parent
+	 * attaches the memory and the children inherit that memory
+	 * so the attaches equal N_ATTACH + 1.
 	 */
-	if (buf.shm_nattch != N_ATTACH + stat_time) {
+	num = (attach_to_parent == NULL) ? 0 : 1;
+	if (buf.shm_nattch != N_ATTACH + num) {
 		tst_res(TFAIL, "# of attaches is incorrect - %lu",
 			 (unsigned long)buf.shm_nattch);
 		goto fail;
@@ -195,7 +199,7 @@ static void func_stat(void)
 	}
 
 	tst_res(TPASS, "pid, size, # of attaches and mode are correct "
-		 "- pass #%d", stat_time);
+		 "- pass #%d", num);
 
 fail:
 	stat_cleanup();
@@ -220,11 +224,12 @@ static void stat_cleanup(void)
 	for (i = 0; i < N_ATTACH; i++)
 		SAFE_WAIT(&status);
 
-	/* remove the parent's shared memory the second time through */
-	if (stat_time == SECOND)
-		if (shmdt(set_shared) == -1)
+	/* remove the parent's shared memory if we set*/
+	if (attach_to_parent) {
+		if (shmdt(attach_to_parent) == -1)
 			tst_res(TFAIL | TERRNO, "shmdt in stat_cleanup()");
-	stat_time++;
+		attach_to_parent = NULL;
+	}
 }
 
 /*
@@ -296,19 +301,6 @@ void setup(void)
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
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
