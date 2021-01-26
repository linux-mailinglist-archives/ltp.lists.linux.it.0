Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B815830399A
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 10:55:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 903193C5D25
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 10:55:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B23393C0752
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 10:55:39 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 38A241000A1D
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 10:55:35 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; d="scan'208";a="103847560"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Jan 2021 17:55:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 1A5114CE6014
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 17:55:25 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 26 Jan 2021 17:55:24 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 26 Jan 2021 17:55:23 +0800
Message-ID: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1A5114CE6014.AB034
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/3] syscalls/mallinfo01: Add a basic test for
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Referring to glibc test tst-mallinfo2.c[1], add a test to test mallinfo.
Also check mallinfo in autotools.

[1]https://sourceware.org/git/?p=glibc.git;a=blob;f=malloc/tst-mallinfo2.c

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 configure.ac                                  |  1 +
 runtest/syscalls                              |  2 +
 testcases/kernel/syscalls/mallinfo/.gitignore |  1 +
 testcases/kernel/syscalls/mallinfo/Makefile   |  8 ++
 .../kernel/syscalls/mallinfo/mallinfo01.c     | 84 +++++++++++++++++++
 5 files changed, 96 insertions(+)
 create mode 100644 testcases/kernel/syscalls/mallinfo/.gitignore
 create mode 100644 testcases/kernel/syscalls/mallinfo/Makefile
 create mode 100644 testcases/kernel/syscalls/mallinfo/mallinfo01.c

diff --git a/configure.ac b/configure.ac
index 8bdb96300..223900ca1 100644
--- a/configure.ac
+++ b/configure.ac
@@ -94,6 +94,7 @@ AC_CHECK_FUNCS_ONCE([ \
     io_uring_register \
     io_uring_enter \
     kcmp \
+    mallinfo \
     mallopt \
     mkdirat \
     mknodat \
diff --git a/runtest/syscalls b/runtest/syscalls
index 576eacf83..d0a9a5145 100644
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
index 000000000..1a2a30af1
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic mallinfo() test. Refer to glibc test
+ * https://sourceware.org/git/?p=glibc.git;a=blob;f=malloc/tst-mallinfo2.c
+\*/
+
+#include <malloc.h>
+
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+
+#ifdef HAVE_MALLINFO
+static char *buf;
+static struct mallinfo info1;
+
+static void
+print_mallinfo(const char *msg, struct mallinfo *m)
+{
+	tst_res(TINFO, "%s...", msg);
+#define P(f) tst_res(TINFO, "%s: %d", #f, m->f)
+	P(arena);
+	P(ordblks);
+	P(smblks);
+	P(hblks);
+	P(hblkhd);
+	P(usmblks);
+	P(fsmblks);
+	P(uordblks);
+	P(fordblks);
+	P(keepcost);
+}
+
+void test_mallinfo(void)
+{
+	struct mallinfo info2;
+	int i;
+	int total = 0;
+
+	for (i = 1; i < 20; i++) {
+		buf = SAFE_MALLOC(160 * i);
+		total += 16 * i;
+	}
+
+	info2 = mallinfo();
+	print_mallinfo("Test", &info2);
+	if (info2.uordblks > info1.uordblks + total)
+		tst_res(TPASS, "mallinfo() passed");
+	else
+		tst_res(TFAIL, "mallinfo() failed");
+
+	info1 = info2;
+}
+
+static void setup(void)
+{
+	if (sizeof(info1.arena) != sizeof(int))
+		tst_res(TFAIL, "The member of mallinfo struct is not int");
+
+	info1 = mallinfo();
+	print_mallinfo("Start", &info1);
+}
+
+static void cleanup(void)
+{
+	if (buf)
+		free(buf);
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
