Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2C23AC7D5
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 11:42:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8FA5F3C2FC7
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 11:42:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF0BE3C2462
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 11:42:01 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A838B601CF4
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 11:42:00 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G5v2X3Bqdz1BN1g
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 17:36:52 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 17:41:56 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 17:41:55 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 18 Jun 2021 17:42:04 +0800
Message-ID: <20210618094210.183027-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210618094210.183027-1-xieziyao@huawei.com>
References: <20210618094210.183027-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/7] io_cancel02: Add io_cancel02 test for libaio
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

Test io_cancel invoked via libaio with one of the data structures
points to invalid data and expects it to return -EFAULT.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/io_cancel/.gitignore      |  1 +
 .../kernel/syscalls/io_cancel/io_cancel02.c   | 51 +++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_cancel/io_cancel02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 6c42c0b09..28ffa1286 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -606,6 +606,7 @@ ioprio_set02 ioprio_set02
 ioprio_set03 ioprio_set03

 io_cancel01 io_cancel01
+io_cancel02 io_cancel02
 io_destroy01 io_destroy01
 io_destroy02 io_destroy02
 io_getevents01 io_getevents01
diff --git a/testcases/kernel/syscalls/io_cancel/.gitignore b/testcases/kernel/syscalls/io_cancel/.gitignore
index 1728695a6..f01afa592 100644
--- a/testcases/kernel/syscalls/io_cancel/.gitignore
+++ b/testcases/kernel/syscalls/io_cancel/.gitignore
@@ -1 +1,2 @@
 /io_cancel01
+/io_cancel02
diff --git a/testcases/kernel/syscalls/io_cancel/io_cancel02.c b/testcases/kernel/syscalls/io_cancel/io_cancel02.c
new file mode 100644
index 000000000..9fc131065
--- /dev/null
+++ b/testcases/kernel/syscalls/io_cancel/io_cancel02.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Ported from Crackerjack to LTP by Masatake YAMATO <yamato@redhat.com>
+ * Copyright (c) 2011 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Test io_cancel invoked via libaio with one of the data structures points
+ * to invalid data and expects it to return -EFAULT.
+ */
+
+#include "config.h"
+#include "tst_test.h"
+
+#ifdef HAVE_LIBAIO
+#define EXP_RET (-EFAULT)
+
+#include <libaio.h>
+
+static void run(void)
+{
+	io_context_t ctx;
+
+	memset(&ctx, 0, sizeof(ctx));
+	TEST(io_cancel(ctx, NULL, NULL));
+
+	if (TST_RET == 0)
+		tst_res(TFAIL, "call succeeded unexpectedly");
+	else if (TST_RET == EXP_RET)
+		tst_res(TPASS, "io_cancel(ctx, NULL, NULL) returns %ld : %s",
+			TST_RET, strerror(-TST_RET));
+	else
+		tst_res(TFAIL, "io_cancel(ctx, NULL, NULL) returns %ld : %s, expected %d : %s",
+			TST_RET, strerror(-TST_RET), EXP_RET, strerror(-EXP_RET));
+}
+
+static struct tst_test test = {
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_AIO=y",
+		NULL
+	},
+	.test_all = run,
+};
+
+#else
+TST_TEST_TCONF("test requires libaio and it's development packages");
+#endif
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
