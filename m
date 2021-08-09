Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5693E41B6
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 10:38:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 291AF3C7183
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 10:38:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4395F3C2244
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 10:37:57 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B3C836000E6
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 10:37:56 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GjqGC52kKz1CTvB;
 Mon,  9 Aug 2021 16:37:39 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 16:37:51 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 16:37:51 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 9 Aug 2021 16:39:03 +0800
Message-ID: <20210809083903.161596-5-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809083903.161596-1-xieziyao@huawei.com>
References: <20210809083903.161596-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] epoll_wait: Add test for epoll_wait04
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

Check that a timeout equal to zero causes epoll_wait() to return immediately.

Fixes: #792
Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/epoll_wait/.gitignore     |  7 +-
 .../kernel/syscalls/epoll_wait/epoll_wait04.c | 71 +++++++++++++++++++
 3 files changed, 76 insertions(+), 3 deletions(-)
 create mode 100644 testcases/kernel/syscalls/epoll_wait/epoll_wait04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 9af5aa5c0..57bf0477b 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -165,6 +165,7 @@ epoll_ctl02 epoll_ctl02
 epoll_wait01 epoll_wait01
 epoll_wait02 epoll_wait02
 epoll_wait03 epoll_wait03
+epoll_wait04 epoll_wait04
 epoll_pwait01 epoll_pwait01
 epoll_pwait02 epoll_pwait02
 epoll_pwait03 epoll_pwait03
diff --git a/testcases/kernel/syscalls/epoll_wait/.gitignore b/testcases/kernel/syscalls/epoll_wait/.gitignore
index 03b1be9a0..222955dd2 100644
--- a/testcases/kernel/syscalls/epoll_wait/.gitignore
+++ b/testcases/kernel/syscalls/epoll_wait/.gitignore
@@ -1,3 +1,4 @@
-/epoll_wait01
-/epoll_wait02
-/epoll_wait03
+epoll_wait01
+epoll_wait02
+epoll_wait03
+epoll_wait04
diff --git a/testcases/kernel/syscalls/epoll_wait/epoll_wait04.c b/testcases/kernel/syscalls/epoll_wait/epoll_wait04.c
new file mode 100644
index 000000000..dc62e9202
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_wait/epoll_wait04.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Huawei Technologies Co., Ltd. 2021. All rights reserved.
+ * Author: Xie Ziyao <xieziyao@huawei.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Check that a timeout equal to zero causes epoll_wait() to return immediately.
+ */
+
+#include <sys/epoll.h>
+
+#include "tst_test.h"
+#include "tst_timer_test.h"
+
+#define USEC_PRECISION 1000	/* Error margin allowed in usec */
+
+static int epfd, fds[2];
+static struct epoll_event epevs[1] = {
+	{.events = EPOLLIN}
+};
+
+static void run(void)
+{
+	tst_timer_start(CLOCK_MONOTONIC);
+	TEST(epoll_wait(epfd, epevs, 1, 0));
+	tst_timer_stop();
+
+	if (TST_RET != 0)
+		tst_res(TFAIL | TTERRNO, "epoll_wait() returned %li", TST_RET);
+
+	if (tst_timer_elapsed_us() <= USEC_PRECISION)
+		tst_res(TPASS, "epoll_wait() returns immediately with a timeout equal to zero");
+	else
+		tst_res(TFAIL, "epoll_wait() waited for %llius with a timeout equal to zero",
+			tst_timer_elapsed_us());
+}
+
+static void setup(void)
+{
+	SAFE_PIPE(fds);
+
+	epfd = epoll_create(1);
+	if (epfd == -1)
+		tst_brk(TBROK | TERRNO, "epoll_create()");
+
+	epevs[0].data.fd = fds[0];
+
+	if (epoll_ctl(epfd, EPOLL_CTL_ADD, fds[0], &epevs[0]))
+		tst_brk(TBROK | TERRNO, "epoll_clt(..., EPOLL_CTL_ADD, ...)");
+}
+
+static void cleanup(void)
+{
+	if (epfd > 0)
+		SAFE_CLOSE(epfd);
+
+	if (fds[0] > 0)
+		SAFE_CLOSE(fds[0]);
+
+	if (fds[1] > 0)
+		SAFE_CLOSE(fds[1]);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
