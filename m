Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 091301B40A0
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:47:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69FE83C2985
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:47:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DCD0A3C622E
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:46:50 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 63BB31A00E32
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:46:48 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,414,1580745600"; d="scan'208";a="89476344"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 18:45:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5DF284BCC884
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 18:34:46 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 18:45:21 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 22 Apr 2020 18:45:25 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 22 Apr 2020 18:45:29 +0800
Message-ID: <1587552329-21738-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 5DF284BCC884.AFFB7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
 runtest/syscalls                           |   1 +
 testcases/kernel/syscalls/pipe2/.gitignore |   1 +
 testcases/kernel/syscalls/pipe2/pipe2_03.c | 172 +++++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 9bb72beb2..16add02d3 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -916,6 +916,7 @@ pipe13 pipe13
 
 pipe2_01 pipe2_01
 pipe2_02 pipe2_02
+pipe2_03 pipe2_03
 pipe2_04 pipe2_04
 
 pivot_root01 pivot_root01
diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/syscalls/pipe2/.gitignore
index 773450a48..ede1da65e 100644
--- a/testcases/kernel/syscalls/pipe2/.gitignore
+++ b/testcases/kernel/syscalls/pipe2/.gitignore
@@ -1,3 +1,4 @@
 /pipe2_01
 /pipe2_02
+/pipe2_03
 /pipe2_04
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_03.c b/testcases/kernel/syscalls/pipe2/pipe2_03.c
new file mode 100644
index 000000000..0314f9eda
--- /dev/null
+++ b/testcases/kernel/syscalls/pipe2/pipe2_03.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * This case is designed to test the basic functionality about the
+ * O_DIRECT flag of pipe2.
+ *
+ * It includes three sub tests.
+ * 1) Each write(2) to the pipe is dealt with as a separate packet, and
+ * read(2)s from the pipe will read one packet at a time.
+ * 2) Writes of greater than PIPE_BUF bytes (see pipe(7)) will be split
+ * into multiple packet.
+ * 3)If a read(2) specifies a buffer size that is smaller than the next
+ * packet, then the requested number of bytes are read, and the excess
+ * bytes in the packet are discarded.
+ */
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <linux/limits.h>
+#include "lapi/fcntl.h"
+#include "tst_test.h"
+
+static int fds[2], packet_num, pipe_size;
+static char *wrbuf;
+static char *rdbuf;
+static void check_peer_rw(void);
+static void check_split(void);
+static void check_discard(void);
+
+static void (*test_func[])(void) = {check_peer_rw, check_split, check_discard};
+
+static void check_peer_rw(void)
+{
+	int i, pid;
+
+	SAFE_PIPE2(fds, O_DIRECT | O_NONBLOCK);
+
+	pid = SAFE_FORK();
+	if (!pid) {
+		SAFE_CLOSE(fds[1]);
+		memset(rdbuf, 0, pipe_size);
+		TST_CHECKPOINT_WAIT(0);
+		for (i = 0; i < packet_num; i++) {
+			TEST(SAFE_READ(0, fds[0], rdbuf, pipe_size));
+			if (TST_RET != 1)
+				tst_res(TFAIL,
+					"Each read(2) doesn't read a separate packet, return %ld", TST_RET);
+		}
+		tst_res(TPASS, "Each read(2) reads a separate packet");
+		 _exit(0);
+	}
+
+	SAFE_CLOSE(fds[0]);
+	for (i = 0; i < packet_num; i++)
+		SAFE_WRITE(1, fds[1], "x", 1);
+
+	TEST(write(fds[1], "x", 1));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "write succeeded unexpectedly");
+	} else {
+		if (TST_ERR == EAGAIN)
+			tst_res(TPASS, "Each write(2) uses a separate packet");
+		else
+			tst_res(TFAIL | TTERRNO, "write failed, expected EAGAIN but got");
+	}
+	TST_CHECKPOINT_WAKE(0);
+	tst_reap_children();
+	SAFE_CLOSE(fds[1]);
+}
+
+static void check_split(void)
+{
+	int i, pid;
+
+	SAFE_PIPE2(fds, O_DIRECT);
+
+	pid = SAFE_FORK();
+	if (!pid) {
+		SAFE_CLOSE(fds[1]);
+		memset(rdbuf, 0, pipe_size);
+		TST_CHECKPOINT_WAIT(0);
+		for (i = 0; i < 2; i++) {
+			TEST(SAFE_READ(0, fds[0], rdbuf, pipe_size));
+			if (TST_RET != PIPE_BUF)
+				tst_res(TFAIL,
+					"write(higner than PIPE_BUF) split into multiple packet, return %ld", TST_RET);
+		}
+		tst_res(TPASS, "write(higner than PIPE_BUF) split into multiple packet");
+		 _exit(0);
+	}
+	SAFE_CLOSE(fds[0]);
+	SAFE_WRITE(1, fds[1], wrbuf, PIPE_BUF * 2);
+	TST_CHECKPOINT_WAKE(0);
+	tst_reap_children();
+	SAFE_CLOSE(fds[1]);
+}
+
+static void check_discard(void)
+{
+	int pid;
+	char tmp_buf[20];
+	char tmp_secondbuf[20];
+
+	SAFE_PIPE2(fds, O_DIRECT);
+
+	pid = SAFE_FORK();
+	if (!pid) {
+		SAFE_CLOSE(fds[1]);
+		TST_CHECKPOINT_WAIT(0);
+		TEST(SAFE_READ(0, fds[0], tmp_buf, 20));
+		if (TST_RET != 20)
+			tst_res(TFAIL,
+				"the excess bytes in the packet isn't discarded by read, return %ld", TST_RET);
+		TEST(SAFE_READ(0, fds[0], tmp_secondbuf, 20));
+		if (TST_RET == 1) {
+			if (!memcmp(tmp_secondbuf, "1", 1))
+				tst_res(TPASS,
+					"the excess bytes in the packet is discarded by read, only read 1");
+			else
+				tst_res(TFAIL,
+					"the excess bytes in the packet is discarded by read, expect 1 got %s", tmp_secondbuf);
+		}
+		 _exit(0);
+	}
+	SAFE_CLOSE(fds[0]);
+	SAFE_WRITE(1, fds[1], wrbuf, PIPE_BUF);
+	SAFE_WRITE(1, fds[1], "1", 1);
+	TST_CHECKPOINT_WAKE(0);
+	tst_reap_children();
+	SAFE_CLOSE(fds[1]);
+}
+
+static void verify_pipe2(unsigned int n)
+{
+	(*test_func[n])();
+}
+
+static void setup(void)
+{
+	SAFE_PIPE2(fds, O_DIRECT);
+	pipe_size = SAFE_FCNTL(fds[1], F_GETPIPE_SZ);
+	wrbuf = SAFE_MALLOC(PIPE_BUF * 2);
+	rdbuf = SAFE_MALLOC(pipe_size);
+	memset(wrbuf, 'x', PIPE_BUF * 2);
+	packet_num = pipe_size / PIPE_BUF;
+	SAFE_CLOSE(fds[0]);
+	SAFE_CLOSE(fds[1]);
+}
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
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.test = verify_pipe2,
+	.tcnt = ARRAY_SIZE(test_func),
+	.needs_checkpoints = 1,
+};
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
