Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 016B339F83B
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:57:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9658F3C7AEE
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:57:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D88F73C4CD3
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:56:43 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 380FB600633
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:56:41 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fzs9F2nMVzWsRB
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 21:51:45 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 21:56:36 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 21:56:36 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 8 Jun 2021 21:57:15 +0800
Message-ID: <20210608135718.36579-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608135718.36579-1-xieziyao@huawei.com>
References: <20210608135718.36579-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4 v2] syscalls/io_destroy: Add io_destroy02 test for
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

Test io_destroy invoked via syscall(2) with an invalid ctx and expects it to return EINVAL.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Add .needs_kconfig in this test.
2. Print values not variable names in TST_EXP_PASS().

 runtest/syscalls                              |  1 +
 .../kernel/syscalls/io_destroy/.gitignore     |  1 +
 .../kernel/syscalls/io_destroy/io_destroy02.c | 38 +++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_destroy/io_destroy02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 9df181b76..01d26ad5a 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -607,6 +607,7 @@ ioprio_set03 ioprio_set03

 io_cancel01 io_cancel01
 io_destroy01 io_destroy01
+io_destroy02 io_destroy02
 io_getevents01 io_getevents01

 io_pgetevents01 io_pgetevents01
diff --git a/testcases/kernel/syscalls/io_destroy/.gitignore b/testcases/kernel/syscalls/io_destroy/.gitignore
index 025aa0f4a..48a16cd2f 100644
--- a/testcases/kernel/syscalls/io_destroy/.gitignore
+++ b/testcases/kernel/syscalls/io_destroy/.gitignore
@@ -1 +1,2 @@
 /io_destroy01
+/io_destroy02
diff --git a/testcases/kernel/syscalls/io_destroy/io_destroy02.c b/testcases/kernel/syscalls/io_destroy/io_destroy02.c
new file mode 100644
index 000000000..c8cc63818
--- /dev/null
+++ b/testcases/kernel/syscalls/io_destroy/io_destroy02.c
@@ -0,0 +1,38 @@
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
+ * Test io_destroy invoked via syscall(2) with an invalid ctx and expects
+ * it to return EINVAL.
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
+	memset(&ctx, 0xff, sizeof(ctx));
+	TST_EXP_FAIL(tst_syscall(__NR_io_destroy, ctx), EINVAL,
+		     "io_destroy() with an invalid ctx");
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
