Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C66DA3BA096
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:35:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C9163C8E76
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:35:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 86FE13C84C9
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:35:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 97DD71401356
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:35:46 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1482A2055E;
 Fri,  2 Jul 2021 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1625229346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=o617ca9GY9bkGHnRWfCVttpwqeksFo3+zlCmJqKZ4Qw=;
 b=aV9OIkl4eQeYO0SIFLVA0fvs3hA/eMtiju/HP5NkHHgSH0CJKU3NSkCnieFIxtGJ06leGr
 2HCRjPl0DH6Fm4oB5Rh/YicTsgk6eoiPyo/AsbJkRKL22gcWSTSqQ4m2/UR3oGfEqP1UGk
 Gil5/xJqK+g61BhTTQIA5D8+PrEQKTw=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id C2319A3B96;
 Fri,  2 Jul 2021 12:35:45 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri,  2 Jul 2021 13:35:33 +0100
Message-Id: <20210702123533.18008-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] vsock01,
 CVE-2021-26708: Add reproducer for race condition
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Also as this is the first VSOCK test, add the necessary bits to lapi
and configure.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 configure.ac                        |   1 +
 include/lapi/vm_sockets.h           |  14 +++
 runtest/cve                         |   1 +
 testcases/network/.gitignore        |   1 +
 testcases/network/sockets/Makefile  |   1 +
 testcases/network/sockets/vsock01.c | 129 ++++++++++++++++++++++++++++
 6 files changed, 147 insertions(+)
 create mode 100644 include/lapi/vm_sockets.h
 create mode 100644 testcases/network/sockets/vsock01.c

diff --git a/configure.ac b/configure.ac
index eb675b367..1a43ebea8 100644
--- a/configure.ac
+++ b/configure.ac
@@ -79,6 +79,7 @@ AC_CHECK_HEADERS_ONCE([ \
 ])
 AC_CHECK_HEADERS(fts.h, [have_fts=1])
 AC_SUBST(HAVE_FTS_H, $have_fts)
+AC_CHECK_HEADERS(linux/vm_sockets.h, [], [], [#include <sys/socket.h>])
 
 AC_CHECK_FUNCS_ONCE([ \
     clone3 \
diff --git a/include/lapi/vm_sockets.h b/include/lapi/vm_sockets.h
new file mode 100644
index 000000000..94d0248c5
--- /dev/null
+++ b/include/lapi/vm_sockets.h
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC <rpalethorpe@suse.com>
+ */
+
+#include <sys/socket.h>
+
+#if HAVE_LINUX_VM_SOCKETS_H
+#  include <linux/vm_sockets.h>
+#endif
+
+#ifndef VMADDR_CID_LOCAL
+#  define VMADDR_CID_LOCAL 1
+#endif
diff --git a/runtest/cve b/runtest/cve
index 9da58d524..5a6ef966d 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -63,3 +63,4 @@ cve-2020-14416 pty03
 cve-2020-25705 icmp_rate_limit01
 cve-2020-29373 io_uring02
 cve-2021-3444 bpf_prog05
+cve-2021-26708 vsock01
diff --git a/testcases/network/.gitignore b/testcases/network/.gitignore
index dab2bc34e..c65113960 100644
--- a/testcases/network/.gitignore
+++ b/testcases/network/.gitignore
@@ -24,6 +24,7 @@
 /sctp/sctp_big_chunk
 /sockets/ltpClient
 /sockets/ltpServer
+/sockets/vsock01
 /stress/ns-tools/ns-icmp_redirector
 /stress/ns-tools/ns-icmpv4_sender
 /stress/ns-tools/ns-icmpv6_sender
diff --git a/testcases/network/sockets/Makefile b/testcases/network/sockets/Makefile
index 7d4c289d0..5d655b8be 100644
--- a/testcases/network/sockets/Makefile
+++ b/testcases/network/sockets/Makefile
@@ -10,4 +10,5 @@ INSTALL_TARGETS		:= *.sh
 
 LDLIBS			+= -lpthread
 
+include $(top_srcdir)/include/mk/testcases.mk
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/sockets/vsock01.c b/testcases/network/sockets/vsock01.c
new file mode 100644
index 000000000..fe05ee683
--- /dev/null
+++ b/testcases/network/sockets/vsock01.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC <rpalethorpe@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Reproducer of CVE-2021-26708
+ *
+ * Based on POC https://github.com/jordan9001/vsock_poc
+ * Fuzzy Sync has been substituted for userfaultfd.
+ *
+ * Fixed by: c518adafa39f ("vsock: fix the race conditions in multi-transport support")
+ * Fixes: c0cfa2d8a788fcf4 ("vsock: add multi-transports support")
+ *
+ * Note that in many testing environments this will reproduce the race
+ * silently. For the test to produce visible errors the loopback
+ * transport should be registered, but not the g2h or h2g transports.
+ *
+ * One way to do this is to remove CONFIG_VIRTIO_VSOCKETS in the guest
+ * or CONFIG_VHOST_VSOCK on the host. Or just unload the
+ * modules. Alternatively run the test on a bare metal host which has
+ * never started a VM.
+ */
+
+#include "config.h"
+#include "tst_test.h"
+
+#if HAVE_LINUX_VM_SOCKETS_H
+#  include "tst_fuzzy_sync.h"
+#  include "lapi/vm_sockets.h"
+
+static struct tst_fzsync_pair pair;
+int vsock = -1;
+
+void *writer(LTP_ATTRIBUTE_UNUSED void *unused)
+{
+	const uint64_t b_buflen = 0x4141;
+
+	while (tst_fzsync_run_b(&pair)) {
+		tst_fzsync_start_race_b(&pair);
+		SAFE_SETSOCKOPT(vsock, AF_VSOCK,
+				SO_VM_SOCKETS_BUFFER_SIZE,
+				&b_buflen, sizeof(b_buflen));
+		tst_fzsync_end_race_b(&pair);
+	}
+
+
+	return NULL;
+}
+
+static void run(void)
+{
+	struct sockaddr_vm addr = { 0 };
+	const struct timeval timeout = { 0, 1 };
+	const uint64_t a_buflen = 0x4140;
+
+	vsock = SAFE_SOCKET(AF_VSOCK, SOCK_STREAM, 0);
+	SAFE_SETSOCKOPT(vsock, AF_VSOCK, SO_VM_SOCKETS_CONNECT_TIMEOUT,
+			&timeout, sizeof(timeout));
+
+	tst_res(TINFO, "Colliding transport change and setsockopt");
+	tst_fzsync_pair_reset(&pair, writer);
+	while (tst_fzsync_run_a(&pair)) {
+
+		addr.svm_family = AF_VSOCK;
+		addr.svm_port = 1234;
+		addr.svm_cid = VMADDR_CID_LOCAL;
+
+		if (!connect(vsock, (struct sockaddr *)&addr, sizeof(addr)))
+			tst_brk(TCONF, "Connected to something on VSOCK loopback");
+
+		if (errno == ENODEV)
+			tst_brk(TCONF | TERRNO, "No loopback transport");
+
+		SAFE_SETSOCKOPT(vsock, AF_VSOCK,
+				SO_VM_SOCKETS_BUFFER_SIZE,
+				&a_buflen, sizeof(a_buflen));
+
+		addr.svm_family = AF_VSOCK;
+		addr.svm_port = 5678;
+		addr.svm_cid = VMADDR_CID_HOST + 3;
+
+		tst_fzsync_start_race_a(&pair);
+		TEST(connect(vsock, (struct sockaddr *)&addr, sizeof(addr)));
+		tst_fzsync_end_race_a(&pair);
+
+		if (!TST_RET) {
+			tst_brk(TCONF,
+				"g2h or h2g transport exists and we connected to something");
+		}
+	}
+
+	SAFE_CLOSE(vsock);
+	tst_res(TPASS, "Nothing bad happened, probably.");
+}
+
+static void cleanup(void)
+{
+	tst_fzsync_pair_cleanup(&pair);
+}
+
+static void setup(void)
+{
+	tst_fzsync_pair_init(&pair);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_VSOCKETS_LOOPBACK",
+		NULL
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "c518adafa39f"},
+		{"CVE", "CVE-2021-26708"},
+		{}
+	},
+};
+
+#else
+
+TST_TEST_TCONF("No linux/vm_sockets.h");
+
+#endif
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
