Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE1F12286E
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:13:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4ADEF3C2390
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:13:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EF59D3C234F
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:12:58 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id CCD221A00A35
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:12:57 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,325,1571673600"; d="scan'208";a="80413209"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Dec 2019 18:12:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id B0BCA4CE1C93
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 18:04:11 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 17 Dec 2019 18:12:50 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Dec 2019 18:12:51 +0800
Message-ID: <1576577571-3668-5-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: B0BCA4CE1C93.A0BA3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/5] syscalls/quotactl05: add project quota test
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
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/quotactl/.gitignore |  2 +
 .../kernel/syscalls/quotactl/quotactl05.c     | 99 +++++++++++++++++++
 3 files changed, 102 insertions(+)
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
index 1db7c5d98..9621e7717 100644
--- a/testcases/kernel/syscalls/quotactl/.gitignore
+++ b/testcases/kernel/syscalls/quotactl/.gitignore
@@ -2,3 +2,5 @@
 /quotactl02
 /quotactl03
 /quotactl04
+/quotactl05
+
diff --git a/testcases/kernel/syscalls/quotactl/quotactl05.c b/testcases/kernel/syscalls/quotactl/quotactl05.c
new file mode 100644
index 000000000..2c4f49f7c
--- /dev/null
+++ b/testcases/kernel/syscalls/quotactl/quotactl05.c
@@ -0,0 +1,99 @@
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
+ *    for project.
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
+ */
+#include "quotactl02.h"
+#if defined(HAVE_XFS_XQM_H)
+
+static uint32_t qflagp = XFS_QUOTA_PDQ_ENFD;
+static struct t_case {
+	int cmd;
+	void *addr;
+	void (*func_check)();
+	int check_subcmd;
+	int flag;
+	char *des;
+} tcases[] = {
+	{QCMD(Q_XQUOTAOFF, PRJQUOTA), &qflagp, check_qoff,
+	QCMD(Q_XGETQSTAT, PRJQUOTA), 1,
+	"turn off xfs quota and get xfs quota off status for project"},
+
+	{QCMD(Q_XQUOTAON, PRJQUOTA), &qflagp, check_qon,
+	QCMD(Q_XGETQSTAT, PRJQUOTA), 1,
+	"turn on xfs quota and get xfs quota on status for project"},
+
+	{QCMD(Q_XSETQLIM, PRJQUOTA), &set_dquota, check_qlim,
+	QCMD(Q_XGETQUOTA, PRJQUOTA), 0,
+	"Q_XGETQUOTA for project"},
+
+	{QCMD(Q_XSETQLIM, PRJQUOTA), &set_dquota, check_qlim,
+	QCMD(Q_XGETNEXTQUOTA, PRJQUOTA), 0,
+	"Q_XGETNEXTQUOTA for project"},
+
+#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
+	{QCMD(Q_XQUOTAOFF, PRJQUOTA), &qflagp, check_qoffv,
+	QCMD(Q_XGETQSTATV, PRJQUOTA), 1,
+	"turn off xfs quota and get xfs quota off statv for project"},
+
+	{QCMD(Q_XQUOTAON, PRJQUOTA), &qflagp, check_qonv,
+	QCMD(Q_XGETQSTATV, PRJQUOTA), 1,
+	"turn on xfs quota and get xfs quota on statv for project"},
+#endif
+};
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
+
+#else
+	TST_TEST_TCONF("This system didn't have <xfs/xqm.h>");
+#endif
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
