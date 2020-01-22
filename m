Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9B1456F9
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 14:43:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 542A83C23B0
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 14:43:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 187043C23BF
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 14:43:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B7BF2200C71
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 14:43:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A3EBAFB7
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 13:43:27 +0000 (UTC)
From: Jorik Cronenberg <jcronenberg@suse.de>
To: ltp@lists.linux.it
Date: Wed, 22 Jan 2020 14:42:39 +0100
Message-Id: <20200122134239.28844-2-jcronenberg@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200122134239.28844-1-jcronenberg@suse.de>
References: <20200122134239.28844-1-jcronenberg@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/vmsplice: Add NONBLOCK testcase
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

Add a testcase for vmsplice() with the flag SPLICE_F_NONBLOCK.
And also test that vmsplice() blocks when writing to a full pipe
without the flag specified.

Signed-off-by: Jorik Cronenberg <jcronenberg@suse.de>
---
 testcases/kernel/syscalls/vmsplice/.gitignore |  1 +
 .../kernel/syscalls/vmsplice/vmsplice04.c     | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 testcases/kernel/syscalls/vmsplice/vmsplice04.c

diff --git a/testcases/kernel/syscalls/vmsplice/.gitignore b/testcases/kernel/syscalls/vmsplice/.gitignore
index 03922073c..042c32585 100644
--- a/testcases/kernel/syscalls/vmsplice/.gitignore
+++ b/testcases/kernel/syscalls/vmsplice/.gitignore
@@ -1,3 +1,4 @@
 /vmsplice01
 /vmsplice02
 /vmsplice03
+/vmsplice04
diff --git a/testcases/kernel/syscalls/vmsplice/vmsplice04.c b/testcases/kernel/syscalls/vmsplice/vmsplice04.c
new file mode 100644
index 000000000..c49657d84
--- /dev/null
+++ b/testcases/kernel/syscalls/vmsplice/vmsplice04.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 SUSE LLC
+ * Author: Jorik Cronenberg <jcronenberg@suse.de>
+ *
+ * Test vmsplice() to a full pipe with SPLICE_F_NONBLOCK and without
+ * With SPLICE_F_NONBLOCK vmsplice() should return with errno EAGAIN
+ * Without SPLICE_F_NONBLOCK it should block
+ */
+
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+#include "lapi/vmsplice.h"
+#include <stdlib.h>
+
+
+static int pipes[2];
+static ssize_t pipe_max_size;
+static char *write_buffer;
+
+static void vmsplice_test(void)
+{
+	int status;
+	struct iovec iov;
+	int pid;
+
+	iov.iov_base = write_buffer;
+	iov.iov_len = pipe_max_size;
+
+
+	TEST(vmsplice(pipes[1], &iov, 1, 0));
+	if (TST_RET < 0)
+		tst_brk(TBROK | TTERRNO,
+		    "Initial vmsplice() to fill pipe failed");
+
+	TEST(vmsplice(pipes[1], &iov, 1, SPLICE_F_NONBLOCK));
+	if (TST_RET < 0 && TST_ERR == EAGAIN)
+		tst_res(TPASS | TTERRNO, "vmsplice failed as expected");
+	else if (TST_RET < 0)
+		tst_res(TFAIL | TTERRNO,
+		    "vmsplice failed with unexpected errno");
+	else
+		tst_res(TFAIL, "vmsplice wrote to a full pipe");
+
+	pid = SAFE_FORK();
+	if (!pid) {
+		TEST(vmsplice(pipes[1], &iov, 1, 0));
+		if (TST_RET < 0)
+			tst_res(TFAIL | TTERRNO, "vmsplice() failed");
+		else
+			tst_res(TFAIL, "vmsplice() wrote to a full pipe");
+		exit(0);
+	} else {
+		if (TST_PROCESS_STATE_WAIT2(pid, 'S', 1000) < 0)
+			return;
+		else
+			tst_res(TPASS, "vmsplice() blocked");
+		SAFE_KILL(pid, SIGKILL);
+		SAFE_WAIT(&status);
+	}
+
+}
+static void cleanup(void)
+{
+	if (pipes[1] > 0)
+		SAFE_CLOSE(pipes[1]);
+	if (pipes[0] > 0)
+		SAFE_CLOSE(pipes[0]);
+	if (write_buffer)
+		free(write_buffer);
+}
+static void setup(void)
+{
+	SAFE_PIPE(pipes);
+
+	pipe_max_size = SAFE_FCNTL(pipes[1], F_GETPIPE_SZ);
+	write_buffer = SAFE_MALLOC(pipe_max_size);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = vmsplice_test,
+	.min_kver = "2.6.17",
+	.forks_child = 1,
+};
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
