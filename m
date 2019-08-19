Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8536B91E3E
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 09:46:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34B923C1D22
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 09:46:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0C5E53C1C6D
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 09:46:08 +0200 (CEST)
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BA58E1400B93
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 09:46:07 +0200 (CEST)
Received: by mail-lf1-x142.google.com with SMTP id c9so681566lfh.4
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 00:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ybjx0/ZGa1MBZovQ61fn4vSoKJqbuc5EbyENSY1R3o=;
 b=mzW8T79XaDO5HhNXYVCojOuvyNanFLJo9KkBqFn0YsiqTwzDmh8NFh8yT5wpepS5Uc
 gkLY82ihD2oKkIE6YTTZ7/V8c2FdAwmcknRhMKo61Vwb33hch4MNMypPGTSb2ZWF7Fg5
 FTuEPSCkMmWxM9Pq/7vlzshf0NHyi3P5DorF8BXueY3WmT9NsqYNQ89hMwSHmo1sUfLc
 70MH0JGBP9nu81j25DU8uhkiQJOssNh4XtvjlDS0vaOFtWh5L87OZ8y1foLUGDxGp83x
 8DxUUQa4oSGUTLmXppom0mPpJZAK1jJr8TRA3itjyRSv1i46FKAEVfjOm/9E3atIQ3O6
 Qggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ybjx0/ZGa1MBZovQ61fn4vSoKJqbuc5EbyENSY1R3o=;
 b=CdnbalJNjDlMx9zvyuiQveeltpLQPeXOfaxdtYX5LXjn07qVjQawDzJUTfnOfYmiMZ
 3jU1rnwKpy34pLsoJ2h1N2qlx/4yyrN884PAD/ex+yAjDCTgJifFV3ZHWY022lFnxC6o
 zbvyjROr8Z1NuCtvX84o1EjN/ClEZT7EKUrMB/4OxWW5nS/r9NFPdEBd4CyAJlcOxpEc
 J1bh2WnEEK5JyTbJP9n0h493puc/d14YpSJO1yzXWikUd6CtE2pUc07SwTvR7kz/ImtE
 YCfzBmbBprQGsktFmYBJnEO2znriYc1Kb2xgJ76B/jcsPrJrk/J/dOmYqqjlYQLwxdED
 0q0Q==
X-Gm-Message-State: APjAAAVy7Q/SpqWcUaB8J+9RDVoyJPNgnH+XX9QnP9fzrQgHCiyYzGb4
 LjFCJhzn0WPXGnCUNdKkqCEp2w3VKMY=
X-Google-Smtp-Source: APXvYqwrAYrZbGtApddt2nt3zF9btYqFgp9CCR4lPA3LeLMidTYGV/3l07+SW/6W7g8EdBefGCACGA==
X-Received: by 2002:a19:7709:: with SMTP id s9mr10861417lfc.86.1566200766786; 
 Mon, 19 Aug 2019 00:46:06 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id i123sm2418394lfi.72.2019.08.19.00.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 00:46:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 19 Aug 2019 09:46:01 +0200
Message-Id: <20190819074601.12094-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v5] syscalls/ioprio: Add test cases for I/O priority
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
Cc: Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The ioprio_get/ioprio_set syscalls are used primarily by the
userspace tool "ionice" to set priority of a process, user or
process group toward the I/O (block layer) scheduler.

This adds a simple iprio_get test and two more verbose tests
for ioprio_set.

Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Cyril Hrubis <chrubis@suse.cz>
Cc: Christian Amann <camann@suse.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v4->v5:
- Drop unnecessary MOD % operation around increades/decreased
  prio levels, as these are already tested to be valid.
- Fix up erroneous comment in the header of ioprio_set02.c
- Explain why we first set priority 4 before testing the
  illegal priority 8 in ioprio_set03.c with a verbose comment.
ChangeLog v3->v4:
- Rename syscall wrappers ioprio_get() and ioprio_set() to
  sys_ioprio_get() and sys_ioprio_set() to match the glibc
  convention.
- Issue tst_brk(TBROK ... if we can't even get the inital
  priority in the first prio set test.
- Add a define for the number of priorities and use arithmetic
  MOD to wrap priorities around from what they are at
  test start. Also use this define in prio test loops.
- Also report failed priority level in IDLE scheduling class
  priority test.
- Use TPASS|TTERRNO to print successful failure with the right
  error numbers on negative tests.
- Use TINFO on prints that more serve as information than as
  result of any test.
ChangeLog v2->v3:
- Add testcases to runtest/syscalls
- Add an info blurb to each test file
- Move syscall wrappers into ioprio.h
- Add helper to check that class is in range and use that
  consistently in the test cases
- Check the new priorities for validity when we bump the prio
  +1 and -2.
- Factor prio/class check function into the header as well
  and use the same in both setting tests
- Don't get the current prio before looping over all 8
  prios in ioprio_set02
- Break out the negative tests from ioprio_set02 to ioprio_set03
- Also check that the negative tests return EINVAL
- Diet down includes
- Use tst_syscall()
- Drop .min_kver since we use tst_syscall() to determine if
  the syscall is there
- Fixed relevant checkpatch warnings, left 80 col warnings
  as these are non-compulsory
ChangeLog v1->v2:
- Use the new test fixture "tst_test.h"
- Fix up legalese in the Makefile to a simple SPDX tag.
- Test from v2.6.13 when the syscall was introduced
---
 runtest/syscalls                              |  5 +
 testcases/kernel/syscalls/ioprio/.gitignore   |  4 +
 testcases/kernel/syscalls/ioprio/Makefile     |  6 ++
 testcases/kernel/syscalls/ioprio/ioprio.h     | 94 +++++++++++++++++++
 .../kernel/syscalls/ioprio/ioprio_get01.c     | 47 ++++++++++
 .../kernel/syscalls/ioprio/ioprio_set01.c     | 63 +++++++++++++
 .../kernel/syscalls/ioprio/ioprio_set02.c     | 67 +++++++++++++
 .../kernel/syscalls/ioprio/ioprio_set03.c     | 61 ++++++++++++
 8 files changed, 347 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioprio/.gitignore
 create mode 100644 testcases/kernel/syscalls/ioprio/Makefile
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio.h
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_get01.c
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_set01.c
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_set02.c
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_set03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 42c20042376a..700471a2cf07 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -542,6 +542,11 @@ ioperm02 ioperm02
 iopl01 iopl01
 iopl02 iopl02
 
+ioprio_get01 ioprio_get01
+ioprio_set01 ioprio_set01
+ioprio_set02 ioprio_set02
+ioprio_set03 ioprio_set03
+
 io_cancel01 io_cancel01
 io_destroy01 io_destroy01
 io_getevents01 io_getevents01
diff --git a/testcases/kernel/syscalls/ioprio/.gitignore b/testcases/kernel/syscalls/ioprio/.gitignore
new file mode 100644
index 000000000000..373079bf2219
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/.gitignore
@@ -0,0 +1,4 @@
+ioprio_get01
+ioprio_set01
+ioprio_set02
+ioprio_set03
diff --git a/testcases/kernel/syscalls/ioprio/Makefile b/testcases/kernel/syscalls/ioprio/Makefile
new file mode 100644
index 000000000000..5ea7d67db123
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ioprio/ioprio.h b/testcases/kernel/syscalls/ioprio/ioprio.h
new file mode 100644
index 000000000000..c74380475740
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
+ */
+
+#ifndef LTP_IOPRIO_H
+#define LTP_IOPRIO_H
+
+enum {
+	IOPRIO_CLASS_NONE = 0,
+	IOPRIO_CLASS_RT,
+	IOPRIO_CLASS_BE,
+	IOPRIO_CLASS_IDLE,
+};
+
+enum {
+	IOPRIO_WHO_PROCESS = 1,
+	IOPRIO_WHO_PGRP,
+	IOPRIO_WHO_USER,
+};
+
+/* The I/O scheduler classes have 8 priorities 0..7 except for the IDLE class */
+#define IOPRIO_PRIO_NUM		8
+
+#define IOPRIO_CLASS_SHIFT	(13)
+#define IOPRIO_PRIO_MASK	((1UL << IOPRIO_CLASS_SHIFT) - 1)
+
+#define IOPRIO_PRIO_CLASS(data)	((data) >> IOPRIO_CLASS_SHIFT)
+#define IOPRIO_PRIO_LEVEL(data)	((data) & IOPRIO_PRIO_MASK)
+#define IOPRIO_PRIO_VALUE(class, data)	(((class) << IOPRIO_CLASS_SHIFT) | data)
+
+static const char * const to_class_str[] = {
+	[IOPRIO_CLASS_NONE] = "NONE",
+	[IOPRIO_CLASS_RT]   = "REALTIME",
+	[IOPRIO_CLASS_BE]   = "BEST-EFFORT",
+	[IOPRIO_CLASS_IDLE] = "IDLE"
+};
+
+static inline int sys_ioprio_get(int which, int who)
+{
+	return tst_syscall(__NR_ioprio_get, which, who);
+}
+
+static inline int sys_ioprio_set(int which, int who, int ioprio)
+{
+	return tst_syscall(__NR_ioprio_set, which, who, ioprio);
+}
+
+/* Priority range from 0 (highest) to 7 (lowest) */
+static inline int prio_in_range(int prio)
+{
+	if ((prio < 0) || (prio > 7))
+		return 0;
+	return 1;
+}
+
+/* Priority range from 0 to 3 using the enum */
+static inline int class_in_range(int class)
+{
+	if ((class < IOPRIO_CLASS_NONE) || (class > IOPRIO_CLASS_IDLE))
+		return 0;
+	return 1;
+}
+
+static inline void ioprio_check_setting(int class, int prio, int report)
+{
+	int res;
+	int newclass, newprio;
+
+	res = sys_ioprio_get(IOPRIO_WHO_PROCESS, 0);
+	if (res == -1) {
+		tst_res(TFAIL | TTERRNO,
+			 "reading back prio failed");
+		return;
+	}
+
+	newclass = IOPRIO_PRIO_CLASS(res);
+	newprio = IOPRIO_PRIO_LEVEL(res);
+	if (newclass != class)
+		tst_res(TFAIL,
+			"wrong class after setting, expected %s got %s",
+			to_class_str[class],
+			to_class_str[newclass]);
+	else if (newprio != prio)
+		tst_res(TFAIL,
+			"wrong prio after setting, expected %d got %d",
+			prio, newprio);
+	else if (report)
+		tst_res(TPASS, "ioprio_set new class %s, new prio %d",
+			to_class_str[newclass],
+			newprio);
+}
+
+#endif
diff --git a/testcases/kernel/syscalls/ioprio/ioprio_get01.c b/testcases/kernel/syscalls/ioprio/ioprio_get01.c
new file mode 100644
index 000000000000..6e822434ee7f
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_get01.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
+ *
+ * Description:
+ * Basic ioprio_get() test. Gets the current process I/O priority and
+ * checks that the values are sane.
+ */
+#include <sys/types.h>
+#include <sys/syscall.h>
+
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+#include "ioprio.h"
+
+static void run(void)
+{
+	int prio, class;
+
+	/* Get the I/O priority for the current process */
+	TEST(sys_ioprio_get(IOPRIO_WHO_PROCESS, 0));
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "ioprio_get failed");
+		return;
+	}
+
+	class = IOPRIO_PRIO_CLASS(TST_RET);
+	prio = IOPRIO_PRIO_LEVEL(TST_RET);
+
+	if (!prio_in_range(prio)) {
+		tst_res(TFAIL, "ioprio out of range (%d)", prio);
+		return;
+	}
+
+	if (!class_in_range(class)) {
+		tst_res(TFAIL, "ioprio class of range (%d)", class);
+		return;
+	}
+
+	tst_res(TPASS, "ioprio_get returned class %s prio %d",
+		to_class_str[class], prio);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+};
diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set01.c b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
new file mode 100644
index 000000000000..24bf8a9caea9
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
+ *
+ * Description:
+ * Basic ioprio_set() test. Gets the current process I/O priority and
+ * bumps it up one notch, then down two notches and checks that the
+ * new priority is reported back correctly.
+ */
+#include <sys/types.h>
+#include <sys/syscall.h>
+
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+#include "ioprio.h"
+
+static void run(void)
+{
+	int class, prio;
+
+	/* Get the I/O priority for the current process */
+	TEST(sys_ioprio_get(IOPRIO_WHO_PROCESS, 0));
+
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "ioprio_get failed");
+
+	class = IOPRIO_PRIO_CLASS(TST_RET);
+	prio = IOPRIO_PRIO_LEVEL(TST_RET);
+	tst_res(TINFO, "ioprio_get returned class %s prio %d",
+		to_class_str[class], prio);
+
+	/* Bump prio to what it was + 1 */
+	class = IOPRIO_CLASS_BE;
+	if (!prio_in_range(prio + 1)) {
+		tst_res(TFAIL, "ioprio increase out of range (%d)", prio + 1);
+		return;
+	}
+	prio = (prio + 1);
+
+	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			    IOPRIO_PRIO_VALUE(class, prio)));
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "ioprio_set failed");
+	else
+		ioprio_check_setting(class, prio, 1);
+
+	/* Bump prio down two notches */
+	if (!prio_in_range(prio - 2)) {
+		tst_res(TFAIL, "ioprio increase out of range (%d)", prio - 2);
+		return;
+	}
+	prio = (prio - 2);
+	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			    IOPRIO_PRIO_VALUE(class, prio)));
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "ioprio_set failed");
+	else
+		ioprio_check_setting(class, prio, 1);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+};
diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set02.c b/testcases/kernel/syscalls/ioprio/ioprio_set02.c
new file mode 100644
index 000000000000..6a655394845c
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set02.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
+ *
+ * Description:
+ * Extended ioprio_set() test.
+ * Tests to set all 8 priority levels for best effort priority, then
+ * switches to test all 8 priority levels for idle priority. Also test
+ * some non-working priorities to make sure they don't work.
+ */
+#include <sys/types.h>
+#include <sys/syscall.h>
+
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+#include "ioprio.h"
+
+static void run(void)
+{
+	int class, prio;
+	int fail_in_loop;
+
+	/* Bump to best effort scheduling, all 8 priorities */
+	class = IOPRIO_CLASS_BE;
+
+	fail_in_loop = 0;
+	for (prio = 0; prio < IOPRIO_PRIO_NUM; prio++) {
+		TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
+				    IOPRIO_PRIO_VALUE(class, prio)));
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_BE prio %d failed", prio);
+			fail_in_loop = 1;
+		}
+	}
+	if (!fail_in_loop)
+		tst_res(TPASS, "tested all prios in class %s",
+			 to_class_str[class]);
+
+	/* Bump down to idle scheduling */
+	class = IOPRIO_CLASS_IDLE;
+
+	fail_in_loop = 0;
+	for (prio = 0; prio < IOPRIO_PRIO_NUM; prio++) {
+		TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
+				    IOPRIO_PRIO_VALUE(class, prio)));
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_IDLE prio %d failed", prio);
+			fail_in_loop = 1;
+		}
+	}
+	if (!fail_in_loop)
+		tst_res(TPASS, "tested all prios in class %s",
+			 to_class_str[class]);
+
+	/* Test NONE scheduling */
+	class = IOPRIO_CLASS_NONE;
+	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			    IOPRIO_PRIO_VALUE(class, 0)));
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_NONE failed");
+	else
+		ioprio_check_setting(class, 0, 1);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+};
diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set03.c b/testcases/kernel/syscalls/ioprio/ioprio_set03.c
new file mode 100644
index 000000000000..b2c962a6f0a5
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set03.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
+ *
+ * Description:
+ * Negative ioprio_set() test. Test some non-working priorities to make
+ * sure they don't work.
+ */
+#include <sys/types.h>
+#include <sys/syscall.h>
+
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+#include "ioprio.h"
+
+static void run(void)
+{
+	int class;
+
+	class = IOPRIO_CLASS_BE;
+
+	/*
+	 * Test to fail with prio 8, first set prio 4 so we know what it
+	 * should still be after failure, i.e. we check that the priority
+	 * didn't change as a side effect of setting an invalid priority.
+	 */
+	sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
+		       IOPRIO_PRIO_VALUE(class, 4));
+	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			    IOPRIO_PRIO_VALUE(class, 8)));
+	if (TST_RET == -1) {
+		ioprio_check_setting(class, 4, 1);
+		if (errno == EINVAL)
+			tst_res(TPASS | TTERRNO, "returned correct error for wrong prio");
+		else
+			tst_res(TFAIL, "ioprio_set returns wrong errno %d",
+				TST_ERR);
+	} else {
+		tst_res(TFAIL, "ioprio_set IOPRIO_CLASS_BE prio 8 should not work");
+	}
+
+	/* Any other prio than 0 should not work with NONE */
+	class = IOPRIO_CLASS_NONE;
+	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			    IOPRIO_PRIO_VALUE(class, 4)));
+	if (TST_RET == -1) {
+		tst_res(TINFO, "tested illegal priority with class %s",
+			to_class_str[class]);
+		if (errno == EINVAL)
+			tst_res(TPASS | TTERRNO, "returned correct error for wrong prio");
+		else
+			tst_res(TFAIL, "ioprio_set returns wrong errno %d",
+				TST_ERR);
+	} else {
+		tst_res(TFAIL, "ioprio_set IOPRIO_CLASS_NONE should fail");
+	}
+}
+
+static struct tst_test test = {
+	.test_all = run,
+};
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
