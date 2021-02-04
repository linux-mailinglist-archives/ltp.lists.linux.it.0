Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F5130F2F6
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 13:13:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56C5C3C7352
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 13:13:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 8A4A03C7381
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 13:12:44 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 432B714010E5
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 13:12:42 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="104197347"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Feb 2021 20:12:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B970F4CE6D8D;
 Thu,  4 Feb 2021 20:12:38 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Feb 2021 20:12:39 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <liwang@redhat.com>
Date: Thu, 4 Feb 2021 20:12:41 +0800
Message-ID: <1612440762-22389-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
 <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B970F4CE6D8D.AFA30
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/5] syscalls/mallinfo02: Add a basic test to check
 use mmap or sbrk
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

According mallinfo man-page, hblkhd member represents
"The number of bytes in blocks currently allocated using mmap(2).".
For allocations greater than or equal to 128K and that can't be satisfied from
the free list, the memory-allocation functions employ mmap(2) instead of increasing
the program break using sbrk(2).

In this case, we test 20k size to use sbrk and 128k size to use mmap.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
v1->v2:
1.Use mallopt(M_MMAP_THRESHOLD, 131072) to avoid dynamic mmap threshold
2.Use tst_print_malinfo api 
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/mallinfo/.gitignore |  1 +
 .../kernel/syscalls/mallinfo/mallinfo02.c     | 64 +++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 testcases/kernel/syscalls/mallinfo/mallinfo02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 753340068..a8fa3f7bf 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -683,6 +683,7 @@ lstat02 lstat02
 lstat02_64 lstat02_64
 
 mallinfo01 mallinfo01
+mallinfo02 mallinfo02
 
 mallopt01 mallopt01
 
diff --git a/testcases/kernel/syscalls/mallinfo/.gitignore b/testcases/kernel/syscalls/mallinfo/.gitignore
index a7e32a637..678ac277e 100644
--- a/testcases/kernel/syscalls/mallinfo/.gitignore
+++ b/testcases/kernel/syscalls/mallinfo/.gitignore
@@ -1 +1,2 @@
 /mallinfo01
+/mallinfo02
diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo02.c b/testcases/kernel/syscalls/mallinfo/mallinfo02.c
new file mode 100644
index 000000000..d5bed45a8
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo/mallinfo02.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic mallinfo() test for malloc() using sbrk or mmap.
+ * It size > MMAP_THRESHOLD, it will use mmap. Otherwise, use sbrk.
+\*/
+
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+#include "tst_mallinfo.h"
+
+#ifdef HAVE_MALLINFO
+void test_mallopt(void)
+{
+	struct mallinfo info;
+	int size;
+	char *buf;
+
+	buf = SAFE_MALLOC(20480);
+
+	info = mallinfo();
+	if (info.uordblks > 20480 && info.hblkhd == 0) {
+		tst_res(TPASS, "malloc() uses sbrk when size < 128k");
+	} else {
+		tst_res(TFAIL, "malloc() use mmap when size < 128k");
+		tst_print_mallinfo("Test malloc(20480)", &info);
+	}
+	free(buf);
+
+	info = mallinfo();
+	size = MAX(info.fordblks, 131072);
+
+	buf = SAFE_MALLOC(size);
+	info = mallinfo();
+	if (info.hblkhd > size && info.hblks > 0) {
+		tst_res(TPASS, "malloc() uses mmap when size >= 128k");
+	} else {
+		tst_res(TFAIL, "malloc uses sbrk when size >= 128k");
+		tst_print_mallinfo("Test malloc(1024*128)", &info);
+	}
+
+	free(buf);
+}
+
+static void setup(void)
+{
+	if (mallopt(M_MMAP_THRESHOLD, 131072) == 0)
+		tst_res(TFAIL, "mallopt(M_MMAP_THRESHOLD, 128K) failed");
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = test_mallopt,
+};
+
+#else
+TST_TEST_TCONF("system doesn't implement non-POSIX mallinfo()");
+#endif
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
