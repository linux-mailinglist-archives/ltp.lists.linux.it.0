Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D99D7255D9D
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 17:17:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94A1B3C2E4B
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 17:17:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B32CD3C25A9
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 17:17:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A92751A0090A
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 17:17:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F474AC4C
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 15:18:21 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 28 Aug 2020 17:17:47 +0200
Message-Id: <20200828151747.21445-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] Add test for send(MSG_MORE)
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

The setsockopt05 test will not work properly if kernel handles the MSG_MORE
flag incorrectly. Add a new test to detect broken test environment.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/syscalls                          |   1 +
 testcases/kernel/syscalls/send/.gitignore |   1 +
 testcases/kernel/syscalls/send/send02.c   | 177 ++++++++++++++++++++++
 3 files changed, 179 insertions(+)
 create mode 100644 testcases/kernel/syscalls/send/send02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index a6ab75ba7..fd43977fa 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1174,6 +1174,7 @@ semop02 semop02
 semop03 semop03
 
 send01 send01
+send02 send02
 
 sendfile02 sendfile02
 sendfile02_64 sendfile02_64
diff --git a/testcases/kernel/syscalls/send/.gitignore b/testcases/kernel/syscalls/send/.gitignore
index 9394e972f..ec3cc677c 100644
--- a/testcases/kernel/syscalls/send/.gitignore
+++ b/testcases/kernel/syscalls/send/.gitignore
@@ -1 +1,2 @@
 /send01
+/send02
diff --git a/testcases/kernel/syscalls/send/send02.c b/testcases/kernel/syscalls/send/send02.c
new file mode 100644
index 000000000..5630230fa
--- /dev/null
+++ b/testcases/kernel/syscalls/send/send02.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
+ */
+
+/*
+ * Check that the kernel correctly handles send()/sendto()/sendmsg() calls
+ * with MSG_MORE flag
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
+
+#define SENDSIZE 16
+#define RECVSIZE 32
+
+static int sock = -1, dst_sock = -1, listen_sock = -1;
+static struct sockaddr_in addr;
+static char sendbuf[SENDSIZE];
+
+static void do_send(int sock, void *buf, size_t size, int flags)
+{
+	SAFE_SEND(1, sock, buf, size, flags);
+}
+
+static void do_sendto(int sock, void *buf, size_t size, int flags)
+{
+	SAFE_SENDTO(1, sock, buf, size, flags, (struct sockaddr *)&addr,
+		sizeof(addr));
+}
+
+static void do_sendmsg(int sock, void *buf, size_t size, int flags)
+{
+	struct msghdr msg;
+	struct iovec iov;
+
+	iov.iov_base = buf;
+	iov.iov_len = size;
+	msg.msg_name = &addr;
+	msg.msg_namelen = sizeof(addr);
+	msg.msg_iov = &iov;
+	msg.msg_iovlen = 1;
+	msg.msg_control = NULL;
+	msg.msg_controllen = 0;
+	msg.msg_flags = 0;
+	SAFE_SENDMSG(size, sock, &msg, flags);
+}
+
+static struct test_case {
+	int domain, type, protocol;
+	void (*send)(int sock, void *buf, size_t size, int flags);
+	int needs_connect, needs_accept;
+	const char *name;
+} testcase_list[] = {
+	{AF_INET, SOCK_STREAM, 0, do_send, 1, 1, "TCP send"},
+	{AF_INET, SOCK_DGRAM, 0, do_send, 1, 0, "UDP send"},
+	{AF_INET, SOCK_DGRAM, 0, do_sendto, 0, 0, "UDP sendto"},
+	{AF_INET, SOCK_DGRAM, 0, do_sendmsg, 0, 0, "UDP sendmsg"}
+};
+
+static void setup(void)
+{
+	memset(sendbuf, 0x42, SENDSIZE);
+}
+
+static int check_recv(int sock, long expsize)
+{
+	char recvbuf[RECVSIZE] = {0};
+
+	TEST(recv(sock, recvbuf, RECVSIZE, MSG_DONTWAIT));
+
+	if (TST_RET == -1) {
+		/* expected error immediately after send(MSG_MORE) */
+		if (!expsize && (TST_ERR == EAGAIN || TST_ERR == EWOULDBLOCK))
+			return 1;
+
+		/* unexpected error */
+		tst_res(TFAIL | TTERRNO, "recv() error");
+		return 0;
+	}
+
+	if (TST_RET < 0) {
+		tst_res(TFAIL | TTERRNO, "Invalid recv() return value %ld",
+			TST_RET);
+		return 0;
+	}
+
+	if (TST_RET != expsize) {
+		tst_res(TFAIL, "recv() read %ld bytes, expected %ld", TST_RET,
+			expsize);
+		return 0;
+	}
+
+	return 1;
+}
+
+static void cleanup(void)
+{
+	if (sock >= 0)
+		SAFE_CLOSE(sock);
+
+	if (dst_sock >= 0 && dst_sock != listen_sock)
+		SAFE_CLOSE(dst_sock);
+
+	if (listen_sock >= 0)
+		SAFE_CLOSE(listen_sock);
+}
+
+static void run(unsigned int n)
+{
+	int i, ret;
+	struct test_case *tc = testcase_list + n;
+	socklen_t len = sizeof(addr);
+
+	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 0);
+	listen_sock = SAFE_SOCKET(tc->domain, tc->type, tc->protocol);
+	dst_sock = listen_sock;
+	SAFE_BIND(listen_sock, (struct sockaddr *)&addr, sizeof(addr));
+	SAFE_GETSOCKNAME(listen_sock, (struct sockaddr *)&addr, &len);
+
+	if (tc->needs_accept)
+		SAFE_LISTEN(listen_sock, 1);
+
+	for (i = 0; i < 1000; i++) {
+		sock = SAFE_SOCKET(tc->domain, tc->type, tc->protocol);
+
+		if (tc->needs_connect)
+			SAFE_CONNECT(sock, (struct sockaddr *)&addr, len);
+
+		if (tc->needs_accept)
+			dst_sock = SAFE_ACCEPT(listen_sock, NULL, NULL);
+
+		tc->send(sock, sendbuf, SENDSIZE, 0);
+		ret = check_recv(dst_sock, SENDSIZE);
+
+		if (!ret)
+			break;
+
+		tc->send(sock, sendbuf, SENDSIZE, MSG_MORE);
+		ret = check_recv(dst_sock, 0);
+
+		if (!ret)
+			break;
+
+		tc->send(sock, sendbuf, 1, 0);
+		ret = check_recv(dst_sock, SENDSIZE + 1);
+
+		if (!ret)
+			break;
+
+		SAFE_CLOSE(sock);
+
+		if (dst_sock != listen_sock)
+			SAFE_CLOSE(dst_sock);
+	}
+
+	if (ret)
+		tst_res(TPASS, "%s(MSG_MORE) works correctly", tc->name);
+
+	cleanup();
+	dst_sock = -1;
+}
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(testcase_list),
+	.setup = setup,
+	.cleanup = cleanup
+};
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
