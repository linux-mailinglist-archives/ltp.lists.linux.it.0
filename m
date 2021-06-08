Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 709AD39F837
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:57:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D077E3C90EE
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:57:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A53383C4D27
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:56:43 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2A8631400F21
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:56:42 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FzsCK4r9Yz6wQw
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 21:53:33 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 21:56:36 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 21:56:36 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 8 Jun 2021 21:57:17 +0800
Message-ID: <20210608135718.36579-4-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608135718.36579-1-xieziyao@huawei.com>
References: <20210608135718.36579-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4 v2] syscalls/io_submit: Add io_submit02 test for
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
1. io_submit() returns the number of iocbs submitted.
2. io_submit() returns 0 if nr is zero.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Split io_submit02 into two, one for negative and one for positive cases.
2. Print values not variable names in TST_EXP_PASS().
3. Add .needs_kconfig in this test.

 runtest/syscalls                              |  1 +
 .../kernel/syscalls/io_submit/.gitignore      |  1 +
 .../kernel/syscalls/io_submit/io_submit02.c   | 89 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_submit/io_submit02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index d1ec32754..9c4c64fa3 100644
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
index 000000000..b0ed35eec
--- /dev/null
+++ b/testcases/kernel/syscalls/io_submit/io_submit02.c
@@ -0,0 +1,89 @@
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
+ * 1. io_submit() returns the number of iocbs submitted.
+ * 2. io_submit() returns 0 if nr is zero.
+ */
+
+#include <linux/aio_abi.h>
+
+#include "config.h"
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+
+#define TEST_FILE "test_file"
+#define MODE 0777
+
+static int fd;
+static char buf[100];
+
+static aio_context_t ctx;
+static struct iocb iocb;
+static struct iocb *iocbs[] = {&iocb};
+
+static struct tcase {
+	aio_context_t *ctx;
+	long nr;
+	struct iocb **iocbs;
+	const char *desc;
+} tc[] = {
+	{&ctx, 1, iocbs, "returns the number of iocbs submitted"},
+	{&ctx, 0, NULL, "returns 0 if nr is zero"},
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
+	fd = SAFE_OPEN(TEST_FILE, O_RDONLY | O_CREAT, MODE);
+	io_prep_option(&iocb, fd, buf, 0, 0, IOCB_CMD_PREAD);
+}
+
+static void cleanup(void)
+{
+	if (fd > 0)
+		SAFE_CLOSE(fd);
+	TST_EXP_PASS_SILENT(tst_syscall(__NR_io_destroy, ctx));
+}
+
+static void run(unsigned int i)
+{
+	TEST(tst_syscall(__NR_io_submit, *tc[i].ctx, tc[i].nr, tc[i].iocbs));
+
+	if (TST_RET == tc[i].nr)
+		tst_res(TPASS, "io_submit() %s", tc[i].desc);
+	else
+		tst_res(TFAIL, "io_submit() returns %ld, expected %ld", TST_RET, tc[i].nr);
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
