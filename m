Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B0FDEB0E
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 13:37:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84C553C2695
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 13:37:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 07D373C258F
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 13:37:14 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id EB6031000A8B
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 13:37:12 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,323,1566835200"; d="scan'208";a="77276175"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Oct 2019 19:37:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id EE1C24B6EC6D
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 19:29:19 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 21 Oct 2019 19:37:06 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 21 Oct 2019 19:37:02 +0800
Message-ID: <1571657822-31421-5-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571657822-31421-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1571657822-31421-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: EE1C24B6EC6D.A31CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] syscalls/quotactl02.c: Add Q_XGETQSTATV test
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

This cmd returns XFS filesystem-specific quota information in the fs_quota_statv
pointed to by addr. The qs_version field of the structure should be filled with
the version of the structure supported by the caller (for now, only FS_QSTAT_VERSION1
is supported).

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/lapi/quotactl.h                       |  4 ++
 m4/ltp-quota.m4                               |  2 +
 .../kernel/syscalls/quotactl/quotactl02.c     | 69 ++++++++++++++++++-
 3 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/include/lapi/quotactl.h b/include/lapi/quotactl.h
index 99f4e5fc5..2a03c5b5a 100644
--- a/include/lapi/quotactl.h
+++ b/include/lapi/quotactl.h
@@ -10,6 +10,10 @@
 
 #include <linux/quota.h>
 
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
index 021833411..043ae0770 100644
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
@@ -15,6 +16,8 @@
  *    limits.
  * 4) quotactl(2) succeeds to set and use Q_XGETNEXTQUOTA to get xfs disk
  *    quota limits.
+ * 5) quotactl(2) succeeds to turn off xfs quota and get xfs quota off statv.
+ * 6) quotactl(2) succeeds to turn on xfs quota and get xfs quota on statv.
  */
 #define _GNU_SOURCE
 #include <errno.h>
@@ -29,6 +32,12 @@
 #include <xfs/xqm.h>
 static void check_qoff(int, char *);
 static void check_qon(int, char *);
+
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+static void check_qoffv(int, char *);
+static void check_qonv(int, char *);
+#endif
+
 static void check_qlim(int, char *);
 
 static uint32_t test_id;
@@ -54,6 +63,12 @@ static struct t_case {
 	"Q_XGETQUOTA"},
 	{QCMD(Q_XSETQLIM, USRQUOTA), &set_dquota, check_qlim, Q_XGETNEXTQUOTA,
 	"Q_XGETNEXTQUOTA"},
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+	{QCMD(Q_XQUOTAOFF, USRQUOTA), &qflag, check_qoffv, Q_XGETQSTATV,
+	"turn off xfs quota and get xfs quota off statv"},
+	{QCMD(Q_XQUOTAON, USRQUOTA), &qflag, check_qonv, Q_XGETQSTATV,
+	"turn on xfs quota and get xfs quota on statv"},
+#endif
 };
 
 static void check_qoff(int subcmd, char *desp)
@@ -62,7 +77,7 @@ static void check_qoff(int subcmd, char *desp)
 	struct fs_quota_stat res_qstat;
 
 	res = quotactl(QCMD(subcmd, USRQUOTA), tst_device->dev,
-	               test_id, (void*) &res_qstat);
+			test_id, (void *) &res_qstat);
 	if (res == -1) {
 		tst_res(TFAIL | TERRNO,
 			"quotactl() failed to get xfs quota off status");
@@ -77,6 +92,31 @@ static void check_qoff(int subcmd, char *desp)
 	tst_res(TPASS, "quoactl() succeeded to %s", desp);
 }
 
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+static void check_qoffv(int subcmd, char *desp)
+{
+	int res;
+	struct fs_quota_statv res_qstatv = {
+		.qs_version = FS_QSTATV_VERSION1,
+	};
+
+	res = quotactl(QCMD(subcmd, USRQUOTA), tst_device->dev,
+			test_id, (void *) &res_qstatv);
+	if (res == -1) {
+		tst_res(TFAIL | TERRNO,
+			"quotactl() failed to get xfs quota off stav");
+		return;
+	}
+
+	if (res_qstatv.qs_flags & XFS_QUOTA_UDQ_ENFD) {
+		tst_res(TFAIL, "xfs quota enforcement was on unexpectedly");
+		return;
+	}
+
+	tst_res(TPASS, "quoactl() succeeded to %s", desp);
+}
+#endif
+
 static void check_qon(int subcmd, char *desp)
 {
 	int res;
@@ -98,6 +138,31 @@ static void check_qon(int subcmd, char *desp)
 	tst_res(TPASS, "quoactl() succeeded to %s", desp);
 }
 
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+static void check_qonv(int subcmd, char *desp)
+{
+	int res;
+	struct fs_quota_statv res_qstatv = {
+		.qs_version = FS_QSTATV_VERSION1
+	};
+
+	res = quotactl(QCMD(subcmd, USRQUOTA), tst_device->dev,
+		test_id, (void *) &res_qstatv);
+	if (res == -1) {
+		tst_res(TFAIL | TERRNO,
+			"quotactl() failed to get xfs quota on statv");
+		return;
+	}
+
+	if (!(res_qstatv.qs_flags & XFS_QUOTA_UDQ_ENFD)) {
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
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
