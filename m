Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9DB36E9CE
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 13:50:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFBFE3C61D1
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 13:50:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E738A3C618E
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 13:50:19 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F0AE91A014E1
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 13:50:17 +0200 (CEST)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FWDHs6b2CzlW1N
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 19:47:05 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 29 Apr 2021 19:50:05 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 29 Apr 2021 19:50:19 +0800
Message-ID: <20210429115021.24128-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429115021.24128-1-xieziyao@huawei.com>
References: <20210429115021.24128-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] syscalls/io_destroy: Convert libaio wrapper
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
 .../kernel/syscalls/io_destroy/io_destroy01.c | 49 +++++--------------
 1 file changed, 12 insertions(+), 37 deletions(-)

diff --git a/testcases/kernel/syscalls/io_destroy/io_destroy01.c b/testcases/kernel/syscalls/io_destroy/io_destroy01.c
index bb89f61f5..6f14bb8e6 100644
--- a/testcases/kernel/syscalls/io_destroy/io_destroy01.c
+++ b/testcases/kernel/syscalls/io_destroy/io_destroy01.c
@@ -1,55 +1,30 @@
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
- * io_destroy(2) fails and returns -EINVAL if ctx is invalid.
+ * Call io_destroy with an invalid ctx and expects it to return EINVAL.
  */

-#include <errno.h>
-#include <string.h>
+#include <linux/aio_abi.h>
+
 #include "config.h"
 #include "tst_test.h"
-
-#ifdef HAVE_LIBAIO
-#include <libaio.h>
+#include "lapi/syscalls.h"

 static void verify_io_destroy(void)
 {
-	io_context_t ctx;
-
+	aio_context_t ctx;
 	memset(&ctx, 0xff, sizeof(ctx));
-	TEST(io_destroy(ctx));
-
-	if (TST_RET == 0) {
-		tst_res(TFAIL, "io_destroy() succeeded unexpectedly");
-		return;
-	}
-
-	if (TST_RET == -ENOSYS) {
-		tst_res(TCONF, "io_destroy() not supported");
-		return;
-	}
-
-	if (TST_RET == -EINVAL) {
-		tst_res(TPASS, "io_destroy() failed as expected, returned -EINVAL");
-		return;
-	}
-
-	tst_res(TFAIL, "io_destroy() failed unexpectedly, returned -%s expected -EINVAL",
-		tst_strerrno(-TST_RET));
+	TST_EXP_FAIL(tst_syscall(__NR_io_destroy, ctx), EINVAL);
 }

 static struct tst_test test = {
 	.test_all = verify_io_destroy,
 };
-
-#else
-	TST_TEST_TCONF("test requires libaio and it's development packages");
-#endif
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
