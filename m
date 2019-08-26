Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBE89D13C
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 16:02:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FBB73C1D47
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 16:02:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 70A5B3C1CE6
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 16:01:28 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CDA856021FC
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 16:01:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7BD0CB066
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 14:01:27 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Aug 2019 16:01:24 +0200
Message-Id: <20190826140124.24681-6-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190826140124.24681-1-chrubis@suse.cz>
References: <20190826140124.24681-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 5/5] kernel/uevent: Add uevent03
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

This time we create a virtual input device, a mouse, and validate the result.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/uevent                      |   1 +
 testcases/kernel/uevents/.gitignore |   1 +
 testcases/kernel/uevents/Makefile   |   4 +
 testcases/kernel/uevents/uevent03.c | 248 ++++++++++++++++++++++++++++
 4 files changed, 254 insertions(+)
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
index 000000000..991737e20
--- /dev/null
+++ b/testcases/kernel/uevents/uevent03.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2019 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*
+ * Very simple uevent netlink socket test.
+ *
+ * We fork a child that listens for a kernel events while parents creates and
+ * removes a virtual mouse which produces add and remove event for the device
+ * itself and for two event handlers called eventX and mouseY.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/wait.h>
+#include <sys/sysmacros.h>
+
+#include <linux/uinput.h>
+
+#include "tst_test.h"
+#include "tst_uinput.h"
+#include "uevent.h"
+
+static int mouse_fd;
+
+static void create_uinput_mouse(void)
+{
+	mouse_fd = open_uinput();
+	setup_mouse_events(mouse_fd);
+	create_input_device(mouse_fd);
+}
+
+static void destroy_uinput_mouse(void)
+{
+	destroy_input_device(mouse_fd);
+}
+
+static void get_minor_major(char *device, char *minor, char *major, size_t buf_sizes)
+{
+	char path[1024];
+	struct stat stbuf;
+
+	snprintf(path, sizeof(path), "/dev/input/%s", device);
+
+	SAFE_STAT(path, &stbuf);
+
+	snprintf(major, buf_sizes, "MAJOR=%i", major(stbuf.st_rdev));
+	snprintf(minor, buf_sizes, "MINOR=%i", minor(stbuf.st_rdev));
+}
+
+#define MINOR_MAJOR_SIZE 32
+
+static void verify_uevent(void)
+{
+	int pid, fd;
+	char sysname[64];
+	char add_msg[1024];
+	char rem_msg[1024];
+	char dev_path[1024];
+	char add_msg_event1[1024];
+	char rem_msg_event1[1024];
+	char dev_path_event1[1024];
+	char add_msg_event2[1024];
+	char rem_msg_event2[1024];
+	char dev_path_event2[1024];
+	char dev_name1[1024];
+	char dev_name2[1024];
+
+	char minor_event1[MINOR_MAJOR_SIZE];
+	char minor_event2[MINOR_MAJOR_SIZE];
+	char major_event1[MINOR_MAJOR_SIZE];
+	char major_event2[MINOR_MAJOR_SIZE];
+
+	char *handlers, *handler1, *handler2;
+
+	struct uevent_desc add = {
+		.msg = add_msg,
+		.value_cnt = 7,
+		.values = (const char*[]) {
+			"ACTION=add",
+			dev_path,
+			"SUBSYSTEM=input",
+			"NAME=\"virtual-device-ltp\"",
+			"PROP=0",
+			"EV=7",
+			"REL=3",
+		}
+	};
+
+	struct uevent_desc add_event1 = {
+		.msg = add_msg_event1,
+		.value_cnt = 6,
+		.values = (const char*[]) {
+			"ACTION=add",
+			"SUBSYSTEM=input",
+			dev_name1,
+			dev_path_event1,
+			minor_event1,
+			major_event1,
+		}
+	};
+
+	struct uevent_desc add_event2 = {
+		.msg = add_msg_event2,
+		.value_cnt = 6,
+		.values = (const char*[]) {
+			"ACTION=add",
+			"SUBSYSTEM=input",
+			dev_name2,
+			dev_path_event2,
+			minor_event2,
+			major_event2,
+		}
+	};
+
+	struct uevent_desc rem_event1 = {
+		.msg = rem_msg_event1,
+		.value_cnt = 6,
+		.values = (const char*[]) {
+			"ACTION=remove",
+			"SUBSYSTEM=input",
+			dev_name1,
+			dev_path_event1,
+			minor_event1,
+			major_event1,
+		}
+	};
+
+	struct uevent_desc rem_event2 = {
+		.msg = rem_msg_event2,
+		.value_cnt = 6,
+		.values = (const char*[]) {
+			"ACTION=remove",
+			"SUBSYSTEM=input",
+			dev_name2,
+			dev_path_event2,
+			minor_event2,
+			major_event2,
+		}
+	};
+
+	struct uevent_desc rem = {
+		.msg = rem_msg,
+		.value_cnt = 7,
+		.values = (const char*[]) {
+			"ACTION=remove",
+			dev_path,
+			"SUBSYSTEM=input",
+			"NAME=\"virtual-device-ltp\"",
+			"PROP=0",
+			"EV=7",
+			"REL=3",
+		}
+	};
+
+	const struct uevent_desc *const uevents[] = {
+		&add,
+		&add_event1,
+		&add_event2,
+		&rem_event1,
+		&rem_event2,
+		&rem,
+		NULL
+	};
+
+	fd = open_uevent_netlink();
+
+	create_uinput_mouse();
+
+	SAFE_IOCTL(mouse_fd, UI_GET_SYSNAME(sizeof(sysname)), sysname);
+	handlers = get_input_handlers();
+
+	tst_res(TINFO, "Sysname: %s", sysname);
+	tst_res(TINFO, "Handlers: %s", handlers);
+
+	handler1 = strtok(handlers, " ");
+	if (!handler1)
+		tst_brk(TBROK, "Expected mouseX and eventY handlers!");
+
+	get_minor_major(handler1, minor_event1, major_event1, MINOR_MAJOR_SIZE);
+
+	handler2 = strtok(NULL, " ");
+	if (!handler2)
+		tst_brk(TBROK, "Expected mouseX and eventY handlers!");
+
+	get_minor_major(handler2, minor_event2, major_event2, MINOR_MAJOR_SIZE);
+
+	destroy_uinput_mouse();
+
+	snprintf(add_msg, sizeof(add_msg),
+	         "add@/devices/virtual/input/%s", sysname);
+
+	snprintf(rem_msg, sizeof(rem_msg),
+	         "remove@/devices/virtual/input/%s", sysname);
+
+	snprintf(dev_path, sizeof(dev_path),
+	         "DEVPATH=/devices/virtual/input/%s", sysname);
+
+
+	snprintf(add_msg_event1, sizeof(add_msg_event1),
+	         "add@/devices/virtual/input/%s/%s", sysname, handler1);
+
+	snprintf(rem_msg_event1, sizeof(rem_msg_event1),
+	         "remove@/devices/virtual/input/%s/%s", sysname, handler1);
+
+	snprintf(dev_path_event1, sizeof(dev_path_event1),
+	         "DEVPATH=/devices/virtual/input/%s/%s", sysname, handler1);
+
+	snprintf(dev_name1, sizeof(dev_name1),
+	         "DEVNAME=input/%s", handler1);
+
+
+	snprintf(add_msg_event2, sizeof(add_msg_event2),
+	         "add@/devices/virtual/input/%s/%s", sysname, handler2);
+
+	snprintf(rem_msg_event2, sizeof(rem_msg_event2),
+	         "remove@/devices/virtual/input/%s/%s", sysname, handler2);
+
+	snprintf(dev_path_event2, sizeof(dev_path_event2),
+	         "DEVPATH=/devices/virtual/input/%s/%s", sysname, handler2);
+
+	snprintf(dev_name2, sizeof(dev_name2),
+	         "DEVNAME=input/%s", handler2);
+
+	free(handlers);
+
+	pid = SAFE_FORK();
+	if (!pid) {
+		wait_for_uevents(fd, uevents);
+		exit(0);
+	}
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
