Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D41BF9043D
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Aug 2019 16:54:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A378A3C1CA0
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Aug 2019 16:54:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4CC2A3C1D0B
 for <ltp@lists.linux.it>; Fri, 16 Aug 2019 16:54:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 53AC7600944
 for <ltp@lists.linux.it>; Fri, 16 Aug 2019 16:54:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2D1DCAEA4
 for <ltp@lists.linux.it>; Fri, 16 Aug 2019 14:54:15 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 16 Aug 2019 16:54:10 +0200
Message-Id: <20190816145410.8681-6-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190816145410.8681-1-chrubis@suse.cz>
References: <20190816145410.8681-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1 5/5] kernel/uevent: Add uevent03
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

This time we create a virtual input device and validate the result.

Note that this test is unfinished, we only validate the addition of the
virtual input and not the device itself. I will finish this test later
on.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/uevent                      |  1 +
 testcases/kernel/uevents/.gitignore |  1 +
 testcases/kernel/uevents/Makefile   |  4 ++
 testcases/kernel/uevents/uevent03.c | 98 +++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 testcases/kernel/uevents/uevent03.c

diff --git a/runtest/uevent b/runtest/uevent
index 30b1114a4..0b59c8723 100644
--- a/runtest/uevent
+++ b/runtest/uevent
@@ -1,2 +1,3 @@
 uevent01 uevent01
 uevent02 uevent02
+uevent03 uevent03
diff --git a/testcases/kernel/uevents/.gitignore b/testcases/kernel/uevents/.gitignore
index 0afc95534..7818f7308 100644
--- a/testcases/kernel/uevents/.gitignore
+++ b/testcases/kernel/uevents/.gitignore
@@ -1,2 +1,3 @@
 uevent01
 uevent02
+uevent03
diff --git a/testcases/kernel/uevents/Makefile b/testcases/kernel/uevents/Makefile
index cba769739..d5ceb0719 100644
--- a/testcases/kernel/uevents/Makefile
+++ b/testcases/kernel/uevents/Makefile
@@ -2,5 +2,9 @@
 
 top_srcdir			?= ../../..
 
+LTPLIBS = ltpuinput
+
+uevent03: LDLIBS += -lltpuinput
+
 include $(top_srcdir)/include/mk/testcases.mk
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/uevents/uevent03.c b/testcases/kernel/uevents/uevent03.c
new file mode 100644
index 000000000..463322c2c
--- /dev/null
+++ b/testcases/kernel/uevents/uevent03.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2019 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*
+ * Very simple uevent netlink socket test.
+ *
+ * We fork a child that listens for a kernel events while parents creates and removes
+ * a tun network device which should produce two several add and remove events.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/wait.h>
+
+#include <linux/uinput.h>
+
+#include "tst_test.h"
+#include "tst_uinput.h"
+#include "uevent.h"
+
+static void generate_input_uevents(char *buf, size_t buf_len)
+{
+	int fd = open_uinput();
+
+	create_input_device(fd);
+	SAFE_IOCTL(fd, UI_GET_SYSNAME(buf_len), buf);
+	destroy_input_device(fd);
+}
+
+static void verify_uevent(void)
+{
+	int pid, fd;
+	char sysname[64];
+	char add_msg[1024];
+	char rem_msg[1024];
+	char dev_path[1024];
+
+	struct uevent_desc add = {
+		.msg = add_msg,
+		.value_cnt = 6,
+		.values = (const char*[]) {
+			"ACTION=add",
+			dev_path,
+			"SUBSYSTEM=input",
+			"NAME=\"virtual-device-ltp\"",
+			"PROP=0",
+			"EV=1",
+		}
+	};
+
+	struct uevent_desc rem = {
+		.msg = rem_msg,
+		.value_cnt = 6,
+		.values = (const char*[]) {
+			"ACTION=remove",
+			dev_path,
+			"SUBSYSTEM=input",
+			"NAME=\"virtual-device-ltp\"",
+			"PROP=0",
+			"EV=1",
+		}
+	};
+
+	const struct uevent_desc *const uevents[] = {
+		&add,
+		&rem,
+		NULL
+	};
+
+	fd = open_uevent_netlink();
+
+	generate_input_uevents(sysname, sizeof(sysname));
+
+	snprintf(add_msg, sizeof(add_msg), "add@/devices/virtual/input/%s", sysname);
+	snprintf(rem_msg, sizeof(rem_msg), "remove@/devices/virtual/input/%s", sysname);
+	snprintf(dev_path, sizeof(dev_path), "DEVPATH=/devices/virtual/input/%s", sysname);
+
+	pid = SAFE_FORK();
+	if (!pid)
+		wait_for_uevents(fd, uevents);
+
+	SAFE_CLOSE(fd);
+	wait_for_pid(pid);
+}
+
+static struct tst_test test = {
+	.test_all = verify_uevent,
+	.forks_child = 1,
+	.needs_tmpdir = 1,
+	.needs_checkpoints = 1,
+	.needs_drivers = (const char *const[]) {
+		"uinput",
+		NULL
+	},
+	.needs_root = 1,
+};
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
