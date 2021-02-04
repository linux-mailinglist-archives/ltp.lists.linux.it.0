Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C403E30F2F1
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 13:12:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 308333C736E
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 13:12:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 445AC3C015D
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 13:12:37 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9F76F60020E
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 13:12:36 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="104197343"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Feb 2021 20:12:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A6AC34CE6D90;
 Thu,  4 Feb 2021 20:12:34 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Feb 2021 20:12:35 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <liwang@redhat.com>
Date: Thu, 4 Feb 2021 20:12:40 +0800
Message-ID: <1612440762-22389-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
 <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A6AC34CE6D90.AED9B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/5] syscalls/mallinfo01: Add a basic test for
 mallinfo
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

Referring to glibc test tst-mallinfo2.c[1], add a test to test mallinfo.
Also check mallinfo in autotools.

[1]https://sourceware.org/git/?p=glibc.git;a=blob;f=malloc/tst-mallinfo2.c

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
v1->v2
1.use tst_print_mallinfo api
2.use buf array
3.use 160 multiple instead of 16
4.add free chunk check
 runtest/syscalls                              |  2 +
 testcases/kernel/syscalls/mallinfo/.gitignore |  1 +
 testcases/kernel/syscalls/mallinfo/Makefile   |  8 ++
 .../kernel/syscalls/mallinfo/mallinfo01.c     | 82 +++++++++++++++++++
 4 files changed, 93 insertions(+)
 create mode 100644 testcases/kernel/syscalls/mallinfo/.gitignore
 create mode 100644 testcases/kernel/syscalls/mallinfo/Makefile
 create mode 100644 testcases/kernel/syscalls/mallinfo/mallinfo01.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 11a1e83c2..753340068 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -682,6 +682,8 @@ lstat01_64 lstat01_64
 lstat02 lstat02
 lstat02_64 lstat02_64
 
+mallinfo01 mallinfo01
+
 mallopt01 mallopt01
 
 mbind01 mbind01
diff --git a/testcases/kernel/syscalls/mallinfo/.gitignore b/testcases/kernel/syscalls/mallinfo/.gitignore
new file mode 100644
index 000000000..a7e32a637
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo/.gitignore
@@ -0,0 +1 @@
+/mallinfo01
diff --git a/testcases/kernel/syscalls/mallinfo/Makefile b/testcases/kernel/syscalls/mallinfo/Makefile
new file mode 100644
index 000000000..044619fb8
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) International Business Machines  Corp., 2001
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo01.c b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
new file mode 100644
index 000000000..add3c0df3
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic mallinfo() test. Refer to glibc test mallinfo2 test
+ * https://sourceware.org/git/?p=glibc.git;a=blob;f=malloc/tst-mallinfo2.c
+\*/
+
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+#include "tst_mallinfo.h"
+
+#ifdef HAVE_MALLINFO
+#define M_NUM 20
+static struct mallinfo info1;
+static void *buf[M_NUM + 1];
+
+static void cleanup(void)
+{
+	int i;
+
+	for (i = M_NUM; i > 0; i--) {
+		if (buf[i]) {
+			free(buf[i]);
+			buf[i] = NULL;
+		}
+	}
+}
+
+void test_mallinfo(void)
+{
+	int i;
+	int total = 0;
+	struct mallinfo info2;
+
+	for (i = 1; i <= M_NUM; i++) {
+		buf[i] = SAFE_MALLOC(160 * i);
+		total += 160 * i;
+	}
+	info2 = mallinfo();
+	tst_print_mallinfo("Test uordblks", &info2);
+	if (info2.uordblks > info1.uordblks + total)
+		tst_res(TPASS, "mallinfo() uordblks passed");
+	else
+		tst_res(TFAIL, "mallinfo() uordblks failed");
+
+	//Create another free chunk
+	free(buf[M_NUM/2]);
+	buf[M_NUM/2] = NULL;
+	info2 = mallinfo();
+	tst_print_mallinfo("Test ordblks", &info2);
+	if (info2.ordblks == info1.ordblks + 1)
+		tst_res(TPASS, "mallinfo() ordblks passed");
+	else
+		tst_res(TFAIL, "mallinfo() ordblks failed");
+
+	cleanup();
+}
+
+static void setup(void)
+{
+	if (sizeof(info1.arena) != sizeof(int))
+		tst_res(TFAIL, "The member of mallinfo struct is not int");
+
+	info1 = mallinfo();
+	tst_print_mallinfo("Start", &info1);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = test_mallinfo,
+	.cleanup = cleanup,
+};
+
+#else
+TST_TEST_TCONF("system doesn't implement non-POSIX mallinfo()");
+#endif
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
