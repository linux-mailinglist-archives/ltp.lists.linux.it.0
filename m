Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDDF6060D5
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Oct 2022 15:01:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B95A03CB1B9
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Oct 2022 15:01:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 547333CB17D
 for <ltp@lists.linux.it>; Thu, 20 Oct 2022 15:01:24 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 731D3601390
 for <ltp@lists.linux.it>; Thu, 20 Oct 2022 15:01:23 +0200 (CEST)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MtSMg47sLzJn3N
 for <ltp@lists.linux.it>; Thu, 20 Oct 2022 20:58:39 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 21:01:19 +0800
To: <ltp@lists.linux.it>
Date: Thu, 20 Oct 2022 20:57:47 +0800
Message-ID: <20221020125747.231509-3-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221020125747.231509-1-zhaogongyi@huawei.com>
References: <20221020125747.231509-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/nice07: new test for nice()
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
From: Zhao Gongyi via ltp <ltp@lists.linux.it>
Reply-To: Zhao Gongyi <zhaogongyi@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Verify that the errno is zero when callling of nice
legitimately return -1.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 runtest/syscalls                          |  1 +
 testcases/kernel/syscalls/nice/.gitignore |  1 +
 testcases/kernel/syscalls/nice/nice07.c   | 46 +++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 testcases/kernel/syscalls/nice/nice07.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 557c946ec..7a425439a 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -903,6 +903,7 @@ nice03 nice03
 nice04 nice04
 nice05 nice05
 nice06 nice06
+nice07 nice07

 open01 open01
 open01A symlink01 -T open01
diff --git a/testcases/kernel/syscalls/nice/.gitignore b/testcases/kernel/syscalls/nice/.gitignore
index c96064cdf..a92595f2a 100644
--- a/testcases/kernel/syscalls/nice/.gitignore
+++ b/testcases/kernel/syscalls/nice/.gitignore
@@ -4,3 +4,4 @@
 /nice04
 /nice05
 /nice06
+/nice07
diff --git a/testcases/kernel/syscalls/nice/nice07.c b/testcases/kernel/syscalls/nice/nice07.c
new file mode 100644
index 000000000..8d098de60
--- /dev/null
+++ b/testcases/kernel/syscalls/nice/nice07.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright(c) 2022 Huawei Technologies Co., Ltd
+ * Author: Zhao Gongyi <zhaogongyi@huawei.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that the errno is zero when callling of nice
+ * legitimately return -1.
+ */
+#include <unistd.h>
+#include "tst_test.h"
+
+static void verify_nice(void)
+{
+	int orig_nice;
+	int niceinc;
+
+	orig_nice = SAFE_GETPRIORITY(PRIO_PROCESS, 0);
+	niceinc = -1 - orig_nice;
+
+	TEST(nice(niceinc));
+	if (TST_RET != -1) {
+		tst_res(TFAIL | TTERRNO,
+				"nice(%d) returned %ld", niceinc, TST_RET);
+		return;
+	}
+
+	if (TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "nice(%d) failed", niceinc);
+		return;
+	}
+
+	tst_res(TPASS, "nice(%d) passed", niceinc);
+
+	TEST(nice(-niceinc));
+	if (TST_ERR)
+		tst_brk(TBROK | TTERRNO, "nice(%d) failed", -niceinc);
+}
+
+static struct tst_test test = {
+	.test_all = verify_nice,
+	.needs_root = 1,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
