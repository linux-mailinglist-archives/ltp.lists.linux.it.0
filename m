Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6789830399B
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 10:55:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3657E3C304F
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 10:55:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 36F1A3C5ED0
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 10:55:45 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 6C6C51400DC6
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 10:55:43 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; d="scan'208";a="103847576"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Jan 2021 17:55:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 197FA4CE6781
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 17:55:37 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 26 Jan 2021 17:55:36 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 26 Jan 2021 17:55:25 +0800
Message-ID: <1611654925-8994-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 197FA4CE6781.AEA27
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1 3/3] syscalls/mallinfo03: Add an overflow test when
 setting 2G size
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

Since these members of mallinfo struct use int data type, it will overflow
when allocating 2G size. mallinfo() is deprecated and we should use mallinfo2()
in the future.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/mallinfo/.gitignore |  1 +
 .../kernel/syscalls/mallinfo/mallinfo03.c     | 62 +++++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 testcases/kernel/syscalls/mallinfo/mallinfo03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 74ad999e8..8fe123f8c 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -684,6 +684,7 @@ lstat02_64 lstat02_64
 
 mallinfo01 mallinfo01
 mallinfo02 mallinfo02
+mallinfo03 mallinfo03
 
 mallopt01 mallopt01
 
diff --git a/testcases/kernel/syscalls/mallinfo/.gitignore b/testcases/kernel/syscalls/mallinfo/.gitignore
index 678ac277e..30c315cf2 100644
--- a/testcases/kernel/syscalls/mallinfo/.gitignore
+++ b/testcases/kernel/syscalls/mallinfo/.gitignore
@@ -1,2 +1,3 @@
 /mallinfo01
 /mallinfo02
+/mallinfo03
diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo03.c b/testcases/kernel/syscalls/mallinfo/mallinfo03.c
new file mode 100644
index 000000000..e8dc35e42
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo/mallinfo03.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic mallinfo() test. Test the member of struct mallinfo
+ * whether overflow when setting 2G size. mallinfo() is deprecated
+ * since the type used for the fields is too small. We should use
+ * mallinfo2() and it was added since glibc 2.33.
+\*/
+
+#include <malloc.h>
+
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+
+#ifdef HAVE_MALLINFO
+static void print_mallinfo(const char *msg, struct mallinfo *m)
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
+	struct mallinfo info;
+	char *buf;
+	size_t size = 2UL * 1024UL * 1024UL * 1024UL;
+
+	buf = SAFE_MALLOC(size);
+	info = mallinfo();
+	if (info.hblkhd < 0) {
+		print_mallinfo("Test malloc 2G", &info);
+		tst_res(TFAIL, "The member of struct mallinfo overflow, we should use mallinfo2");
+	} else {
+		/*We will never get here*/
+		tst_res(TPASS, "The member of struct mallinfo doesn't overflow");
+	}
+	free(buf);
+}
+
+static struct tst_test test = {
+	.test_all = test_mallinfo,
+};
+
+#else
+TST_TEST_TCONF("system doesn't implement non-POSIX mallinfo()");
+#endif
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
