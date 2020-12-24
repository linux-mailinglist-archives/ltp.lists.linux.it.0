Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4B72E25CB
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Dec 2020 10:58:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 544A63C5693
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Dec 2020 10:58:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2B0453C303C
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 10:58:30 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C93F61A00678
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 10:58:28 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,444,1599494400"; d="scan'208";a="102906701"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Dec 2020 17:58:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 83E224CE546D
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 17:58:22 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.48) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 24 Dec 2020 17:58:22 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 24 Dec 2020 04:58:16 -0500
Message-ID: <1608803896-17634-3-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1608803896-17634-1-git-send-email-zhufy.jy@cn.fujitsu.com>
References: <1608803896-17634-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.48]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 83E224CE546D.AA42F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] syscalls/ipc: semctl09: add a test for
 SEM_STAT_ANY
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

Validate the content of the seminfo structure and the return value.

The return value is highest used index to a kernel table, so we call
semctl() with SEM_STAT_ANY which shouldn't fail if the value is correct.

We also test SEM_STAT_ANY by calling semctl() directly by syscall(),
because glibc have a bug that caused fails to pass the buffer specified
by the caller to the kernel.

We parse /proc/sysvipc/sem and check that the information is
consistent with the content of seminfo structure.

Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                                |   1 +
 runtest/syscalls-ipc                            |   1 +
 testcases/kernel/syscalls/ipc/semctl/.gitignore |   1 +
 testcases/kernel/syscalls/ipc/semctl/Makefile   |   2 +-
 testcases/kernel/syscalls/ipc/semctl/semctl09.c | 197 ++++++++++++++++++++++++
 5 files changed, 201 insertions(+), 1 deletion(-)
 create mode 100644 testcases/kernel/syscalls/ipc/semctl/semctl09.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 28174dd..1549916 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1179,6 +1179,7 @@ semctl05 semctl05
 semctl06 semctl06
 semctl07 semctl07
 semctl08 semctl08
+semctl09 semctl09
 
 semget01 semget01
 semget02 semget02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 9524b1a..68fff40 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -37,6 +37,7 @@ semctl05 semctl05
 semctl06 semctl06
 semctl07 semctl07
 semctl08 semctl08
+semctl09 semctl09
 
 semget01 semget01
 semget02 semget02
diff --git a/testcases/kernel/syscalls/ipc/semctl/.gitignore b/testcases/kernel/syscalls/ipc/semctl/.gitignore
index 6189a04..87d8393 100644
--- a/testcases/kernel/syscalls/ipc/semctl/.gitignore
+++ b/testcases/kernel/syscalls/ipc/semctl/.gitignore
@@ -6,3 +6,4 @@
 /semctl06
 /semctl07
 /semctl08
+/semctl09
diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
index f711e77..c6d8597 100644
--- a/testcases/kernel/syscalls/ipc/semctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
@@ -8,6 +8,6 @@ LTPLIBS = ltpipc ltpnewipc
 include $(top_srcdir)/include/mk/testcases.mk
 
 semctl01 semctl02 semctl03 semctl04 semctl05 semctl06 semctl07: LTPLDLIBS = -lltpipc
-semctl08: LTPLDLIBS = -lltpnewipc
+semctl08 semctl09: LTPLDLIBS = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl09.c b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
new file mode 100644
index 0000000..131bfbc
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
+ */
+/*\
+ * [DESCRIPTION]
+ *
+ * Call semctl() with SEM_INFO flag and check that:
+ *
+ * * The returned index points to a valid SEM by calling SEM_STAT_ANY
+ * * Also count that valid indexes < returned max index sums up to semusz
+ * * And the data are consistent with /proc/sysvipc/sem
+ *
+ * There is a possible race between the call to the semctl() and read from the
+ * proc file so this test cannot be run in parallel with any IPC testcases that
+ * adds or removes semaphore set.
+ *
+ * Note what we create a semaphore set in the test setup to make sure
+ * that there is at least one during the testrun.
+ *
+ * Also note that for SEM_INFO the members of the seminfo structure have
+ * completely different meaning than their names seems to suggest.
+ *
+ * We also calling semctl() directly by syscall(), because of a glibc bug:
+ * * semctl SEM_STAT_ANY fails to pass the buffer specified by the caller
+ * * to the kernel.
+ * * https://sourceware.org/bugzilla/show_bug.cgi?id=26637
+ *
+ * The glibc bug was fixed in:
+ * * commit  574500a108be1d2a6a0dc97a075c9e0a98371aba
+ * * Author: Dmitry V. Levin <ldv@altlinux.org>
+ * * Date:   Tue, 29 Sep 2020 17:10:20 +0000 (14:10 -0300)
+\*/
+
+#include <stdio.h>
+#include <pwd.h>
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+#include "libnewipc.h"
+#include "lapi/sem.h"
+#include "lapi/syscalls.h"
+
+static int sem_id = -1;
+static uid_t nobody_uid, root_uid;
+static union semun un;
+
+/*
+ * Note: semctl man-pages may have wrong description. We should use sem_ds
+ * struct(un.buf) instead of seminfo struct(un.__buf).
+ */
+static inline int do_semctl(int semid, int semnum, int cmd)
+{
+	switch (tst_variant) {
+	case 0:
+		return tst_syscall(__NR_semctl, semid, semnum, cmd, &un.buf);
+	case 1:
+		return semctl(semid, semnum, cmd, &un.buf);
+	}
+	return -1;
+}
+
+static void test_info(void)
+{
+	switch (tst_variant) {
+	case 0:
+		tst_res(TINFO, "Test SYS_semctl syscall");
+	break;
+	case 1:
+		tst_res(TINFO, "Test libc semctl()");
+	break;
+	}
+}
+
+static struct tcases {
+	uid_t *uid;
+	char *desc;
+} tests[] = {
+	{&nobody_uid, "with nobody user",},
+	{&root_uid, "with root user",},
+};
+
+static void parse_proc_sysvipc(struct seminfo *info)
+{
+	FILE *f = fopen("/proc/sysvipc/sem", "r");
+	int semset_cnt = 0;
+	int sem_cnt = 0;
+
+	/* Eat header */
+	for (;;) {
+		int c = fgetc(f);
+
+		if (c == '\n' || c == EOF)
+			break;
+	}
+
+	int nsems;
+	/*
+	 * Sum sem set, nsems for all elements listed, which should equal
+	 * the data returned in the seminfo structure.
+	 */
+	while (fscanf(f, "%*i %*i %*i %i %*i %*i %*i %*i %*i %*i",
+		      &nsems) > 0){
+		semset_cnt++;
+		sem_cnt += nsems;
+	}
+
+	if (info->semusz != semset_cnt) {
+		tst_res(TFAIL, "semusz = %i, expected %i",
+				info->semusz, semset_cnt);
+	} else {
+		tst_res(TPASS, "semset_cnt = %i", semset_cnt);
+	}
+
+	if (info->semaem != sem_cnt) {
+		tst_res(TFAIL, "semaem = %i, expected %i",
+				info->semaem, sem_cnt);
+	} else {
+		tst_res(TPASS, "sen_cnt = %i", sem_cnt);
+	}
+
+	fclose(f);
+}
+
+static void verify_semctl(unsigned int n)
+{
+	struct tcases *tc = &tests[n];
+	int i, semid, cnt = 0;
+	struct seminfo info;
+	union semun arg;
+
+	tst_res(TINFO, "Test SEM_STAT_ANY %s", tc->desc);
+
+	SAFE_SETEUID(*tc->uid);
+
+	arg.__buf = &info;
+
+	TEST(semctl(sem_id, 0, SEM_INFO, arg));
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "semctl(sem_id, 0, SEM_INFO, ...)");
+		return;
+	}
+
+	semid = do_semctl(TST_RET, 0, SEM_STAT_ANY);
+
+	if (errno == EFAULT) {
+		tst_res(TFAIL, "SEM_STAT_ANY doesn't pass the buffer "
+				"specified by the caller to kernel");
+		return;
+	} else if (semid == -1) {
+		tst_res(TFAIL | TTERRNO, "SEM_INFO haven't returned a valid index");
+	} else {
+		tst_res(TPASS, "SEM_INFO returned valid index %li to semid %i",
+			TST_RET, semid);
+	}
+
+	for (i = 0; i <= TST_RET; i++) {
+		if ((do_semctl(i, 0, SEM_STAT_ANY)) != -1)
+			cnt++;
+	}
+
+	if (cnt == info.semusz) {
+		tst_res(TPASS, "Counted used = %i", cnt);
+	} else {
+		tst_res(TFAIL, "Counted used = %i, semuse = %i",
+			cnt, info.semusz);
+	}
+
+	parse_proc_sysvipc(&info);
+}
+
+static void setup(void)
+{
+	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
+
+	nobody_uid = ltpuser->pw_uid;
+	root_uid = 0;
+
+	sem_id = SAFE_SEMGET(IPC_PRIVATE, 2, IPC_CREAT | 0600);
+	test_info();
+}
+
+static void cleanup(void)
+{
+	if (sem_id >= 0)
+		SAFE_SEMCTL(sem_id, 0, IPC_RMID);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_semctl,
+	.tcnt = ARRAY_SIZE(tests),
+	.test_variants = 2,
+	.needs_root = 1,
+};
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
