Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B9D39F836
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:56:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 386D53C7B03
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:56:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A20623C4CD3
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:56:43 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 112B11A002F3
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:56:41 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FzsCK5Hhnz6wR5
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 21:53:33 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 21:56:36 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 21:56:36 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 8 Jun 2021 21:57:18 +0800
Message-ID: <20210608135718.36579-5-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608135718.36579-1-xieziyao@huawei.com>
References: <20210608135718.36579-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4 v2] syscalls/io_submit: Add io_submit03 test for
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test io_submit invoked via syscall(2):
1. io_submit fails and returns EINVAL if ctx is invalid.
2. io_submit fails and returns EINVAL if nr is invalid.
3. io_submit fails and returns EFAULT if iocbpp pointer is invalid.
4. io_submit fails and returns EBADF if fd is invalid.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Split io_submit02 into two, one for negative and one for positive cases.
2. Print values not variable names in TST_EXP_PASS().
3. Add .needs_kconfig in this test.

runtest/syscalls                              |   1 +
 .../kernel/syscalls/io_submit/.gitignore      |   1 +
 .../kernel/syscalls/io_submit/io_submit03.c   | 118 ++++++++++++++++++
 3 files changed, 120 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_submit/io_submit03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 9c4c64fa3..e1a02ef7f 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -617,6 +617,7 @@ io_setup01 io_setup01
 io_setup02 io_setup02
 io_submit01 io_submit01
 io_submit02 io_submit02
+io_submit03 io_submit03

 keyctl01 keyctl01
 keyctl02 keyctl02
diff --git a/testcases/kernel/syscalls/io_submit/.gitignore b/testcases/kernel/syscalls/io_submit/.gitignore
index 5f2a2cff2..60b07970a 100644
--- a/testcases/kernel/syscalls/io_submit/.gitignore
+++ b/testcases/kernel/syscalls/io_submit/.gitignore
@@ -1,2 +1,3 @@
 /io_submit01
 /io_submit02
+/io_submit03
diff --git a/testcases/kernel/syscalls/io_submit/io_submit03.c b/testcases/kernel/syscalls/io_submit/io_submit03.c
new file mode 100644
index 000000000..e0e596d00
--- /dev/null
+++ b/testcases/kernel/syscalls/io_submit/io_submit03.c
@@ -0,0 +1,118 @@
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
+ *
+ * 1. io_submit fails and returns EINVAL if ctx is invalid.
+ * 2. io_submit fails and returns EINVAL if nr is invalid.
+ * 3. io_submit fails and returns EFAULT if iocbpp pointer is invalid.
+ * 4. io_submit fails and returns EBADF if fd is invalid.
+ */
+
+#include <linux/aio_abi.h>
+
+#include "config.h"
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+
+#define RDONLY_FILE "rdonly_file"
+#define WRONLY_FILE "wronly_file"
+#define MODE 0777
+
+static char buf[100];
+static aio_context_t ctx;
+static aio_context_t invalid_ctx;
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
+	TST_EXP_PASS_SILENT(tst_syscall(__NR_io_setup, 1, &ctx));
+	io_prep_option(&inv_fd_iocb, -1, buf, sizeof(buf), 0, IOCB_CMD_PREAD);
+
+	rdonly_fd = SAFE_OPEN(RDONLY_FILE, O_RDONLY | O_CREAT, MODE);
+	io_prep_option(&rdonly_fd_iocb, rdonly_fd, buf, sizeof(buf), 0, IOCB_CMD_PWRITE);
+
+	wronly_fd = SAFE_OPEN(WRONLY_FILE, O_WRONLY | O_CREAT, MODE);
+	io_prep_option(&wronly_fd_iocb, wronly_fd, buf, sizeof(buf), 0, IOCB_CMD_PREAD);
+}
+
+static void cleanup(void)
+{
+	if (rdonly_fd > 0)
+		SAFE_CLOSE(rdonly_fd);
+	if (wronly_fd > 0)
+		SAFE_CLOSE(wronly_fd);
+	TST_EXP_PASS_SILENT(tst_syscall(__NR_io_destroy, ctx));
+}
+
+static void run(unsigned int i)
+{
+	TST_EXP_FAIL(tst_syscall(__NR_io_submit, *tc[i].ctx, tc[i].nr, tc[i].iocbs),
+		     tc[i].exp_errno, "io_submit() with %s", tc[i].desc);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.needs_tmpdir = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_AIO=y",
+		NULL
+	},
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
