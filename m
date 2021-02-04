Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E8430ACCD
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 17:40:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAC0D3C87E7
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 17:40:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8F8DC3C5E35
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 17:39:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 006A01A00A56
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 17:39:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6792CAF9E
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 16:39:49 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  1 Feb 2021 17:39:48 +0100
Message-Id: <20210201163948.24783-4-mdoucha@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201163948.24783-1-mdoucha@suse.cz>
References: <20210201163948.24783-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] Add test for CVE 2020-29373
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

Fixes #770

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/cve                                   |   1 +
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/io_uring/io_uring02.c     | 197 ++++++++++++++++++
 3 files changed, 199 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_uring/io_uring02.c

diff --git a/runtest/cve b/runtest/cve
index 0bb1983bc..f650854f9 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -60,3 +60,4 @@ cve-2019-8912 af_alg07
 cve-2020-11494 pty04
 cve-2020-14386 sendto03
 cve-2020-14416 pty03
+cve-2020-29373 io_uring02
diff --git a/runtest/syscalls b/runtest/syscalls
index 11a1e83c2..dbb33a2cd 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1712,3 +1712,4 @@ statx07 statx07
 membarrier01 membarrier01
 
 io_uring01 io_uring01
+io_uring02 io_uring02
diff --git a/testcases/kernel/syscalls/io_uring/io_uring02.c b/testcases/kernel/syscalls/io_uring/io_uring02.c
new file mode 100644
index 000000000..b045cc34e
--- /dev/null
+++ b/testcases/kernel/syscalls/io_uring/io_uring02.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC
+ * Author: Nicolai Stange <nstange@suse.de>
+ * LTP port: Martin Doucha <mdoucha@suse.cz>
+ *
+ * CVE-2020-29373
+ *
+ * Check that io_uring does not bypass chroot. Fixed in:
+ *
+ *  commit ff002b30181d30cdfbca316dadd099c3ca0d739c
+ *  Author: Jens Axboe <axboe@kernel.dk>
+ *  Date:   Fri Feb 7 16:05:21 2020 -0700
+ *
+ *  io_uring: grab ->fs as part of async preparation
+ */
+
+#include <stdio.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include "tst_test.h"
+#include "tst_safe_io_uring.h"
+
+#define CHROOT_DIR "test_root"
+#define SOCK_NAME "sock"
+#define SPAM_MARK 0xfa7
+#define BEEF_MARK 0xbeef
+
+static struct sockaddr_un addr;
+static int sendsock = -1, recvsock = -1, sockpair[2] = {-1, -1};
+static struct io_uring_params params;
+static struct tst_io_uring uring = { .fd = -1 };
+static char buf[16];
+static struct iovec iov = {
+	.iov_base = buf,
+	.iov_len = sizeof(buf)
+};
+
+static struct msghdr spam_header = {
+	.msg_name = NULL,
+	.msg_namelen = 0,
+	.msg_iov = &iov,
+	.msg_iovlen = 1
+};
+
+static struct msghdr beef_header = {
+	.msg_name = &addr,
+	.msg_namelen = sizeof(addr),
+	.msg_iov = &iov,
+	.msg_iovlen = 1
+};
+
+static void setup(void)
+{
+	char *tmpdir = tst_get_tmpdir();
+	int ret;
+
+	addr.sun_family = AF_UNIX;
+	ret = snprintf(addr.sun_path, sizeof(addr.sun_path), "%s/%s", tmpdir,
+		SOCK_NAME);
+	free(tmpdir);
+
+	if (ret >= (int)sizeof(addr.sun_path))
+		tst_brk(TBROK, "Tempdir path is too long");
+
+	io_uring_setup_supported_by_kernel();
+
+	sendsock = SAFE_SOCKET(AF_UNIX, SOCK_DGRAM, 0);
+	recvsock = SAFE_SOCKET(AF_UNIX, SOCK_DGRAM, 0);
+	SAFE_BIND(recvsock, (struct sockaddr *)&addr, sizeof(addr));
+
+	SAFE_MKDIR(CHROOT_DIR, 0755);
+	SAFE_CHROOT(CHROOT_DIR);
+}
+
+static void run(void)
+{
+	uint32_t i, count, tail;
+	int beef_found = 0;
+	struct io_uring_sqe *sqe_ptr;
+	const struct io_uring_cqe *cqe_ptr;
+
+	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sockpair);
+	SAFE_SETSOCKOPT_INT(sockpair[0], SOL_SOCKET, SO_SNDBUF,
+		32+sizeof(buf));
+	SAFE_FCNTL(sockpair[0], F_SETFL, O_NONBLOCK);
+
+	SAFE_IO_URING_INIT(512, &params, &uring);
+	sqe_ptr = uring.sqr_entries;
+
+	/* Add spam requests to force async processing of the real test */
+	for (i = 0, tail = *uring.sqr_tail; i < 255; i++, tail++, sqe_ptr++) {
+		memset(sqe_ptr, 0, sizeof(*sqe_ptr));
+		sqe_ptr->opcode = IORING_OP_SENDMSG;
+		sqe_ptr->flags = IOSQE_IO_DRAIN;
+		sqe_ptr->fd = sockpair[0];
+		sqe_ptr->addr = (__u64)&spam_header;
+		sqe_ptr->user_data = SPAM_MARK;
+		uring.sqr_array[tail & *uring.sqr_mask] = i;
+	}
+
+	/* Add the real test to queue */
+	memset(sqe_ptr, 0, sizeof(*sqe_ptr));
+	sqe_ptr->opcode = IORING_OP_SENDMSG;
+	sqe_ptr->flags = IOSQE_IO_DRAIN;
+	sqe_ptr->fd = sendsock;
+	sqe_ptr->addr = (__u64)&beef_header;
+	sqe_ptr->user_data = BEEF_MARK;
+	uring.sqr_array[tail & *uring.sqr_mask] = i;
+	count = ++i;
+	tail++;
+
+	__atomic_store(uring.sqr_tail, &tail, __ATOMIC_RELEASE);
+	SAFE_IO_URING_ENTER(1, uring.fd, count, count, IORING_ENTER_GETEVENTS,
+		NULL);
+
+	/* Check test results */
+	__atomic_load(uring.cqr_tail, &tail, __ATOMIC_ACQUIRE);
+
+	for (i = *uring.cqr_head; i != tail; i++, count--) {
+		cqe_ptr = uring.cqr_entries + (i & *uring.cqr_mask);
+		TST_ERR = -cqe_ptr->res;
+
+		if (cqe_ptr->user_data == SPAM_MARK) {
+			if (cqe_ptr->res >= 0 || cqe_ptr->res == -EAGAIN)
+				continue;
+
+			tst_res(TFAIL | TTERRNO,
+				"Spam request failed unexpectedly");
+			continue;
+		}
+
+		if (cqe_ptr->user_data != BEEF_MARK) {
+			tst_res(TFAIL, "Unexpected entry in completion queue");
+			count++;
+			continue;
+		}
+
+		beef_found = 1;
+
+		if (cqe_ptr->res >= 0) {
+			tst_res(TFAIL, "Write outside chroot succeeded.");
+		} else if (cqe_ptr->res != -ENOENT) {
+			tst_res(TFAIL | TTERRNO,
+				"Write outside chroot failed unexpectedly");
+		} else {
+			tst_res(TPASS,
+				"Write outside chroot failed as expected");
+		}
+	}
+
+	__atomic_store(uring.cqr_head, &i, __ATOMIC_RELEASE);
+
+	if (!beef_found)
+		tst_res(TFAIL, "Write outside chroot result not found");
+
+	if (count)
+		tst_res(TFAIL, "Wrong number of entries in completion queue");
+
+	/* iteration cleanup */
+	SAFE_IO_URING_CLOSE(&uring);
+	SAFE_CLOSE(sockpair[0]);
+	SAFE_CLOSE(sockpair[1]);
+}
+
+static void cleanup(void)
+{
+	if (uring.fd >= 0)
+		SAFE_IO_URING_CLOSE(&uring);
+
+	if (sockpair[0] >= 0) {
+		SAFE_CLOSE(sockpair[0]);
+		SAFE_CLOSE(sockpair[1]);
+	}
+
+	if (recvsock >= 0)
+		SAFE_CLOSE(recvsock);
+
+	if (sendsock >= 0)
+		SAFE_CLOSE(sendsock);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_REQ, CAP_SYS_CHROOT),
+		{}
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "ff002b30181d"},
+		{"CVE", "2020-29373"},
+		{}
+	}
+};
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
