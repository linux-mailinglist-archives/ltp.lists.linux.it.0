Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD6FD3846
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 06:23:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5C183C233C
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 06:23:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E26483C1C93
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 06:23:45 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E298A600C31
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 06:23:43 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,282,1566835200"; d="scan'208";a="76818119"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Oct 2019 12:23:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 6C7774CE1506;
 Fri, 11 Oct 2019 12:23:32 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 11 Oct 2019 12:23:39 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Fri, 11 Oct 2019 12:23:18 +0800
Message-ID: <1570767798-26685-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1570767798-26685-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20191009121906.GA7677@rei.lan>
 <1570767798-26685-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 6C7774CE1506.AD033
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/2] syscalls/prctl09: New timer sample test for
 PR_SET_TIMERSLACK
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                           |  1 +
 testcases/kernel/syscalls/prctl/.gitignore |  1 +
 testcases/kernel/syscalls/prctl/Makefile   |  2 +-
 testcases/kernel/syscalls/prctl/prctl09.c  | 45 ++++++++++++++++++++++
 4 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 testcases/kernel/syscalls/prctl/prctl09.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 76961a684..705d7f87e 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -879,6 +879,7 @@ prctl05 prctl05
 prctl06 prctl06
 prctl07 prctl07
 prctl08 prctl08
+prctl09 prctl09
 
 pread01 pread01
 pread01_64 pread01_64
diff --git a/testcases/kernel/syscalls/prctl/.gitignore b/testcases/kernel/syscalls/prctl/.gitignore
index fe36a8e0f..0f2c9b194 100644
--- a/testcases/kernel/syscalls/prctl/.gitignore
+++ b/testcases/kernel/syscalls/prctl/.gitignore
@@ -7,3 +7,4 @@
 /prctl06_execve
 /prctl07
 /prctl08
+/prctl09
diff --git a/testcases/kernel/syscalls/prctl/Makefile b/testcases/kernel/syscalls/prctl/Makefile
index cf19507c0..c02b6d1de 100644
--- a/testcases/kernel/syscalls/prctl/Makefile
+++ b/testcases/kernel/syscalls/prctl/Makefile
@@ -21,5 +21,5 @@ top_srcdir		?= ../../../..
 include $(top_srcdir)/include/mk/testcases.mk
 
 prctl07: LDLIBS += $(CAP_LIBS)
-
+prctl09: LDLIBS += -lrt
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/prctl/prctl09.c b/testcases/kernel/syscalls/prctl/prctl09.c
new file mode 100644
index 000000000..e8d9aabd0
--- /dev/null
+++ b/testcases/kernel/syscalls/prctl/prctl09.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+
+/*
+ * Test Description:
+ *  This is a timer sampling tests that timer slack is 200us.
+ */
+
+#include <errno.h>
+#include <sys/prctl.h>
+#include "lapi/prctl.h"
+#include "tst_timer_test.h"
+
+int sample_fn(int clk_id, long long usec)
+{
+	struct timespec t = tst_us_to_timespec(usec);
+
+	TEST(prctl(PR_SET_TIMERSLACK, 200000));
+	if (TST_RET != 0) {
+		tst_res(TFAIL | TTERRNO,
+			"prctl(), returned %li", TST_RET);
+		return 1;
+	}
+
+	tst_timer_start(clk_id);
+	TEST(nanosleep(&t, NULL));
+	tst_timer_stop();
+	tst_timer_sample();
+
+	if (TST_RET != 0) {
+		tst_res(TFAIL | TTERRNO,
+			"nanosleep() returned %li", TST_RET);
+		return 1;
+	}
+
+	return 0;
+}
+
+static struct tst_test test = {
+	.scall = "prctl()",
+	.sample = sample_fn,
+};
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
