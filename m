Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C12AFFDC
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 07:50:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4F113C5FE2
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 07:50:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E0BC33C5FDF
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 07:50:24 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 25DAB2003AC
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 07:50:23 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,471,1596470400"; d="scan'208";a="101271008"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Nov 2020 14:50:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A118648990EB;
 Thu, 12 Nov 2020 14:50:18 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 12 Nov 2020 14:50:18 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Thu, 12 Nov 2020 14:48:44 +0800
Message-ID: <1605163724-20306-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605163724-20306-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20201111150926.GA21539@yuki.lan>
 <1605163724-20306-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A118648990EB.AB908
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/ptrace11: Add test for tracing init
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                            |  1 +
 testcases/kernel/syscalls/ptrace/.gitignore |  1 +
 testcases/kernel/syscalls/ptrace/ptrace11.c | 39 +++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ptrace/ptrace11.c

diff --git a/runtest/syscalls b/runtest/syscalls
index aeacb8bc8..6b5908662 100644
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
index 000000000..6375964f9
--- /dev/null
+++ b/testcases/kernel/syscalls/ptrace/ptrace11.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com
+ *
+ * This case just check whether we can trace init(1) process and
+ * doesn't trigger error.
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
+		tst_res(TPASS, "ptrace() traces init process succeeded");
+	else
+		tst_res(TFAIL | TTERRNO,
+			"ptrace() returns %ld, failed unexpectedly", TST_RET);
+
+	/*
+	 * Running attach/detach more times will trigger a ESRCH error because
+	 * ptrace_check_attach function in kernel will report it if its process
+	 * stats is not __TASK_TRACED.
+	 */
+	TST_RETRY_FUNC(ptrace(PTRACE_DETACH, 1, NULL, NULL), TST_RETVAL_EQ0);
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
