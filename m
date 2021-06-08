Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B6639F838
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:57:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C3D93C90FE
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:57:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D1A4B3C2685
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:56:43 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 16E89600815
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:56:42 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FzsCK3MHBz6wLQ
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 21:53:33 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 21:56:36 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 21:56:36 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 8 Jun 2021 21:57:16 +0800
Message-ID: <20210608135718.36579-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608135718.36579-1-xieziyao@huawei.com>
References: <20210608135718.36579-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4 v2] syscalls/io_setup: Add io_setup02 test for
 native AIO
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

Test io_setup invoked via syscall(2):
1. io_setup fails and returns -EFAULT if ctxp is NULL.
2. io_setup fails and returns -EINVAL if ctxp is not initialized to 0.
3. io_setup fails and returns -EINVAL if nr_events is -1.
4. io_setup fails and returns -EAGAIN if nr_events exceeds the limit.
5. io_setup succeeds if both nr_events and ctxp are valid.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Add .needs_kconfig in this test.
2. Print values not variable names in TST_EXP_PASS().
3. Use TST_EXP_PASS_SILENT() instead of TST_EXP_PASS() in cleanup.

 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/io_setup/.gitignore |  1 +
 .../kernel/syscalls/io_setup/io_setup02.c     | 64 +++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_setup/io_setup02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 01d26ad5a..d1ec32754 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -614,6 +614,7 @@ io_pgetevents01 io_pgetevents01
 io_pgetevents02 io_pgetevents02

 io_setup01 io_setup01
+io_setup02 io_setup02
 io_submit01 io_submit01

 keyctl01 keyctl01
diff --git a/testcases/kernel/syscalls/io_setup/.gitignore b/testcases/kernel/syscalls/io_setup/.gitignore
index 4fd03960c..37a4b8321 100644
--- a/testcases/kernel/syscalls/io_setup/.gitignore
+++ b/testcases/kernel/syscalls/io_setup/.gitignore
@@ -1 +1,2 @@
 /io_setup01
+/io_setup02
diff --git a/testcases/kernel/syscalls/io_setup/io_setup02.c b/testcases/kernel/syscalls/io_setup/io_setup02.c
new file mode 100644
index 000000000..292b7440d
--- /dev/null
+++ b/testcases/kernel/syscalls/io_setup/io_setup02.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Ported from Crackerjack to LTP by Masatake YAMATO <yamato@redhat.com>
+ * Copyright (c) 2011 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) 2017 Xiao Yang <yangx.jy@cn.fujitsu.com>
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Test io_setup invoked via syscall(2):
+ *
+ * 1. io_setup fails and returns -EFAULT if ctxp is NULL.
+ * 2. io_setup fails and returns -EINVAL if ctxp is not initialized to 0.
+ * 3. io_setup fails and returns -EINVAL if nr_events is -1.
+ * 4. io_setup fails and returns -EAGAIN if nr_events exceeds the limit
+ *    of available events.
+ * 5. io_setup succeeds if both nr_events and ctxp are valid.
+ */
+
+#include <linux/aio_abi.h>
+
+#include "config.h"
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+
+static void run(void)
+{
+	aio_context_t ctx;
+
+	TST_EXP_FAIL(tst_syscall(__NR_io_setup, 1, NULL), EFAULT,
+		     "io_setup() when ctxp is NULL");
+
+	memset(&ctx, 1, sizeof(ctx));
+	TST_EXP_FAIL(tst_syscall(__NR_io_setup, 1, &ctx), EINVAL,
+		     "io_setup() when ctxp is not initialized to 0");
+
+	memset(&ctx, 0, sizeof(ctx));
+	TST_EXP_FAIL(tst_syscall(__NR_io_setup, -1, &ctx), EINVAL,
+		     "io_setup() when nr_events is -1");
+
+	unsigned aio_max = 0;
+	if (!access("/proc/sys/fs/aio-max-nr", F_OK)) {
+		SAFE_FILE_SCANF("/proc/sys/fs/aio-max-nr", "%u", &aio_max);
+		TST_EXP_FAIL(tst_syscall(__NR_io_setup, aio_max + 1, &ctx), EAGAIN,
+			     "io_setup() when nr_events exceeds the limit");
+	} else {
+		tst_res(TCONF, "the aio-max-nr file did not exist");
+	}
+
+	TST_EXP_PASS(tst_syscall(__NR_io_setup, 1, &ctx),
+		     "io_setup() when both nr_events and ctxp are valid");
+	TST_EXP_PASS_SILENT(tst_syscall(__NR_io_destroy, ctx));
+}
+
+static struct tst_test test = {
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_AIO=y",
+		NULL
+	},
+	.test_all = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
