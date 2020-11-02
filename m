Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFE52A29AE
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 12:43:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8026A3C3030
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 12:43:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 23D2B3C23BB
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 12:43:28 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 51AC1140121A
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 12:43:26 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,444,1596470400"; d="scan'208";a="100826793"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Nov 2020 19:43:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id DB3404CE34E5
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 19:43:22 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 2 Nov 2020 19:43:24 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 2 Nov 2020 19:43:29 +0800
Message-ID: <1604317409-22871-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DB3404CE34E5.AC15C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/ptrace02: Add another EPERM error test
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
 testcases/kernel/syscalls/ptrace/.gitignore |  1 +
 testcases/kernel/syscalls/ptrace/ptrace02.c | 66 +++++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ptrace/ptrace02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 0dcd3d66d..a439267b2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -990,6 +990,7 @@ pselect03 pselect03
 pselect03_64 pselect03_64
 
 ptrace01 ptrace01
+ptrace02 ptrace02
 ptrace03 ptrace03
 ptrace04 ptrace04
 ptrace05 ptrace05
diff --git a/testcases/kernel/syscalls/ptrace/.gitignore b/testcases/kernel/syscalls/ptrace/.gitignore
index 7ee3b3c47..34be5148f 100644
--- a/testcases/kernel/syscalls/ptrace/.gitignore
+++ b/testcases/kernel/syscalls/ptrace/.gitignore
@@ -1,4 +1,5 @@
 /ptrace01
+/ptrace02
 /ptrace03
 /ptrace04
 /ptrace05
diff --git a/testcases/kernel/syscalls/ptrace/ptrace02.c b/testcases/kernel/syscalls/ptrace/ptrace02.c
new file mode 100644
index 000000000..b87529d90
--- /dev/null
+++ b/testcases/kernel/syscalls/ptrace/ptrace02.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com
+ *
+ * ptrace() returns -1 and sets errno to EPERM if tracer doesn't have
+ * CAP_SYS_PTRACE capability for the process. Such as nobody user.
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
+uid_t uid;
+
+static void verify_ptrace(void)
+{
+	int child_pid;
+
+	tst_res(TINFO, "Trace a process that don't have CAP_SYS_PTRACE capability(nobody user) for it");
+
+	child_pid = SAFE_FORK();
+	if (!child_pid)
+		pause();
+
+	if (!SAFE_FORK()) {
+		SAFE_SETUID(uid);
+		TEST(ptrace(PTRACE_ATTACH, child_pid, NULL, NULL));
+		if (TST_RET == 0) {
+			tst_res(TFAIL, "ptrace() succeeded unexpectedly");
+			TST_CHECKPOINT_WAKE(0);
+			exit(0);
+		}
+		if (TST_ERR == EPERM)
+			tst_res(TPASS | TTERRNO, "ptrace() failed as expected");
+		else
+			tst_res(TFAIL | TTERRNO, "ptrace() expected EPERM, but got");
+		TST_CHECKPOINT_WAKE(0);
+		exit(0);
+	}
+	TST_CHECKPOINT_WAIT(0);
+	SAFE_KILL(child_pid, SIGKILL);
+	SAFE_WAITPID(child_pid, NULL, 0);
+	tst_reap_children();
+}
+
+static void setup(void)
+{
+	struct passwd *pw;
+
+	pw = SAFE_GETPWNAM("nobody");
+	uid = pw->pw_uid;
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = verify_ptrace,
+	.forks_child = 1,
+	.needs_root = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
