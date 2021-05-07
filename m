Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEBC376215
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 10:33:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E40F33C566E
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 10:33:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 78AD33C55ED
 for <ltp@lists.linux.it>; Fri,  7 May 2021 10:33:11 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8B6D66010DA
 for <ltp@lists.linux.it>; Fri,  7 May 2021 10:33:10 +0200 (CEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fc3Yv1PlSzlcS7;
 Fri,  7 May 2021 16:30:59 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 7 May 2021 16:33:00 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 7 May 2021 16:33:19 +0800
Message-ID: <20210507083321.167998-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507083321.167998-1-xieziyao@huawei.com>
References: <20210507083321.167998-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] syscalls/io_destroy: Add io_destroy02 test for
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
Cc: rpalethorpe@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test io_destroy invoked via syscall(2) with an invalid ctx and expects
it to return EINVAL.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/io_destroy/.gitignore     |  1 +
 .../kernel/syscalls/io_destroy/io_destroy02.c | 32 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_destroy/io_destroy02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index aa7fa24dd..bd6ec6a2e 100644
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
index 000000000..357e61f10
--- /dev/null
+++ b/testcases/kernel/syscalls/io_destroy/io_destroy02.c
@@ -0,0 +1,32 @@
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
+static void verify_io_destroy(void)
+{
+	aio_context_t ctx;
+	memset(&ctx, 0xff, sizeof(ctx));
+	TST_EXP_FAIL(tst_syscall(__NR_io_destroy, ctx), EINVAL);
+}
+
+static struct tst_test test = {
+	.test_all = verify_io_destroy,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
