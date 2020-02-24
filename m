Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5956A16A315
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 10:51:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49B603C2676
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 10:51:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 86E663C1775
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 10:51:48 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 921D360253D
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 10:51:45 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,479,1574092800"; d="scan'208";a="83835832"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Feb 2020 17:51:41 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id EDA8550A997A
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 17:41:58 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 24 Feb 2020 17:51:43 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 24 Feb 2020 17:51:42 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 24 Feb 2020 17:52:26 +0800
Message-ID: <1582537946-22098-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: EDA8550A997A.AF9DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/pipe13: Add regression test for pipe to wake
 up all readers
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
 runtest/syscalls                          |  1 +
 testcases/kernel/syscalls/pipe/.gitignore |  1 +
 testcases/kernel/syscalls/pipe/pipe13.c   | 64 +++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 testcases/kernel/syscalls/pipe/pipe13.c

diff --git a/runtest/syscalls b/runtest/syscalls
index e42db9910..39d04a3a8 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -874,6 +874,7 @@ pipe09 pipe09
 pipe10 pipe10
 pipe11 pipe11
 pipe12 pipe12
+pipe13 pipe13
 
 pipe2_01 pipe2_01
 pipe2_02 pipe2_02
diff --git a/testcases/kernel/syscalls/pipe/.gitignore b/testcases/kernel/syscalls/pipe/.gitignore
index 90b502547..23e7186a6 100644
--- a/testcases/kernel/syscalls/pipe/.gitignore
+++ b/testcases/kernel/syscalls/pipe/.gitignore
@@ -10,3 +10,4 @@
 /pipe10
 /pipe11
 /pipe12
+/pipe13
diff --git a/testcases/kernel/syscalls/pipe/pipe13.c b/testcases/kernel/syscalls/pipe/pipe13.c
new file mode 100644
index 000000000..c2a89ba02
--- /dev/null
+++ b/testcases/kernel/syscalls/pipe/pipe13.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * Test Description:
+ * This is a case to test whether pipe can wakeup all readers
+ * when last writer closes.
+ *
+ * This bug was introduced by commit 0ddad21d3e99 ("pipe: use exclusive
+ * waits when reading or writing").
+ * This bug has been fixed by commit 6551d5c56eb0 ("pipe: make sure to
+ * wake up everybody when the last reader/writer closes").
+ */
+#include <unistd.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <stdlib.h>
+#include "tst_test.h"
+
+static void verify_pipe(void)
+{
+	int fds[2];
+	int status1, status2;
+	pid_t p1, p2;
+	int ret;
+
+	SAFE_PIPE(fds);
+
+	p1 = SAFE_FORK();
+	if (p1 == 0) {
+		SAFE_CLOSE(fds[1]);
+		SAFE_READ(0, fds[0], &status1, sizeof(status1));
+		exit(0);
+	}
+	p2 = SAFE_FORK();
+	if (p2 == 0) {
+		SAFE_CLOSE(fds[1]);
+		SAFE_READ(0, fds[0], &status2, sizeof(status2));
+		exit(0);
+	}
+
+	sleep(1);
+	SAFE_CLOSE(fds[1]);
+
+	SAFE_WAITPID(p1, &status1, 0);
+	ret = waitpid(p2, &status2, WNOHANG);
+	if (ret == p2) {
+		tst_res(TPASS, "pipe wakes up everybody when last write closes");
+	} else {
+		tst_res(TFAIL, "pipe doesn't wake up every body when last write closes");
+		SAFE_KILL(p2, SIGKILL);
+		SAFE_WAIT(&status2);
+	}
+}
+
+static struct tst_test test = {
+	.test_all = verify_pipe,
+	.forks_child = 1,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "6551d5c56eb"},
+		{}
+	}
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
