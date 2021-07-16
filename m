Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FD83CB5EE
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:22:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1994B3C736D
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:22:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B47C93C65B8
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:22:16 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A4A931A016F8
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:22:14 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GR6bK6t7RzYd16
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 18:16:29 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 18:22:10 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 18:22:10 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 16 Jul 2021 18:22:55 +0800
Message-ID: <20210716102257.20882-4-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716102257.20882-1-xieziyao@huawei.com>
References: <20210628080424.245911-3-xieziyao@huawei.com>
 <20210716102257.20882-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 3/5 v2] epoll_pwait: Add test variants for epoll_pwait
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

Add test variants to switch between different syscall variants/wrappers at runtime.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Add test variants to switch between epoll_pwait and epoll_pwait2.

 .../syscalls/epoll_pwait/epoll_pwait_var.h    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 testcases/kernel/syscalls/epoll_pwait/epoll_pwait_var.h

diff --git a/testcases/kernel/syscalls/epoll_pwait/epoll_pwait_var.h b/testcases/kernel/syscalls/epoll_pwait/epoll_pwait_var.h
new file mode 100644
index 000000000..2bdea17e9
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_pwait/epoll_pwait_var.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) Huawei Technologies Co., Ltd. 2021. All rights reserved.
+ * Author: Xie Ziyao <xieziyao@huawei.com>
+ */
+
+#ifndef LTP_EPOLL_PWAIT_VAR_H
+#define LTP_EPOLL_PWAIT_VAR_H
+
+#include "lapi/epoll.h"
+
+#define TEST_VARIANTS 2
+#define MSEC_PER_SEC (1000L)
+#define NSEC_PER_MSEC (1000000L)
+
+static int do_epoll_pwait(int epfd, struct epoll_event *events, int
+	maxevents, int timeout, const sigset_t *sigmask)
+{
+	if (tst_variant == 0)
+		return epoll_pwait(epfd, events, maxevents, timeout, sigmask);
+
+	struct timespec ts;
+
+	if (timeout < 0) {
+		return epoll_pwait2(epfd, events, maxevents, NULL, sigmask);
+	} else {
+		ts.tv_sec = timeout / MSEC_PER_SEC;
+		ts.tv_nsec = NSEC_PER_MSEC * (timeout % MSEC_PER_SEC);
+	}
+
+	return epoll_pwait2(epfd, events, maxevents, &ts, sigmask);
+
+}
+
+static void epoll_pwait_info(void)
+{
+	if (tst_variant == 0)
+		tst_res(TINFO, "Test epoll_pwait()");
+	else
+		tst_res(TINFO, "Test epoll_pwait2()");
+}
+
+#endif //LTP_EPOLL_PWAIT_VAR_H
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
