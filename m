Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA674F4907
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Nov 2019 13:00:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C9263C1CBA
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Nov 2019 13:00:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7F5D23C1D56
 for <ltp@lists.linux.it>; Fri,  8 Nov 2019 13:00:31 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id BA024600724
 for <ltp@lists.linux.it>; Fri,  8 Nov 2019 13:00:28 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,281,1569254400"; d="scan'208";a="78065026"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 20:00:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 36CE84B6AE15;
 Fri,  8 Nov 2019 19:52:18 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 8 Nov 2019 20:00:23 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Fri, 8 Nov 2019 20:00:19 +0800
Message-ID: <1573214419-15435-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1573214419-15435-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20191107130543.GD22352@rei.lan>
 <1573214419-15435-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 36CE84B6AE15.AD448
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v5 2/2] syscalls/prctl09: New timer sample test for
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

It also moves test setup function before timer setup function,
so we can get this set value.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 lib/tst_timer_test.c                       |  8 ++--
 runtest/syscalls                           |  1 +
 testcases/kernel/syscalls/prctl/.gitignore |  1 +
 testcases/kernel/syscalls/prctl/Makefile   |  2 +-
 testcases/kernel/syscalls/prctl/prctl09.c  | 47 ++++++++++++++++++++++
 5 files changed, 53 insertions(+), 6 deletions(-)
 create mode 100644 testcases/kernel/syscalls/prctl/prctl09.c

diff --git a/lib/tst_timer_test.c b/lib/tst_timer_test.c
index f6459e5c0..13e9deff2 100644
--- a/lib/tst_timer_test.c
+++ b/lib/tst_timer_test.c
@@ -340,6 +340,9 @@ static void timer_setup(void)
 	struct timespec t;
 	int ret;
 
+	if (setup)
+		setup();
+
 	tst_clock_getres(CLOCK_MONOTONIC, &t);
 
 	tst_res(TINFO, "CLOCK_MONOTONIC resolution %lins", (long)t.tv_nsec);
@@ -360,16 +363,11 @@ static void timer_setup(void)
 	tst_res(TINFO, "PR_GET_TIMERSLACK not defined, using %uus",
 		timerslack);
 #endif /* PR_GET_TIMERSLACK */
-
 	parse_timer_opts();
 
 	samples = SAFE_MALLOC(sizeof(long long) * MAX(MAX_SAMPLES, sample_cnt));
-
 	if (set_latency() < 0)
 		tst_res(TINFO, "Failed to set zero latency constraint: %m");
-
-	if (setup)
-		setup();
 }
 
 static void timer_cleanup(void)
diff --git a/runtest/syscalls b/runtest/syscalls
index fee91f909..e4e162b23 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -880,6 +880,7 @@ prctl05 prctl05
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
index 000000000..e4d76ef85
--- /dev/null
+++ b/testcases/kernel/syscalls/prctl/prctl09.c
@@ -0,0 +1,47 @@
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
+static void setup(void)
+{
+	TEST(prctl(PR_SET_TIMERSLACK, 200000));
+	if (TST_RET != 0)
+		tst_brk(TBROK | TTERRNO,
+			"prctl set timerslack 200us failed");
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.scall = "prctl()",
+	.sample = sample_fn,
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
