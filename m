Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 551E3E14F6
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 11:00:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE4863C229E
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 11:00:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 33FE93C22A0
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 11:00:47 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id A522B600D61
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 11:00:45 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.68,220,1569254400"; d="scan'208";a="77359717"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Oct 2019 17:00:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 0ABBE4CE151F;
 Wed, 23 Oct 2019 16:52:52 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 23 Oct 2019 17:00:44 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 23 Oct 2019 17:00:29 +0800
Message-ID: <1571821231-3846-5-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 0ABBE4CE151F.A127B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/6] syscalls/quotactl02.c: Add Q_XGETQSTATV and
 Q_XQUOTARM test
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
Cc: jack@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Q_XGETQSTATV returns XFS filesystem-specific quota information in the fs_quota_statv
pointed to by addr. The qs_version field of the structure should be filled with
the version of the structure supported by the caller (for now, only FS_QSTAT_VERSION1
is supported).

Q_XQUOTARM free the disk space taken by disk quotas and quotas must have already been
turned off.

Also increase coverage to test group quota.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/lapi/quotactl.h                       |   8 +
 m4/ltp-quota.m4                               |   2 +
 .../kernel/syscalls/quotactl/quotactl02.c     | 200 +++++++++++++++---
 3 files changed, 182 insertions(+), 28 deletions(-)

diff --git a/include/lapi/quotactl.h b/include/lapi/quotactl.h
index 99f4e5fc5..f1e404256 100644
--- a/include/lapi/quotactl.h
+++ b/include/lapi/quotactl.h
@@ -10,6 +10,14 @@
 
 #include <linux/quota.h>
 
+# ifndef Q_XQUOTARM
+#  define Q_XQUOTARM XQM_CMD(6)
+# endif
+
+# ifndef Q_XGETQSTATV
+#  define Q_XGETQSTATV XQM_CMD(8)
+# endif
+
 # ifndef Q_XGETNEXTQUOTA
 #  define Q_XGETNEXTQUOTA XQM_CMD(9)
 # endif
diff --git a/m4/ltp-quota.m4 b/m4/ltp-quota.m4
index 964c34925..688c7c5f7 100644
--- a/m4/ltp-quota.m4
+++ b/m4/ltp-quota.m4
@@ -4,4 +4,6 @@ dnl Copyright (c) 2019 Fujitsu Ltd.
 
 AC_DEFUN([LTP_CHECK_SYSCALL_QUOTACTL],[
 AC_CHECK_TYPES([struct if_nextdqblk],,,[#include <linux/quota.h>])
+AC_CHECK_TYPES([struct fs_quota_statv],,,[#include <xfs/xqm.h>])
+
 ])
diff --git a/testcases/kernel/syscalls/quotactl/quotactl02.c b/testcases/kernel/syscalls/quotactl/quotactl02.c
index 021833411..da431a41d 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl02.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl02.c
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2013 Fujitsu Ltd.
+ * Copyright (c) 2016-2019 FUJITSU LIMITED. All rights reserved
  * Author: DAN LI <li.dan@cn.fujitsu.com>
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
  */
 
 /*
@@ -9,12 +10,32 @@
  *
  * Description:
  * This testcase checks basic flags of quotactl(2) for an XFS file system:
- * 1) quotactl(2) succeeds to turn off xfs quota and get xfs quota off status.
- * 2) quotactl(2) succeeds to turn on xfs quota and get xfs quota on status.
+ * 1) quotactl(2) succeeds to turn off xfs quota and get xfs quota off status
+ *    for user.
+ * 2) quotactl(2) succeeds to turn on xfs quota and get xfs quota on status
+ *    for user.
  * 3) quotactl(2) succeeds to set and use Q_XGETQUOTA to get xfs disk quota
- *    limits.
+ *    limits for user.
  * 4) quotactl(2) succeeds to set and use Q_XGETNEXTQUOTA to get xfs disk
- *    quota limits.
+ *    quota limits Cgreater than or equal to ID for user.
+ * 5) quotactl(2) succeeds to turn off xfs quota and get xfs quota off statv
+ *    for user.
+ * 6) quotactl(2) succeeds to turn on xfs quota and get xfs quota on statv
+ *    for user.
+ * 7) quotactl(2) succeeds to turn off xfs quota and get xfs quota off status
+ *    for group.
+ * 8) quotactl(2) succeeds to turn on xfs quota and get xfs quota on status
+ *    for group.
+ * 9) quotactl(2) succeeds to set and use Q_XGETQUOTA to get xfs disk quota
+ *    limits for group.
+ * 10) quotactl(2) succeeds to set and use Q_XGETNEXTQUOTA to get xfs disk
+ *    quota limits for group.
+ * 11) quotactl(2) succeeds to turn off xfs quota and get xfs quota off statv
+ *    for group.
+ * 12) quotactl(2) succeeds to turn on xfs quota and get xfs quota on statv
+ *    for group.
+ * 13)quotactl(2) succeeds to turn off xfs_quota and use Q_XQUOTARM to free
+ *    disk space taken by disk quotas.
  */
 #define _GNU_SOURCE
 #include <errno.h>
@@ -27,16 +48,25 @@
 
 #if defined(HAVE_XFS_XQM_H)
 #include <xfs/xqm.h>
-static void check_qoff(int, char *);
-static void check_qon(int, char *);
+static void check_qoff(int, char *, int);
+static void check_qon(int, char *, int);
+
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+static void check_qoffv(int, char *, int);
+static void check_qonv(int, char *, int);
+#endif
+
 static void check_qlim(int, char *);
+static void check_qrm(int, char *);
 
 static uint32_t test_id;
 static struct fs_disk_quota set_dquota = {
 	.d_rtb_softlimit = 1000,
 	.d_fieldmask = FS_DQ_RTBSOFT
 };
-static uint32_t qflag = XFS_QUOTA_UDQ_ENFD;
+static uint32_t qflagu = XFS_QUOTA_UDQ_ENFD;
+static uint32_t qflagg = XFS_QUOTA_GDQ_ENFD;
+static uint32_t qflag_acct = XFS_QUOTA_UDQ_ACCT | XFS_QUOTA_GDQ_ACCT;
 static const char mntpoint[] = "mnt_point";
 
 static struct t_case {
@@ -44,32 +74,78 @@ static struct t_case {
 	void *addr;
 	void (*func_check)();
 	int check_subcmd;
+	int flag;
 	char *des;
 } tcases[] = {
-	{QCMD(Q_XQUOTAOFF, USRQUOTA), &qflag, check_qoff, Q_XGETQSTAT,
-	"turn off xfs quota and get xfs quota off status"},
-	{QCMD(Q_XQUOTAON, USRQUOTA), &qflag, check_qon, Q_XGETQSTAT,
-	"turn on xfs quota and get xfs quota on status"},
-	{QCMD(Q_XSETQLIM, USRQUOTA), &set_dquota, check_qlim, Q_XGETQUOTA,
-	"Q_XGETQUOTA"},
-	{QCMD(Q_XSETQLIM, USRQUOTA), &set_dquota, check_qlim, Q_XGETNEXTQUOTA,
-	"Q_XGETNEXTQUOTA"},
+	{QCMD(Q_XQUOTAOFF, USRQUOTA), &qflagu, check_qoff,
+	QCMD(Q_XGETQSTAT, USRQUOTA), 1,
+	"turn off xfs quota and get xfs quota off status for user"},
+
+	{QCMD(Q_XQUOTAON, USRQUOTA), &qflagu, check_qon,
+	QCMD(Q_XGETQSTAT, USRQUOTA), 1,
+	"turn on xfs quota and get xfs quota on status for user"},
+
+	{QCMD(Q_XSETQLIM, USRQUOTA), &set_dquota, check_qlim,
+	QCMD(Q_XGETQUOTA, USRQUOTA), 0,
+	"Q_XGETQUOTA for user"},
+
+	{QCMD(Q_XSETQLIM, USRQUOTA), &set_dquota, check_qlim,
+	QCMD(Q_XGETNEXTQUOTA, USRQUOTA), 0,
+	"Q_XGETNEXTQUOTA for user"},
+
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+	{QCMD(Q_XQUOTAOFF, USRQUOTA), &qflagu, check_qoffv,
+	QCMD(Q_XGETQSTATV, USRQUOTA), 1,
+	"turn off xfs quota and get xfs quota off statv for user"},
+
+	{QCMD(Q_XQUOTAON, USRQUOTA), &qflagu, check_qonv,
+	QCMD(Q_XGETQSTATV, USRQUOTA), 1,
+	"turn on xfs quota and get xfs quota on statv for user"},
+#endif
+
+	{QCMD(Q_XQUOTAOFF, GRPQUOTA), &qflagg, check_qoff,
+	QCMD(Q_XGETQSTAT, GRPQUOTA), 1,
+	"turn off xfs quota and get xfs quota off status for group"},
+
+	{QCMD(Q_XQUOTAON, GRPQUOTA), &qflagg, check_qon,
+	QCMD(Q_XGETQSTAT, GRPQUOTA), 1,
+	"turn on xfs quota and get xfs quota on status for group"},
+
+	{QCMD(Q_XSETQLIM, GRPQUOTA), &set_dquota, check_qlim,
+	QCMD(Q_XGETQUOTA, GRPQUOTA), 0,
+	"Q_XGETQUOTA for group"},
+
+	{QCMD(Q_XSETQLIM, GRPQUOTA), &set_dquota, check_qlim,
+	QCMD(Q_XGETNEXTQUOTA, GRPQUOTA), 0,
+	"Q_XGETNEXTQUOTA for group"},
+
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+	{QCMD(Q_XQUOTAOFF, GRPQUOTA), &qflagg, check_qoffv,
+	QCMD(Q_XGETQSTATV, GRPQUOTA), 1,
+	"turn off xfs quota and get xfs quota off statv for group"},
+
+	{QCMD(Q_XQUOTAON, GRPQUOTA), &qflagg, check_qonv,
+	QCMD(Q_XGETQSTATV, GRPQUOTA), 1,
+	"turn on xfs quota and get xfs quota on statv for group"},
+#endif
+
+	{QCMD(Q_XQUOTAOFF, USRQUOTA), &qflag_acct, check_qrm, Q_XQUOTARM, 1,
+	"turn off xfs quota and free disk spaces taken by disk quotas"},
 };
 
-static void check_qoff(int subcmd, char *desp)
+static void check_qoff(int subcmd, char *desp, int flag)
 {
 	int res;
 	struct fs_quota_stat res_qstat;
 
-	res = quotactl(QCMD(subcmd, USRQUOTA), tst_device->dev,
-	               test_id, (void*) &res_qstat);
+	res = quotactl(subcmd, tst_device->dev, test_id, (void *) &res_qstat);
 	if (res == -1) {
 		tst_res(TFAIL | TERRNO,
 			"quotactl() failed to get xfs quota off status");
 		return;
 	}
 
-	if (res_qstat.qs_flags & XFS_QUOTA_UDQ_ENFD) {
+	if (res_qstat.qs_flags & flag) {
 		tst_res(TFAIL, "xfs quota enforcement was on unexpectedly");
 		return;
 	}
@@ -77,20 +153,43 @@ static void check_qoff(int subcmd, char *desp)
 	tst_res(TPASS, "quoactl() succeeded to %s", desp);
 }
 
-static void check_qon(int subcmd, char *desp)
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+static void check_qoffv(int subcmd, char *desp, int flag)
+{
+	int res;
+	struct fs_quota_statv res_qstatv = {
+		.qs_version = FS_QSTATV_VERSION1,
+	};
+
+	res = quotactl(subcmd, tst_device->dev, test_id, (void *) &res_qstatv);
+	if (res == -1) {
+		tst_res(TFAIL | TERRNO,
+			"quotactl() failed to get xfs quota off stav");
+		return;
+	}
+
+	if (res_qstatv.qs_flags & flag) {
+		tst_res(TFAIL, "xfs quota enforcement was on unexpectedly");
+		return;
+	}
+
+	tst_res(TPASS, "quoactl() succeeded to %s", desp);
+}
+#endif
+
+static void check_qon(int subcmd, char *desp, int flag)
 {
 	int res;
 	struct fs_quota_stat res_qstat;
 
-	res = quotactl(QCMD(subcmd, USRQUOTA), tst_device->dev,
-	               test_id, (void*) &res_qstat);
+	res = quotactl(subcmd, tst_device->dev, test_id, (void *) &res_qstat);
 	if (res == -1) {
 		tst_res(TFAIL | TERRNO,
 			"quotactl() failed to get xfs quota on status");
 		return;
 	}
 
-	if (!(res_qstat.qs_flags & XFS_QUOTA_UDQ_ENFD)) {
+	if (!(res_qstat.qs_flags & flag)) {
 		tst_res(TFAIL, "xfs quota enforcement was off unexpectedly");
 		return;
 	}
@@ -98,6 +197,30 @@ static void check_qon(int subcmd, char *desp)
 	tst_res(TPASS, "quoactl() succeeded to %s", desp);
 }
 
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+static void check_qonv(int subcmd, char *desp, int flag)
+{
+	int res;
+	struct fs_quota_statv res_qstatv = {
+		.qs_version = FS_QSTATV_VERSION1
+	};
+
+	res = quotactl(subcmd, tst_device->dev, test_id, (void *) &res_qstatv);
+	if (res == -1) {
+		tst_res(TFAIL | TERRNO,
+			"quotactl() failed to get xfs quota on statv");
+		return;
+	}
+
+	if (!(res_qstatv.qs_flags & flag)) {
+		tst_res(TFAIL, "xfs quota enforcement was off unexpectedly");
+		return;
+	}
+
+	tst_res(TPASS, "quoactl() succeeded to %s", desp);
+}
+#endif
+
 static void check_qlim(int subcmd, char *desp)
 {
 	int res;
@@ -105,8 +228,7 @@ static void check_qlim(int subcmd, char *desp)
 
 	res_dquota.d_rtb_softlimit = 0;
 
-	res = quotactl(QCMD(subcmd, USRQUOTA), tst_device->dev,
-	               test_id, (void*) &res_dquota);
+	res = quotactl(subcmd, tst_device->dev,	test_id, (void *) &res_dquota);
 	if (res == -1) {
 		if (errno == EINVAL) {
 			tst_brk(TCONF | TERRNO,
@@ -134,6 +256,25 @@ static void check_qlim(int subcmd, char *desp)
 		"quota limits", desp);
 }
 
+static void check_qrm(int subcmd, char *desp)
+{
+	int res;
+
+	res = quotactl(QCMD(subcmd, USRQUOTA), tst_device->dev,
+			test_id, (void *) &qflag_acct);
+	if (res == -1) {
+		if (errno == EINVAL) {
+			tst_brk(TCONF | TERRNO,
+				"Q_XQUOTARM wasn't supported in quotactl()");
+		}
+		tst_res(TFAIL | TERRNO,
+			"quotactl() failed to free disk spaces taken by disk quotas");
+		return;
+	}
+
+	tst_res(TPASS, "quoactl() succeeded to %s", desp);
+}
+
 static void setup(void)
 {
 	test_id = geteuid();
@@ -149,7 +290,10 @@ static void verify_quota(unsigned int n)
 		return;
 	}
 
-	tc->func_check(tc->check_subcmd, tc->des);
+	if (tc->flag)
+		tc->func_check(tc->check_subcmd, tc->des, *(int *)(tc->addr));
+	else
+		tc->func_check(tc->check_subcmd, tc->des);
 }
 
 static const char *kconfigs[] = {
@@ -166,7 +310,7 @@ static struct tst_test test = {
 	.mount_device = 1,
 	.dev_fs_type = "xfs",
 	.mntpoint = mntpoint,
-	.mnt_data = "usrquota",
+	.mnt_data = "usrquota,grpquota",
 	.setup = setup,
 };
 #else
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
