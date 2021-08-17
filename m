Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DE94D3EE6DF
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:49:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7295A3C5764
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:49:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 085B43C207C
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:40 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D09131000965
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:38 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GphNL2TB3zdbFL
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 14:44:50 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:34 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:33 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Aug 2021 14:49:20 +0800
Message-ID: <20210817064924.127970-4-xieziyao@huawei.com>
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
Subject: [LTP] [PATCH 3/7] epoll_ctl: Add test for epoll_ctl03
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

Check that epoll_ctl returns zero with different combinations of events on
success.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/epoll_ctl/.gitignore      |  5 +-
 .../kernel/syscalls/epoll_ctl/epoll_ctl03.c   | 75 +++++++++++++++++++
 3 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 7d308dcec..b28d19ac7 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -160,6 +160,7 @@ epoll_create1_01 epoll_create1_01
 epoll01 epoll-ltp
 epoll_ctl01 epoll_ctl01
 epoll_ctl02 epoll_ctl02
+epoll_ctl03 epoll_ctl03
 epoll_wait01 epoll_wait01
 epoll_wait02 epoll_wait02
 epoll_wait03 epoll_wait03
diff --git a/testcases/kernel/syscalls/epoll_ctl/.gitignore b/testcases/kernel/syscalls/epoll_ctl/.gitignore
index 634470a06..2b50d924c 100644
--- a/testcases/kernel/syscalls/epoll_ctl/.gitignore
+++ b/testcases/kernel/syscalls/epoll_ctl/.gitignore
@@ -1,2 +1,3 @@
-/epoll_ctl01
-/epoll_ctl02
+epoll_ctl01
+epoll_ctl02
+epoll_ctl03
diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c
new file mode 100644
index 000000000..f80bef93e
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Huawei Technologies Co., Ltd. 2021. All rights reserved.
+ * Author: Xie Ziyao <xieziyao@huawei.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Check that epoll_ctl returns zero with different combinations of events on
+ * success.
+ */
+
+#include <poll.h>
+#include <sys/epoll.h>
+
+#include "tst_test.h"
+
+#define WIDTH_EPOLL_EVENTS 256
+
+static int epfd, fds[2];
+static struct epoll_event events = {.events = EPOLLIN};
+
+static void run_all(void)
+{
+	unsigned int index, events_bitmap;
+
+	for (index = 0; index < WIDTH_EPOLL_EVENTS; index++) {
+		events_bitmap = ((EPOLLIN * ((index & 0x01) >> 0)) |
+				(EPOLLOUT * ((index & 0x02) >> 1)) |
+				(EPOLLPRI * ((index & 0x04) >> 2)) |
+				(EPOLLERR * ((index & 0x08) >> 3)) |
+				(EPOLLHUP * ((index & 0x10) >> 4)) |
+				(EPOLLET * ((index & 0x20) >> 5)) |
+				(EPOLLONESHOT * ((index & 0x40) >> 6)) |
+				(EPOLLRDHUP * ((index & 0x80) >> 7)));
+
+		events.events = events_bitmap;
+		TST_EXP_PASS(epoll_ctl(epfd, EPOLL_CTL_MOD, fds[0], &events),
+			     "epoll_ctl(..., EPOLL_CTL_MOD, ...) with events.events=%x",
+			     events.events);
+	}
+}
+
+static void setup(void)
+{
+	epfd = epoll_create(1);
+	if (epfd == -1)
+		tst_brk(TBROK | TERRNO, "fail to create epoll instance");
+
+	SAFE_PIPE(fds);
+	events.data.fd = fds[0];
+
+	if (epoll_ctl(epfd, EPOLL_CTL_ADD, fds[0], &events))
+		tst_brk(TBROK | TERRNO, "epoll_clt(..., EPOLL_CTL_ADD, ...)");
+}
+
+static void cleanup(void)
+{
+	if (epfd)
+		SAFE_CLOSE(epfd);
+
+	if (fds[0])
+		SAFE_CLOSE(fds[0]);
+
+	if (fds[1])
+		SAFE_CLOSE(fds[1]);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run_all,
+	.min_kver = "2.6.17",
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
