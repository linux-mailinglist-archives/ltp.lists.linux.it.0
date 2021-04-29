Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5436E9CF
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 13:50:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A6243C61B8
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 13:50:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3B4E93C6197
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 13:50:19 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F1DE514012BF
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 13:50:17 +0200 (CEST)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FWDHt01FkzlW1W
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 19:47:06 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 29 Apr 2021 19:50:05 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 29 Apr 2021 19:50:20 +0800
Message-ID: <20210429115021.24128-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429115021.24128-1-xieziyao@huawei.com>
References: <20210429115021.24128-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] syscalls/io_setup: Convert libaio wrapper
 function to kernel syscall
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

Instead of using the libaio wrapper function, the system call is changed to be invoked via syscall(2).

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../kernel/syscalls/io_setup/io_setup01.c     | 94 +++++--------------
 1 file changed, 26 insertions(+), 68 deletions(-)

diff --git a/testcases/kernel/syscalls/io_setup/io_setup01.c b/testcases/kernel/syscalls/io_setup/io_setup01.c
index 28aee7831..6927aeafc 100644
--- a/testcases/kernel/syscalls/io_setup/io_setup01.c
+++ b/testcases/kernel/syscalls/io_setup/io_setup01.c
@@ -1,92 +1,50 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *   Copyright (c) Crackerjack Project., 2007
- *   Copyright (c) 2011 Cyril Hrubis <chrubis@suse.cz>
- *   Copyright (c) 2017 Xiao Yang <yangx.jy@cn.fujitsu.com>
+ * Copyright (c) Crackerjack Project., 2007
+ * Ported from Crackerjack to LTP by Masatake YAMATO <yamato@redhat.com>
+ * Copyright (c) 2011 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) 2017 Xiao Yang <yangx.jy@cn.fujitsu.com>
  */

-/* Porting from Crackerjack to LTP is done
- * by Masatake YAMATO <yamato@redhat.com>
+/*\
+ * [Description]
  *
- * Description:
- * 1) io_setup(2) succeeds if both nr_events and ctxp are valid.
- * 2) io_setup(2) fails and returns -EINVAL if ctxp is not initialized to 0.
- * 3) io_setup(2) fails and returns -EINVAL if nr_events is invalid.
- * 4) io_setup(2) fails and returns -EFAULT if ctxp is NULL.
- * 5) io_setup(2) fails and returns -EAGAIN if nr_events exceeds the limit
- *    of available events.
+ * - io_setup(2) fails and returns -EFAULT if ctxp is NULL;
+ * - io_setup(2) fails and returns -EINVAL if ctxp is not initialized to 0;
+ * - io_setup(2) fails and returns -EINVAL if nr_events is -1;
+ * - io_setup(2) fails and returns -EAGAIN if nr_events exceeds the limit
+ *   of available events;
+ * - io_setup(2) succeeds if both nr_events and ctxp are valid;
  */

-#include <errno.h>
-#include <string.h>
-#include <unistd.h>
+#include <linux/aio_abi.h>
+
 #include "config.h"
 #include "tst_test.h"
-
-#ifdef HAVE_LIBAIO
-#include <libaio.h>
-
-static void verify_failure(unsigned int nr, io_context_t *ctx, int init_val, long exp_err)
-{
-	if (ctx)
-		memset(ctx, init_val, sizeof(*ctx));
-
-	TEST(io_setup(nr, ctx));
-	if (TST_RET == 0) {
-		tst_res(TFAIL, "io_setup() passed unexpectedly");
-		io_destroy(*ctx);
-		return;
-	}
-
-	if (TST_RET == -exp_err) {
-		tst_res(TPASS, "io_setup() failed as expected, returned -%s",
-			tst_strerrno(exp_err));
-	} else {
-		tst_res(TFAIL, "io_setup() failed unexpectedly, returned -%s "
-			"expected -%s", tst_strerrno(-TST_RET),
-			tst_strerrno(exp_err));
-	}
-}
-
-static void verify_success(unsigned int nr, io_context_t *ctx, int init_val)
-{
-	memset(ctx, init_val, sizeof(*ctx));
-
-	TEST(io_setup(nr, ctx));
-	if (TST_RET == -ENOSYS)
-		tst_brk(TCONF | TRERRNO, "io_setup(): AIO not supported by kernel");
-	if (TST_RET != 0) {
-		tst_res(TFAIL, "io_setup() failed unexpectedly with %li (%s)",
-			TST_RET, tst_strerrno(-TST_RET));
-		return;
-	}
-
-	tst_res(TPASS, "io_setup() passed as expected");
-	io_destroy(*ctx);
-}
+#include "lapi/syscalls.h"

 static void verify_io_setup(void)
 {
-	io_context_t ctx;
-	unsigned int aio_max = 0;
+	aio_context_t ctx;
+	TST_EXP_FAIL(tst_syscall(__NR_io_setup, 1, NULL), EFAULT);

-	verify_success(1, &ctx, 0);
-	verify_failure(1, &ctx, 1, EINVAL);
-	verify_failure(-1, &ctx, 0, EINVAL);
-	verify_failure(1, NULL, 0, EFAULT);
+	memset(&ctx, 1, sizeof(ctx));
+	TST_EXP_FAIL(tst_syscall(__NR_io_setup, 1, &ctx), EINVAL);
+	memset(&ctx, 0, sizeof(ctx));
+	TST_EXP_FAIL(tst_syscall(__NR_io_setup, -1, &ctx), EINVAL);

+	unsigned aio_max = 0;
 	if (!access("/proc/sys/fs/aio-max-nr", F_OK)) {
 		SAFE_FILE_SCANF("/proc/sys/fs/aio-max-nr", "%u", &aio_max);
-		verify_failure(aio_max + 1, &ctx, 0, EAGAIN);
+		TST_EXP_FAIL(tst_syscall(__NR_io_setup, aio_max + 1, &ctx), EAGAIN);
 	} else {
 		tst_res(TCONF, "the aio-max-nr file did not exist");
 	}
+
+	TST_EXP_PASS(tst_syscall(__NR_io_setup, 1, &ctx));
+	TST_EXP_PASS(tst_syscall(__NR_io_destroy, ctx));
 }

 static struct tst_test test = {
 	.test_all = verify_io_setup,
 };
-
-#else
-	TST_TEST_TCONF("test requires libaio and it's development packages");
-#endif
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
