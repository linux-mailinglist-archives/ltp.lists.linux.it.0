Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9DE122874
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:14:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BFDD3C2093
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:14:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2B2BA3C0431
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:14:54 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B0E4A2013ED
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:14:51 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,325,1571673600"; d="scan'208";a="80413294"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Dec 2019 18:14:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 5327A4CE1C93
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 18:06:10 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 17 Dec 2019 18:14:49 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Dec 2019 18:15:22 +0800
Message-ID: <1576577722-3727-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 5327A4CE1C93.ACA34
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1 4/4] syscalls/capset04: add new EPERM error test
 with vfs cap support
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

Now, most linux distributions has VFS capabilities supports, so
modifying other process cap is never permitted. This case from old
capset02.c.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                            |  1 +
 testcases/kernel/syscalls/capset/.gitignore |  1 +
 testcases/kernel/syscalls/capset/capset04.c | 86 +++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 testcases/kernel/syscalls/capset/capset04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 4f481be6d..f58fefe17 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -45,6 +45,7 @@ capget02 capget02
 capset01 capset01
 capset02 capset02
 capset03 capset03
+capset04 capset04
 
 cacheflush01 cacheflush01
 
diff --git a/testcases/kernel/syscalls/capset/.gitignore b/testcases/kernel/syscalls/capset/.gitignore
index 3f9a4d5e8..d0a7a13a4 100644
--- a/testcases/kernel/syscalls/capset/.gitignore
+++ b/testcases/kernel/syscalls/capset/.gitignore
@@ -1,3 +1,4 @@
 /capset01
 /capset02
 /capset03
+/capset04
diff --git a/testcases/kernel/syscalls/capset/capset04.c b/testcases/kernel/syscalls/capset/capset04.c
new file mode 100644
index 000000000..ba8546521
--- /dev/null
+++ b/testcases/kernel/syscalls/capset/capset04.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
+ * Author: Saji Kumar.V.R <saji.kumar@wipro.com>
+ *
+ * Tests whether we can use capset() to modify the capabilities of a thread
+ * other than itself. Now, most linux distributions with kernel supporting
+ * VFS capabilities, this should be never permitted.
+ */
+#include <stdlib.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+#include <linux/capability.h>
+
+static struct __user_cap_header_struct header = {
+	.version = 0x20080522,
+	.pid = 0,
+};
+static struct __user_cap_data_struct data[2];
+static pid_t child_pid;
+static int clean_nflag;
+static void cleanup(void);
+
+static void child_func(void)
+{
+	for (;;)
+		sleep(10);
+}
+
+static void verify_capset(void)
+{
+	child_pid = SAFE_FORK();
+	if (child_pid == 0) {
+		child_func();
+		exit(0);
+	}
+
+	clean_nflag = 0;
+	header.pid = child_pid;
+
+	TEST(tst_syscall(__NR_capset, &header, data));
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "capset succeed unexpectedly");
+		cleanup();
+		return;
+	}
+	if (TST_ERR == EPERM)
+		tst_res(TPASS, "capset doesn't can modify other process capabilities");
+	else
+		tst_res(TFAIL | TTERRNO, "capset expected EPERM, bug got");
+
+	cleanup();
+}
+
+static void setup(void)
+{
+	pid_t pid;
+
+	pid = getpid();
+	header.pid = pid;
+	TEST(tst_syscall(__NR_capget, &header, data));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "capget data failed");
+}
+
+static void cleanup(void)
+{
+	if (child_pid > 0 && !clean_nflag) {
+		SAFE_KILL(child_pid, SIGTERM);
+		SAFE_WAIT(NULL);
+		clean_nflag = 1;
+	}
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_capset,
+	.forks_child = 1,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_REQ, CAP_SETPCAP),
+		{}
+	},
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
