Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4C3CB5F4
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:23:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22B1C3C728F
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:23:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A68DC3C861D
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:22:24 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6F581201148
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:22:16 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GR6f33MtZzZmbX
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 18:18:51 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 18:22:10 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 18:22:10 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 16 Jul 2021 18:22:54 +0800
Message-ID: <20210716102257.20882-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716102257.20882-1-xieziyao@huawei.com>
References: <20210628080424.245911-3-xieziyao@huawei.com>
 <20210716102257.20882-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/5 v2] lapi: Add the prototype for epoll_pwait and
 epoll_pwait2
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

Add the prototype for epoll_pwait and epoll_pwait2 into include/lapi/epoll.h.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Add the prototype for epoll_pwait and epoll_pwait2 into include/lapi/epoll.h.

 configure.ac         |  1 +
 include/lapi/epoll.h | 37 ++++++++++++++++++++++++++++++++++---
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index 25c421de0..5bf3c52ec 100644
--- a/configure.ac
+++ b/configure.ac
@@ -86,6 +86,7 @@ AC_CHECK_FUNCS_ONCE([ \
     close_range \
     copy_file_range \
     epoll_pwait \
+    epoll_pwait2 \
     execveat \
     fallocate \
     fchownat \
diff --git a/include/lapi/epoll.h b/include/lapi/epoll.h
index 899eeb9d4..57f4b9d0f 100644
--- a/include/lapi/epoll.h
+++ b/include/lapi/epoll.h
@@ -1,13 +1,44 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * Copyright (c) 2016 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

 #ifndef LAPI_EPOLL_H__
 #define LAPI_EPOLL_H__

+#include "lapi/syscalls.h"
+#include "tst_timer_test.h"
+
 #ifndef EPOLL_CLOEXEC
-# define EPOLL_CLOEXEC 02000000
+#define EPOLL_CLOEXEC 02000000
+#endif
+
+#ifndef HAVE_EPOLL_PWAIT
+int epoll_pwait(int epfd, struct epoll_event *events, int maxevents,
+		int timeout, const sigset_t *sigmask)
+{
+	return tst_syscall(__NR_epoll_pwait, epfd, events, maxevents,
+			   timeout, sigmask, _NSIG / 8);
+}
+#endif
+
+#ifndef HAVE_EPOLL_PWAIT2
+int epoll_pwait2(int epfd, struct epoll_event *events, int maxevents,
+		 const struct timespec *timeout, const sigset_t *sigmask)
+{
+	if (timeout == NULL)
+		return tst_syscall(__NR_epoll_pwait2, epfd, events, maxevents,
+				   NULL, sigmask, _NSIG / 8);
+
+	struct __kernel_timespec ts;
+
+	ts.tv_sec = timeout->tv_sec;
+	ts.tv_nsec = timeout->tv_nsec;
+
+	return tst_syscall(__NR_epoll_pwait2, epfd, events, maxevents,
+			   &ts, sigmask, _NSIG / 8);
+}
 #endif

 #endif /* LAPI_EPOLL_H__ */
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
