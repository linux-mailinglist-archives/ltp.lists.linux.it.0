Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FFC1C5AF3
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:23:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68BA63C57E6
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:23:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 395C83C2646
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:23:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 90E20600BB6
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:23:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7385FAD5E
 for <ltp@lists.linux.it>; Tue,  5 May 2020 15:23:18 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  5 May 2020 17:23:14 +0200
Message-Id: <20200505152315.29216-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505152315.29216-1-mdoucha@suse.cz>
References: <20200505152315.29216-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] Add test for CVE 2016-8655
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Use LAPI headers
- Minor cleanup
- Quit early if TPACKET_V3 is not supported

This test is awfully slow but it checks for local root exploit.

 runtest/cve                                   |   1 +
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/setsockopt/.gitignore     |   1 +
 testcases/kernel/syscalls/setsockopt/Makefile |   2 +
 .../kernel/syscalls/setsockopt/setsockopt06.c | 135 ++++++++++++++++++
 5 files changed, 140 insertions(+)
 create mode 100644 testcases/kernel/syscalls/setsockopt/setsockopt06.c

diff --git a/runtest/cve b/runtest/cve
index c2e9e8c89..786b5ee76 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -12,6 +12,7 @@ cve-2016-4997 setsockopt03
 cve-2016-5195 dirtyc0w
 cve-2016-7042 cve-2016-7042
 cve-2016-7117 cve-2016-7117
+cve-2016-8655 setsockopt06
 cve-2016-9604 keyctl08
 cve-2016-9793 setsockopt04
 cve-2016-10044 cve-2016-10044
diff --git a/runtest/syscalls b/runtest/syscalls
index cbab5730c..bdcd9a5b8 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1326,6 +1326,7 @@ setsockopt02 setsockopt02
 setsockopt03 setsockopt03
 setsockopt04 setsockopt04
 setsockopt05 setsockopt05
+setsockopt06 setsockopt06
 
 settimeofday01 settimeofday01
 settimeofday02 settimeofday02
diff --git a/testcases/kernel/syscalls/setsockopt/.gitignore b/testcases/kernel/syscalls/setsockopt/.gitignore
index f4eabd92b..ad067c3e3 100644
--- a/testcases/kernel/syscalls/setsockopt/.gitignore
+++ b/testcases/kernel/syscalls/setsockopt/.gitignore
@@ -3,3 +3,4 @@
 /setsockopt03
 /setsockopt04
 /setsockopt05
+/setsockopt06
diff --git a/testcases/kernel/syscalls/setsockopt/Makefile b/testcases/kernel/syscalls/setsockopt/Makefile
index 044619fb8..1e80facd4 100644
--- a/testcases/kernel/syscalls/setsockopt/Makefile
+++ b/testcases/kernel/syscalls/setsockopt/Makefile
@@ -2,6 +2,8 @@
 # Copyright (c) International Business Machines  Corp., 2001
 
 top_srcdir		?= ../../../..
+setsockopt06:		CFLAGS += -pthread
+setsockopt06:		LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/testcases.mk
 
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt06.c b/testcases/kernel/syscalls/setsockopt/setsockopt06.c
new file mode 100644
index 000000000..c1f142d51
--- /dev/null
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt06.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
+ */
+
+/*
+ * CVE-2016-8655
+ *
+ * Check for race condition between packet_set_ring() and tp_version. On some
+ * kernels, this may lead to use-after-free. Kernel crash fixed in:
+ * 
+ *  commit 84ac7260236a49c79eede91617700174c2c19b0c
+ *  Author: Philip Pettersson <philip.pettersson@gmail.com>
+ *  Date:   Wed Nov 30 14:55:36 2016 -0800
+ *
+ *  packet: fix race condition in packet_set_ring
+ */
+
+#define _GNU_SOURCE
+#include <unistd.h>
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <sched.h>
+
+#include "tst_test.h"
+#include "tst_fuzzy_sync.h"
+#include "tst_taint.h"
+#include "lapi/if_packet.h"
+#include "lapi/if_ether.h"
+
+static int sock = -1;
+static struct tst_fzsync_pair fzsync_pair;
+
+static void setup(void)
+{
+	int real_uid = getuid();
+	int real_gid = getgid();
+
+	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
+
+	SAFE_UNSHARE(CLONE_NEWUSER);
+	SAFE_UNSHARE(CLONE_NEWNET);
+	SAFE_FILE_PRINTF("/proc/self/setgroups", "deny");
+	SAFE_FILE_PRINTF("/proc/self/uid_map", "0 %d 1", real_uid);
+	SAFE_FILE_PRINTF("/proc/self/gid_map", "0 %d 1", real_gid);
+
+	fzsync_pair.exec_loops = 100000;
+	fzsync_pair.exec_time_p = 0.9;
+	tst_fzsync_pair_init(&fzsync_pair);
+}
+
+static void *thread_run(void *arg)
+{
+	int ret;
+	struct tpacket_req3 req = {
+		.tp_block_size = 4096,
+		.tp_block_nr = 1,
+		.tp_frame_size = 4096,
+		.tp_frame_nr = 1,
+		.tp_retire_blk_tov = 100
+	};
+
+	while (tst_fzsync_run_b(&fzsync_pair)) {
+		tst_fzsync_start_race_b(&fzsync_pair);
+		ret = setsockopt(sock, SOL_PACKET, PACKET_RX_RING, &req,
+			sizeof(req));
+		tst_fzsync_end_race_b(&fzsync_pair);
+
+		if (!ret)
+			tst_fzsync_pair_add_bias(&fzsync_pair, -10);
+	}
+
+	return arg;
+}
+
+static void run(void)
+{
+	int val1 = TPACKET_V1, val3 = TPACKET_V3;
+
+	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
+
+	while (tst_fzsync_run_a(&fzsync_pair)) {
+		sock = SAFE_SOCKET(AF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
+		TEST(setsockopt(sock, SOL_PACKET, PACKET_VERSION, &val3,
+			sizeof(val3)));
+
+		if (TST_RET == -1 && TST_ERR == EINVAL)
+			tst_brk(TCONF | TTERRNO, "TPACKET_V3 not supported");
+
+		if (TST_RET) {
+			tst_brk(TBROK | TTERRNO,
+				"setsockopt(PACKET_VERSION, TPACKET_V3");
+		}
+
+		tst_fzsync_start_race_a(&fzsync_pair);
+		setsockopt(sock, SOL_PACKET, PACKET_VERSION, &val1,
+			sizeof(val1));
+		tst_fzsync_end_race_a(&fzsync_pair);
+		SAFE_CLOSE(sock);
+	}
+
+	/* setsockopt(PACKET_RX_RING) created a 100ms timer. Wait for it. */
+	usleep(300000);
+
+	if (tst_taint_check()) {
+		tst_res(TFAIL, "Kernel is vulnerable");
+		return;
+	}
+
+	tst_res(TPASS, "Nothing bad happened, probably");
+}
+
+static void cleanup(void)
+{
+	tst_fzsync_pair_cleanup(&fzsync_pair);
+
+	if (sock >= 0)
+		SAFE_CLOSE(sock);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_USER_NS=y",
+		"CONFIG_NET_NS=y",
+		NULL
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "84ac7260236a"},
+		{"CVE", "2016-8655"},
+		{}
+	}
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
