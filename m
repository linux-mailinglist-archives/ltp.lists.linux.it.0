Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D702316EB14
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 17:15:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E0DC3C24D8
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 17:15:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id CB77C3C12E6
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 17:15:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 59B1D1A01792
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 17:15:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D54F2ABD7
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 16:15:14 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 Feb 2020 17:15:14 +0100
Message-Id: <20200225161514.25544-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] Add test for CVE-2017-17712
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
 runtest/cve                                   |   1 +
 testcases/kernel/syscalls/sendmsg/Makefile    |   3 +
 testcases/kernel/syscalls/sendmsg/sendmsg03.c | 113 ++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 testcases/kernel/syscalls/sendmsg/sendmsg03.c

diff --git a/runtest/cve b/runtest/cve
index 57cf66075..db7b98dfb 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -26,6 +26,7 @@ cve-2017-15299 request_key03 -b cve-2017-15299
 cve-2017-15537 ptrace07
 cve-2017-15649 fanout01
 cve-2017-15951 request_key03 -b cve-2017-15951
+cve-2017-17712 sendmsg03
 cve-2017-17805 af_alg02
 cve-2017-17806 af_alg01
 cve-2017-17807 request_key04
diff --git a/testcases/kernel/syscalls/sendmsg/Makefile b/testcases/kernel/syscalls/sendmsg/Makefile
index e69c726f5..170cc00a6 100644
--- a/testcases/kernel/syscalls/sendmsg/Makefile
+++ b/testcases/kernel/syscalls/sendmsg/Makefile
@@ -22,4 +22,7 @@ include $(top_srcdir)/include/mk/testcases.mk
 
 CPPFLAGS		+= -I$(abs_srcdir)/../utils
 
+sendmsg03:  CFLAGS += -pthread
+sendmsg03:  LDLIBS += -pthread -lrt
+
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/sendmsg/sendmsg03.c b/testcases/kernel/syscalls/sendmsg/sendmsg03.c
new file mode 100644
index 000000000..dcabfbb00
--- /dev/null
+++ b/testcases/kernel/syscalls/sendmsg/sendmsg03.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 SUSE LLC <mdoucha@suse.cz>
+ *
+ * CVE-2017-17712
+ *
+ * Test for race condition vulnerability in sendmsg() on SOCK_RAW sockets.
+ * Changing the value of IP_HDRINCL socket option in parallel with sendmsg()
+ * call may lead to uninitialized stack pointer usage, allowing arbitrary code
+ * execution or privilege escalation. Fixed in:
+ *
+ *  commit 8f659a03a0ba9289b9aeb9b4470e6fb263d6f483
+ *  Author: Mohamed Ghannam <simo.ghannam@gmail.com>
+ *  Date:   Sun Dec 10 03:50:58 2017 +0000
+ *
+ *  net: ipv4: fix for a race condition in raw_sendmsg
+ */
+#define _GNU_SOURCE
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <sched.h>
+#include "tst_test.h"
+#include "tst_fuzzy_sync.h"
+#include "tst_taint.h"
+
+#define IOVEC_COUNT 4
+#define PACKET_SIZE 100
+
+static int sockfd = -1;
+static struct msghdr msg;
+/* addr must be full of zeroes to trigger the kernel bug */
+static struct sockaddr_in addr;
+static struct iovec iov[IOVEC_COUNT];
+static unsigned char buf[PACKET_SIZE];
+static struct tst_fzsync_pair fzsync_pair;
+
+static void setup(void)
+{
+	int i;
+
+	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
+	SAFE_UNSHARE(CLONE_NEWUSER);
+	SAFE_UNSHARE(CLONE_NEWNET);
+	sockfd = SAFE_SOCKET(AF_INET, SOCK_RAW, IPPROTO_ICMP);
+
+	memset(buf, 0xcc, PACKET_SIZE);
+
+	for (i = 0; i < IOVEC_COUNT; i++) {
+		iov[i].iov_base = buf;
+		iov[i].iov_len = PACKET_SIZE;
+	}
+
+	msg.msg_name = &addr;
+	msg.msg_namelen = sizeof(addr);
+	msg.msg_iov = iov;
+	msg.msg_iovlen = IOVEC_COUNT;
+
+	fzsync_pair.exec_loops = 100000;
+	tst_fzsync_pair_init(&fzsync_pair);
+}
+
+static void cleanup(void)
+{
+	SAFE_CLOSE(sockfd);
+	tst_fzsync_pair_cleanup(&fzsync_pair);
+}
+
+static void *thread_run(void *arg)
+{
+	int val = 0;
+
+	while (tst_fzsync_run_b(&fzsync_pair)) {
+		tst_fzsync_start_race_b(&fzsync_pair);
+		setsockopt(sockfd, SOL_IP, IP_HDRINCL, &val, sizeof(val));
+		tst_fzsync_end_race_b(&fzsync_pair);
+	}
+
+	return arg;
+}
+
+static void run(void)
+{
+	int hdrincl = 1;
+
+	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
+
+	while (tst_fzsync_run_a(&fzsync_pair)) {
+		SAFE_SETSOCKOPT_INT(sockfd, SOL_IP, IP_HDRINCL, hdrincl);
+
+		tst_fzsync_start_race_a(&fzsync_pair);
+		sendmsg(sockfd, &msg, 0);
+		tst_fzsync_end_race_a(&fzsync_pair);
+
+		if (tst_taint_check()) {
+			tst_res(TFAIL, "Kernel is vulnerable");
+			return;
+		}
+	}
+
+	tst_res(TPASS, "Nothing bad happened, probably");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "8f659a03a0ba"},
+		{"CVE", "2017-17712"},
+		{}
+	}
+};
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
