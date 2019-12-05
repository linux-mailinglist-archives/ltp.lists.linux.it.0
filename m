Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A7D113BA2
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 07:17:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40D813C2561
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 07:17:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4726D3C23AF
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 07:17:47 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 633486009FA
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 07:17:44 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,279,1571673600"; d="scan'208";a="79624675"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Dec 2019 14:17:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 0F18C4CE1C07;
 Thu,  5 Dec 2019 14:09:10 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 5 Dec 2019 14:17:39 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ice_yangxiao@163.com>
Date: Thu, 5 Dec 2019 14:17:44 +0800
Message-ID: <1575526664-25738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 0F18C4CE1C07.ACD10
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/quotactl07: add regresstion test for
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a regresstion test to check Q_XQUOTARM  whether has
quota flags check.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

---------------------
1.Simplify test code
2.add comment for invalid_type,
---------------------
---
 include/lapi/quotactl.h                       |  4 ++
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/quotactl/.gitignore |  1 +
 .../kernel/syscalls/quotactl/quotactl07.c     | 71 +++++++++++++++++++
 4 files changed, 77 insertions(+)
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
index 000000000..cd9f629ea
--- /dev/null
+++ b/testcases/kernel/syscalls/quotactl/quotactl07.c
@@ -0,0 +1,71 @@
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
+static unsigned int valid_type = XFS_USER_QUOTA;
+/*Include a valid quota type to avoid other EINVAL error*/
+static unsigned int invalid_type = XFS_GROUP_QUOTA << 1 | XFS_USER_QUOTA;
+
+static void verify_quota(void)
+{
+	TEST(quotactl(QCMD(Q_XQUOTARM, USRQUOTA), tst_device->dev, 0, (void *)&invalid_type));
+	if (TST_ERR == EINVAL)
+		tst_res(TPASS, "Q_XQUOTARM has quota type check");
+	else
+		tst_res(TFAIL, "Q_XQUOTARM doesn't have quota type check");
+}
+
+static void setup(void)
+{
+	TEST(quotactl(QCMD(Q_XQUOTAOFF, USRQUOTA), tst_device->dev, 0, (void *)&qflag_acct));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "quotactl with Q_XQUOTAOFF failed");
+
+	TEST(quotactl(QCMD(Q_XQUOTARM, USRQUOTA), tst_device->dev, 0, (void *)&valid_type));
+	if (TST_ERR == EINVAL) {
+		tst_res(TCONF, "current system doesn't support Q_XQUOTARM, skip it");
+		return;
+	}
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
+	.mount_device = 1,
+	.dev_fs_type = "xfs",
+	.mnt_data = "usrquota",
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
