Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B07E3AB1AC
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 12:55:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67EFA3C7183
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 12:55:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 514A03C4C05
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 12:55:17 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 103191400DA1
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 12:55:15 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G5Jly50DjzZgDg
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
Date: Thu, 17 Jun 2021 18:55:54 +0800
Message-ID: <20210617105556.130869-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617105556.130869-1-xieziyao@huawei.com>
References: <20210617105556.130869-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3 v2] lib: tst_process_state: Use SPDX and format
 alignment
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

Use SPDX and format alignment.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Move changes in license and whitespaces to a separate patch.

 include/tst_process_state.h | 23 +++++++++--------------
 lib/tst_process_state.c     | 31 +++++++------------------------
 2 files changed, 16 insertions(+), 38 deletions(-)

diff --git a/include/tst_process_state.h b/include/tst_process_state.h
index c32aa58e6..32eaf46d9 100644
--- a/include/tst_process_state.h
+++ b/include/tst_process_state.h
@@ -2,13 +2,10 @@
  * Copyright (C) 2012-2014 Cyril Hrubis chrubis@suse.cz
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
@@ -29,8 +26,7 @@
 #ifdef TST_TEST_H__

 #define TST_PROCESS_STATE_WAIT(pid, state, msec_timeout) \
-	tst_process_state_wait(__FILE__, __LINE__, NULL, \
-	                       (pid), (state), (msec_timeout))
+	tst_process_state_wait(__FILE__, __LINE__, NULL, (pid), (state), (msec_timeout))
 #else
 /*
  * The same as above but does not use tst_brkm() interface.
@@ -41,13 +37,12 @@
  */
 int tst_process_state_wait2(pid_t pid, const char state);

-# define TST_PROCESS_STATE_WAIT(cleanup_fn, pid, state) \
-	 tst_process_state_wait(__FILE__, __LINE__, (cleanup_fn), \
-	                        (pid), (state), 0)
+#define TST_PROCESS_STATE_WAIT(cleanup_fn, pid, state) \
+	tst_process_state_wait(__FILE__, __LINE__, (cleanup_fn), (pid), (state), 0)
 #endif

 int tst_process_state_wait(const char *file, const int lineno,
-                            void (*cleanup_fn)(void), pid_t pid,
-			    const char state, unsigned int msec_timeout);
+			   void (*cleanup_fn)(void), pid_t pid,
+			   const char state, unsigned int msec_timeout);

 #endif /* TST_PROCESS_STATE__ */
diff --git a/lib/tst_process_state.c b/lib/tst_process_state.c
index 11790c947..2f42895b7 100644
--- a/lib/tst_process_state.c
+++ b/lib/tst_process_state.c
@@ -1,24 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
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
  */

 #include <stdio.h>
@@ -29,8 +11,8 @@
 #include "tst_process_state.h"

 int tst_process_state_wait(const char *file, const int lineno,
-                            void (*cleanup_fn)(void), pid_t pid,
-			    const char state, unsigned int msec_timeout)
+			   void (*cleanup_fn)(void), pid_t pid,
+			   const char state, unsigned int msec_timeout)
 {
 	char proc_path[128], cur_state;
 	unsigned int msecs = 0;
@@ -39,7 +21,7 @@ int tst_process_state_wait(const char *file, const int lineno,

 	for (;;) {
 		safe_file_scanf(file, lineno, cleanup_fn, proc_path,
-		                "%*i %*s %c", &cur_state);
+				"%*i %*s %c", &cur_state);

 		if (state == cur_state)
 			break;
@@ -64,16 +46,17 @@ int tst_process_state_wait2(pid_t pid, const char state)

 	for (;;) {
 		FILE *f = fopen(proc_path, "r");
+
 		if (!f) {
 			fprintf(stderr, "Failed to open '%s': %s\n",
-			        proc_path, strerror(errno));
+				proc_path, strerror(errno));
 			return 1;
 		}

 		if (fscanf(f, "%*i %*s %c", &cur_state) != 1) {
 			fclose(f);
 			fprintf(stderr, "Failed to read '%s': %s\n",
-			        proc_path, strerror(errno));
+				proc_path, strerror(errno));
 			return 1;
 		}
 		fclose(f);
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
