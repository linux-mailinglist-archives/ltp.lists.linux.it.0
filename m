Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BDE3AFFF6
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 11:10:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B507F3C8709
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 11:10:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C49593C6FF5
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 11:10:36 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 48DA8600BF5
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 11:10:35 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G8L8K1G1TzXjpT
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 17:05:21 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:10:29 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:10:29 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 22 Jun 2021 17:11:08 +0800
Message-ID: <20210622091108.249098-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210622091108.249098-1-xieziyao@huawei.com>
References: <20210622091108.249098-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2 v2] io_getevents02: Add io_getevents02 test for
 libaio
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
Reply-To: 20210618094210.183027-2-xieziyao@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test io_getevents invoked via libaio with invalid ctx and expects it to
return -EINVAL.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Modification of the output format.

 runtest/syscalls                              |  1 +
 .../kernel/syscalls/io_getevents/.gitignore   |  1 +
 .../syscalls/io_getevents/io_getevents02.c    | 53 +++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_getevents/io_getevents02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index fdcfe9e01..d3eb96249 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -610,6 +610,7 @@ io_cancel02 io_cancel02
 io_destroy01 io_destroy01
 io_destroy02 io_destroy02
 io_getevents01 io_getevents01
+io_getevents02 io_getevents02

 io_pgetevents01 io_pgetevents01
 io_pgetevents02 io_pgetevents02
diff --git a/testcases/kernel/syscalls/io_getevents/.gitignore b/testcases/kernel/syscalls/io_getevents/.gitignore
index b3a5f4df1..b57022f73 100644
--- a/testcases/kernel/syscalls/io_getevents/.gitignore
+++ b/testcases/kernel/syscalls/io_getevents/.gitignore
@@ -1 +1,2 @@
 /io_getevents01
+/io_getevents02
diff --git a/testcases/kernel/syscalls/io_getevents/io_getevents02.c b/testcases/kernel/syscalls/io_getevents/io_getevents02.c
new file mode 100644
index 000000000..09eedd4f6
--- /dev/null
+++ b/testcases/kernel/syscalls/io_getevents/io_getevents02.c
@@ -0,0 +1,53 @@
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
+ * Test io_getevents invoked via libaio with invalid ctx and expects it to
+ * return -EINVAL.
+ */
+
+#include "config.h"
+#include "tst_test.h"
+
+#ifdef HAVE_LIBAIO
+#include <libaio.h>
+
+static void run(void)
+{
+	io_context_t ctx;
+
+	memset(&ctx, 0, sizeof(ctx));
+	TEST(io_getevents(ctx, 0, 0, NULL, NULL));
+
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "io_getevents() succeeded unexpectedly");
+		return;
+	}
+
+	if (TST_RET == -EINVAL) {
+		tst_res(TPASS, "io_getevents() failed with EINVAL");
+		return;
+	}
+
+	tst_res(TFAIL, "io_getevents() failed unexpectedly %s (%ld) expected EINVAL",
+		tst_strerrno(-TST_RET), -TST_RET);
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
