Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 288721AB9F2
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 09:29:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5E4D3C649B
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 09:29:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id BC36F3C6480
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 09:29:19 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id F1E3B1001420
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 09:29:17 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,390,1580745600"; d="scan'208";a="89140500"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Apr 2020 15:29:13 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 9A15150A996E
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 15:18:40 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Apr 2020 15:29:11 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 16 Apr 2020 15:29:13 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 16 Apr 2020 15:29:01 +0800
Message-ID: <1587022142-32122-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 9A15150A996E.ABCA9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/3] syscalls/pipe2_02: Add new test for pipe2
 O_CLOEXEC flag
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
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/pipe2/.gitignore    |  2 +
 testcases/kernel/syscalls/pipe2/pipe2_02.c    | 69 +++++++++++++++++++
 .../kernel/syscalls/pipe2/pipe2_02_child.c    | 26 +++++++
 4 files changed, 98 insertions(+)
 create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_02.c
 create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_02_child.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 79b671d50..44254d7da 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -911,6 +911,7 @@ pipe12 pipe12
 pipe13 pipe13
 
 pipe2_01 pipe2_01
+pipe2_02 pipe2_02
 
 pivot_root01 pivot_root01
 
diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/syscalls/pipe2/.gitignore
index 42350bbdc..786222de2 100644
--- a/testcases/kernel/syscalls/pipe2/.gitignore
+++ b/testcases/kernel/syscalls/pipe2/.gitignore
@@ -1 +1,3 @@
 /pipe2_01
+/pipe2_02
+/pipe2_02_child
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_02.c b/testcases/kernel/syscalls/pipe2/pipe2_02.c
new file mode 100644
index 000000000..743d78c58
--- /dev/null
+++ b/testcases/kernel/syscalls/pipe2/pipe2_02.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * This case is designed to test the basic functionality about the
+ * O_CLOEXEC flag of pipe2.
+ */
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include "lapi/fcntl.h"
+#include "tst_test.h"
+
+#define TESTBIN "pipe2_02_child"
+static int fds[2];
+
+static void cleanup(void)
+{
+	if (fds[0] > 0)
+		SAFE_CLOSE(fds[0]);
+	if (fds[1] > 0)
+		SAFE_CLOSE(fds[1]);
+}
+
+static void verify_pipe2(void)
+{
+	int pid, status;
+	char buf[20];
+
+	SAFE_PIPE2(fds, O_CLOEXEC);
+	sprintf(buf, "%d", fds[1]);
+	pid = SAFE_FORK();
+	if (pid == 0) {
+		if (execlp(TESTBIN, TESTBIN, buf, NULL))
+			exit(2);
+	}
+
+	SAFE_WAIT(&status);
+	if (WIFEXITED(status)) {
+		switch (WEXITSTATUS(status)) {
+		case 0:
+			tst_res(TPASS, "test O_CLOEXEC for pipe2 success");
+		break;
+		case 1:
+			tst_res(TFAIL, "test O_CLOEXEC for pipe2 failed");
+		break;
+		default:
+			tst_brk(TBROK, "execlp() failed");
+		}
+	} else {
+		tst_brk(TBROK, "%s exits with unexpected error", TESTBIN);
+	}
+	cleanup();
+}
+
+static const char *const resfile[] = {
+	TESTBIN,
+	NULL,
+};
+
+static struct tst_test test = {
+	.resource_files = resfile,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.needs_root = 1,
+	.test_all = verify_pipe2,
+};
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_02_child.c b/testcases/kernel/syscalls/pipe2/pipe2_02_child.c
new file mode 100644
index 000000000..d5ed68cf7
--- /dev/null
+++ b/testcases/kernel/syscalls/pipe2/pipe2_02_child.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com
+ */
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <unistd.h>
+
+int main(int argc, char **argv)
+{
+	int ret;
+	int fd;
+
+	if (argc != 2) {
+		fprintf(stderr, "Only two arguments: %s <fd>\n", argv[0]);
+		exit(1);
+	}
+
+	fd = atoi(argv[1]);
+	ret = write(fd, "x", 1);
+
+	return ret != -1;
+}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
