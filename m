Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5F41A2AEE
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 23:18:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8799D3C2D27
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 23:18:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id ED3663C2D3D
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 23:18:02 +0200 (CEST)
Received: from confino.investici.org (confino.investici.org
 [IPv6:2a00:c38:11e:ffff::a020])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7D62B200CFE
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 23:18:02 +0200 (CEST)
Received: from mx1.investici.org (unknown [127.0.0.1])
 by confino.investici.org (Postfix) with ESMTP id 9ACD521722;
 Wed,  8 Apr 2020 21:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
 s=stigmate; t=1586380681;
 bh=E0zCn0YqzbQOktOrg3Xfa49F1op5nwRKWy/PuGqx4tQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HxRj4Jk6AXl4MBamucxd18gCi5eI61egOC6P9ZmTht5FKaaZTehDvZcZhsunsxhnE
 RG7ArPSKhqAvzk1dmNGCS9oNpubhBDsbSI9RMbORw3i8W4SgsDGlpTZw3rLbG2OoAM
 ApFAsT1ZiYYuSWnwb4WHqw1HMR7ceBkTlEDy2nsI=
Received: from [212.103.72.250] (mx1.investici.org [212.103.72.250])
 (Authenticated sender: laniel_francis@privacyrequired.com) by localhost
 (Postfix) with ESMTPSA id 7A19A20EB7; 
 Wed,  8 Apr 2020 21:18:01 +0000 (UTC)
From: laniel_francis@privacyrequired.com
To: ltp@lists.linux.it
Date: Wed,  8 Apr 2020 23:17:01 +0200
Message-Id: <20200408211700.7958-3-laniel_francis@privacyrequired.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <208a947b-a64a-0962-b3de-0756f1cc1c92@cn.fujitsu.com>
References: <208a947b-a64a-0962-b3de-0756f1cc1c92@cn.fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] Add new test for pipe2 with/without O_NONBLOCK
 mode.
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

From: Francis Laniel <laniel_francis@privacyrequired.com>

The new test (pipe2_03.c) checks the following:
1. Create a pipe with O_NONBLOCK.
2. Check that this flag is set.
3. Check that pipe size is 16 * PAGE_SIZE.
4. Reduce pipe size to PAGE_SIZE.
5. Write buffer bigger than page size and see that second write fails.
6. Set pipe's flags to default.
7. Fork and do a write in the child, its state must be 'S' and is checked from
the father.
---
 testcases/kernel/syscalls/pipe2/.gitignore |   1 +
 testcases/kernel/syscalls/pipe2/pipe2_03.c | 128 +++++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_03.c

diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/syscalls/pipe2/.gitignore
index cd38bb309..01d980dba 100644
--- a/testcases/kernel/syscalls/pipe2/.gitignore
+++ b/testcases/kernel/syscalls/pipe2/.gitignore
@@ -1,2 +1,3 @@
 /pipe2_01
 /pipe2_02
+/pipe2_03
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_03.c b/testcases/kernel/syscalls/pipe2/pipe2_03.c
new file mode 100644
index 000000000..c2b182e02
--- /dev/null
+++ b/testcases/kernel/syscalls/pipe2/pipe2_03.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Francis Laniel. All rights reserved.
+ * Author: Francis Laniel <laniel_francis@privacyrequired.com>
+ *
+ * Test Description:
+ * This Program tests getting and setting the pipe size.
+ * It also tests what happen when you write to a full pipe depending on whether
+ * O_NONBLOCK is set or not.
+ */
+#define _GNU_SOURCE
+#include <stdlib.h>
+#include <features.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <assert.h>
+#include <sys/select.h>
+
+#include "lapi/fcntl.h"
+#include "tst_test.h"
+
+#define PAGE_NR 16
+#define SECONDS 3
+#define MICROSECONDS 0
+
+static int fds[2];
+static long page_size;
+
+static void setup(void)
+{
+	/*
+	 * Create the pipe with O_NONBLOCK.
+	 */
+	SAFE_PIPE2(fds, O_NONBLOCK);
+
+	/*
+	 * Get the system page size.
+	 */
+	page_size = SAFE_SYSCONF(_SC_PAGESIZE);
+}
+
+static void test_pipe2(void)
+{
+	long flags;
+	long pipe_size;
+
+	char *buf;
+
+	pid_t pid;
+	int status;
+
+	flags = SAFE_FCNTL(fds[0], F_GETFL);
+
+	if (!(flags & O_NONBLOCK))
+		tst_res(TFAIL, "O_NONBLOCK flag must be set.");
+
+	pipe_size = SAFE_FCNTL(fds[0], F_GETPIPE_SZ);
+
+	if (pipe_size != page_size * PAGE_NR)
+		tst_res(TFAIL, "Default pipe page is 16 * 4096 = 65536B.");
+
+	/*
+	 * A pipe has two file descriptors.
+	 * But in the kernel these two file descriptors point to the same pipe.
+	 * So setting size from first file handle set size for the pipe.
+	 */
+	SAFE_FCNTL(fds[0], F_SETPIPE_SZ, 0);
+
+	/*
+	 * So getting size from the second file descriptor return the size of
+	 * the pipe which was changed before with first file descriptor.
+	 */
+	pipe_size = SAFE_FCNTL(fds[1], F_GETPIPE_SZ);
+
+	if (pipe_size != page_size)
+		tst_res(TFAIL, "Pipe size (%ld) must be page size (%ld)",
+			pipe_size, page_size);
+
+	buf = alloca(page_size);
+
+	SAFE_WRITE(1, fds[1], buf, page_size);
+
+	/*
+	 * This write should return -1 because pipe is already full.
+	 */
+	if (write(fds[1], buf, page_size) != -1)
+		tst_res(TFAIL | TERRNO, "write() succeeded and should not");
+
+	SAFE_FCNTL(fds[1], F_SETFL, flags & ~O_NONBLOCK);
+
+	flags = SAFE_FCNTL(fds[1], F_GETFL);
+
+	if (flags & O_NONBLOCK)
+		tst_res(TFAIL, "O_NONBLOCK flag must not be set.");
+
+	pid = SAFE_FORK();
+
+	/*
+	 * Since writes are now blocking the child must wait forever on this
+	 * write.
+	 */
+	if (!pid)
+		SAFE_WRITE(1, fds[1], buf, page_size);
+
+	if (TST_PROCESS_STATE_WAIT(pid, 'S', 1000))
+		tst_res(TFAIL, "Child must be stopped.");
+	else
+		tst_res(TPASS, "Child is stopped.");
+
+	SAFE_KILL(pid, SIGKILL);
+
+	SAFE_WAIT(&status);
+}
+
+static void cleanup(void)
+{
+	for (int i = 0; i < 2; i++)
+		if (fds[i] > 0)
+			SAFE_CLOSE(fds[i]);
+}
+
+static struct tst_test test = {
+	.test_all = test_pipe2,
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+};
\ No newline at end of file
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
