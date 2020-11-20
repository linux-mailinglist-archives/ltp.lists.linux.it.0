Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB3B2BA0F0
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 04:16:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DF023C643A
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 04:16:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 652F53C2F45
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 04:16:34 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id CA6916011A1
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 04:16:33 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,354,1599494400"; d="scan'208";a="101570593"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Nov 2020 11:16:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 743C74CE3A6C;
 Fri, 20 Nov 2020 11:16:29 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Nov 2020 11:16:29 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Fri, 20 Nov 2020 11:16:33 +0800
Message-ID: <1605842193-10828-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20201119153116.GA18048@yuki.lan>
References: <20201119153116.GA18048@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 743C74CE3A6C.AE924
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4] syscalls/ptrace11: Add test for tracing init
 process
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

Before kernel 2.6.26, ptrace can't trace init process and will get
EPERM error. Now, it should succeed when we have enough privileges.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                            |  1 +
 testcases/kernel/syscalls/ptrace/.gitignore |  1 +
 testcases/kernel/syscalls/ptrace/ptrace11.c | 46 +++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ptrace/ptrace11.c

diff --git a/runtest/syscalls b/runtest/syscalls
index a5363277f..be5e1e76c 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1000,6 +1000,7 @@ ptrace07 ptrace07
 ptrace08 ptrace08
 ptrace09 ptrace09
 ptrace10 ptrace10
+ptrace11 ptrace11
 
 pwrite01 pwrite01
 pwrite02 pwrite02
diff --git a/testcases/kernel/syscalls/ptrace/.gitignore b/testcases/kernel/syscalls/ptrace/.gitignore
index 34be5148f..01cbc6072 100644
--- a/testcases/kernel/syscalls/ptrace/.gitignore
+++ b/testcases/kernel/syscalls/ptrace/.gitignore
@@ -7,3 +7,4 @@
 /ptrace08
 /ptrace09
 /ptrace10
+/ptrace11
diff --git a/testcases/kernel/syscalls/ptrace/ptrace11.c b/testcases/kernel/syscalls/ptrace/ptrace11.c
new file mode 100644
index 000000000..daaadcd3a
--- /dev/null
+++ b/testcases/kernel/syscalls/ptrace/ptrace11.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * Before kernel 2.6.26, we can't trace init(1) process and ptrace() will
+ * get EPERM error. This case just check whether we can trace init(1)
+ * process and doesn't trigger error.
+ */
+
+#include <errno.h>
+#include <signal.h>
+#include <sys/wait.h>
+#include <pwd.h>
+#include <config.h>
+#include <stdlib.h>
+#include "ptrace.h"
+#include "tst_test.h"
+
+static void verify_ptrace(void)
+{
+	TEST(ptrace(PTRACE_ATTACH, 1, NULL, NULL));
+	if (TST_RET == 0)
+		tst_res(TPASS, "ptrace() traces init process successfully");
+	else
+		tst_res(TFAIL | TTERRNO,
+			"ptrace() returns %ld, failed unexpectedly", TST_RET);
+
+	/*
+	 * As ptrace(2) man-page said, when using PTRACE_ATTACH option, the
+	 * tracee is sent a SIGSTOP, but will not necessarily have stopped
+	 * by the completion of this call. Use waitpid(2) to wait for the
+	 * tracee into stop. Otherwise it may get ESRCH error.
+	 * As waitpid(2) man-pages said, status for traced children which have
+	 * stopped is provided even if WUNTRACED option is not specified.
+	 * So using 0 option is enough.
+	 */
+	SAFE_WAITPID(1, NULL, 0);
+
+	SAFE_PTRACE(PTRACE_DETACH, 1, NULL, NULL);
+}
+
+static struct tst_test test = {
+	.test_all = verify_ptrace,
+	.needs_root = 1,
+};
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
