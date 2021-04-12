Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8582935BC2B
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 10:28:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F6B53C2509
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 10:28:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E0173C1C5B
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 10:28:53 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 73EAB200FCE
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 10:28:51 +0200 (CEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FJhfn5RJszkj5w
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 16:26:57 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 16:28:40 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 12 Apr 2021 16:28:36 +0800
Message-ID: <20210412082836.27415-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] controllers/memcg: Add testcase for
 kmem_limit_in_bytes of memory cgroup
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

Add memory cgroup testcase for checking that kmem overflow is controlled
by kmem.limit_in_bytes.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 .../functional/memcg_kmem_limit_in_bytes.c    | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 testcases/kernel/controllers/memcg/functional/memcg_kmem_limit_in_bytes.c

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_kmem_limit_in_bytes.c b/testcases/kernel/controllers/memcg/functional/memcg_kmem_limit_in_bytes.c
new file mode 100644
index 000000000..d01403fdd
--- /dev/null
+++ b/testcases/kernel/controllers/memcg/functional/memcg_kmem_limit_in_bytes.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 HUAWEI LIMITED
+ * Author: Zhao Gongyi <zhaogongyi@huawei.com>
+ */
+
+/*\
+ * [Description]
+ * Check that kmem overflow is controlled by kmem.limit_in_bytes.
+ *
+ * [Algorithm]
+ * 1) mount memory cgroup
+ * 2) set 0 to memory.kmem.limit_in_bytes
+ * 3) set test process group to cgroup.procs
+ * 4) fork in test process group to trig kmem overflow
+ */
+
+#include <sys/wait.h>
+#include "tst_test.h"
+
+#define MNT_POINT "memcg"
+#define TESTDIR "memcg/ltpmemcg"
+#define CGROUP_PROCS "memcg/ltpmemcg/cgroup.procs"
+#define KMEM_LIMIT_IN_BYTES "memcg/ltpmemcg/memory.kmem.limit_in_bytes"
+
+static void cleanup(void)
+{
+	SAFE_RMDIR(TESTDIR);
+	SAFE_UMOUNT(MNT_POINT);
+	SAFE_RMDIR(MNT_POINT);
+}
+
+static void setup(void)
+{
+	SAFE_MKDIR(MNT_POINT, 0755);
+	SAFE_MOUNT("memcg", MNT_POINT, "cgroup", 0, "memory");
+	SAFE_MKDIR(TESTDIR, 0755);
+}
+
+static void run(void)
+{
+	pid_t pid;
+	int st;
+	int fd;
+	char buf[128] = {0};
+
+	pid = SAFE_FORK();
+	if (!pid) {
+		SAFE_SETPGID(0, 0);
+
+		SAFE_FILE_PRINTF(KMEM_LIMIT_IN_BYTES, "%d", 0);
+
+		SAFE_FILE_PRINTF(CGROUP_PROCS, "%d", getpgid(getpid()));
+
+		TEST(fork());
+		if (TST_RET == -1) {
+			if (TST_ERR == ENOMEM)
+				tst_res(TPASS, "fork fail as expected");
+			else
+				tst_brk(TFAIL | TTERRNO,
+					"fork fail as unexpected");
+		} else if (TST_RET == 0) {
+			tst_brk(TFAIL, "fork success as unexpected");
+		} else {
+			SAFE_WAIT(NULL);
+			tst_brk(TFAIL, "fork success as unexpected");
+		}
+	} else {
+		SAFE_WAIT(&st);
+		if (WIFEXITED(st))
+			if (!WEXITSTATUS(st)) {
+				tst_res(TPASS, "kmem alloc is controled "
+					"by memory.kmem.limit_in_bytes");
+				return;
+			}
+
+		tst_res(TFAIL,"kmem alloc is not controled "
+			"by memory.kmem.limit_in_bytes");
+	}
+}
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.forks_child = 1,
+	.setup = setup,
+	.test_all = run,
+	.cleanup = cleanup,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
