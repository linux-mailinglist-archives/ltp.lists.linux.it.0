Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B96376219
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 10:33:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1004A3C563B
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 10:33:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DAD663C67D0
 for <ltp@lists.linux.it>; Fri,  7 May 2021 10:33:16 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 83BCE6010E1
 for <ltp@lists.linux.it>; Fri,  7 May 2021 10:33:15 +0200 (CEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fc3YS0Z0yzkXQb;
 Fri,  7 May 2021 16:30:36 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 7 May 2021 16:33:01 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 7 May 2021 16:33:21 +0800
Message-ID: <20210507083321.167998-4-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507083321.167998-1-xieziyao@huawei.com>
References: <20210507083321.167998-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] syscalls/io_submit: Add io_submit02 test for
 native AIO
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
Cc: rpalethorpe@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test io_submit invoked via syscall(2):
- io_submit fails and returns EINVAL if ctx is invalid;
- io_submit fails and returns EINVAL if nr is invalid;
- io_submit fails and returns EFAULT if iocbpp pointer is invalid;
- io_submit fails and returns EBADF if fd is invalid;
- io_submit should work fine if no-op.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/io_submit/.gitignore      |   1 +
 .../kernel/syscalls/io_submit/io_submit02.c   | 119 ++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_submit/io_submit02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index b8f195891..a1c0f2de2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -616,6 +616,7 @@ io_pgetevents02 io_pgetevents02
 io_setup01 io_setup01
 io_setup02 io_setup02
 io_submit01 io_submit01
+io_submit02 io_submit02

 keyctl01 keyctl01
 keyctl02 keyctl02
diff --git a/testcases/kernel/syscalls/io_submit/.gitignore b/testcases/kernel/syscalls/io_submit/.gitignore
index cac043b6c..5f2a2cff2 100644
--- a/testcases/kernel/syscalls/io_submit/.gitignore
+++ b/testcases/kernel/syscalls/io_submit/.gitignore
@@ -1 +1,2 @@
 /io_submit01
+/io_submit02
diff --git a/testcases/kernel/syscalls/io_submit/io_submit02.c b/testcases/kernel/syscalls/io_submit/io_submit02.c
new file mode 100644
index 000000000..e695bcb5d
--- /dev/null
+++ b/testcases/kernel/syscalls/io_submit/io_submit02.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Ported from Crackerjack to LTP by Masatake YAMATO <yamato@redhat.com>
+ * Copyright (c) 2011-2017 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Test io_submit invoked via syscall(2):
+ * - io_submit fails and returns EINVAL if ctx is invalid;
+ * - io_submit fails and returns EINVAL if nr is invalid;
+ * - io_submit fails and returns EFAULT if iocbpp pointer is invalid;
+ * - io_submit fails and returns EBADF if fd is invalid;
+ * - io_submit should work fine if no-op.
+ */
+
+#include <linux/aio_abi.h>
+
+#include "config.h"
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+
+static aio_context_t ctx;
+static aio_context_t invalid_ctx;
+static char buf[100];
+
+static struct iocb iocb;
+static struct iocb *iocbs[] = {&iocb};
+
+static struct iocb inv_fd_iocb;
+static struct iocb *inv_fd_iocbs[] = {&inv_fd_iocb};
+
+static int rdonly_fd;
+static struct iocb rdonly_fd_iocb;
+static struct iocb *rdonly_fd_iocbs[] = {&rdonly_fd_iocb};
+
+static int wronly_fd;
+static struct iocb wronly_fd_iocb;
+static struct iocb *wronly_fd_iocbs[] = {&wronly_fd_iocb};
+
+static struct iocb zero_buf_iocb;
+static struct iocb *zero_buf_iocbs[] = {&zero_buf_iocb};
+
+static struct iocb *zero_iocbs[1];
+
+static struct tcase {
+	aio_context_t *ctx;
+	long nr;
+	struct iocb **iocbs;
+	int exp_errno;
+	const char *desc;
+} tc[] = {
+	/* Invalid ctx */
+	{&invalid_ctx, 1, iocbs, EINVAL, "invalid ctx"},
+	/* Invalid nr */
+	{&ctx, -1, iocbs, EINVAL, "invalid nr"},
+	/* Invalid pointer */
+	{&ctx, 1, (void*)-1, EFAULT, "invalid iocbpp pointer"},
+	{&ctx, 1, zero_iocbs, EFAULT, "NULL iocb pointers"},
+	/* Invalid fd */
+	{&ctx, 1, inv_fd_iocbs, EBADF, "invalid fd"},
+	{&ctx, 1, rdonly_fd_iocbs, EBADF, "readonly fd for write"},
+	{&ctx, 1, wronly_fd_iocbs, EBADF, "writeonly fd for read"},
+	/* No-op but should work fine */
+	{&ctx, 1, zero_buf_iocbs, 0, "zero buf size"},
+	{&ctx, 0, NULL, 0, "zero nr"},
+};
+
+static inline void io_prep_option(struct iocb *cb, int fd, void *buf,
+			size_t count, long long offset, unsigned opcode)
+{
+	memset(cb, 0, sizeof(*cb));
+	cb->aio_fildes = fd;
+	cb->aio_lio_opcode = opcode;
+	cb->aio_buf = (uint64_t)buf;
+	cb->aio_offset = offset;
+	cb->aio_nbytes = count;
+}
+
+static void setup(void)
+{
+	TST_EXP_PASS(tst_syscall(__NR_io_setup, 1, &ctx));
+	io_prep_option(&inv_fd_iocb, -1, buf, sizeof(buf), 0, IOCB_CMD_PREAD);
+
+	rdonly_fd = SAFE_OPEN("rdonly_file", O_RDONLY | O_CREAT, 0777);
+	io_prep_option(&rdonly_fd_iocb, rdonly_fd, buf, sizeof(buf), 0, IOCB_CMD_PWRITE);
+
+	io_prep_option(&zero_buf_iocb, rdonly_fd, buf, 0, 0, IOCB_CMD_PREAD);
+
+	wronly_fd = SAFE_OPEN("wronly_file", O_WRONLY | O_CREAT, 0777);
+	io_prep_option(&wronly_fd_iocb, wronly_fd, buf, sizeof(buf), 0, IOCB_CMD_PREAD);
+}
+
+static void cleanup(void)
+{
+	if (rdonly_fd > 0)
+		SAFE_CLOSE(rdonly_fd);
+	if (wronly_fd > 0)
+		SAFE_CLOSE(wronly_fd);
+}
+
+static void run(unsigned int i)
+{
+	TEST(tst_syscall(__NR_io_submit, *tc[i].ctx, tc[i].nr, tc[i].iocbs));
+	tst_res(TST_ERR == tc[i].exp_errno ? TPASS : TFAIL,
+		"io_submit(2) with %s returns %s, expected %s",
+		tc[i].desc, tst_strerrno(TST_ERR), tst_strerrno(tc[i].exp_errno));
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = run,
+	.tcnt = ARRAY_SIZE(tc),
+	.needs_tmpdir = 1,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
