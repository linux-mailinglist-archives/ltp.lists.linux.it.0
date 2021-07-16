Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE303CB5EF
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:22:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBC643C65B8
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:22:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9B3F3C65A8
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:22:16 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 389F41001381
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:22:15 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GR6cg6PkRz7tf0
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 18:17:39 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 18:22:10 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 18:22:10 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 16 Jul 2021 18:22:57 +0800
Message-ID: <20210716102257.20882-6-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716102257.20882-1-xieziyao@huawei.com>
References: <20210628080424.245911-3-xieziyao@huawei.com>
 <20210716102257.20882-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5 v2] epoll_pwait: Add test for epoll_pwait03
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

Check that epoll_pwait/epoll_pwait2 timeout correctly.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Add test variants to switch between epoll_pwait and epoll_pwait2.

 runtest/syscalls                              |  1 +
 .../kernel/syscalls/epoll_pwait/.gitignore    |  1 +
 .../syscalls/epoll_pwait/epoll_pwait03.c      | 74 +++++++++++++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 testcases/kernel/syscalls/epoll_pwait/epoll_pwait03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index bed224809..1deb6118f 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -167,6 +167,7 @@ epoll_wait02 epoll_wait02
 epoll_wait03 epoll_wait03
 epoll_pwait01 epoll_pwait01
 epoll_pwait02 epoll_pwait02
+epoll_pwait03 epoll_pwait03

 eventfd01 eventfd01

diff --git a/testcases/kernel/syscalls/epoll_pwait/.gitignore b/testcases/kernel/syscalls/epoll_pwait/.gitignore
index ab049f173..1d16367e6 100644
--- a/testcases/kernel/syscalls/epoll_pwait/.gitignore
+++ b/testcases/kernel/syscalls/epoll_pwait/.gitignore
@@ -1,2 +1,3 @@
 epoll_pwait01
 epoll_pwait02
+epoll_pwait03
diff --git a/testcases/kernel/syscalls/epoll_pwait/epoll_pwait03.c b/testcases/kernel/syscalls/epoll_pwait/epoll_pwait03.c
new file mode 100644
index 000000000..ec3b9579d
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_pwait/epoll_pwait03.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Huawei Technologies Co., Ltd. 2021. All rights reserved.
+ * Author: Xie Ziyao <xieziyao@huawei.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Check that epoll_pwait and epoll_pwait2 timeout correctly.
+ */
+
+#include <sys/epoll.h>
+
+#include "tst_timer_test.h"
+#include "epoll_pwait_var.h"
+
+#define USEC_PER_MSEC (1000L)
+
+static int efd, sfd[2];
+static struct epoll_event e;
+
+int sample_fn(int clk_id, long long usec)
+{
+	unsigned int ms = usec / USEC_PER_MSEC;
+
+	tst_timer_start(clk_id);
+	TEST(do_epoll_pwait(efd, &e, 1, ms, NULL));
+	tst_timer_stop();
+	tst_timer_sample();
+
+	if (TST_RET != 0) {
+		tst_res(TFAIL | TTERRNO,
+			"do_epoll_pwait() returned %li, expected 0", TST_RET);
+		return 1;
+	}
+
+	return 0;
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
+	.scall = "do_epoll_pwait()",
+	.sample = sample_fn,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_variants = TEST_VARIANTS,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
