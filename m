Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C464E3E58B9
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 12:59:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 911753C70C6
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 12:59:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B9E833C5DC7
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 12:59:12 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2C0E41400196
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 12:59:10 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GkVLh3zNqzYn2M
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 18:58:52 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 10 Aug 2021 18:59:06 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 10 Aug 2021 18:59:06 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 10 Aug 2021 19:00:23 +0800
Message-ID: <20210810110024.106436-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810110024.106436-1-xieziyao@huawei.com>
References: <20210810110024.106436-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] epoll_pwait: Add invalid sigmask test for
 epoll_pwait04
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

Verify that, epoll_pwait() and epoll_pwait2() return -1 and set errno to
EFAULT with a sigmask points outside user's accessible address space.

Fixes: #792
Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/epoll_pwait/.gitignore    |  1 +
 .../syscalls/epoll_pwait/epoll_pwait04.c      | 61 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 testcases/kernel/syscalls/epoll_pwait/epoll_pwait04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 9af5aa5c0..206281f6e 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -168,6 +168,7 @@ epoll_wait03 epoll_wait03
 epoll_pwait01 epoll_pwait01
 epoll_pwait02 epoll_pwait02
 epoll_pwait03 epoll_pwait03
+epoll_pwait04 epoll_pwait04

 eventfd01 eventfd01

diff --git a/testcases/kernel/syscalls/epoll_pwait/.gitignore b/testcases/kernel/syscalls/epoll_pwait/.gitignore
index 1d16367e6..cdefffa2d 100644
--- a/testcases/kernel/syscalls/epoll_pwait/.gitignore
+++ b/testcases/kernel/syscalls/epoll_pwait/.gitignore
@@ -1,3 +1,4 @@
 epoll_pwait01
 epoll_pwait02
 epoll_pwait03
+epoll_pwait04
diff --git a/testcases/kernel/syscalls/epoll_pwait/epoll_pwait04.c b/testcases/kernel/syscalls/epoll_pwait/epoll_pwait04.c
new file mode 100644
index 000000000..2c855dab6
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_pwait/epoll_pwait04.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Huawei Technologies Co., Ltd. 2021. All rights reserved.
+ * Author: Xie Ziyao <xieziyao@huawei.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that, epoll_pwait() and epoll_pwait2() return -1 and set errno to
+ * EFAULT with a sigmask points outside user's accessible address space.
+ */
+
+#include <sys/epoll.h>
+
+#include "tst_test.h"
+#include "epoll_pwait_var.h"
+
+static int efd, sfd[2];
+static struct epoll_event e;
+
+static void run(void)
+{
+	TST_EXP_FAIL(do_epoll_pwait(efd, &e, 1, -1, tst_get_bad_addr(NULL)),
+		     EFAULT, "with an invalid sigmask pointer");
+}
+
+static void setup(void)
+{
+	epoll_pwait_info();
+
+	SAFE_SOCKETPAIR(AF_UNIX, SOCK_STREAM, 0, sfd);
+
+	efd = epoll_create(1);
+	if (efd == -1)
+		tst_brk(TBROK | TERRNO, "epoll_create()");
+
+	e.events = EPOLLIN;
+	if (epoll_ctl(efd, EPOLL_CTL_ADD, sfd[0], &e))
+		tst_brk(TBROK | TERRNO, "epoll_clt(..., EPOLL_CTL_ADD, ...)");
+	SAFE_WRITE(1, sfd[1], "w", 1);
+}
+
+static void cleanup(void)
+{
+	if (efd > 0)
+		SAFE_CLOSE(efd);
+
+	if (sfd[0] > 0)
+		SAFE_CLOSE(sfd[0]);
+
+	if (sfd[1] > 0)
+		SAFE_CLOSE(sfd[1]);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_variants = TEST_VARIANTS,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
