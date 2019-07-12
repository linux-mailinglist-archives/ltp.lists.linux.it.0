Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AD55366AD8
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 12:24:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 246D23C1CF4
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 12:24:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CFA7C3C1C94
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 12:24:16 +0200 (CEST)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C8F26200C78
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 12:24:15 +0200 (CEST)
Received: by mail-lj1-x241.google.com with SMTP id x25so8857478ljh.2
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mwsgJ3MdMh0CfxgRCqmuDip4vtYP0TjDqTaZVEKvfts=;
 b=sOiw3z6Qmi8IoQyJSueUR9zv/XYPfOzqx/yhgclkseoSL6Q8TpIAQd2fG6MZH/koS+
 5aH8Dyfx7AxzrQbv7+oFTfMY525soBXqq3F2f5BNWIt2PzI5qX3KO5K6Bvve4+8Ge2Ld
 iAvVS6Vjdhr6Cz559+BVYlguEtubMtxKjQSrNuaeQACOZA4C3zPwy2ZZXxKQ/PUjbYbk
 7nsZi/+5O5Vt1M/wLBhNRFb57Jzon6FOX7Mi/G4f7Ai0q62+T/0knSUGXNwP/dtrRd4l
 XCjV0D/x1ntD7Fge67fppCRQ+vRYRIrzNNJMBuRJi4wQ/X1gz+O3rJgMISLz/DO4DRlg
 +69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mwsgJ3MdMh0CfxgRCqmuDip4vtYP0TjDqTaZVEKvfts=;
 b=nmH0KsfeffhB/8i/yfBbOYdOOLNIDufpAHfF8gF2QvWg48T+pgBVeksK+0V6XPzg7v
 hNZG0kZeOYeRqjNOL3XH6ZI2IOVYUMXQdKVYnEuyWIWz+nVTcPCbn/5lhHQxD09xWaGt
 ry2LfEENVB1vbMt8bq2dCWoG+2PY5j5a2D03B+9IZU41h/7YttuoTGJLShLm9iSzZjit
 zaNjork8cKNCg4Z2guIhlsmQlSEIxSjsJqU6QrKQOTJonvioBgsGK4MG9JAADpO1Hqh/
 dFGUeSG8S2klZcNPu90LDp2p1FQN1lvGWpLI76hREn/JTjZ8LFBKXBk0i9wg8PErhpUi
 8bqQ==
X-Gm-Message-State: APjAAAUsup3vrxOxUrkTPtzr0BAWw6zT2CKLQjQlsDTJXvLxReh2ZwLH
 Ax/uGGZT7qRsBJCpnaElaBq8vVxU2lE=
X-Google-Smtp-Source: APXvYqxUtjzdclUZSu6Zy3q03hlaThFUzFOWQP0vENIGPyJRkrVytJr6TDiP5Bw623yobhWEqjeqiA==
X-Received: by 2002:a2e:7614:: with SMTP id r20mr5604245ljc.42.1562927054714; 
 Fri, 12 Jul 2019 03:24:14 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id y18sm1375477ljh.1.2019.07.12.03.24.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 03:24:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 12 Jul 2019 12:24:09 +0200
Message-Id: <20190712102409.12906-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ioprio: Add test cases for I/O priority
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

The ioprio_get/ioprio_set syscalls are used primarily by the
userspace tool "ionice" to set priority of a process, user or
process group toward the I/O (block layer) scheduler.

This adds a simple iprio_get test and two more verbose tests
for ioprio_set.

Cc: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I never did LTP work before. Reviews appreciated.
If this proves worthwhile I will add test cases for
real-time and other scheduling requireing root access
and possibly look into testing user or process group
scheduling as well.
---
 testcases/kernel/syscalls/ioprio/.gitignore   |   1 +
 testcases/kernel/syscalls/ioprio/Makefile     |  22 +++
 testcases/kernel/syscalls/ioprio/ioprio.h     |  44 +++++
 .../kernel/syscalls/ioprio/ioprio_get01.c     |  72 ++++++++
 .../kernel/syscalls/ioprio/ioprio_set01.c     | 123 +++++++++++++
 .../kernel/syscalls/ioprio/ioprio_set02.c     | 166 ++++++++++++++++++
 6 files changed, 428 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioprio/.gitignore
 create mode 100644 testcases/kernel/syscalls/ioprio/Makefile
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio.h
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_get01.c
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_set01.c
 create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_set02.c

diff --git a/testcases/kernel/syscalls/ioprio/.gitignore b/testcases/kernel/syscalls/ioprio/.gitignore
new file mode 100644
index 000000000000..fc1c236053a4
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/.gitignore
@@ -0,0 +1 @@
+/ioprio_get01.c
diff --git a/testcases/kernel/syscalls/ioprio/Makefile b/testcases/kernel/syscalls/ioprio/Makefile
new file mode 100644
index 000000000000..7a1a87a28ead
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/Makefile
@@ -0,0 +1,22 @@
+#
+#  Copyright (c) International Business Machines  Corp., 2001
+#
+#  This program is free software;  you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation; either version 2 of the License, or
+#  (at your option) any later version.
+#
+#  This program is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY;  without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+#  the GNU General Public License for more details.
+#
+#  You should have received a copy of the GNU General Public License
+#  along with this program;  if not, write to the Free Software
+#  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+#
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
index 000000000000..62183ebcf856
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_get01.c
@@ -0,0 +1,72 @@
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
+#include "test.h"
+#include "ioprio.h"
+
+static void setup(void);
+static void cleanup(void);
+
+TCID_DEFINE(ioprio_get01);
+int TST_TOTAL = 1;
+
+static int ioprio_get(int which, int who)
+{
+	return syscall(SYS_ioprio_get, which, who);
+}
+
+int main(int ac, char **av)
+{
+	int lc;
+
+	tst_parse_opts(ac, av, NULL, NULL);
+
+	setup();
+
+	for (lc = 0; TEST_LOOPING(lc); lc++) {
+
+		tst_count = 0;
+		int prio, class;
+
+		/* Get the I/O priority for the current process */
+		TEST(ioprio_get(IOPRIO_WHO_PROCESS, 0));
+
+		if (TEST_RETURN == -1) {
+			tst_resm(TFAIL | TTERRNO, "ioprio_get failed");
+			continue;
+		}
+
+		class = IOPRIO_PRIO_CLASS(TEST_RETURN);
+		prio = IOPRIO_PRIO_LEVEL(TEST_RETURN);
+
+		if (!prio_in_range(prio)) {
+			tst_resm(TFAIL, "ioprio out of range (%d)", prio);
+			continue;
+		}
+
+		tst_resm(TPASS, "ioprio_get returned class %s prio %d",
+			 to_class_str[class], prio);
+	}
+
+	cleanup();
+	tst_exit();
+}
+
+static void setup(void)
+{
+	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	TEST_PAUSE;
+}
+
+static void cleanup(void)
+{
+}
diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set01.c b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
new file mode 100644
index 000000000000..776c5392e8dc
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
@@ -0,0 +1,123 @@
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
+#include "test.h"
+#include "ioprio.h"
+
+static void setup(void);
+static void cleanup(void);
+
+TCID_DEFINE(ioprio_set01);
+int TST_TOTAL = 1;
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
+		tst_resm(TFAIL | TTERRNO,
+			 "reading back prio failed");
+		return;
+	}
+
+	newclass = IOPRIO_PRIO_CLASS(res);
+	newprio = IOPRIO_PRIO_LEVEL(res);
+	if (newclass != class)
+		tst_resm(TFAIL,
+			 "wrong class after setting, expected %s got %s",
+			 to_class_str[class],
+			 to_class_str[newclass]);
+	else if (newprio != prio)
+		tst_resm(TFAIL,
+			 "wrong prio after setting, expected %d got %d",
+			 prio, newprio);
+	else
+		tst_resm(TPASS, "ioprio_set new class %s, new prio %d",
+			 to_class_str[newclass],
+			 newprio);
+}
+
+int main(int ac, char **av)
+{
+	int lc;
+
+	tst_parse_opts(ac, av, NULL, NULL);
+
+	setup();
+
+	for (lc = 0; TEST_LOOPING(lc); lc++) {
+
+		tst_count = 0;
+		int class, prio;
+
+		/* Get the I/O priority for the current process */
+		TEST(ioprio_get(IOPRIO_WHO_PROCESS, 0));
+
+		if (TEST_RETURN == -1) {
+			tst_resm(TFAIL | TTERRNO, "ioprio_get failed");
+			/* Try to continue anyway */
+			class = IOPRIO_CLASS_NONE;
+			prio = 4;
+		} else {
+			class = IOPRIO_PRIO_CLASS(TEST_RETURN);
+			prio = IOPRIO_PRIO_LEVEL(TEST_RETURN);
+			tst_resm(TPASS, "ioprio_get returned class %s prio %d",
+				 to_class_str[class], prio);
+		}
+
+		/* Bump prio to what it was + 1 */
+		class = IOPRIO_CLASS_BE;
+		prio++;
+
+		TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+				IOPRIO_PRIO_VALUE(class, prio)));
+		if (TEST_RETURN == -1)
+			tst_resm(TFAIL | TTERRNO, "ioprio_set failed");
+		else
+			ioprio_check_setting(class, prio);
+
+		/* Bump prio down two notches */
+		prio -= 2;
+		TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+				IOPRIO_PRIO_VALUE(class, prio)));
+		if (TEST_RETURN == -1)
+			tst_resm(TFAIL | TTERRNO, "ioprio_set failed");
+		else
+			ioprio_check_setting(class, prio);
+
+	}
+
+	cleanup();
+	tst_exit();
+}
+
+static void setup(void)
+{
+	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	TEST_PAUSE;
+}
+
+static void cleanup(void)
+{
+}
diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set02.c b/testcases/kernel/syscalls/ioprio/ioprio_set02.c
new file mode 100644
index 000000000000..1ba515b37e90
--- /dev/null
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set02.c
@@ -0,0 +1,166 @@
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
+#include "test.h"
+#include "ioprio.h"
+
+static void setup(void);
+static void cleanup(void);
+
+TCID_DEFINE(ioprio_set02);
+int TST_TOTAL = 1;
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
+		tst_resm(TFAIL | TTERRNO,
+			 "reading back prio failed");
+		return;
+	}
+
+	newclass = IOPRIO_PRIO_CLASS(res);
+	newprio = IOPRIO_PRIO_LEVEL(res);
+	if (newclass != class)
+		tst_resm(TFAIL,
+			 "wrong class after setting, expected %s got %s",
+			 to_class_str[class],
+			 to_class_str[newclass]);
+	else if (newprio != prio)
+		tst_resm(TFAIL,
+			 "wrong prio after setting, expected %d got %d",
+			 prio, newprio);
+	else if (report)
+		tst_resm(TPASS, "ioprio_set new class %s, new prio %d",
+			 to_class_str[newclass],
+			 newprio);
+}
+
+int main(int ac, char **av)
+{
+	int lc;
+
+	tst_parse_opts(ac, av, NULL, NULL);
+
+	setup();
+
+	for (lc = 0; TEST_LOOPING(lc); lc++) {
+
+		tst_count = 0;
+		int class, prio;
+		int fail_in_loop;
+
+		/* Get the I/O priority for the current process */
+		TEST(ioprio_get(IOPRIO_WHO_PROCESS, 0));
+
+		if (TEST_RETURN == -1) {
+			tst_resm(TFAIL | TTERRNO, "ioprio_get failed");
+			/* Try to continue anyway */
+			class = IOPRIO_CLASS_NONE;
+			prio = 4;
+		} else {
+			class = IOPRIO_PRIO_CLASS(TEST_RETURN);
+			prio = IOPRIO_PRIO_LEVEL(TEST_RETURN);
+			tst_resm(TPASS, "ioprio_get returned class %s prio %d",
+				 to_class_str[class], prio);
+		}
+
+		/* Bump to best effort scheduling, all 8 priorities */
+		class = IOPRIO_CLASS_BE;
+
+		fail_in_loop = 0;
+		for (prio = 0; prio < 8; prio++) {
+			TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+					IOPRIO_PRIO_VALUE(class, prio)));
+			if (TEST_RETURN == -1) {
+				tst_resm(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_BE prio %d failed", prio);
+				fail_in_loop = 1;
+			}
+		}
+		if (!fail_in_loop)
+			tst_resm(TPASS, "tested all 8 prios in class %s",
+				 to_class_str[class]);
+
+		/* Test to fail with prio 8, first set prio 4 */
+		ioprio_set(IOPRIO_WHO_PROCESS, 0,
+			   IOPRIO_PRIO_VALUE(class, 4));
+		TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+				IOPRIO_PRIO_VALUE(class, 8)));
+		if (TEST_RETURN == -1) {
+			ioprio_check_setting(class, 4, 1);
+			prio = 5;
+		}
+		else
+			tst_resm(TFAIL, "ioprio_set IOPRIO_CLASS_BE prio %d should not work", prio);
+
+		/* Bump down to idle scheduling */
+		class = IOPRIO_CLASS_IDLE;
+
+		fail_in_loop = 0;
+		for (prio = 0; prio < 8; prio++) {
+			TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+					IOPRIO_PRIO_VALUE(class, prio)));
+			if (TEST_RETURN == -1) {
+				tst_resm(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_IDLE failed");
+				fail_in_loop = 1;
+			}
+		}
+		if (!fail_in_loop)
+			tst_resm(TPASS, "tested all 8 prios in class %s",
+				 to_class_str[class]);
+
+		/* Test NONE scheduling */
+		class = IOPRIO_CLASS_NONE;
+		TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+				IOPRIO_PRIO_VALUE(class, 0)));
+		if (TEST_RETURN == -1)
+			tst_resm(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_NONE failed");
+		else
+			ioprio_check_setting(class, 0, 1);
+
+		/* Any other prio than 0 should not work with NONE */
+		class = IOPRIO_CLASS_NONE;
+		TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
+				IOPRIO_PRIO_VALUE(class, 4)));
+		if (TEST_RETURN == -1)
+			tst_resm(TPASS, "tested illegal priority with class %s",
+				 to_class_str[class]);
+		else
+			tst_resm(TFAIL, "ioprio_set IOPRIO_CLASS_NONE should fail");
+	}
+
+	cleanup();
+	tst_exit();
+}
+
+static void setup(void)
+{
+	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	TEST_PAUSE;
+}
+
+static void cleanup(void)
+{
+}
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
