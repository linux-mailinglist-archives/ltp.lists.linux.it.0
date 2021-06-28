Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 782AC3B5A32
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 10:03:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48F973C6E17
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 10:03:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 297E03C0E61
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 10:03:37 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8E96260077A
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 10:03:35 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GD0QL6wsWz75FZ
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 16:00:10 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 16:03:30 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 16:03:30 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 28 Jun 2021 16:04:24 +0800
Message-ID: <20210628080424.245911-4-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210628080424.245911-1-xieziyao@huawei.com>
References: <20210628080424.245911-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] epoll_pwait2: Add test for epoll_pwait202
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

Check that epoll_pwait2 timeouts correctly.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/epoll_pwait2/.gitignore   |  1 +
 .../syscalls/epoll_pwait2/epoll_pwait202.c    | 76 +++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 testcases/kernel/syscalls/epoll_pwait2/epoll_pwait202.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 8a6b8ba20..f63e57fee 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -167,6 +167,7 @@ epoll_wait02 epoll_wait02
 epoll_wait03 epoll_wait03
 epoll_pwait01 epoll_pwait01
 epoll_pwait201 epoll_pwait201
+epoll_pwait202 epoll_pwait202

 eventfd01 eventfd01

diff --git a/testcases/kernel/syscalls/epoll_pwait2/.gitignore b/testcases/kernel/syscalls/epoll_pwait2/.gitignore
index 2298cf9d9..8b2c314ea 100644
--- a/testcases/kernel/syscalls/epoll_pwait2/.gitignore
+++ b/testcases/kernel/syscalls/epoll_pwait2/.gitignore
@@ -1 +1,2 @@
 epoll_pwait201
+epoll_pwait202
diff --git a/testcases/kernel/syscalls/epoll_pwait2/epoll_pwait202.c b/testcases/kernel/syscalls/epoll_pwait2/epoll_pwait202.c
new file mode 100644
index 000000000..2b0d5dd5b
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_pwait2/epoll_pwait202.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 HUAWEI LIMITED
+ * Author: Xie Ziyao <xieziyao@huawei.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Check that epoll_pwait2 timeouts correctly.
+ */
+
+#include <sys/epoll.h>
+
+#include "tst_timer_test.h"
+#include "lapi/epoll.h"
+
+static int efd, sfd[2];
+static struct epoll_event e;
+static struct __kernel_timespec ts;
+
+int sample_fn(int clk_id, long long usec)
+{
+	if (usec >= 1000000) {
+		ts.tv_sec = usec / 1000000;
+		ts.tv_nsec = 0;
+	} else {
+		ts.tv_sec = 0;
+		ts.tv_nsec = usec * 1000;
+	}
+
+	tst_timer_start(clk_id);
+	TEST(tst_syscall(__NR_epoll_pwait2, efd, &e, 1, &ts, NULL, 0));
+	tst_timer_stop();
+	tst_timer_sample();
+
+	if (TST_RET != 0) {
+		tst_res(TFAIL | TTERRNO,
+			"epoll_pwait2() returned %li, expected 0", TST_RET);
+		return 1;
+	}
+
+	return 0;
+}
+
+static void setup(void)
+{
+	SAFE_SOCKETPAIR(AF_UNIX, SOCK_STREAM, 0, sfd);
+
+	efd = epoll_create(1);
+	if (efd == -1)
+		tst_brk(TBROK | TERRNO, "epoll_create()");
+
+	e.events = EPOLLIN;
+	if (epoll_ctl(efd, EPOLL_CTL_ADD, sfd[0], &e))
+		tst_brk(TBROK | TERRNO, "epoll_clt(..., EPOLL_CTL_ADD, ...)");
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
+	.scall = "epoll_pwait2()",
+	.sample = sample_fn,
+	.setup = setup,
+	.cleanup = cleanup,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
