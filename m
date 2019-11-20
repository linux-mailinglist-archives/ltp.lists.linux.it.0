Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D134B103673
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 10:14:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 914BE3C203D
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 10:14:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 22EC23C2022
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 10:14:00 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 8EB361400200
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 10:13:57 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,221,1571673600"; d="scan'208";a="78787342"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 17:13:53 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 0EEC24CE1BEC
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 17:05:37 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 20 Nov 2019 17:13:53 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 20 Nov 2019 17:13:36 +0800
Message-ID: <1574241216-15168-6-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 0EEC24CE1BEC.AF4D8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 5/5] syscalls/quotactl06: Add new error testcase
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/quotactl/.gitignore |   1 +
 .../kernel/syscalls/quotactl/quotactl06.c     | 196 ++++++++++++++++++
 3 files changed, 198 insertions(+)
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl06.c

diff --git a/runtest/syscalls b/runtest/syscalls
index b6bf67c38..9bbde8c41 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -956,6 +956,7 @@ quotactl02 quotactl02
 quotactl03 quotactl03
 quotactl04 quotactl04
 quotactl05 quotactl05
+quotactl06 quotactl06
 
 read01 read01
 read02 read02
diff --git a/testcases/kernel/syscalls/quotactl/.gitignore b/testcases/kernel/syscalls/quotactl/.gitignore
index 6fe62fbf7..12896d6ad 100644
--- a/testcases/kernel/syscalls/quotactl/.gitignore
+++ b/testcases/kernel/syscalls/quotactl/.gitignore
@@ -3,3 +3,4 @@
 /quotactl03
 /quotactl04
 /quotactl05
+/quotactl06
diff --git a/testcases/kernel/syscalls/quotactl/quotactl06.c b/testcases/kernel/syscalls/quotactl/quotactl06.c
new file mode 100644
index 000000000..0d7efe38b
--- /dev/null
+++ b/testcases/kernel/syscalls/quotactl/quotactl06.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * Tests basic error handling of the quotactl syscall.
+ * Description:
+ * 1) quotactl fails with EACCES when cmd is Q_QUOTAON and addr
+ * existed but not a regular file.
+ * 2) quotaclt fails with ENOENT when the file specified by special
+ * or addr does not exist.
+ * 3) quotactl fails with EBUSTY when  cmd is Q_QUOTAON and another
+ * Q_QUOTAON had already been performed.
+ * 4) quotactl fails with EFAULT when addr or special is invalid.
+ * 5) quotactl fails with EINVAL when cmd or type is invalid.
+ * 6) quotactl fails with ENOTBLK when special is not a block device.
+ * 7) quotactl fails with ESRCH when no disk quota is found for the
+ * indicated user and quotas have not been turned on for this fs.
+ * 8) quotactl fails with ESRCH when cmd is Q_QUOTAON, but the quota
+ * format was not found.
+ * 9) quotactl fails with ESRCH when cmd is Q_GETNEXTQUOTA, but there
+ * is no ID greater than or equal to id that has an active quota.
+ * 10) quotactl fails with ERANGE when cmd is Q_SETQUOTA, but the
+ * specified limits are out of the range allowed by the quota format.
+ * 11) quotactl fails with EPERM when the caller lacked the required
+ * privilege (CAP_SYS_ADMIN) for the specified operation.
+ */
+#include <errno.h>
+#include <sys/quota.h>
+#include "tst_test.h"
+#include "lapi/quotactl.h"
+#include "tst_capability.h"
+
+#define OPTION_INVALID 999
+#define QFMT_VFS_V0     2
+#define USRPATH MNTPOINT "/aquota.user"
+#define FMTID QFMT_VFS_V0
+
+#define MNTPOINT "mntpoint"
+#define TESTDIR1 MNTPOINT "/testdir1"
+#define TESTDIR2 MNTPOINT "/testdir2"
+
+static int32_t fmt_id = FMTID;
+static int32_t fmt_invalid = 999;
+static int test_invalid;
+static int test_id;
+static int getnextquota_nsup;
+
+static struct if_nextdqblk res_ndq;
+static struct dqblk set_dq = {
+	.dqb_bsoftlimit = 100,
+	.dqb_valid = QIF_BLIMITS
+};
+
+static struct dqblk set_dqmax = {
+	.dqb_bsoftlimit = 0x7fffffffffffffffLL,  /* 2^63-1 */
+	.dqb_valid = QIF_BLIMITS
+};
+
+struct tst_cap dropadmin = {
+	.action = TST_CAP_DROP,
+	.id = CAP_SYS_ADMIN,
+	.name = "CAP_SYS_ADMIN",
+};
+
+struct tst_cap needadmin = {
+	.action = TST_CAP_REQ,
+	.id = CAP_SYS_ADMIN,
+	.name = "CAP_SYS_ADMIN",
+};
+
+static struct tcase {
+	int cmd;
+	int *id;
+	void *addr;
+	int exp_err;
+	int on_flag;
+} tcases[] = {
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, TESTDIR1, EACCES, 0},
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, TESTDIR2, ENOENT, 0},
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, USRPATH, EBUSY, 1},
+	{QCMD(Q_SETQUOTA, USRQUOTA), &fmt_id, NULL, EFAULT, 1},
+	{QCMD(OPTION_INVALID, USRQUOTA), &fmt_id, USRPATH, EINVAL, 0},
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, USRPATH, ENOTBLK, 0},
+	{QCMD(Q_SETQUOTA, USRQUOTA), &test_id, &set_dq, ESRCH, 0},
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_invalid, USRPATH, ESRCH, 0},
+	{QCMD(Q_GETNEXTQUOTA, USRQUOTA), &test_invalid, USRPATH, ESRCH, 0},
+	{QCMD(Q_SETQUOTA, USRQUOTA), &test_id, &set_dqmax, ERANGE, 1},
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, USRPATH, EPERM, 0},
+};
+
+static void verify_quotactl(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int quota_on = 0;
+	int drop_flag = 0;
+
+	if (tc->cmd == QCMD(Q_GETNEXTQUOTA, USRQUOTA) && getnextquota_nsup) {
+		tst_res(TCONF, "current system doesn't support Q_GETNEXTQUOTA, skip it");
+		return;
+	}
+
+	if (tc->on_flag) {
+		TEST(quotactl(QCMD(Q_QUOTAON, USRQUOTA), tst_device->dev, FMTID, USRPATH));
+		if (TST_RET == -1)
+			tst_brk(TBROK,
+				"quotactl with Q_QUOTAON returned %ld", TST_RET);
+		quota_on = 1;
+	}
+
+	if (tc->exp_err == EPERM) {
+		tst_cap_action(&dropadmin);
+		drop_flag = 1;
+	}
+
+	if (tc->exp_err == ENOTBLK)
+		TEST(quotactl(tc->cmd, "/dev/null", *tc->id, tc->addr));
+	else
+		TEST(quotactl(tc->cmd, tst_device->dev, *tc->id, tc->addr));
+	if (TST_RET == -1) {
+		if (tc->exp_err == TST_ERR) {
+			tst_res(TPASS | TTERRNO, "quotactl failed as expected");
+		} else {
+			tst_res(TFAIL | TTERRNO,
+				"quotactl failed unexpectedly; expected %s, but got",
+				tst_strerrno(tc->exp_err));
+		}
+	} else {
+		tst_res(TFAIL, "quotactl returned wrong value: %ld", TST_RET);
+	}
+
+	if (quota_on) {
+		TEST(quotactl(QCMD(Q_QUOTAOFF, USRQUOTA), tst_device->dev, FMTID, USRPATH));
+		if (TST_RET == -1)
+			tst_brk(TBROK,
+				"quotactl with Q_QUOTAOFF returned %ld", TST_RET);
+		quota_on = 0;
+	}
+
+	if (drop_flag) {
+		tst_cap_action(&needadmin);
+		drop_flag = 0;
+	}
+}
+
+static void setup(void)
+{
+	const char *const cmd[] = {"quotacheck", "-uF", "vfsv0", MNTPOINT, NULL};
+	int ret;
+	unsigned int i;
+
+	ret = tst_run_cmd(cmd, NULL, NULL, 1);
+	switch (ret) {
+	case 0:
+		break;
+	case 255:
+		tst_brk(TBROK, "quotacheck binary not installed");
+		break;
+	default:
+		tst_brk(TBROK, "quotacheck exited with %i", ret);
+	}
+
+	if (access(USRPATH, F_OK) == -1)
+		tst_brk(TFAIL | TERRNO, "user quotafile didn't exist");
+
+	SAFE_MKDIR(TESTDIR1, 0666);
+	test_id = geteuid();
+	test_invalid = test_id + 1;
+
+	TEST(quotactl(QCMD(Q_GETNEXTQUOTA, USRQUOTA), tst_device->dev,
+		test_id, (void *) &res_ndq));
+	if (TST_ERR == EINVAL || TST_ERR == ENOSYS)
+		getnextquota_nsup = 1;
+
+	for (i = 0; i < ARRAY_SIZE(tcases); i++) {
+		if (!tcases[i].addr)
+			tcases[i].addr = tst_get_bad_addr(NULL);
+	}
+}
+
+static const char *kconfigs[] = {
+	"CONFIG_QFMT_V2",
+	NULL
+};
+
+static struct tst_test test = {
+	.setup = setup,
+	.needs_kconfigs = kconfigs,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_quotactl,
+	.dev_fs_type = "ext4",
+	.mntpoint = MNTPOINT,
+	.mount_device = 1,
+	.mnt_data = "usrquota",
+	.needs_root = 1,
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
