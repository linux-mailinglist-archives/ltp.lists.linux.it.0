Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9883A12A75C
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Dec 2019 11:29:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED0F83C242E
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Dec 2019 11:28:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 696623C0823
 for <ltp@lists.linux.it>; Wed, 25 Dec 2019 11:28:55 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 8EB611401B51
 for <ltp@lists.linux.it>; Wed, 25 Dec 2019 11:28:52 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,354,1571673600"; d="scan'208";a="80766670"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Dec 2019 18:28:48 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 229CD4CE1514
 for <ltp@lists.linux.it>; Wed, 25 Dec 2019 18:19:59 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 25 Dec 2019 18:28:46 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 25 Dec 2019 18:28:46 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 25 Dec 2019 18:29:28 +0800
Message-ID: <1577269768-30118-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 229CD4CE1514.AE345
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/pipe12: add new test for pipe when write
 bytes > PIPE_BUF
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

A pipe has a limited capacity. If the pipe with non block mode is full,
then a write(2) will fail and get EAGAIN error. Otherwise, from 1 to
PIPE_BUF bytes may be written.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                          |   1 +
 testcases/kernel/syscalls/pipe/.gitignore |   1 +
 testcases/kernel/syscalls/pipe/pipe12.c   | 102 ++++++++++++++++++++++
 3 files changed, 104 insertions(+)
 create mode 100644 testcases/kernel/syscalls/pipe/pipe12.c

diff --git a/runtest/syscalls b/runtest/syscalls
index f58fefe17..b1deea600 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -863,6 +863,7 @@ pipe08 pipe08
 pipe09 pipe09
 pipe10 pipe10
 pipe11 pipe11
+pipe12 pipe12
 
 pipe2_01 pipe2_01
 pipe2_02 pipe2_02
diff --git a/testcases/kernel/syscalls/pipe/.gitignore b/testcases/kernel/syscalls/pipe/.gitignore
index ee2974ca8..90b502547 100644
--- a/testcases/kernel/syscalls/pipe/.gitignore
+++ b/testcases/kernel/syscalls/pipe/.gitignore
@@ -9,3 +9,4 @@
 /pipe09
 /pipe10
 /pipe11
+/pipe12
diff --git a/testcases/kernel/syscalls/pipe/pipe12.c b/testcases/kernel/syscalls/pipe/pipe12.c
new file mode 100644
index 000000000..63befc97c
--- /dev/null
+++ b/testcases/kernel/syscalls/pipe/pipe12.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * Test Description:
+ * A pipe has a limited capacity. If the pipe with non block mode is full,
+ * then a write(2) will fail and get EAGAIN error. Otherwise, from 1 to
+ * PIPE_BUF bytes may be written.
+ */
+#define _GNU_SOURCE
+#include <unistd.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include "tst_test.h"
+
+static int fds[2];
+static char *wrbuf;
+static char *rdbuf;
+static ssize_t max_size, invalid_size;
+
+static struct tcase {
+	int full_flag;
+	int need_offset;
+	char *message;
+} tcases[] = {
+	{1, 0, "Test on full pipe"},
+	{0, 1, "Test on non full pipe from 1 offset"},
+	{0, 0, "Test on non full pipe from 0 offset"},
+};
+
+static void verify_pipe(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	memset(rdbuf, 0, max_size);
+
+	tst_res(TINFO, "%s", tc->message);
+	if (tc->full_flag) {
+		SAFE_WRITE(1, fds[1], wrbuf, max_size);
+		TEST(write(fds[1], "x", 1));
+		if (TST_RET == 0) {
+			tst_res(TFAIL, "write succeed unexpectedly");
+			goto clean_pipe_buf;
+			return;
+		}
+		if (TST_ERR == EAGAIN)
+			tst_res(TPASS | TTERRNO, "write failed as expected");
+		else
+			tst_res(TFAIL | TTERRNO, "write failed expected EAGAIN but got");
+	} else {
+		if (tc->need_offset)
+			SAFE_WRITE(1, fds[1], "x", 1);
+		TEST(write(fds[1], wrbuf, invalid_size));
+		if (TST_RET == invalid_size)
+			tst_res(TFAIL, "write size %ld larger than PIPE_BUF %ld", TST_RET, max_size);
+		else
+			tst_res(TPASS, "write size %ld between [1, %ld]", TST_RET, max_size);
+	}
+
+clean_pipe_buf:
+	SAFE_READ(0, fds[0], rdbuf, max_size);
+}
+
+
+static void cleanup(void)
+{
+	if (fds[0] > 0)
+		SAFE_CLOSE(fds[0]);
+	if (fds[1] > 0)
+		SAFE_CLOSE(fds[1]);
+	if (wrbuf)
+		free(wrbuf);
+	if (rdbuf)
+		free(rdbuf);
+}
+
+static void setup(void)
+{
+
+	TEST(pipe(fds));
+	if (TST_RET == -1) {
+		tst_brk(TBROK | TTERRNO, "pipe");
+		return;
+	}
+
+	max_size = SAFE_FCNTL(fds[1], F_GETPIPE_SZ);
+	invalid_size = max_size + 4096;
+	wrbuf = SAFE_MALLOC(invalid_size);
+	rdbuf = SAFE_MALLOC(max_size);
+	memset(wrbuf, 'x', invalid_size);
+
+	SAFE_FCNTL(fds[1], F_SETFL, O_NONBLOCK);
+	SAFE_FCNTL(fds[0], F_SETFL, O_NONBLOCK);
+}
+
+static struct tst_test test = {
+	.test = verify_pipe,
+	.setup = setup,
+	.cleanup = cleanup,
+	.tcnt = ARRAY_SIZE(tcases),
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
