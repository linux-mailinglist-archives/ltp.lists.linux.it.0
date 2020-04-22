Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFAE1B3F8E
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:39:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 415DC3C2979
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:39:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A46183C0738
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:39:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0F808200761
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:39:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C5DC2AB5F
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 10:39:07 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 12:39:07 +0200
Message-Id: <20200422103907.15740-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Add test for CVE 2017-1000112
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

Fixes #489

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Oh noes! UFOs are attacking the kernel!!1! XD

Changes since v1:
- Added needs_kconfigs to struct tst_test
- Fixed GitHub issue number in commit message (the old issue was closed
  as duplicate)

 runtest/cve                                   |  1 +
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/setsockopt/.gitignore     |  1 +
 .../kernel/syscalls/setsockopt/setsockopt05.c | 97 +++++++++++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 testcases/kernel/syscalls/setsockopt/setsockopt05.c

diff --git a/runtest/cve b/runtest/cve
index 629cf7035..e55b7a7e3 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -38,6 +38,7 @@ cve-2017-16939 cve-2017-16939
 cve-2017-16995 bpf_prog03
 cve-2017-17053 cve-2017-17053
 cve-2017-18075 pcrypt_aead01
+cve-2017-1000112 setsockopt05
 cve-2017-1000380 snd_timer01
 cve-2018-5803 sctp_big_chunk
 cve-2018-7566 snd_seq01
diff --git a/runtest/syscalls b/runtest/syscalls
index 9bb72beb2..b67968d95 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1320,6 +1320,7 @@ setsockopt01 setsockopt01
 setsockopt02 setsockopt02
 setsockopt03 setsockopt03
 setsockopt04 setsockopt04
+setsockopt05 setsockopt05
 
 settimeofday01 settimeofday01
 settimeofday02 settimeofday02
diff --git a/testcases/kernel/syscalls/setsockopt/.gitignore b/testcases/kernel/syscalls/setsockopt/.gitignore
index 603e2ad7a..f4eabd92b 100644
--- a/testcases/kernel/syscalls/setsockopt/.gitignore
+++ b/testcases/kernel/syscalls/setsockopt/.gitignore
@@ -2,3 +2,4 @@
 /setsockopt02
 /setsockopt03
 /setsockopt04
+/setsockopt05
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt05.c b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
new file mode 100644
index 000000000..6e938aa60
--- /dev/null
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 SUSE LLC <mdoucha@suse.cz>
+ */
+
+/*
+ * CVE-2017-1000112
+ *
+ * Check that UDP fragmentation offload doesn't cause memory corruption
+ * if the userspace process turns off UFO in between two send() calls.
+ * Kernel crash fixed in:
+ * 
+ *  commit 85f1bd9a7b5a79d5baa8bf44af19658f7bf77bfa
+ *  Author: Willem de Bruijn <willemb@google.com>
+ *  Date:   Thu Aug 10 12:29:19 2017 -0400
+ *
+ *  udp: consistently apply ufo or fragmentation
+ */
+
+#define _GNU_SOURCE
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <sys/ioctl.h>
+#include <net/if.h>
+#include <sched.h>
+
+#include "tst_test.h"
+#include "tst_net.h"
+#include "tst_taint.h"
+
+#define BUFSIZE 4000
+
+static struct sockaddr_in addr;
+
+static void setup(void)
+{
+	int real_uid = getuid();
+	int real_gid = getgid();
+	int sock;
+	struct ifreq ifr;
+
+	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
+
+	SAFE_UNSHARE(CLONE_NEWUSER);
+	SAFE_UNSHARE(CLONE_NEWNET);
+	SAFE_FILE_PRINTF("/proc/self/setgroups", "deny");
+	SAFE_FILE_PRINTF("/proc/self/uid_map", "0 %d 1", real_uid);
+	SAFE_FILE_PRINTF("/proc/self/gid_map", "0 %d 1", real_gid);
+
+	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 12345);
+	sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+	strcpy(ifr.ifr_name, "lo");
+	ifr.ifr_mtu = 1500;
+	SAFE_IOCTL(sock, SIOCSIFMTU, &ifr);
+	ifr.ifr_flags = IFF_UP;
+	SAFE_IOCTL(sock, SIOCSIFFLAGS, &ifr);
+	SAFE_CLOSE(sock);
+}
+
+static void run(void)
+{
+	int sock, i;
+	char buf[BUFSIZE];
+	memset(buf, 0x42, BUFSIZE);
+
+	for (i = 0; i < 1000; i++) {
+		sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+		SAFE_CONNECT(sock, (struct sockaddr *)&addr, sizeof(addr));
+		SAFE_SEND(1, sock, buf, BUFSIZE, MSG_MORE);
+		SAFE_SETSOCKOPT_INT(sock, SOL_SOCKET, SO_NO_CHECK, 1);
+		send(sock, buf, 1, 0);
+		SAFE_CLOSE(sock);
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
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_USER_NS=y",
+		"CONFIG_NET_NS=y",
+		NULL
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "85f1bd9a7b5a"},
+		{"CVE", "2017-1000112"},
+		{}
+	}
+};
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
