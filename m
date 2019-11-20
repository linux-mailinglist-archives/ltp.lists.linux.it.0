Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CB010366F
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 10:14:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23A6F3C0738
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 10:14:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 381333C21DD
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 10:13:58 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1D4B91A0174C
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 10:13:56 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,221,1571673600"; d="scan'208";a="78787341"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 17:13:53 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 372D64CE14FF
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 17:05:32 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 20 Nov 2019 17:13:48 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 20 Nov 2019 17:13:34 +0800
Message-ID: <1574241216-15168-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 372D64CE14FF.AD757
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/5] syscalls/quotactl04: add project quota test
 for non-xfs filesystem
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

This is a variant about quotactl01.c and used to test project quota.
I split it into a new case instead of adding it in quotaclt01.c because
two points:
1)Before linux 4.10, ext4 doesn't support project quota.
2)On old kernel, kernel doesn't permit mount both prjquota and grpquota together.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/lapi/quotactl.h                       |   4 +
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/quotactl/.gitignore |   1 +
 .../kernel/syscalls/quotactl/quotactl04.c     | 162 ++++++++++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl04.c

diff --git a/include/lapi/quotactl.h b/include/lapi/quotactl.h
index 808d044ff..8d559af51 100644
--- a/include/lapi/quotactl.h
+++ b/include/lapi/quotactl.h
@@ -59,6 +59,10 @@ struct fs_quota_statv {
 #endif
 #endif
 
+#ifndef PRJQUOTA
+# define PRJQUOTA 2
+#endif
+
 # ifndef Q_XGETQSTATV
 #  define Q_XGETQSTATV XQM_CMD(8)
 # endif
diff --git a/runtest/syscalls b/runtest/syscalls
index fee91f909..078143b13 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -954,6 +954,7 @@ pwritev202_64 pwritev202_64
 quotactl01 quotactl01
 quotactl02 quotactl02
 quotactl03 quotactl03
+quotactl04 quotactl04
 
 read01 read01
 read02 read02
diff --git a/testcases/kernel/syscalls/quotactl/.gitignore b/testcases/kernel/syscalls/quotactl/.gitignore
index b0ef075e7..1db7c5d98 100644
--- a/testcases/kernel/syscalls/quotactl/.gitignore
+++ b/testcases/kernel/syscalls/quotactl/.gitignore
@@ -1,3 +1,4 @@
 /quotactl01
 /quotactl02
 /quotactl03
+/quotactl04
diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
new file mode 100644
index 000000000..86260499d
--- /dev/null
+++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * This testcase checks the basic flag of quotactl(2) for project quota on
+ * non-XFS filesystems.
+ *
+ * 1) quotactl(2) succeeds to turn on quota with Q_QUOTAON flag for project.
+ * 2) quotactl(2) succeeds to set disk quota limits with Q_SETQUOTA flag
+ *    for project.
+ * 3) quotactl(2) succeeds to get disk quota limits with Q_GETQUOTA flag
+ *    for project.
+ * 4) quotactl(2) succeeds to set information about quotafile with Q_SETINFO
+ *    flag for project.
+ * 5) quotactl(2) succeeds to get information about quotafile with Q_GETINFO
+ *    flag for project.
+ * 6) quotactl(2) succeeds to get quota format with Q_GETFMT flag for project.
+ * 7) quotactl(2) succeeds to get disk quota limit greater than or equal to
+ *    ID with Q_GETNEXTQUOTA flag for project.
+ * 8) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for project.
+ */
+
+#include <errno.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <sys/stat.h>
+#include "config.h"
+#include "lapi/quotactl.h"
+#include "tst_test.h"
+
+#ifndef QFMT_VFS_V1
+# define QFMT_VFS_V1 4
+#endif
+
+#define FMTID QFMT_VFS_V1
+#define MNTPOINT	"mntpoint"
+static int32_t fmt_id = FMTID;
+static int test_id, mount_flag;
+static struct dqblk set_dq = {
+	.dqb_bsoftlimit = 100,
+	.dqb_valid = QIF_BLIMITS
+};
+static struct dqblk res_dq;
+static struct dqinfo set_qf = {
+	.dqi_bgrace = 80,
+	.dqi_valid = IIF_BGRACE
+};
+
+static struct dqinfo res_qf;
+static int32_t fmt_buf;
+
+static struct if_nextdqblk res_ndq;
+
+static struct tcase {
+	int cmd;
+	int *id;
+	void *addr;
+	void *set_data;
+	void *res_data;
+	int sz;
+	char *des;
+	char *tname;
+} tcases[] = {
+	{QCMD(Q_QUOTAON, PRJQUOTA), &fmt_id, NULL,
+	NULL, NULL, 0, "turn on quota for project",
+	"QCMD(Q_QUOTAON, PRJQUOTA)"},
+
+	{QCMD(Q_SETQUOTA, PRJQUOTA), &test_id, &set_dq,
+	NULL, NULL, 0, "set disk quota limit for project",
+	"QCMD(Q_SETQUOTA, PRJQUOTA)"},
+
+	{QCMD(Q_GETQUOTA, PRJQUOTA), &test_id, &res_dq,
+	&set_dq.dqb_bsoftlimit, &res_dq.dqb_bsoftlimit,
+	sizeof(res_dq.dqb_bsoftlimit), "get disk quota limit for project",
+	"QCMD(Q_GETQUOTA, PRJQUOTA)"},
+
+	{QCMD(Q_SETINFO, PRJQUOTA), &test_id, &set_qf,
+	NULL, NULL, 0, "set information about quotafile for project",
+	"QCMD(Q_SETINFO, PRJQUOTA"},
+
+	{QCMD(Q_GETINFO, PRJQUOTA), &test_id, &res_qf,
+	&set_qf.dqi_bgrace, &res_qf.dqi_bgrace, sizeof(res_qf.dqi_bgrace),
+	"get information about quotafile for project",
+	"QCMD(Q_GETINFO, PRJQUOTA"},
+
+	{QCMD(Q_GETFMT, PRJQUOTA), &test_id, &fmt_buf,
+	&fmt_id, &fmt_buf, sizeof(fmt_buf),
+	"get quota format for project", "QCMD(Q_GETFMT, PRJQUOTA)"},
+
+	{QCMD(Q_GETNEXTQUOTA, PRJQUOTA), &test_id, &res_ndq,
+	&test_id, &res_ndq.dqb_id, sizeof(res_ndq.dqb_id),
+	"get next disk quota limit for project",
+	"QCMD(Q_GETNEXTQUOTA, PRJQUOTA)"},
+
+	{QCMD(Q_QUOTAOFF, PRJQUOTA), &test_id, NULL,
+	NULL, NULL, 0, "turn off quota for project",
+	"QCMD(Q_QUOTAOFF, PRJQUOTA)"},
+
+};
+
+static void setup(void)
+{
+	const char *const extra_opts[] = {"-O quota,project", NULL};
+
+	test_id = geteuid();
+	SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, extra_opts);
+	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
+	mount_flag = 1;
+}
+
+static void cleanup(void)
+{
+	if (mount_flag && tst_umount(MNTPOINT))
+	tst_res(TWARN | TERRNO, "umount(%s)", MNTPOINT);
+}
+
+static void verify_quota(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	res_dq.dqb_bsoftlimit = 0;
+	res_qf.dqi_igrace = 0;
+	fmt_buf = 0;
+
+	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
+
+	TEST(quotactl(tc->cmd, tst_device->dev, *tc->id, tc->addr));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "quotactl failed to %s", tc->des);
+		return;
+	}
+
+	if (memcmp(tc->res_data, tc->set_data, tc->sz)) {
+		tst_res(TFAIL, "quotactl failed to %s", tc->des);
+		tst_res_hexd(TINFO, tc->res_data, tc->sz, "retval:   ");
+		tst_res_hexd(TINFO, tc->set_data, tc->sz, "expected: ");
+		return;
+	}
+
+	tst_res(TPASS, "quotactl succeeded to %s", tc->des);
+}
+
+static const char *kconfigs[] = {
+	"CONFIG_QFMT_V2",
+	NULL
+};
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+	.needs_kconfigs = kconfigs,
+	.min_kver = "4.10", /* commit 689c958cbe6b (ext4: add project quota support) */
+	.test = verify_quota,
+	.tcnt = ARRAY_SIZE(tcases),
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_device = 1,
+	.dev_fs_type = "ext4",
+	.mntpoint = MNTPOINT,
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
