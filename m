Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F95D12286C
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:13:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 608273C2270
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:13:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E68A73C22D4
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:12:51 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D3628140013F
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:12:49 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,325,1571673600"; d="scan'208";a="80413200"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Dec 2019 18:12:49 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 807D74CE1C97
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 18:04:08 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 17 Dec 2019 18:12:47 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Dec 2019 18:12:50 +0800
Message-ID: <1576577571-3668-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 807D74CE1C97.AE74F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1 3/4] syscalls/capset03: add new EPERM error test
 without CAP_SETPCAP
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
 runtest/syscalls                            |  1 +
 testcases/kernel/syscalls/capset/.gitignore |  1 +
 testcases/kernel/syscalls/capset/capset03.c | 65 +++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 testcases/kernel/syscalls/capset/capset03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index fa87ef63f..4f481be6d 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -44,6 +44,7 @@ capget02 capget02
 
 capset01 capset01
 capset02 capset02
+capset03 capset03
 
 cacheflush01 cacheflush01
 
diff --git a/testcases/kernel/syscalls/capset/.gitignore b/testcases/kernel/syscalls/capset/.gitignore
index 004ce7b3e..3f9a4d5e8 100644
--- a/testcases/kernel/syscalls/capset/.gitignore
+++ b/testcases/kernel/syscalls/capset/.gitignore
@@ -1,2 +1,3 @@
 /capset01
 /capset02
+/capset03
diff --git a/testcases/kernel/syscalls/capset/capset03.c b/testcases/kernel/syscalls/capset/capset03.c
new file mode 100644
index 000000000..d973095a4
--- /dev/null
+++ b/testcases/kernel/syscalls/capset/capset03.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com
+ *
+ * capset() fails with errno set or EPERM if the new_Inheritable is
+ * not a subset of old_Inheritable and old_Permitted without CAP_SETPCAP.
+ */
+#include <stdlib.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <sys/prctl.h>
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+#include <linux/capability.h>
+
+static struct __user_cap_header_struct header = {
+	.version = 0x20080522,
+	.pid = 0,
+};
+
+static struct __user_cap_data_struct data[2] = {
+	{
+		.effective = 1 << CAP_KILL,
+		.permitted = 1 << CAP_KILL,
+		.inheritable = 1 << CAP_KILL,
+	},
+};
+
+static void verify_capset(void)
+{
+	tst_res(TINFO, "Test bad value data(when pI is not old pP or old pI without CAP_SETPCAP)");
+	data[0].inheritable = (1 << CAP_KILL | 1 << CAP_NET_RAW);
+	TEST(tst_syscall(__NR_capset, &header, data));
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "capset succeed unexpectedly");
+		return;
+	}
+	if (TST_ERR == EPERM)
+		tst_res(TPASS | TTERRNO, "capset() failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "capset expected EPERM, bug got");
+}
+
+static void setup(void)
+{
+	pid_t pid;
+
+	pid = getpid();
+	header.pid = pid;
+	if (geteuid() == 0) {
+		TEST(tst_syscall(__NR_capset, &header, data));
+		if (TST_RET == -1)
+			tst_brk(TBROK | TTERRNO, "capset data failed");
+	}
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = verify_capset,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_DROP, CAP_SETPCAP),
+		{}
+	},
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
