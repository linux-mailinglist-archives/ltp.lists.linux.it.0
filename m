Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A291B2AFFDB
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 07:50:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 698F03C2EF4
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 07:50:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 3CD053C262E
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 07:50:20 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 68CF2200BA4
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 07:50:18 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,471,1596470400"; d="scan'208";a="101271001"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Nov 2020 14:50:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 79DE74CE3B74;
 Thu, 12 Nov 2020 14:50:14 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 12 Nov 2020 14:50:14 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Thu, 12 Nov 2020 14:48:43 +0800
Message-ID: <1605163724-20306-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20201111150926.GA21539@yuki.lan>
References: <20201111150926.GA21539@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 79DE74CE3B74.AF6E1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] syscalls/ptrace02: Add another EPERM error test
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
 testcases/kernel/syscalls/ptrace/ptrace02.c | 61 +++++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ptrace/ptrace02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 3ddf70c54..aeacb8bc8 100644
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
index 000000000..cacaeeb96
--- /dev/null
+++ b/testcases/kernel/syscalls/ptrace/ptrace02.c
@@ -0,0 +1,61 @@
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
+	int child_pid[2];
+
+	child_pid[0] = SAFE_FORK();
+	if (!child_pid[0])
+		pause();
+
+	child_pid[1] = SAFE_FORK();
+	if (!child_pid[1]) {
+		SAFE_SETUID(uid);
+		TEST(ptrace(PTRACE_ATTACH, child_pid[0], NULL, NULL));
+		if (TST_RET == 0) {
+			tst_res(TFAIL, "ptrace() succeeded unexpectedly");
+			exit(0);
+		}
+		if (TST_ERR == EPERM)
+			tst_res(TPASS | TTERRNO, "ptrace() failed as expected");
+		else
+			tst_res(TFAIL | TTERRNO, "ptrace() expected EPERM, but got");
+		exit(0);
+	}
+	SAFE_WAITPID(child_pid[1], NULL, 0);
+	SAFE_KILL(child_pid[0], SIGKILL);
+	SAFE_WAITPID(child_pid[0], NULL, 0);
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
+};
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
