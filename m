Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA718E14FD
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 11:01:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E98C3C242E
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 11:01:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CB25C3C23FD
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 11:00:52 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 06BFC600D5C
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 11:00:50 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.68,220,1569254400"; d="scan'208";a="77359738"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Oct 2019 17:00:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 762A64CE1519;
 Wed, 23 Oct 2019 16:52:56 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 23 Oct 2019 17:00:48 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 23 Oct 2019 17:00:31 +0800
Message-ID: <1571821231-3846-7-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 762A64CE1519.ACBF9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 6/6] syscalls/quotactl05: add project quota test
 for xfs filesystem
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

This is a variant about quotactl02. It is used to test project quota.
I split it into a new case instead of adding it in quotaclt02 because
kernel doesn't permit mount both group and project quota before
commit d892d5864f02 ("xfs: Start using pquotaino from the superblock.").

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/quotactl/.gitignore |   1 +
 .../kernel/syscalls/quotactl/quotactl05.c     | 276 ++++++++++++++++++
 3 files changed, 278 insertions(+)
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl05.c

diff --git a/runtest/syscalls b/runtest/syscalls
index c30e9e620..f2c7b0daf 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -954,6 +954,7 @@ quotactl01 quotactl01
 quotactl02 quotactl02
 quotactl03 quotactl03
 quotactl04 quotactl04
+quotactl05 quotactl05
 
 read01 read01
 read02 read02
diff --git a/testcases/kernel/syscalls/quotactl/.gitignore b/testcases/kernel/syscalls/quotactl/.gitignore
index 1db7c5d98..6fe62fbf7 100644
--- a/testcases/kernel/syscalls/quotactl/.gitignore
+++ b/testcases/kernel/syscalls/quotactl/.gitignore
@@ -2,3 +2,4 @@
 /quotactl02
 /quotactl03
 /quotactl04
+/quotactl05
diff --git a/testcases/kernel/syscalls/quotactl/quotactl05.c b/testcases/kernel/syscalls/quotactl/quotactl05.c
new file mode 100644
index 000000000..7f62c3b8c
--- /dev/null
+++ b/testcases/kernel/syscalls/quotactl/quotactl05.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * Test Name: quotactl05
+ *
+ * Description:
+ * This testcase checks basic flags of quotactl(2) for project on an XFS file
+ * system:
+ * 1) quotactl(2) succeeds to turn off xfs quota and get xfs quota off status
+ *    for project
+ * 2) quotactl(2) succeeds to turn on xfs quota and get xfs quota on status
+ *    for project.
+ * 3) quotactl(2) succeeds to set and use Q_XGETQUOTA to get xfs disk quota
+ *    limits for project.
+ * 4) quotactl(2) succeeds to set and use Q_XGETNEXTQUOTA to get xfs disk
+ *    quota limits Cgreater than or equal to ID for project.
+ * 5) quotactl(2) succeeds to turn off xfs quota and get xfs quota off statv
+ *    for project.
+ * 6) quotactl(2) succeeds to turn on xfs quota and get xfs quota on statv
+ *    for project.
+ * 7)quotactl(2) succeeds to turn off xfs_quota and use Q_XQUOTARM to free
+ *    disk space taken by disk quotas.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <sys/quota.h>
+#include "config.h"
+#include "tst_test.h"
+#include "lapi/quotactl.h"
+
+#if defined(HAVE_XFS_XQM_H)
+#include <xfs/xqm.h>
+static void check_qoff(int, char *, int);
+static void check_qon(int, char *, int);
+
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+static void check_qoffv(int, char *, int);
+static void check_qonv(int, char *, int);
+#endif
+
+static void check_qlim(int, char *);
+static void check_qrm(int, char *);
+
+static uint32_t test_id;
+static struct fs_disk_quota set_dquota = {
+	.d_rtb_softlimit = 1000,
+	.d_fieldmask = FS_DQ_RTBSOFT
+};
+static uint32_t qflag = XFS_QUOTA_PDQ_ENFD;
+static uint32_t qflag_acct = XFS_QUOTA_PDQ_ACCT | XFS_QUOTA_UDQ_ACCT | XFS_QUOTA_GDQ_ACCT;
+static const char mntpoint[] = "mnt_point";
+
+static struct t_case {
+	int cmd;
+	void *addr;
+	void (*func_check)();
+	int check_subcmd;
+	int flag;
+	char *des;
+} tcases[] = {
+	{QCMD(Q_XQUOTAOFF, PRJQUOTA), &qflag, check_qoff, Q_XGETQSTAT, 1,
+	"turn off xfs quota and get xfs quota off status for project"},
+
+	{QCMD(Q_XQUOTAON, PRJQUOTA), &qflag, check_qon, Q_XGETQSTAT, 1,
+	"turn on xfs quota and get xfs quota on status for project"},
+
+	{QCMD(Q_XSETQLIM, PRJQUOTA), &set_dquota, check_qlim, Q_XGETQUOTA, 0,
+	"Q_XGETQUOTA for project"},
+
+	{QCMD(Q_XSETQLIM, PRJQUOTA), &set_dquota, check_qlim, Q_XGETNEXTQUOTA, 0,
+	"Q_XGETNEXTQUOTA for project"},
+
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+	{QCMD(Q_XQUOTAOFF, PRJQUOTA), &qflag, check_qoffv, Q_XGETQSTATV, 1,
+	"turn off xfs quota and get xfs quota off statv for project"},
+
+	{QCMD(Q_XQUOTAON, PRJQUOTA), &qflag, check_qonv, Q_XGETQSTATV, 1,
+	"turn on xfs quota and get xfs quota on statv for project"},
+#endif
+
+	{QCMD(Q_XQUOTAOFF, PRJQUOTA), &qflag_acct, check_qrm, Q_XQUOTARM, 1,
+	"turn off xfs quota and free disk spaces taken by disk quotas"},
+};
+
+static void check_qoff(int subcmd, char *desp, int flag)
+{
+	int res;
+	struct fs_quota_stat res_qstat;
+
+	res = quotactl(QCMD(subcmd, PRJQUOTA), tst_device->dev,
+			test_id, (void *) &res_qstat);
+	if (res == -1) {
+		tst_res(TFAIL | TERRNO,
+			"quotactl() failed to get xfs quota off status");
+		return;
+	}
+
+	if (res_qstat.qs_flags & flag) {
+		tst_res(TFAIL, "xfs quota enforcement was on unexpectedly");
+		return;
+	}
+
+	tst_res(TPASS, "quoactl() succeeded to %s", desp);
+}
+
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+static void check_qoffv(int subcmd, char *desp, int flag)
+{
+	int res;
+	struct fs_quota_statv res_qstatv = {
+		.qs_version = FS_QSTATV_VERSION1,
+	};
+
+	res = quotactl(QCMD(subcmd, PRJQUOTA), tst_device->dev,
+			test_id, (void *) &res_qstatv);
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
+{
+	int res;
+	struct fs_quota_stat res_qstat;
+
+	res = quotactl(QCMD(subcmd, PRJQUOTA), tst_device->dev,
+		test_id, (void *) &res_qstat);
+	if (res == -1) {
+		tst_res(TFAIL | TERRNO,
+			"quotactl() failed to get xfs quota on status");
+		return;
+	}
+
+	if (!(res_qstat.qs_flags & flag)) {
+		tst_res(TFAIL, "xfs quota enforcement was off unexpectedly");
+		return;
+	}
+
+	tst_res(TPASS, "quoactl() succeeded to %s", desp);
+}
+
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+static void check_qonv(int subcmd, char *desp, int flag)
+{
+	int res;
+	struct fs_quota_statv res_qstatv = {
+		.qs_version = FS_QSTATV_VERSION1
+	};
+
+	res = quotactl(QCMD(subcmd, PRJQUOTA), tst_device->dev,
+		test_id, (void *) &res_qstatv);
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
+static void check_qlim(int subcmd, char *desp)
+{
+	int res;
+	static struct fs_disk_quota res_dquota;
+
+	res_dquota.d_rtb_softlimit = 0;
+
+	res = quotactl(QCMD(subcmd, PRJQUOTA), tst_device->dev,
+			test_id, (void *) &res_dquota);
+	if (res == -1) {
+		if (errno == EINVAL) {
+			tst_brk(TCONF | TERRNO,
+				"%s wasn't supported in quotactl()", desp);
+		}
+		tst_res(TFAIL | TERRNO,
+			"quotactl() failed to get xfs disk quota limits");
+		return;
+	}
+
+	if (res_dquota.d_id != test_id) {
+		tst_res(TFAIL, "quotactl() got unexpected user id %u,"
+			" expected %u", res_dquota.d_id, test_id);
+		return;
+	}
+
+	if (res_dquota.d_rtb_hardlimit != set_dquota.d_rtb_hardlimit) {
+		tst_res(TFAIL, "quotactl() got unexpected rtb soft limit %llu,"
+			" expected %llu", res_dquota.d_rtb_hardlimit,
+			set_dquota.d_rtb_hardlimit);
+		return;
+	}
+
+	tst_res(TPASS, "quoactl() succeeded to set and use %s to get xfs disk "
+		"quota limits", desp);
+}
+
+static void check_qrm(int subcmd, char *desp)
+{
+	int res;
+
+	res = quotactl(QCMD(subcmd, PRJQUOTA), tst_device->dev,
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
+static void setup(void)
+{
+	test_id = geteuid();
+}
+
+static void verify_quota(unsigned int n)
+{
+	struct t_case *tc = &tcases[n];
+
+	TEST(quotactl(tc->cmd, tst_device->dev, test_id, tc->addr));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "quotactl() failed to %s", tc->des);
+		return;
+	}
+
+	if (tc->flag)
+		tc->func_check(tc->check_subcmd, tc->des, *(int *)(tc->addr));
+	else
+		tc->func_check(tc->check_subcmd, tc->des);
+}
+
+static const char *kconfigs[] = {
+	"CONFIG_XFS_QUOTA",
+	NULL
+};
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+	.needs_kconfigs = kconfigs,
+	.test = verify_quota,
+	.tcnt = ARRAY_SIZE(tcases),
+	.mount_device = 1,
+	.dev_fs_type = "xfs",
+	.mntpoint = mntpoint,
+	.mnt_data = "prjquota",
+	.setup = setup,
+};
+#else
+	TST_TEST_TCONF("This system didn't have <xfs/xqm.h>");
+#endif
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
