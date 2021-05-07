Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 769CF376216
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 10:33:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18FD53C564F
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 10:33:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A5BED3C55ED
 for <ltp@lists.linux.it>; Fri,  7 May 2021 10:33:11 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 334EE1A006BC
 for <ltp@lists.linux.it>; Fri,  7 May 2021 10:33:10 +0200 (CEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fc3Yv1CyDzlcS5;
 Fri,  7 May 2021 16:30:59 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 7 May 2021 16:33:01 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 7 May 2021 16:33:20 +0800
Message-ID: <20210507083321.167998-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507083321.167998-1-xieziyao@huawei.com>
References: <20210507083321.167998-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] syscalls/io_setup: Add io_setup02 test for native
 AIO
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
Cc: rpalethorpe@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test io_setup invoked via syscall(2):
- io_setup fails and returns -EFAULT if ctxp is NULL;
- io_setup fails and returns -EINVAL if ctxp is not initialized to 0;
- io_setup fails and returns -EINVAL if nr_events is -1;
- io_setup fails and returns -EAGAIN if nr_events exceeds the limit
  of available events;
- io_setup succeeds if both nr_events and ctxp are valid.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/io_setup/.gitignore |  1 +
 .../kernel/syscalls/io_setup/io_setup02.c     | 52 +++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_setup/io_setup02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index bd6ec6a2e..b8f195891 100644
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
index 000000000..1d657e14a
--- /dev/null
+++ b/testcases/kernel/syscalls/io_setup/io_setup02.c
@@ -0,0 +1,52 @@
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
+ * - io_setup fails and returns -EFAULT if ctxp is NULL;
+ * - io_setup fails and returns -EINVAL if ctxp is not initialized to 0;
+ * - io_setup fails and returns -EINVAL if nr_events is -1;
+ * - io_setup fails and returns -EAGAIN if nr_events exceeds the limit
+ *   of available events;
+ * - io_setup succeeds if both nr_events and ctxp are valid.
+ */
+
+#include <linux/aio_abi.h>
+
+#include "config.h"
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+
+static void verify_io_setup(void)
+{
+	aio_context_t ctx;
+	TST_EXP_FAIL(tst_syscall(__NR_io_setup, 1, NULL), EFAULT);
+
+	memset(&ctx, 1, sizeof(ctx));
+	TST_EXP_FAIL(tst_syscall(__NR_io_setup, 1, &ctx), EINVAL);
+	memset(&ctx, 0, sizeof(ctx));
+	TST_EXP_FAIL(tst_syscall(__NR_io_setup, -1, &ctx), EINVAL);
+
+	unsigned aio_max = 0;
+	if (!access("/proc/sys/fs/aio-max-nr", F_OK)) {
+		SAFE_FILE_SCANF("/proc/sys/fs/aio-max-nr", "%u", &aio_max);
+		TST_EXP_FAIL(tst_syscall(__NR_io_setup, aio_max + 1, &ctx), EAGAIN);
+	} else {
+		tst_res(TCONF, "the aio-max-nr file did not exist");
+	}
+
+	TST_EXP_PASS(tst_syscall(__NR_io_setup, 1, &ctx));
+	TST_EXP_PASS(tst_syscall(__NR_io_destroy, ctx));
+}
+
+static struct tst_test test = {
+	.test_all = verify_io_setup,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
