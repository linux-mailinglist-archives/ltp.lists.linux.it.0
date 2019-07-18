Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A56CA1C
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 09:41:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B16FD3C1D3F
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 09:41:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 6643C3C04FD
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 09:41:49 +0200 (CEST)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C78151A01108
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 09:41:48 +0200 (CEST)
Received: by mail-lj1-x243.google.com with SMTP id x25so26315592ljh.2
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 00:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AQQnas5xF0OBs4QRwaldghlo894aLTdJChSQ3OO1F5A=;
 b=dXbwWmdN+3jcawSiKETzmIgFPIeaNKB7z0c+jbT//KPD89DTdhwDO+oQauXesmmXrG
 L/hPDI6X5jz33bjEc90blmTDIzCa60OQIsyo1o3CjXoQlQtmzMk4EGw4OkAHC0iMraJ8
 Od73coyynZS8VuFyseVDfPXXZpMDpnBvmI+KInq7ZwKZszLHsrj+/ReZMiQMjei81/ph
 zjroyxo242Qk2/18waSlEjVEI+iT6m/VeS7ZIr79DjqaxrgJb+cvMvzCYuaPiT/QK3AJ
 VvzbesIn4IGGLP9zIncPdqB00oizJgUDmPv7wQ7Urh+izwBiTggPfQahdxcwJjHu5ZiX
 CSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AQQnas5xF0OBs4QRwaldghlo894aLTdJChSQ3OO1F5A=;
 b=E3O9wi9AL5ePlbZ8jkhDmyI0uW3oaUIq3iqMbOo2CZmhZn8ZSUFjMnDocxbnJuSgPa
 3DaVWlGq8UQ3unCufKEQEGcSTepp4y5+358FbFlYybEBmwv2NYjqc4hv8l9VDZSQmrxY
 tJ8vSZFB1XsVi+jYwXzRth/U33Yj3Lc/MjmZPOofqRCeTAZP6hKXbJ0qlPM/e4ozOgbs
 ltbPBCgc3GG7M6aSmJqnpBPYP8Oeg4G8jYxMcsfCKSl+WeDuE1GhhlTI11zGWdp+UinL
 3KJ59RCl2Pp44/mnIgaQmAYR2CMOocDAqAOSsJp8DD5W2k8dvUUKRLAz57sQcGqq0lEv
 EorQ==
X-Gm-Message-State: APjAAAWzFTkMvhgLfScNKNVnm/ScsQhuHI2DPaDp1jJHwdC+oN+BY/rj
 kmgcYevM49hxaDUWVvs6LpS7chbHRmA=
X-Google-Smtp-Source: APXvYqyShyL6pzmreMXyhD+3RjvDCEGeyLphTGQ7XWv01QPQ/UNySfGM0khxZz6hI4DHsB/m2GzLBg==
X-Received: by 2002:a2e:6c14:: with SMTP id h20mr23410381ljc.38.1563435707041; 
 Thu, 18 Jul 2019 00:41:47 -0700 (PDT)
Received: from localhost.localdomain
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id a15sm3840911lfl.44.2019.07.18.00.41.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 00:41:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 18 Jul 2019 09:39:41 +0200
Message-Id: <20190718073941.13153-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/ioprio: Add test cases for I/O priority
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
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Use the new test fixture "tst_test.h"
- Fix up legalese in the Makefile to a simple SPDX tag.
- Test from v2.6.13 when the syscall was introduced
---
 testcases/kernel/syscalls/ioprio/.gitignore   |   3 +
 testcases/kernel/syscalls/ioprio/Makefile     |   6 +
 testcases/kernel/syscalls/ioprio/ioprio.h     |  44 ++++++
 .../kernel/syscalls/ioprio/ioprio_get01.c     |  48 ++++++
 .../kernel/syscalls/ioprio/ioprio_set01.c     |  98 ++++++++++++
 .../kernel/syscalls/ioprio/ioprio_set02.c     | 142 ++++++++++++++++++
 6 files changed, 341 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioprio/.gitignore
 create mode 100644 testcases/kernel/syscalls/ioprio/Makefile
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio.h
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_get01.c
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_set01.c
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_set02.c

diff --git a/testcases/kernel/syscalls/ioprio/.gitignore b/testcases/kernel/syscalls/ioprio/.gitignore
new file mode 100644
index 000000000000..890081d8c625
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/.gitignore
@@ -0,0 +1,3 @@
+ioprio_get01
+ioprio_set01
+ioprio_set02
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
index 000000000000..3a0f068a053a
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio.h
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
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
+static const char *to_class_str[] = {
+	[IOPRIO_CLASS_NONE] = "NONE",
+	[IOPRIO_CLASS_RT]   = "REALTIME",
+	[IOPRIO_CLASS_BE]   = "BEST-EFFORT",
+	[IOPRIO_CLASS_IDLE] = "IDLE"
+};
+
+/* Priority range from 0 (highest) to 7 (lowest) */
+static inline int prio_in_range(int prio)
+{
+	if ((prio < 0) || (prio > 7))
+		return 0;
+	return 1;
+}
+
+#endif
diff --git a/testcases/kernel/syscalls/ioprio/ioprio_get01.c b/testcases/kernel/syscalls/ioprio/ioprio_get01.c
new file mode 100644
index 000000000000..79807763a5f3
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_get01.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Linaro Limited
+ */
+#include <sys/types.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <string.h>
+#include <signal.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+
+#include "tst_test.h"
+#include "ioprio.h"
+
+static int ioprio_get(int which, int who)
+{
+	return syscall(SYS_ioprio_get, which, who);
+}
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
+	tst_res(TPASS, "ioprio_get returned class %s prio %d",
+		to_class_str[class], prio);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.min_kver = "2.6.13",
+};
diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set01.c b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
new file mode 100644
index 000000000000..9f2c9f4b3d48
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
+ */
+#include <sys/types.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <string.h>
+#include <signal.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+
+#include "tst_test.h"
+#include "ioprio.h"
+
+static int ioprio_get(int which, int who)
+{
+	return syscall(SYS_ioprio_get, which, who);
+}
+
+static int ioprio_set(int which, int who, int ioprio)
+{
+	return syscall(SYS_ioprio_set, which, who, ioprio);
+}
+
+static void ioprio_check_setting(int class, int prio)
+{
+	int res;
+	int newclass, newprio;
+
+	res = ioprio_get(IOPRIO_WHO_PROCESS, 0);
+	if (res == -1) {
+		tst_res(TFAIL | TTERRNO,
+			"reading back prio failed");
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
+	else
+		tst_res(TPASS, "ioprio_set new class %s, new prio %d",
+			to_class_str[newclass],
+			newprio);
+}
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
+	prio++;
+
+	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			IOPRIO_PRIO_VALUE(class, prio)));
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "ioprio_set failed");
+	else
+		ioprio_check_setting(class, prio);
+
+	/* Bump prio down two notches */
+	prio -= 2;
+	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			IOPRIO_PRIO_VALUE(class, prio)));
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "ioprio_set failed");
+	else
+		ioprio_check_setting(class, prio);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.min_kver = "2.6.13",
+};
diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set02.c b/testcases/kernel/syscalls/ioprio/ioprio_set02.c
new file mode 100644
index 000000000000..7cec8538254d
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set02.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
+ */
+#include <sys/types.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <string.h>
+#include <signal.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+
+#include "tst_test.h"
+#include "ioprio.h"
+
+static int ioprio_get(int which, int who)
+{
+	return syscall(SYS_ioprio_get, which, who);
+}
+
+static int ioprio_set(int which, int who, int ioprio)
+{
+	return syscall(SYS_ioprio_set, which, who, ioprio);
+}
+
+static void ioprio_check_setting(int class, int prio, int report)
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
+static void run(void)
+{
+	int class, prio;
+	int fail_in_loop;
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
+	/* Test to fail with prio 8, first set prio 4 */
+	ioprio_set(IOPRIO_WHO_PROCESS, 0,
+		   IOPRIO_PRIO_VALUE(class, 4));
+	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			IOPRIO_PRIO_VALUE(class, 8)));
+	if (TST_RET == -1) {
+		ioprio_check_setting(class, 4, 1);
+		prio = 5;
+	}
+	else
+		tst_res(TFAIL, "ioprio_set IOPRIO_CLASS_BE prio %d should not work", prio);
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
+
+	/* Any other prio than 0 should not work with NONE */
+	class = IOPRIO_CLASS_NONE;
+	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			IOPRIO_PRIO_VALUE(class, 4)));
+	if (TST_RET == -1)
+		tst_res(TPASS, "tested illegal priority with class %s",
+			 to_class_str[class]);
+	else
+		tst_res(TFAIL, "ioprio_set IOPRIO_CLASS_NONE should fail");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.min_kver = "2.6.13",
+};
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
