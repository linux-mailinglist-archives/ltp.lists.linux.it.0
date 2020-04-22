Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4CD1B40A3
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:47:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2821A3C297C
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:47:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9565E3C297A
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:46:59 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id BBC781A00E38
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:46:47 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,414,1580745600"; d="scan'208";a="89476279"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 18:45:19 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 9E7B04BCC89D
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 18:34:43 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 18:45:18 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 22 Apr 2020 18:45:22 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 22 Apr 2020 18:45:28 +0800
Message-ID: <1587552329-21738-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 9E7B04BCC89D.A162D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/3] syscalls/pipe2_02: Add new test for pipe2
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
 testcases/kernel/syscalls/pipe2/.gitignore    |  1 +
 testcases/kernel/syscalls/pipe2/pipe2_02.c    | 67 +++++++++++++++++++
 .../kernel/syscalls/pipe2/pipe2_02_child.c    | 26 +++++++
 4 files changed, 95 insertions(+)
 create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_02.c
 create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_02_child.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 6c240d375..9bb72beb2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -915,6 +915,7 @@ pipe12 pipe12
 pipe13 pipe13
 
 pipe2_01 pipe2_01
+pipe2_02 pipe2_02
 pipe2_04 pipe2_04
 
 pivot_root01 pivot_root01
diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/syscalls/pipe2/.gitignore
index 14866e393..773450a48 100644
--- a/testcases/kernel/syscalls/pipe2/.gitignore
+++ b/testcases/kernel/syscalls/pipe2/.gitignore
@@ -1,2 +1,3 @@
 /pipe2_01
+/pipe2_02
 /pipe2_04
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_02.c b/testcases/kernel/syscalls/pipe2/pipe2_02.c
new file mode 100644
index 000000000..e02857e38
--- /dev/null
+++ b/testcases/kernel/syscalls/pipe2/pipe2_02.c
@@ -0,0 +1,67 @@
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
+	if (pid == 0)
+		SAFE_EXECLP(TESTBIN, TESTBIN, buf, NULL);
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
index 000000000..fa0f881e9
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
+#include <fcntl.h>
+
+int main(int argc, char **argv)
+{
+	int fd;
+
+	if (argc != 2) {
+		fprintf(stderr, "Only two arguments: %s <fd>\n", argv[0]);
+		exit(1);
+	}
+
+	fd = atoi(argv[1]);
+	if (fcntl(fd, F_GETFL) < 0 && errno == EBADF)
+		return 0;
+
+	return 1;
+}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
