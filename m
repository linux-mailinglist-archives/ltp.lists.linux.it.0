Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A75651A8390
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 17:42:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDAA13C2B74
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 17:42:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E43A33C2B40
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 17:42:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 153066009EA
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 17:42:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F3A3AAB8F
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 15:42:06 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 14 Apr 2020 17:42:06 +0200
Message-Id: <20200414154206.21237-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] Add test for CVE 2018-9568
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

Fixes #438

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/cve                                   |   1 +
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/connect/.gitignore  |   1 +
 testcases/kernel/syscalls/connect/connect02.c | 100 ++++++++++++++++++
 4 files changed, 103 insertions(+)
 create mode 100644 testcases/kernel/syscalls/connect/connect02.c

diff --git a/runtest/cve b/runtest/cve
index b26e02f0b..629cf7035 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -41,6 +41,7 @@ cve-2017-18075 pcrypt_aead01
 cve-2017-1000380 snd_timer01
 cve-2018-5803 sctp_big_chunk
 cve-2018-7566 snd_seq01
+cve-2018-9568 connect02
 cve-2018-1000001 realpath01
 cve-2018-1000199 ptrace08
 cve-2018-1000204 ioctl_sg01
diff --git a/runtest/syscalls b/runtest/syscalls
index 44254d7da..2b85473ba 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -121,6 +121,7 @@ close08 close08
 confstr01 confstr01
 
 connect01 connect01
+connect02 connect02
 
 creat01 creat01
 creat03 creat03
diff --git a/testcases/kernel/syscalls/connect/.gitignore b/testcases/kernel/syscalls/connect/.gitignore
index b425169a8..0a3fc90bf 100644
--- a/testcases/kernel/syscalls/connect/.gitignore
+++ b/testcases/kernel/syscalls/connect/.gitignore
@@ -1 +1,2 @@
 /connect01
+/connect02
diff --git a/testcases/kernel/syscalls/connect/connect02.c b/testcases/kernel/syscalls/connect/connect02.c
new file mode 100644
index 000000000..141f83dc2
--- /dev/null
+++ b/testcases/kernel/syscalls/connect/connect02.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017 Christoph Paasch <cpaasch@apple.com>
+ * Copyright (C) 2020 SUSE LLC <mdoucha@suse.cz>
+ *
+ * CVE-2018-9568
+ *
+ * Test that connect() to AF_UNSPEC address correctly converts IPV6 socket
+ * to IPV4 listen socket when IPV6_ADDRFORM is set to AF_INET.
+ * Kernel memory corruption fixed in:
+ *
+ *  commit 9d538fa60bad4f7b23193c89e843797a1cf71ef3
+ *  Author: Christoph Paasch <cpaasch@apple.com>
+ *  Date:   Tue Sep 26 17:38:50 2017 -0700
+ *
+ *  net: Set sk_prot_creator when cloning sockets to the right proto
+ */
+
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <netinet/tcp.h>
+
+#include "tst_test.h"
+#include "tst_net.h"
+#include "tst_taint.h"
+
+static int listenfd;
+static struct sockaddr_in6 bind_addr;
+static struct sockaddr_in bind_addr4, client_addr;
+static struct sockaddr reset_addr;
+
+static void setup(void)
+{
+	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
+
+	tst_init_sockaddr_inet6_bin(&bind_addr, &in6addr_any, 42424);
+	tst_init_sockaddr_inet_bin(&bind_addr4, INADDR_ANY, 0);
+	tst_init_sockaddr_inet(&client_addr, "127.0.0.1", 42424);
+	memset(&reset_addr, 0, sizeof(reset_addr));
+	reset_addr.sa_family = AF_UNSPEC;
+
+	listenfd = SAFE_SOCKET(AF_INET6, SOCK_STREAM, IPPROTO_TCP);
+	SAFE_BIND(listenfd, (struct sockaddr *)&bind_addr, sizeof(bind_addr));
+	SAFE_LISTEN(listenfd, 5);
+}
+
+static void cleanup(void)
+{
+	if (listenfd >= 0)
+		SAFE_CLOSE(listenfd);
+}
+
+static void run(void)
+{
+	int i, addrlen, fd, confd1, confd2, confd3;
+	struct sockaddr_storage client_addr2;
+
+	for (i = 0; i < 1000; i++) {
+		confd1 = SAFE_SOCKET(AF_INET, SOCK_STREAM, IPPROTO_TCP);
+		SAFE_CONNECT(confd1, (struct sockaddr *)&client_addr,
+			sizeof(client_addr));
+
+		fd = SAFE_ACCEPT(listenfd, NULL, NULL);
+		SAFE_SETSOCKOPT_INT(fd, SOL_IPV6, IPV6_ADDRFORM, AF_INET);
+		SAFE_CONNECT(fd, (struct sockaddr *)&reset_addr,
+			sizeof(reset_addr));
+		SAFE_BIND(fd, (struct sockaddr *)&bind_addr4,
+			sizeof(bind_addr4));
+		SAFE_LISTEN(fd, 5);
+
+		addrlen = tst_get_connect_address(fd, &client_addr2);
+		confd2 = SAFE_SOCKET(AF_INET, SOCK_STREAM, IPPROTO_TCP);
+		SAFE_CONNECT(confd2, (struct sockaddr *)&client_addr2, addrlen);
+		confd3 = SAFE_ACCEPT(fd, NULL, NULL);
+
+		SAFE_CLOSE(confd3);
+		SAFE_CLOSE(confd2);
+		SAFE_CLOSE(confd1);
+		SAFE_CLOSE(fd);
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
+		{"linux-git", "9d538fa60bad"},
+		{"CVE", "2018-9568"},
+		{}
+	}
+};
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
