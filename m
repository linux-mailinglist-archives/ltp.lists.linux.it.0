Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2709BEC34D
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 13:56:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE8A93C23ED
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 13:56:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 81E013C23FF
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 13:55:53 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C80811000A28
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 13:55:47 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208";a="77795790"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 20:55:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id D09294CE1508;
 Fri,  1 Nov 2019 20:47:38 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 1 Nov 2019 20:55:39 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <pvorel@suse.cz>
Date: Fri, 1 Nov 2019 20:55:55 +0800
Message-ID: <1572612959-20577-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20191031152646.GA7078@dell5510>
 <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: D09294CE1508.AD442
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/5] syscalls/quotactl01.c: Add Q_GETNEXQUOTA test
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Q_GETNEXTQUOTA was introduced since linux 4.6, this operation is the
same as Q_GETQUOTA, but it returns quota information for the next ID
greater than or equal to id that has a quota set.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 configure.ac                                  |  1 +
 include/lapi/quotactl.h                       | 26 +++++----
 m4/ltp-quota.m4                               |  7 +++
 .../kernel/syscalls/quotactl/quotactl01.c     | 53 ++++++++++++++-----
 4 files changed, 61 insertions(+), 26 deletions(-)
 create mode 100644 m4/ltp-quota.m4

diff --git a/configure.ac b/configure.ac
index 62c5a0bb4..31999cd7a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -248,6 +248,7 @@ AC_DEFINE_UNQUOTED(NUMA_ERROR_MSG, ["$numa_error_msg"], [Error message when no N
 
 
 LTP_CHECK_SYSCALL_PERF_EVENT_OPEN
+LTP_CHECK_SYSCALL_QUOTACTL
 LTP_CHECK_SYSCALL_SIGNALFD
 LTP_CHECK_SYSCALL_UTIMENSAT
 LTP_CHECK_TASKSTATS
diff --git a/include/lapi/quotactl.h b/include/lapi/quotactl.h
index 729472f69..afce865bc 100644
--- a/include/lapi/quotactl.h
+++ b/include/lapi/quotactl.h
@@ -1,26 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2017 Fujitsu Ltd.
+ * Copyright (c) 2017-2019 Fujitsu Ltd.
  * Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
- *
- * This program is free software: you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation, either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
  */
 
 #ifndef LAPI_QUOTACTL_H__
 # define LAPI_QUOTACTL_H__
 
+#ifdef HAVE_STRUCT_IF_NEXTDQBLK
+# include <linux/quota.h>
+#endif
+#include <sys/quota.h>
+
 # ifndef Q_XGETNEXTQUOTA
 #  define Q_XGETNEXTQUOTA XQM_CMD(9)
 # endif
 
+# ifndef Q_GETNEXTQUOTA
+#  define Q_GETNEXTQUOTA 0x800009 /* get disk limits and usage >= ID */
+# endif
+
 #endif /* LAPI_QUOTACTL_H__ */
diff --git a/m4/ltp-quota.m4 b/m4/ltp-quota.m4
new file mode 100644
index 000000000..e8d08c6b7
--- /dev/null
+++ b/m4/ltp-quota.m4
@@ -0,0 +1,7 @@
+dnl SPDX-License-Identifier: GPL-2.0-or-later
+dnl Copyright (c) 2019 Fujitsu Ltd.
+dnl Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+
+AC_DEFUN([LTP_CHECK_SYSCALL_QUOTACTL],[
+AC_CHECK_TYPES([struct if_nextdqblk],,,[#include <linux/quota.h>])
+])
diff --git a/testcases/kernel/syscalls/quotactl/quotactl01.c b/testcases/kernel/syscalls/quotactl/quotactl01.c
index 2f563515d..7dda58417 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl01.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
 * Copyright (c) Crackerjack Project., 2007
-* Copyright (c) 2016 Fujitsu Ltd.
+* Copyright (c) 2016-2019 FUJITSU LIMITED. All rights reserved
 * Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
 *
 * This testcase checks the basic flag of quotactl(2) for non-XFS filesystems:
@@ -16,19 +16,23 @@
 *    flag for user.
 * 6) quotactl(2) succeeds to get quota format with Q_GETFMT flag for user.
 * 7) quotactl(2) succeeds to update quota usages with Q_SYNC flag for user.
-* 8) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for user.
-* 9) quotactl(2) succeeds to turn on quota with Q_QUOTAON flag for group.
-* 10) quotactl(2) succeeds to set disk quota limits with Q_SETQUOTA flag
+* 8) quotactl(2) succeeds to get disk quota limit greater than or equal to
+*    ID with Q_GETNEXTSTAT flag for user.
+* 9) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for user.
+* 10) quotactl(2) succeeds to turn on quota with Q_QUOTAON flag for group.
+* 11) quotactl(2) succeeds to set disk quota limits with Q_SETQUOTA flag
 *     for group.
-* 11) quotactl(2) succeeds to get disk quota limits with Q_GETQUOTA flag
+* 12) quotactl(2) succeeds to get disk quota limits with Q_GETQUOTA flag
 *     for group.
-* 12) quotactl(2) succeeds to set information about quotafile with Q_SETINFO
+* 13) quotactl(2) succeeds to set information about quotafile with Q_SETINFO
 *     flag for group.
-* 13) quotactl(2) succeeds to get information about quotafile with Q_GETINFO
+* 14) quotactl(2) succeeds to get information about quotafile with Q_GETINFO
 *     flag for group.
-* 14) quotactl(2) succeeds to get quota format with Q_GETFMT flag for group.
-* 15) quotactl(2) succeeds to update quota usages with Q_SYNC flag for group.
-* 16) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for group.
+* 15) quotactl(2) succeeds to get quota format with Q_GETFMT flag for group.
+* 16) quotactl(2) succeeds to update quota usages with Q_SYNC flag for group.
+* 17) quotactl(2) succeeds to get disk quota limit greater than or equal to
+*     ID with Q_GETNEXTSTAT flag for group.
+* 18) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for group.
 */
 
 #include "config.h"
@@ -36,11 +40,13 @@
 #include <string.h>
 #include <unistd.h>
 #include <stdio.h>
-#include <sys/quota.h>
+#include "lapi/quotactl.h"
 
 #include "tst_test.h"
 
-#define QFMT_VFS_V0	2
+#ifndef QFMT_VFS_V0
+# define QFMT_VFS_V0	2
+#endif
 #define USRPATH MNTPOINT "/aquota.user"
 #define GRPPATH MNTPOINT "/aquota.group"
 #define FMTID	QFMT_VFS_V0
@@ -61,6 +67,10 @@ static struct dqinfo set_qf = {
 static struct dqinfo res_qf;
 static int32_t fmt_buf;
 
+#if defined(HAVE_STRUCT_IF_NEXTDQBLK)
+static struct if_nextdqblk res_ndq;
+#endif
+
 static struct tcase {
 	int cmd;
 	int *id;
@@ -94,6 +104,12 @@ static struct tcase {
 	{QCMD(Q_SYNC, USRQUOTA), &test_id, &res_dq,
 	NULL, NULL, 0, "update quota usages for user"},
 
+#if defined(HAVE_STRUCT_IF_NEXTDQBLK)
+	{QCMD(Q_GETNEXTQUOTA, USRQUOTA), &test_id, &res_ndq,
+	&test_id, &res_ndq.dqb_id, sizeof(res_ndq.dqb_id),
+	"get next disk quota limit for user"},
+#endif
+
 	{QCMD(Q_QUOTAOFF, USRQUOTA), &test_id, USRPATH,
 	NULL, NULL, 0, "turn off quota for user"},
 
@@ -120,6 +136,12 @@ static struct tcase {
 	{QCMD(Q_SYNC, GRPQUOTA), &test_id, &res_dq,
 	NULL, NULL, 0, "update quota usages for group"},
 
+#if defined(HAVE_STRUCT_IF_NEXTDQBLK)
+	{QCMD(Q_GETNEXTQUOTA, GRPQUOTA), &test_id, &res_ndq,
+	&test_id, &res_ndq.dqb_id, sizeof(res_ndq.dqb_id),
+	"get next disk quota limit for group"},
+#endif
+
 	{QCMD(Q_QUOTAOFF, GRPQUOTA), &test_id, GRPPATH,
 	NULL, NULL, 0, "turn off quota for group"}
 };
@@ -155,8 +177,15 @@ static void verify_quota(unsigned int n)
 	res_dq.dqb_bsoftlimit = 0;
 	res_qf.dqi_igrace = 0;
 	fmt_buf = 0;
+#if defined(HAVE_STRUCT_IF_NEXTDQBLK)
+	res_ndq.dqb_id = -1;
+#endif
 
 	TEST(quotactl(tc->cmd, tst_device->dev, *tc->id, tc->addr));
+	if (TST_ERR == EINVAL) {
+		tst_res(TCONF, "Current system doesn't support this cmd");
+		return;
+	}
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "quotactl failed to %s", tc->des);
 		return;
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
