Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDDE19E6E9
	for <lists+linux-ltp@lfdr.de>; Sat,  4 Apr 2020 19:51:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 936E13C2F36
	for <lists+linux-ltp@lfdr.de>; Sat,  4 Apr 2020 19:51:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9F2303C2F06
 for <ltp@lists.linux.it>; Sat,  4 Apr 2020 19:51:13 +0200 (CEST)
Received: from latitanza.investici.org (latitanza.investici.org
 [82.94.249.234])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 358166007A5
 for <ltp@lists.linux.it>; Sat,  4 Apr 2020 19:51:11 +0200 (CEST)
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 819D31201B2;
 Sat,  4 Apr 2020 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
 s=stigmate; t=1586022671;
 bh=s17Z2gkJStqPDJe5aIAW//+FJn21rSSsdh2WG6x8Mrw=;
 h=From:To:Cc:Subject:Date:From;
 b=nMRbAELv3RNIXS8lnn2d1lBKwcIJFRQUFwgZvM5+88M3BUpsQT/1NZc7w05IgWtjw
 8m7XvfHUtF7TdHyHhDNXb6ZZx0g99WV3WsUn/qJmBZZCddkfNPjH5WnfjjYlnMi7Pi
 sfVkp6ciBP6PzqTJNUN+Nfx9WCg/Bx83QDNhGwFY=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: laniel_francis@privacyrequired.com) by localhost
 (Postfix) with ESMTPSA id 3D96A1201B0; 
 Sat,  4 Apr 2020 17:51:11 +0000 (UTC)
From: laniel_francis@privacyrequired.com
To: ltp@lists.linux.it
Date: Sat,  4 Apr 2020 19:50:55 +0200
Message-Id: <20200404175055.8568-1-laniel_francis@privacyrequired.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] Increase pipe2() coverage.
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

A new test was added (pipe2_03.c), this test checks the following:
1. Create a pipe with O_NONBLOCK.
2. Check that this flag is set.
3. Check that pipe size is 65536B.
4. Reduce pipe size to 4096B.
5. Write buffer bigger than page size and see that second write fails.
6. Set pipe's flags to default.
7. Check that pipe is still full with select.
---
 testcases/kernel/syscalls/pipe2/.gitignore |   1 +
 testcases/kernel/syscalls/pipe2/pipe2_03.c | 215 +++++++++++++++++++++
 2 files changed, 216 insertions(+)
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
index 000000000..ea225fddc
--- /dev/null
+++ b/testcases/kernel/syscalls/pipe2/pipe2_03.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) Francis Laniel, 2020                                         */
+/******************************************************************************/
+/******************************************************************************/
+/*                                                                            */
+/* File:        pipe2_03.c                                                    */
+/*                                                                            */
+/* Description: This Program tests getting and setting the pipe size.         */
+/*              It also tests what happen when you write to a full pipe       */
+/*              depending on whether O_NONBLOCK is or not.                    */
+/*                                                                            */
+/* Usage:  <for command-line>                                                 */
+/* pipe2_03 [-c n] [-e][-i n] [-I x] [-p x] [-t]                              */
+/*      where,  -c n : Run n copies concurrently.                             */
+/*              -e   : Turn on errno logging.                                 */
+/*              -i n : Execute test n times.                                  */
+/*              -I x : Execute test for x seconds.                            */
+/*              -P x : Pause for x seconds between iterations.                */
+/*              -t   : Turn on syscall timing.                                */
+/*                                                                            */
+/* Total Tests: 1                                                             */
+/*                                                                            */
+/* Test Name:   pipe2_03                                                      */
+/*                                                                            */
+/* Author:      Francis Laniel                                                */
+/*                                                                            */
+/* History:     Created - Mar 28 2020 - Francis Laniel                        */
+/******************************************************************************/
+#define _GNU_SOURCE
+#include <stdlib.h>
+#include <features.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <assert.h>
+#include <sys/select.h>
+
+#include "tst_test.h"
+
+#define PAGE_NR 16
+#define READ_SIDE 0
+#define WRITE_SIDE 1
+#define SECONDS 3
+#define MICROSECONDS 0
+
+/**
+ * The two file descriptors of the pipe.
+ */
+static int fds[2];
+
+/**
+ * This variable will contain the system page size after setup.
+ */
+static long page_size;
+
+/**
+ * Setup everything.
+ * This function will:
+ * 1. Create the pipe with O_NONBLOCK.
+ * 2. Get system page size with sysconf().
+ */
+static void setup(void)
+{
+	/*
+	 * Check that Linux version is greater than 2.6.35 to be able to use
+	 * F_GETPIPE_SZ and F_SETPIPE_SZ.
+	 */
+	if (tst_kvercmp(2, 6, 35) < 0)
+		tst_brk(TCONF, "This test can only run on kernels that are 2.6.35 and higher");
+
+	/*
+	 * Create the pip with O_NONBLOCK.
+	 */
+	if (pipe2(fds, O_NONBLOCK))
+		tst_brk(TBROK | TERRNO, "pipe2() failed");
+
+	/*
+	 * Get the system page size.
+	 */
+	page_size = SAFE_SYSCONF(_SC_PAGESIZE);
+}
+
+/**
+ * Test everything.
+ */
+static void test_pipe2(void)
+{
+	int ret;
+
+	long flags;
+	long pipe_size;
+
+	char *buf;
+
+	fd_set set;
+	struct timeval timeout;
+
+	/*
+	 * Get the flags of the pipe.
+	 */
+	flags = SAFE_FCNTL(fds[0], F_GETFL);
+
+	if (!(flags & O_NONBLOCK))
+		tst_res(TFAIL, "O_NONBLOCK flag must be set.");
+
+	/*
+	 * Get the size of the pipe.
+	 */
+	pipe_size = SAFE_FCNTL(fds[0], F_GETPIPE_SZ);
+
+	if (pipe_size != page_size * PAGE_NR)
+		tst_res(TFAIL, "Default pipe page is 16 * 4096 = 65536B.");
+
+	/*
+	 * A pipe has two file descriptors.
+	 * But in the kernel these two file descriptors point to the same pipe.
+	 * So setting size from first file handle set size for the pipe.
+	 *
+	 * Moreover, the size of a pipe is exprimed in page.
+	 * So the minimal size of a pipe is a page size, setting its size to 0
+	 * leads to a pipe whom size is 4096B.
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
+	/*
+	 * Create a buffer of page size.
+	 * We create it in stack because we do not care of its lifetime.
+	 */
+	buf = alloca(page_size);
+
+	SAFE_WRITE(1, fds[WRITE_SIDE], buf, page_size);
+
+	/*
+	 * This write should return -1 because pipe is already full.
+	 */
+	if (write(fds[WRITE_SIDE], buf, page_size) != -1)
+		tst_res(TFAIL | TERRNO, "write() succeeded and should not");
+
+	/*
+	 * Remove the O_NONBLOCK parameter for the pipe.
+	 * After this call write to the pipe will be blocking.
+	 */
+	SAFE_FCNTL(fds[0], F_SETFL, flags & ~O_NONBLOCK);
+
+	/*
+	 * Get again the flags of the pipe.
+	 */
+	flags = SAFE_FCNTL(fds[0], F_GETFL);
+
+	if (flags & O_NONBLOCK)
+		tst_res(TFAIL, "O_NONBLOCK flag must not be set.");
+
+	/*
+	 * Empty the set so no garbage value is in it.
+	 */
+	FD_ZERO(&set);
+
+	/*
+	 * Add the write side of the pipe to the set.
+	 */
+	FD_SET(fds[WRITE_SIDE], &set);
+
+	if (!FD_ISSET(fds[WRITE_SIDE], &set))
+		tst_res(TFAIL, "Pipe must be in the set.");
+
+	timeout.tv_sec = SECONDS;
+	timeout.tv_usec = MICROSECONDS;
+
+	/*
+	 * Since writes are now blocking we use select to check if the pipe is
+	 * available to receive write.
+	 * Wait SECONDS seconds and MICROSECONDS microseconds on write side of
+	 * the pipe.
+	 */
+	ret = select(1, NULL, &set, NULL, &timeout);
+
+	if (ret == -1)
+		tst_res(TFAIL | TERRNO, "select() failed");
+
+	/*
+	 * The pipe is still full so select should return after the waiting time
+	 * returning 0 because write side of the pipe is not available because
+	 * it is full.
+	 */
+	if (ret)
+		tst_res(TFAIL, "Pipe is not full.");
+	else
+		tst_res(TPASS, "Pipe is still full.");
+}
+
+/**
+ * Clean everything either if test is finished or if something failed.
+ */
+static void cleanup(void)
+{
+	for (int i = 0; i < 2; i++)
+		if (fds[i])
+			SAFE_CLOSE(fds[i]);
+}
+
+static struct tst_test test = {
+	.test_all = test_pipe2,
+	.setup = setup,
+	.cleanup = cleanup,
+};
\ No newline at end of file
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
