Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC6D9D13A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 16:01:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED26C3C1D0A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 16:01:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 90ED03C1CDE
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 16:01:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4849E600F91
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 16:01:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 525B1B066
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 14:01:26 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Aug 2019 16:01:22 +0200
Message-Id: <20190826140124.24681-4-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190826140124.24681-1-chrubis@suse.cz>
References: <20190826140124.24681-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/5] kernel/uevent: Add uevent02
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

Similar to uevent01 but we create and remove a tun network card instead.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/uevent                      |   1 +
 testcases/kernel/uevents/.gitignore |   1 +
 testcases/kernel/uevents/uevent02.c | 143 ++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 testcases/kernel/uevents/uevent02.c

diff --git a/runtest/uevent b/runtest/uevent
index e9cdf26b8..30b1114a4 100644
--- a/runtest/uevent
+++ b/runtest/uevent
@@ -1 +1,2 @@
 uevent01 uevent01
+uevent02 uevent02
diff --git a/testcases/kernel/uevents/.gitignore b/testcases/kernel/uevents/.gitignore
index 53d0b546a..0afc95534 100644
--- a/testcases/kernel/uevents/.gitignore
+++ b/testcases/kernel/uevents/.gitignore
@@ -1 +1,2 @@
 uevent01
+uevent02
diff --git a/testcases/kernel/uevents/uevent02.c b/testcases/kernel/uevents/uevent02.c
new file mode 100644
index 000000000..b94748c51
--- /dev/null
+++ b/testcases/kernel/uevents/uevent02.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2019 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*
+ * Very simple uevent netlink socket test.
+ *
+ * We fork a child that listens for a kernel events while parents creates and
+ * removes a tun network device which should produce two several add and remove
+ * events.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/wait.h>
+#include <linux/if.h>
+#include <linux/if_tun.h>
+
+#include "tst_test.h"
+
+#include "uevent.h"
+
+#define TUN_PATH "/dev/net/tun"
+
+static void generate_tun_uevents(void)
+{
+	int fd = SAFE_OPEN(TUN_PATH, O_RDWR);
+
+	struct ifreq ifr = {
+		.ifr_flags = IFF_TUN,
+		.ifr_name = "ltp-tun0",
+	};
+
+	SAFE_IOCTL(fd, TUNSETIFF, (void*)&ifr);
+
+	SAFE_IOCTL(fd, TUNSETPERSIST, 0);
+
+	SAFE_CLOSE(fd);
+}
+
+static void verify_uevent(void)
+{
+	int pid, fd;
+
+	struct uevent_desc add = {
+		.msg = "add@/devices/virtual/net/ltp-tun0",
+		.value_cnt = 4,
+		.values = (const char*[]) {
+			"ACTION=add",
+			"DEVPATH=/devices/virtual/net/ltp-tun0",
+			"SUBSYSTEM=net",
+			"INTERFACE=ltp-tun0",
+		}
+	};
+
+	struct uevent_desc add_rx = {
+		.msg = "add@/devices/virtual/net/ltp-tun0/queues/rx-0",
+		.value_cnt = 3,
+		.values = (const char*[]) {
+			"ACTION=add",
+			"DEVPATH=/devices/virtual/net/ltp-tun0/queues/rx-0",
+			"SUBSYSTEM=queues",
+		}
+	};
+
+	struct uevent_desc add_tx = {
+		.msg = "add@/devices/virtual/net/ltp-tun0/queues/tx-0",
+		.value_cnt = 3,
+		.values = (const char*[]) {
+			"ACTION=add",
+			"DEVPATH=/devices/virtual/net/ltp-tun0/queues/tx-0",
+			"SUBSYSTEM=queues",
+		}
+	};
+
+	struct uevent_desc rem_rx = {
+		.msg = "remove@/devices/virtual/net/ltp-tun0/queues/rx-0",
+		.value_cnt = 3,
+		.values = (const char*[]) {
+			"ACTION=remove",
+			"DEVPATH=/devices/virtual/net/ltp-tun0/queues/rx-0",
+			"SUBSYSTEM=queues",
+		}
+	};
+
+	struct uevent_desc rem_tx = {
+		.msg = "remove@/devices/virtual/net/ltp-tun0/queues/tx-0",
+		.value_cnt = 3,
+		.values = (const char*[]) {
+			"ACTION=remove",
+			"DEVPATH=/devices/virtual/net/ltp-tun0/queues/tx-0",
+			"SUBSYSTEM=queues",
+		}
+	};
+
+	struct uevent_desc rem = {
+		.msg = "remove@/devices/virtual/net/ltp-tun0",
+		.value_cnt = 4,
+		.values = (const char*[]) {
+			"ACTION=remove",
+			"DEVPATH=/devices/virtual/net/ltp-tun0",
+			"SUBSYSTEM=net",
+			"INTERFACE=ltp-tun0",
+		}
+	};
+
+	const struct uevent_desc *const uevents[] = {
+		&add,
+		&add_rx,
+		&add_tx,
+		&rem_rx,
+		&rem_tx,
+		&rem,
+		NULL
+	};
+
+	pid = SAFE_FORK();
+	if (!pid) {
+		fd = open_uevent_netlink();
+		TST_CHECKPOINT_WAKE(0);
+		wait_for_uevents(fd, uevents);
+		exit(0);
+	}
+
+	TST_CHECKPOINT_WAIT(0);
+
+	generate_tun_uevents();
+
+	wait_for_pid(pid);
+}
+
+static struct tst_test test = {
+	.test_all = verify_uevent,
+	.forks_child = 1,
+	.needs_tmpdir = 1,
+	.needs_checkpoints = 1,
+	.needs_drivers = (const char *const []) {
+		"tun",
+		NULL
+	},
+	.needs_root = 1
+};
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
