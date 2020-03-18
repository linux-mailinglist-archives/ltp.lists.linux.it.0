Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A50C9189FC0
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 16:35:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AE7F3C5546
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 16:35:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A75B53C5536
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 16:34:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 277966013A0
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 16:34:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF4C2AE59
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 15:34:19 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 18 Mar 2020 16:38:00 +0100
Message-Id: <20200318153801.3529-9-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318153801.3529-1-chrubis@suse.cz>
References: <20200318153801.3529-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 8/9] containers/timens: Add basic error test
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

Add basic error handling test for the /proc/$PID/timens_offsets file.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/containers                            |  1 +
 testcases/kernel/containers/timens/.gitignore |  1 +
 testcases/kernel/containers/timens/Makefile   |  6 ++
 testcases/kernel/containers/timens/timens01.c | 68 +++++++++++++++++++
 4 files changed, 76 insertions(+)
 create mode 100644 testcases/kernel/containers/timens/.gitignore
 create mode 100644 testcases/kernel/containers/timens/Makefile
 create mode 100644 testcases/kernel/containers/timens/timens01.c

diff --git a/runtest/containers b/runtest/containers
index 1006d8d35..23e4a533d 100644
--- a/runtest/containers
+++ b/runtest/containers
@@ -90,3 +90,4 @@ userns07 userns07
 sysinfo03 sysinfo03
 clock_nanosleep03 clock_nanosleep03
 clock_gettime03 clock_gettime03
+timens01 timens01
diff --git a/testcases/kernel/containers/timens/.gitignore b/testcases/kernel/containers/timens/.gitignore
new file mode 100644
index 000000000..bcd2dd9dd
--- /dev/null
+++ b/testcases/kernel/containers/timens/.gitignore
@@ -0,0 +1 @@
+timens01
diff --git a/testcases/kernel/containers/timens/Makefile b/testcases/kernel/containers/timens/Makefile
new file mode 100644
index 000000000..5ea7d67db
--- /dev/null
+++ b/testcases/kernel/containers/timens/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/containers/timens/timens01.c b/testcases/kernel/containers/timens/timens01.c
new file mode 100644
index 000000000..2dbfebfa8
--- /dev/null
+++ b/testcases/kernel/containers/timens/timens01.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+
+  Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+
+ */
+/*
+
+  Basic test for timens_offsets error handling.
+
+  After a call to unshare(CLONE_NEWTIME) a new timer namespace is created, the
+  process that has called the unshare() can adjust offsets for CLOCK_MONOTONIC
+  and CLOCK_BOOTTIME for its children by writing to the '/proc/self/timens_offsets'.
+
+ */
+
+#define _GNU_SOURCE
+#include "lapi/namespaces_constants.h"
+#include "lapi/posix_clocks.h"
+#include "tst_test.h"
+
+static struct tcase {
+	const char *desc;
+	const char *offsets;
+	int exp_err;
+} tcases[] = {
+	{"Obvious garbage", "not an offset", EINVAL},
+	{"Missing nanoseconds", "1 10", EINVAL},
+	{"Negative nanoseconds", "1 10 -10", EINVAL},
+	{"Nanoseconds > 1s", "1 10 1000000001", EINVAL},
+	{"Unsupported CLOCK_REALTIME", "0 10 0", EINVAL},
+	{"Mess on the second line", "1 10 0\na", EINVAL},
+	{"Overflow kernel 64bit ns timer", "1 9223372036 0", ERANGE},
+	{"Overflow kernel 64bit ns timer", "1 -9223372036 0", ERANGE},
+};
+
+static void verify_ns_clock(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int fd, ret;
+
+	SAFE_UNSHARE(CLONE_NEWTIME);
+
+	fd = SAFE_OPEN("/proc/self/timens_offsets", O_WRONLY);
+	ret = write(fd, tc->offsets, strlen(tc->offsets));
+
+	if (ret != -1) {
+		tst_res(TFAIL, "%s returned %i", tc->desc, ret);
+		return;
+	}
+
+	if (errno != tc->exp_err) {
+		tst_res(TFAIL | TERRNO, "%s should fail with %s, got:",
+			tc->desc, tst_strerrno(tc->exp_err));
+		return;
+	}
+
+	tst_res(TPASS | TERRNO, "%s", tc->desc);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_ns_clock,
+	.needs_root = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_TIME_NS=y"
+	}
+};
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
