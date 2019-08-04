Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D82808B2
	for <lists+linux-ltp@lfdr.de>; Sun,  4 Aug 2019 02:27:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A266D3C1D9E
	for <lists+linux-ltp@lfdr.de>; Sun,  4 Aug 2019 02:27:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CE9903C0ECD
 for <ltp@lists.linux.it>; Sun,  4 Aug 2019 02:27:36 +0200 (CEST)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id ED9B51A00719
 for <ltp@lists.linux.it>; Sun,  4 Aug 2019 02:27:34 +0200 (CEST)
Received: by mail-lj1-x244.google.com with SMTP id m8so42549233lji.7
 for <ltp@lists.linux.it>; Sat, 03 Aug 2019 17:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gdL5Po3FIOSMNcul8GzMFJ2zqXcGdJSHSG7qBAEnbTg=;
 b=L/gJsGsYcnSJs3copIErGrSvhCwwkPItGWS5h9fDw/e1AOVRhUpNnpVDipBQmmnScQ
 n4vitZfQMo8hcRgpbwbuqtxXkILt/l7rFTQKyC6Gl8QSQpbDfLYXO8VQIgmJGj1FENOb
 sK8ss55j+uLetGDMVjWMIQoD9cF8qhWQfOAAdaOqBrQ80SL1VSVmucuztZm169qloL99
 iMprmnSBx4nHamjp4X0mz+lJgG5VTWaUUkPAC29lKWejigtLLHpPWhmSfqvH03p+tybV
 BCr/hFu0Z7P8IGAFOjYPVYujNsiAG2y2RGg2jiwdbWD9ElxKwubKrPIG44kpz1LvQEAd
 JLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gdL5Po3FIOSMNcul8GzMFJ2zqXcGdJSHSG7qBAEnbTg=;
 b=RinKcSA7ZPXEVJrQAgFY2dVebNWoAPbKarKUdx+ctz4X7X/aKsJIhBAKxg4MSnP7ps
 BGA7J7fC0xz9uV9/vd8DfDFHzxUeGtonYY5PLafwaBoXQBt3HcyZbINpy8ivvG0myc1+
 1WpOOfZhz21K5sDh6MWk3GHwEkKerPxSXfkeol+jt2o4c42jy9gzufM8/kCbAE0VqzQw
 VTSL/omSnB3gvyDLLcwMH+r2d3cg9eY5cHtg2qGu45Eksfh6tkeG9rkB5NbsaipuQqVm
 drl5yC931zF6giSrth7+hJfscojIk2T658fmKM+4kCZgFM/PsFaH636XylA9Mx/LnX9k
 yPJQ==
X-Gm-Message-State: APjAAAVz6ON3lqg4vEq3FyMJi4pdhLbBp+DN8cu3F6crZ8DPWBgqu1vU
 aCs/mQLU3ReDXicdta3rmaztkT+jnsE=
X-Google-Smtp-Source: APXvYqwUBUGWRZbVP2/EKshJeTU8uLCI2Vj/2BdvDgw908v9rcLMRqWWJzoCJyMU/lsChrhiv36o+g==
X-Received: by 2002:a2e:9950:: with SMTP id r16mr58173808ljj.173.1564878453971; 
 Sat, 03 Aug 2019 17:27:33 -0700 (PDT)
Received: from localhost.localdomain
 (c-2ccd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.44])
 by smtp.gmail.com with ESMTPSA id o3sm13661749lfb.40.2019.08.03.17.27.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 03 Aug 2019 17:27:32 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: ltp@lists.linux.it
Date: Sun,  4 Aug 2019 02:25:30 +0200
Message-Id: <20190804002530.31761-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] syscalls/ioprio: Add test cases for I/O priority
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
 testcases/kernel/syscalls/ioprio/ioprio.h     | 91 +++++++++++++++++++
 .../kernel/syscalls/ioprio/ioprio_get01.c     | 47 ++++++++++
 .../kernel/syscalls/ioprio/ioprio_set01.c     | 67 ++++++++++++++
 .../kernel/syscalls/ioprio/ioprio_set02.c     | 67 ++++++++++++++
 .../kernel/syscalls/ioprio/ioprio_set03.c     | 59 ++++++++++++
 8 files changed, 346 insertions(+)
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
index 000000000000..be7fc5fbcf10
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio.h
@@ -0,0 +1,91 @@
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
+static inline int ioprio_get(int which, int who)
+{
+	return tst_syscall(__NR_ioprio_get, which, who);
+}
+
+static inline int ioprio_set(int which, int who, int ioprio)
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
+	res = ioprio_get(IOPRIO_WHO_PROCESS, 0);
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
index 000000000000..e0acf1670fc9
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
+	TEST(ioprio_get(IOPRIO_WHO_PROCESS, 0));
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
index 000000000000..07fe53caa3d6
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
@@ -0,0 +1,67 @@
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
+	TEST(ioprio_get(IOPRIO_WHO_PROCESS, 0));
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "ioprio_get failed");
+		/* Try to continue anyway */
+		class = IOPRIO_CLASS_NONE;
+		prio = 4;
+	} else {
+		class = IOPRIO_PRIO_CLASS(TST_RET);
+		prio = IOPRIO_PRIO_LEVEL(TST_RET);
+		tst_res(TPASS, "ioprio_get returned class %s prio %d",
+			 to_class_str[class], prio);
+	}
+
+	/* Bump prio to what it was + 1 */
+	class = IOPRIO_CLASS_BE;
+	if (!prio_in_range(prio + 1)) {
+		tst_res(TFAIL, "ioprio increase out of range (%d)", prio + 1);
+		return;
+	}
+	prio++;
+
+	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			IOPRIO_PRIO_VALUE(class, prio)));
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
+	prio -= 2;
+	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			IOPRIO_PRIO_VALUE(class, prio)));
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
index 000000000000..5cdc6f0dbb1b
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set02.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
+ *
+ * Description:
+ * Extended ioprio_set() test. Gets the current process I/O priority and
+ * tests to set all 8 priority levels for best effort prioritym then
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
+	for (prio = 0; prio < 8; prio++) {
+		TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+				IOPRIO_PRIO_VALUE(class, prio)));
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_BE prio %d failed", prio);
+			fail_in_loop = 1;
+		}
+	}
+	if (!fail_in_loop)
+		tst_res(TPASS, "tested all 8 prios in class %s",
+			 to_class_str[class]);
+
+	/* Bump down to idle scheduling */
+	class = IOPRIO_CLASS_IDLE;
+
+	fail_in_loop = 0;
+	for (prio = 0; prio < 8; prio++) {
+		TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+				IOPRIO_PRIO_VALUE(class, prio)));
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_IDLE failed");
+			fail_in_loop = 1;
+		}
+	}
+	if (!fail_in_loop)
+		tst_res(TPASS, "tested all 8 prios in class %s",
+			 to_class_str[class]);
+
+	/* Test NONE scheduling */
+	class = IOPRIO_CLASS_NONE;
+	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			IOPRIO_PRIO_VALUE(class, 0)));
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
index 000000000000..1e3ac291c004
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set03.c
@@ -0,0 +1,59 @@
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
+	/* Test to fail with prio 8, first set prio 4 */
+	ioprio_set(IOPRIO_WHO_PROCESS, 0,
+		   IOPRIO_PRIO_VALUE(class, 4));
+	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			IOPRIO_PRIO_VALUE(class, 8)));
+	if (TST_RET == -1) {
+		ioprio_check_setting(class, 4, 1);
+		if (errno == EINVAL)
+			tst_res(TPASS, "return EINVAL %d",
+				errno);
+		else
+			tst_res(TFAIL, "ioprio_set returns wrong errno %d",
+				errno);
+	} else {
+		tst_res(TFAIL, "ioprio_set IOPRIO_CLASS_BE prio 8 should not work");
+	}
+
+	/* Any other prio than 0 should not work with NONE */
+	class = IOPRIO_CLASS_NONE;
+	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			IOPRIO_PRIO_VALUE(class, 4)));
+	if (TST_RET == -1) {
+		tst_res(TPASS, "tested illegal priority with class %s",
+			 to_class_str[class]);
+		if (errno == EINVAL)
+			tst_res(TPASS, "return EINVAL %d",
+				errno);
+		else
+			tst_res(TFAIL, "ioprio_set returns wrong errno %d",
+				errno);
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
