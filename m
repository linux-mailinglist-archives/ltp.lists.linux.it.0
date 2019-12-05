Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D7B113D6E
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 09:58:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBAF63C23C6
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 09:58:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 178473C23B4
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 09:58:54 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 792B1602801
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 09:58:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1C5D0ACCA
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 08:58:52 +0000 (UTC)
From: Jorik Cronenberg <jcronenberg@suse.de>
To: ltp@lists.linux.it
Date: Thu,  5 Dec 2019 09:58:03 +0100
Message-Id: <20191205085803.24636-1-jcronenberg@suse.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2]syscalls/vmsplice: Add testcase
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

Add vmsplice03 to test splicing from a pipe to user memory.

Signed-off-by: Jorik Cronenberg <jcronenberg@suse.de>
---

V2:

Fixed issues pointed out by Cyril

 testcases/kernel/syscalls/vmsplice/.gitignore |  1 +
 .../kernel/syscalls/vmsplice/vmsplice03.c     | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 testcases/kernel/syscalls/vmsplice/vmsplice03.c

diff --git a/testcases/kernel/syscalls/vmsplice/.gitignore b/testcases/kernel/syscalls/vmsplice/.gitignore
index 2cc74a956..03922073c 100644
--- a/testcases/kernel/syscalls/vmsplice/.gitignore
+++ b/testcases/kernel/syscalls/vmsplice/.gitignore
@@ -1,2 +1,3 @@
 /vmsplice01
 /vmsplice02
+/vmsplice03
diff --git a/testcases/kernel/syscalls/vmsplice/vmsplice03.c b/testcases/kernel/syscalls/vmsplice/vmsplice03.c
new file mode 100644
index 000000000..88a387906
--- /dev/null
+++ b/testcases/kernel/syscalls/vmsplice/vmsplice03.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 SUSE LLC
+ * Author: Jorik Cronenberg <jcronenberg@suse.de>
+ *
+ * Test vmsplice() from a pipe into user memory
+ */
+
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+#include "lapi/fcntl.h"
+#include "lapi/vmsplice.h"
+
+
+#define TEST_BLOCK_SIZE (64*1024)	/* 64K */
+
+static char buffer[TEST_BLOCK_SIZE];
+
+static void vmsplice_test(void)
+{
+	int written, i;
+	int pipes[2];
+	struct iovec iov;
+	char arr_write[TEST_BLOCK_SIZE];
+
+	iov.iov_base = arr_write;
+	iov.iov_len = TEST_BLOCK_SIZE;
+	memset(arr_write, 0, TEST_BLOCK_SIZE);
+
+	SAFE_PIPE(pipes);
+	SAFE_WRITE(1, pipes[1], buffer, TEST_BLOCK_SIZE);
+	written = vmsplice(pipes[0], &iov, 1, 0);
+
+	if (written < 0)
+		tst_brk(TBROK | TERRNO, "vmsplice() failed");
+
+	if (written == 0)
+		tst_res(TFAIL, "vmsplice() didn't write anything");
+	else {
+		for (i = 0; i < TEST_BLOCK_SIZE; i++) {
+			if (arr_write[i] != buffer[i]) {
+				tst_res(TFAIL,
+					"Wrong data in user memory at %i", i);
+				break;
+			}
+		}
+		if (i == written)
+			tst_res(TPASS, "Spliced correctly into user memory");
+	}
+
+	SAFE_CLOSE(pipes[1]);
+	SAFE_CLOSE(pipes[0]);
+}
+
+static void setup(void)
+{
+	int i;
+
+	for (i = 0; i < TEST_BLOCK_SIZE; i++)
+		buffer[i] = i & 0xff;
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = vmsplice_test,
+	.min_kver = "2.6.23",
+};
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
