Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DBC3EE6E2
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:49:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 373823C5776
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:49:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 67BDA3C5774
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:53 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0EA2D10006D5
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:51 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GphST3xrGzYqVb
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 14:48:25 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:34 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:34 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Aug 2021 14:49:22 +0800
Message-ID: <20210817064924.127970-6-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210817064924.127970-1-xieziyao@huawei.com>
References: <20210817064924.127970-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 5/7] epoll_create1: Add test for epoll_create1_02
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

Verify that epoll_create1 returns -1 and set errno to EINVAL with an invalid
value specified in flags.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/epoll_create1/.gitignore  |  3 +-
 .../syscalls/epoll_create1/epoll_create1_02.c | 38 +++++++++++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/runtest/syscalls b/runtest/syscalls
index b28d19ac7..f6fe140b2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -157,6 +157,7 @@ dup3_01 dup3_01
 dup3_02 dup3_02

 epoll_create1_01 epoll_create1_01
+epoll_create1_02 epoll_create1_02
 epoll01 epoll-ltp
 epoll_ctl01 epoll_ctl01
 epoll_ctl02 epoll_ctl02
diff --git a/testcases/kernel/syscalls/epoll_create1/.gitignore b/testcases/kernel/syscalls/epoll_create1/.gitignore
index 7de2e4231..3e0482de9 100644
--- a/testcases/kernel/syscalls/epoll_create1/.gitignore
+++ b/testcases/kernel/syscalls/epoll_create1/.gitignore
@@ -1 +1,2 @@
-/epoll_create1_01
+epoll_create1_01
+epoll_create1_02
diff --git a/testcases/kernel/syscalls/epoll_create1/epoll_create1_02.c b/testcases/kernel/syscalls/epoll_create1/epoll_create1_02.c
index e69de29bb..2308a65d6 100644
--- a/testcases/kernel/syscalls/epoll_create1/epoll_create1_02.c
+++ b/testcases/kernel/syscalls/epoll_create1/epoll_create1_02.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Huawei Technologies Co., Ltd. 2021. All rights reserved.
+ * Author: Xie Ziyao <xieziyao@huawei.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that epoll_create1 returns -1 and set errno to EINVAL with an invalid
+ * value specified in flags.
+ */
+
+#include <sys/epoll.h>
+
+#include "tst_test.h"
+#include "lapi/epoll.h"
+#include "lapi/syscalls.h"
+
+static struct test_case_t {
+	int flags;
+	int exp_err;
+	const char *desc;
+} tc[] = {
+	{-1, EINVAL, "-1"},
+	{EPOLL_CLOEXEC + 1, EINVAL, "EPOLL_CLOEXEC+1"}
+};
+
+static void run(unsigned int n)
+{
+	TST_EXP_FAIL(tst_syscall(__NR_epoll_create1, tc[n].flags),
+		     tc[n].exp_err, "create(%s)", tc[n].desc);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.test = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
