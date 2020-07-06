Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEBF215209
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 07:09:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5EEA3C29D4
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 07:09:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 283A73C0356
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 07:09:30 +0200 (CEST)
Received: from mail.zilogic.com (mail.zilogic.com [45.33.14.236])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id BE6D6600B7C
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 07:09:29 +0200 (CEST)
Date: Mon, 06 Jul 2020 05:08:28 -0000
To: ltp@lists.linux.it
Message-ID: <20200706050828.5134-1-shwetha@zilogic.com>
From: "Shwetha Subramanian" <shwetha@zilogic.com>
Received: from shwetha.shwetha (broadband.actcorp.in [183.83.154.177])
 by mail.zilogic.com; Mon, 06 Jul 2020 05:08:39 -0000
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Add mincore() test for anonymous mappings
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
Cc: vijaykumar@zilogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Changes from v1:
	1.Changed testcase description.
	2.Checked ptr before executing SAFE_MUNMAP() in cleanup().
	3.Added a setup() fuction.
	4.Fixed formatting issues.
	5.Changed TPASS and TFAIL messages.
	6.Changed syntax for conditional statements. 

References: #461

Signed-off-by: Shwetha Subramanian. <shwetha@zilogic.com>
Reviewed-by: Vijay Kumar B. <vijaykumar@zilogic.com>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/mincore/.gitignore  |  1 +
 testcases/kernel/syscalls/mincore/mincore03.c | 83 +++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 testcases/kernel/syscalls/mincore/mincore03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index b4d523319..e0fe9f87e 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -879,6 +879,7 @@ open_tree02 open_tree02
 
 mincore01 mincore01
 mincore02 mincore02
+mincore03 mincore03
 
 madvise01 madvise01
 madvise02 madvise02
diff --git a/testcases/kernel/syscalls/mincore/.gitignore b/testcases/kernel/syscalls/mincore/.gitignore
index fdb2070e9..fcbe27eac 100644
--- a/testcases/kernel/syscalls/mincore/.gitignore
+++ b/testcases/kernel/syscalls/mincore/.gitignore
@@ -1,2 +1,3 @@
 /mincore01
 /mincore02
+/mincore03
\ No newline at end of file
diff --git a/testcases/kernel/syscalls/mincore/mincore03.c b/testcases/kernel/syscalls/mincore/mincore03.c
new file mode 100644
index 000000000..774fce98b
--- /dev/null
+++ b/testcases/kernel/syscalls/mincore/mincore03.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Zilogic Systems Pvt. Ltd., 2020
+ * Email: code@zilogic.com
+ */
+
+/*
+ * mincore03
+ * Testcase 1: Test shows that pages mapped as anonymous and
+ * not faulted, are reported as not resident in memory by mincore().
+ * Testcase 2: Test shows that pages mapped as anonymous and faulted,
+ * are reported as resident in memory by mincore().
+ */
+
+#include <stdbool.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include "tst_test.h"
+
+#define NUM_PAGES 3
+
+static struct tcase {
+	bool mlock;
+	int expected_pages;
+	char *desc;
+} tcases[] = {
+	{ false, 0, "untouched pages are not resident"},
+	{ true, NUM_PAGES, "locked pages are resident"},
+};
+
+static int size, page_size;
+static void *ptr;
+
+static void cleanup(void)
+{
+	if (ptr)
+		SAFE_MUNMAP(ptr, size);
+}
+
+static void setup(void)
+{
+	page_size = getpagesize();
+	size = page_size * NUM_PAGES;
+}
+
+static void test_mincore(unsigned int test_nr)
+{
+	const struct tcase *tc = &tcases[test_nr];
+	unsigned char vec[NUM_PAGES];
+	int locked_pages;
+	int count, mincore_ret;
+
+	ptr = SAFE_MMAP(NULL, size,  PROT_WRITE | PROT_READ, MAP_PRIVATE |  MAP_ANONYMOUS, 0, 0);
+	if (tc->mlock)
+		SAFE_MLOCK(ptr, size);
+
+	mincore_ret = mincore(ptr, size, vec);
+	if (mincore_ret == -1)
+		tst_brk(TBROK | TERRNO, "mincore failed");
+	locked_pages = 0;
+	for (count = 0; count < NUM_PAGES; count++)
+		if (vec[count] & 1)
+			locked_pages++;
+
+	if (locked_pages == tc->expected_pages)
+		tst_res(TPASS, "mincore() reports %s", tc->desc);
+	else
+		tst_res(TFAIL, "mincore reports resident pages as %d, but expected %d",
+			locked_pages, tc->expected_pages);
+
+	if (tc->mlock)
+		SAFE_MUNLOCK(ptr, size);
+	SAFE_MUNMAP(ptr, size);
+	ptr = NULL;
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = test_mincore,
+};
+
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
