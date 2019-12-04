Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A33461129AA
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 11:57:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 435503C2510
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 11:57:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4F38B3C2399
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 11:57:36 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E45DA6012CC
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 11:57:34 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,277,1571673600"; d="scan'208";a="79585217"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 18:57:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 2223E4CE1646
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 18:49:02 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 18:57:29 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 4 Dec 2019 18:57:36 +0800
Message-ID: <1575457056-10022-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 2223E4CE1646.AD058
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/quotactl07: add regresstion test for
 Q_XQTUOTARM
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

This is a regresstion test to check Q_XQUOTARM  whether has
quota flags check.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/lapi/quotactl.h                       |  4 +
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/quotactl/.gitignore |  1 +
 .../kernel/syscalls/quotactl/quotactl07.c     | 89 +++++++++++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl07.c

diff --git a/include/lapi/quotactl.h b/include/lapi/quotactl.h
index d3223b863..c1ec9d6e1 100644
--- a/include/lapi/quotactl.h
+++ b/include/lapi/quotactl.h
@@ -59,6 +59,10 @@ struct fs_quota_statv {
 # define PRJQUOTA 2
 #endif
 
+#ifndef Q_XQUOTARM
+# define Q_XQUOTARM XQM_CMD(6)
+#endif
+
 #ifndef Q_XGETQSTATV
 # define Q_XGETQSTATV XQM_CMD(8)
 #endif
diff --git a/runtest/syscalls b/runtest/syscalls
index 15dbd9971..0f75cf3f6 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -958,6 +958,7 @@ quotactl03 quotactl03
 quotactl04 quotactl04
 quotactl05 quotactl05
 quotactl06 quotactl06
+quotactl07 quotactl07
 
 read01 read01
 read02 read02
diff --git a/testcases/kernel/syscalls/quotactl/.gitignore b/testcases/kernel/syscalls/quotactl/.gitignore
index 12896d6ad..8d2ef94d9 100644
--- a/testcases/kernel/syscalls/quotactl/.gitignore
+++ b/testcases/kernel/syscalls/quotactl/.gitignore
@@ -4,3 +4,4 @@
 /quotactl04
 /quotactl05
 /quotactl06
+/quotactl07
diff --git a/testcases/kernel/syscalls/quotactl/quotactl07.c b/testcases/kernel/syscalls/quotactl/quotactl07.c
new file mode 100644
index 000000000..076db0bfe
--- /dev/null
+++ b/testcases/kernel/syscalls/quotactl/quotactl07.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * This is a regresstion test for kernel commit 3dd4d40b4208
+ * ("xfs: Sanity check flags of Q_XQUOTARM call").
+ */
+
+#include "config.h"
+#include <errno.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <sys/quota.h>
+#include "lapi/quotactl.h"
+#include "tst_test.h"
+
+#ifdef HAVE_XFS_XQM_H
+# include <xfs/xqm.h>
+
+#define MNTPOINT    "mntpoint"
+
+static uint32_t qflag_acct = XFS_QUOTA_UDQ_ACCT;
+static int test_id;
+static int xquotarm_nsup;
+static unsigned int valid_type = 1;
+static unsigned int invalid_type = 9;
+
+static void verify_quota(void)
+{
+	if (xquotarm_nsup) {
+		tst_res(TCONF,
+			"current system doesn't support Q_XQUOTARM, skip it");
+		return;
+	}
+
+	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
+
+	TEST(quotactl(QCMD(Q_XQUOTAOFF, USRQUOTA), tst_device->dev, test_id, (void *)&qflag_acct));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "quotactl with Q_XQUOTAOFF failed");
+
+	TEST(quotactl(QCMD(Q_XQUOTARM, USRQUOTA), tst_device->dev, test_id, (void *)&invalid_type));
+	if (TST_ERR == EINVAL)
+		tst_res(TPASS, "Q_XQUOTARM has quota type check");
+	else
+		tst_res(TFAIL, "Q_XQUOTARM doesn't have quota type check");
+
+	SAFE_UMOUNT(MNTPOINT);
+}
+
+static void setup(void)
+{
+	test_id = geteuid();
+
+	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
+
+	TEST(quotactl(QCMD(Q_XQUOTAOFF, USRQUOTA), tst_device->dev, test_id, (void *)&qflag_acct));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "quotactl with Q_XQUOTAOFF failed");
+
+	TEST(quotactl(QCMD(Q_XQUOTARM, USRQUOTA), tst_device->dev, test_id, (void *)&valid_type));
+	if (TST_ERR == EINVAL)
+		xquotarm_nsup = 1;
+
+	SAFE_UMOUNT(MNTPOINT);
+}
+
+static const char *kconfigs[] = {
+	"CONFIG_XFS_QUOTA",
+	NULL
+};
+
+static struct tst_test test = {
+	.setup = setup,
+	.needs_root = 1,
+	.needs_kconfigs = kconfigs,
+	.test_all = verify_quota,
+	.format_device = 1,
+	.dev_fs_type = "xfs",
+	.mntpoint = MNTPOINT,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "3dd4d40b4208"},
+		{}
+	}
+};
+#else
+	TST_TEST_TCONF("System doesn't have <xfs/xqm.h>");
+#endif
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
