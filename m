Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEF23A9651
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:36:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FA653C71AC
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:36:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D94D13C4CBE
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:36:16 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 813D8200CE9
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:36:15 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G4g3J34kszZf7Q
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 17:33:16 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 17:36:06 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 17:36:06 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 16 Jun 2021 17:36:04 +0800
Message-ID: <20210616093606.214856-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616093606.214856-1-xieziyao@huawei.com>
References: <20210616093606.214856-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] lib: tst_process_state: Add
 tst_process_release_wait()
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

The tst_process_release_wait() returns a value indicating if the
process is released with checking whether "/proc/%i" exists.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 include/tst_process_state.h | 41 +++++++++++++++++------------
 lib/tst_process_state.c     | 52 +++++++++++++++++++++----------------
 2 files changed, 54 insertions(+), 39 deletions(-)

diff --git a/include/tst_process_state.h b/include/tst_process_state.h
index c32aa58e6..8cc1a57fc 100644
--- a/include/tst_process_state.h
+++ b/include/tst_process_state.h
@@ -1,20 +1,21 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
  * Copyright (C) 2012-2014 Cyril Hrubis chrubis@suse.cz
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

- /*
-
-   These functions helps you wait till a process with given pid changes state.
-   This is for example useful when you need to wait in parent until child
-   blocks.
-
-  */
+/*
+ * These functions helps you wait till a process with given pid changes state.
+ * This is for example useful when you need to wait in parent until child blocks.
+ */

 #ifndef TST_PROCESS_STATE__
 #define TST_PROCESS_STATE__

 #include <unistd.h>

+#ifdef TST_TEST_H__
+
 /*
  * Waits for process state change.
  *
@@ -26,11 +27,16 @@
  * Z - zombie process
  * T - process is traced
  */
-#ifdef TST_TEST_H__
-
 #define TST_PROCESS_STATE_WAIT(pid, state, msec_timeout) \
 	tst_process_state_wait(__FILE__, __LINE__, NULL, \
-	                       (pid), (state), (msec_timeout))
+			       (pid), (state), (msec_timeout))
+
+/*
+ * Waits for process is released.
+ */
+#define TST_PROCESS_RELEASE_WAIT(pid, msec_timeout) \
+	tst_process_release_wait((pid), (msec_timeout))
+
 #else
 /*
  * The same as above but does not use tst_brkm() interface.
@@ -41,13 +47,16 @@
  */
 int tst_process_state_wait2(pid_t pid, const char state);

-# define TST_PROCESS_STATE_WAIT(cleanup_fn, pid, state) \
-	 tst_process_state_wait(__FILE__, __LINE__, (cleanup_fn), \
-	                        (pid), (state), 0)
+#define TST_PROCESS_STATE_WAIT(cleanup_fn, pid, state) \
+	tst_process_state_wait(__FILE__, __LINE__, (cleanup_fn), \
+			       (pid), (state), 0)
+
 #endif

 int tst_process_state_wait(const char *file, const int lineno,
-                            void (*cleanup_fn)(void), pid_t pid,
-			    const char state, unsigned int msec_timeout);
+			   void (*cleanup_fn)(void), pid_t pid,
+			   const char state, unsigned int msec_timeout);
+
+int tst_process_release_wait(pid_t pid, unsigned int msec_timeout);

 #endif /* TST_PROCESS_STATE__ */
diff --git a/lib/tst_process_state.c b/lib/tst_process_state.c
index 11790c947..849379e4a 100644
--- a/lib/tst_process_state.c
+++ b/lib/tst_process_state.c
@@ -1,24 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
 /*
  * Copyright (C) 2012-2014 Cyril Hrubis chrubis@suse.cz
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

 #include <stdio.h>
@@ -28,9 +12,8 @@
 #include "test.h"
 #include "tst_process_state.h"

-int tst_process_state_wait(const char *file, const int lineno,
-                            void (*cleanup_fn)(void), pid_t pid,
-			    const char state, unsigned int msec_timeout)
+int tst_process_state_wait(const char *file, const int lineno, void (*cleanup_fn)(void),
+			   pid_t pid, const char state, unsigned int msec_timeout)
 {
 	char proc_path[128], cur_state;
 	unsigned int msecs = 0;
@@ -39,7 +22,7 @@ int tst_process_state_wait(const char *file, const int lineno,

 	for (;;) {
 		safe_file_scanf(file, lineno, cleanup_fn, proc_path,
-		                "%*i %*s %c", &cur_state);
+				"%*i %*s %c", &cur_state);

 		if (state == cur_state)
 			break;
@@ -84,3 +67,26 @@ int tst_process_state_wait2(pid_t pid, const char state)
 		usleep(10000);
 	}
 }
+
+int tst_process_release_wait(pid_t pid, unsigned int msec_timeout)
+{
+	char proc_path[128];
+	unsigned int msecs = 0;
+
+	snprintf(proc_path, sizeof(proc_path), "/proc/%i", pid);
+
+	for (;;) {
+		if (access(proc_path, F_OK))
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
