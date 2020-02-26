Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1916F5F1
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 04:07:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42D0E3C137A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 04:07:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D1EA73C08C9
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 04:07:21 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 3E1A92005C3
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 04:07:19 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,486,1574092800"; d="scan'208";a="84168095"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Feb 2020 11:05:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id DB4A950A9978;
 Wed, 26 Feb 2020 10:55:54 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 26 Feb 2020 11:05:37 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 26 Feb 2020 11:05:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Wed, 26 Feb 2020 11:06:23 +0800
Message-ID: <1582686383-23299-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200225102850.GA5077@rei.lan>
References: <20200225102850.GA5077@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: DB4A950A9978.AEB8B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3] syscalls/pipe13: Add regression test for pipe to
 wake up all readers
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
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
v2->v3:
1.use Cyril's waitpid way and add his signed-off-by
2. change child num to 10, IMO, it is more meaningful than 2
 runtest/syscalls                          |  1 +
 testcases/kernel/syscalls/pipe/.gitignore |  1 +
 testcases/kernel/syscalls/pipe/pipe13.c   | 87 +++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 testcases/kernel/syscalls/pipe/pipe13.c

diff --git a/runtest/syscalls b/runtest/syscalls
index d2551b2ec..f51456b8f 100644
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
index 000000000..cc3f9f55f
--- /dev/null
+++ b/testcases/kernel/syscalls/pipe/pipe13.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * Test Description:
+ * This case is designed to test whether pipe can wakeup all readers
+ * when last writer closes.
+ *
+ * This is also a regression test for commit 6551d5c56eb0
+ * ("pipe: make sure to wake up everybody when the last reader/writer closes").
+ * This bug was introduced by commit 0ddad21d3e99 ("pipe: use exclusive
+ * waits when reading or writing").
+ */
+#include <unistd.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <stdlib.h>
+#include "tst_test.h"
+
+#define CHILD_NUM 10
+
+static int pid[CHILD_NUM];
+static int fds[2];
+static char buf;
+
+static void do_child(unsigned int i)
+{
+	SAFE_CLOSE(fds[1]);
+	TST_CHECKPOINT_WAKE(i);
+	SAFE_READ(0, fds[0], &buf, 1);
+	exit(0);
+}
+
+static void verify_pipe(void)
+{
+	int ret;
+	unsigned int i, cnt = 0, sleep_us = 1, fail = 0;
+
+	SAFE_PIPE(fds);
+	tst_res(TINFO, "Creating %d child processes", CHILD_NUM);
+	for (i = 0; i < CHILD_NUM; i++) {
+		pid[i] = SAFE_FORK();
+		if (pid[i] == 0)
+			do_child(i);
+		TST_CHECKPOINT_WAIT(i);
+		TST_PROCESS_STATE_WAIT(pid[i], 'S', 0);
+	}
+	SAFE_CLOSE(fds[1]);
+	while (cnt < CHILD_NUM && sleep_us < 100000) {
+		ret = waitpid(-1, NULL, WNOHANG);
+		if (ret < 0)
+			tst_brk(TBROK | TERRNO, "waitpid()");
+		if (ret > 0) {
+			cnt++;
+			for (i = 0; i < CHILD_NUM; i++) {
+				if (pid[i] == ret)
+					pid[i] = 0;
+			}
+			continue;
+		}
+		usleep(sleep_us);
+		sleep_us *= 2;
+	}
+	for (i = 0; i < CHILD_NUM; i++) {
+		if (pid[i]) {
+			tst_res(TINFO, "pid %i still sleeps", pid[i]);
+			fail = 1;
+			SAFE_KILL(pid[i], SIGKILL);
+			SAFE_WAIT(NULL);
+		}
+	}
+	if (fail)
+		tst_res(TFAIL, "Closed pipe didn't wake up everyone");
+	else
+		tst_res(TPASS, "Closed pipe waked up everyone");
+}
+
+static struct tst_test test = {
+	.test_all = verify_pipe,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "6551d5c56eb"},
+		{}
+	}
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
