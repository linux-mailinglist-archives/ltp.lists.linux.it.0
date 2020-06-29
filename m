Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B220CFD3
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 17:49:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AAE93C5750
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 17:49:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 76B0E3C2AF0
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 17:49:14 +0200 (CEST)
Received: from mail.zilogic.com (mail.zilogic.com [45.33.14.236])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D673A600AB1
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 17:48:15 +0200 (CEST)
Date: Mon, 29 Jun 2020 15:48:21 -0000
To: ltp@lists.linux.it
Message-ID: <20200629154821.13349-1-shwetha@zilogic.com>
From: "Shwetha Subramanian" <shwetha@zilogic.com>
Received: from shwetha.shwetha (broadband.actcorp.in [49.205.78.75])
 by mail.zilogic.com; Mon, 29 Jun 2020 15:48:33 -0000
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Add mincore() test for anonymous mappings
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


  1. Tests for the results of mincore when anonymous mappings is
     done. It does so by mapping the memory using combination of mmap
     and MAP_ANONYMOUS options and testing it using mincore.

  2. It also tests mincore for pages that are mapped but not cached.
     It is done by mapping the memory ,touching it and testing it
     using mincore.

References: #461

Signed-off-by: Shwetha Subramanian. <shwetha@zilogic.com>
Reviewed-by: Vijay Kumar B. <vijaykumar@zilogic.com>

---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/mincore/.gitignore  |  1 +
 testcases/kernel/syscalls/mincore/mincore03.c | 82 +++++++++++++++++++
 3 files changed, 84 insertions(+)
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
index fdb2070e9..71c3e9864 100644
--- a/testcases/kernel/syscalls/mincore/.gitignore
+++ b/testcases/kernel/syscalls/mincore/.gitignore
@@ -1,2 +1,3 @@
 /mincore01
 /mincore02
+/mincore03
diff --git a/testcases/kernel/syscalls/mincore/mincore03.c b/testcases/kernel/syscalls/mincore/mincore03.c
new file mode 100644
index 000000000..53b05e57c
--- /dev/null
+++ b/testcases/kernel/syscalls/mincore/mincore03.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Zilogic Systems Pvt. Ltd., 2020
+ * Email: code@zilogic.com
+ */
+
+/*
+ * mincore03
+ * Testcase 1 : Tests mincore result for anonymous mapping
+ * Memory is mapped as anonymous.
+ * Mapped memory is not touched.
+ * Mincore is executed.
+ * Number of pages in cache is counted and compared to expected number of pages
+ * Testcase 2 : Tests mincore result for pages mapped but not cached yet
+ * Memory is mapped as anonymous.
+ * Mapped memory is touched.
+ * Mincore is executed.
+ * Number of pages in cache is counted and compared to expected number of pages
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
+} tcases[] = {
+	{ false, 0 },
+	{ true, NUM_PAGES },
+};
+
+static int size;
+static void *ptr;
+
+static void cleanup(void)
+{
+	SAFE_MUNMAP(ptr, size);
+}
+
+static void test_mincore(unsigned int test_nr)
+{
+	const struct tcase *tc = &tcases[test_nr];
+	unsigned char vec[NUM_PAGES];
+	int locked_pages;
+	int count, mincore_ret;
+	int result, page_size;
+
+	page_size = getpagesize();
+	size = page_size * NUM_PAGES;
+	ptr = SAFE_MMAP(NULL, size,  PROT_WRITE | PROT_READ, MAP_PRIVATE |  MAP_ANONYMOUS, 0, 0);
+	if (tc->mlock == true)
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
+		result = TPASS;
+	else
+		result = TFAIL;
+	tst_res(result, "no of pages in memory : %d no of pages expected in memory : %d",
+		locked_pages, tc->expected_pages);
+	
+	if (tc->mlock == true)
+		SAFE_MUNLOCK(ptr, size);
+	SAFE_MUNMAP(ptr, size);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.cleanup = cleanup,
+	.test = test_mincore,
+};
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
