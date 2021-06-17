Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2C53AB1AD
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 12:55:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F64C3C889B
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 12:55:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6510D3C5A4E
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 12:55:17 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1324D600713
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 12:55:15 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G5Jly5tJtzZgPR
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 18:52:14 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 18:55:11 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 18:55:10 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 17 Jun 2021 18:55:55 +0800
Message-ID: <20210617105556.130869-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617105556.130869-1-xieziyao@huawei.com>
References: <20210617105556.130869-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3 v2] lib: tst_process_state: Add
 tst_process_exit_wait()
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

The tst_process_exit_wait() checks a given pid is present on the system.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Instead of checking /proc/$PID, do kill(2) with signal == 0 to check
for the existence of a $PID.

 include/tst_process_state.h | 12 ++++++++++--
 lib/tst_process_state.c     | 21 +++++++++++++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/include/tst_process_state.h b/include/tst_process_state.h
index 32eaf46d9..457ff6056 100644
--- a/include/tst_process_state.h
+++ b/include/tst_process_state.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later
  * Copyright (C) 2012-2014 Cyril Hrubis chrubis@suse.cz
+ * Copyright (C) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

 /*
@@ -12,6 +13,8 @@

 #include <unistd.h>

+#ifdef TST_TEST_H__
+
 /*
  * Waits for process state change.
  *
@@ -23,10 +26,14 @@
  * Z - zombie process
  * T - process is traced
  */
-#ifdef TST_TEST_H__
-
 #define TST_PROCESS_STATE_WAIT(pid, state, msec_timeout) \
 	tst_process_state_wait(__FILE__, __LINE__, NULL, (pid), (state), (msec_timeout))
+
+/*
+ * Check that a given pid is present on the system
+ */
+#define TST_PROCESS_EXIT_WAIT(pid, msec_timeout) \
+	tst_process_exit_wait((pid), (msec_timeout))
 #else
 /*
  * The same as above but does not use tst_brkm() interface.
@@ -44,5 +51,6 @@ int tst_process_state_wait2(pid_t pid, const char state);
 int tst_process_state_wait(const char *file, const int lineno,
 			   void (*cleanup_fn)(void), pid_t pid,
 			   const char state, unsigned int msec_timeout);
+int tst_process_exit_wait(pid_t pid, unsigned int msec_timeout);

 #endif /* TST_PROCESS_STATE__ */
diff --git a/lib/tst_process_state.c b/lib/tst_process_state.c
index 2f42895b7..08a9d0966 100644
--- a/lib/tst_process_state.c
+++ b/lib/tst_process_state.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2012-2014 Cyril Hrubis chrubis@suse.cz
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

 #include <stdio.h>
@@ -67,3 +68,23 @@ int tst_process_state_wait2(pid_t pid, const char state)
 		usleep(10000);
 	}
 }
+
+int tst_process_exit_wait(pid_t pid, unsigned int msec_timeout)
+{
+	unsigned int msecs = 0;
+
+	for (;;) {
+		if (kill(pid, 0) && errno == ESRCH)
+			break;
+
+		usleep(1000);
+		msecs += 1;
+
+		if (msec_timeout && msecs >= msec_timeout) {
+			errno = ETIMEDOUT;
+			return 0;
+		}
+	}
+
+	return 1;
+}
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
