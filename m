Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D161F65BE
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 12:36:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0B0D3C2DF8
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 12:36:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2D3C13C2DFF
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 12:35:48 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 0496B601D1D
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 12:35:46 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,499,1583164800"; d="scan'208";a="94304159"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jun 2020 18:35:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id BD46A4CE26DE
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 18:35:42 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 11 Jun 2020 18:35:43 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 11 Jun 2020 18:35:16 +0800
Message-ID: <1591871716-21250-5-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591871716-21250-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1591871716-21250-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BD46A4CE26DE.A16ED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1 4/4] syscalls/ioctl_loop09: Add LOOP_CONFIGURE
 ioctl test with direct I/O flag
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

Since kernel commit 3448914e8cc5("loop: Add LOOP_CONFIGURE ioctl"),
it can explicitly request direct I/O mode by setting LO_FLAGS_DIRECT_IO
in loop_config.info.lo_flags.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/ioctl/.gitignore    |   1 +
 .../kernel/syscalls/ioctl/ioctl_loop09.c      | 151 ++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop09.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 7259f2a92..df99a0600 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -537,6 +537,7 @@ ioctl_loop05 ioctl_loop05
 ioctl_loop06 ioctl_loop06
 ioctl_loop07 ioctl_loop07
 ioctl_loop08 ioctl_loop08
+ioctl_loop09 ioctl_loop09
 
 ioctl_ns01 ioctl_ns01
 ioctl_ns02 ioctl_ns02
diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
index 97134aa0b..0decf6ea1 100644
--- a/testcases/kernel/syscalls/ioctl/.gitignore
+++ b/testcases/kernel/syscalls/ioctl/.gitignore
@@ -14,6 +14,7 @@
 /ioctl_loop06
 /ioctl_loop07
 /ioctl_loop08
+/ioctl_loop09
 /ioctl_ns01
 /ioctl_ns02
 /ioctl_ns03
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop09.c b/testcases/kernel/syscalls/ioctl/ioctl_loop09.c
new file mode 100644
index 000000000..c291afeb6
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop09.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ *
+ * This is a basic ioctl test about loopdevice. It sets LO_FLAGS_DIRECT_IO
+ * in loop_config.info.lo_flags by using LOOP_CONFIGURE instead of using
+ * LOOP_SET_DIRECT_IO. It is similar with ioctl_loop05.c.
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include <sys/mount.h>
+#include "lapi/loop.h"
+#include "tst_test.h"
+#include "tst_safe_stdio.h"
+
+#define DIO_MESSAGE "In dio mode"
+#define NON_DIO_MESSAGE "In non dio mode"
+
+static char dev_path[1024], sys_loop_diopath[1024];
+static int dev_num, dev_fd, file_fd, block_devfd, logical_block_size;
+static struct loop_config loopconfig;
+static struct tcase {
+	int multi; /*logical_block_size / 2 as unit */
+	int dio_value;
+	char *message;
+} tcases[] = {
+	{0, 1, "Without setting lo_offset or sizelimit"},
+	{2, 1, "With offset equal to logical_block_size"},
+	{1, 0, "less than logical_block_size"},
+};
+
+static void check_dio_value(int flag)
+{
+	struct loop_info loopinfoget;
+
+	memset(&loopinfoget, 0, sizeof(loopinfoget));
+
+	SAFE_IOCTL(dev_fd, LOOP_GET_STATUS, &loopinfoget);
+	tst_res(TINFO, "%s", flag ? DIO_MESSAGE : NON_DIO_MESSAGE);
+
+	if (loopinfoget.lo_flags & LO_FLAGS_DIRECT_IO)
+		tst_res(flag ? TPASS : TFAIL, "lo_flags has LO_FLAGS_DIRECT_IO flag");
+	else
+		tst_res(flag ? TFAIL : TPASS, "lo_flags doesn't have LO_FLAGS_DIRECT_IO flag");
+
+	TST_ASSERT_INT(sys_loop_diopath, flag);
+}
+
+static void find_backing_bdpath(char *buf)
+{
+	const char *const df_cmd[] = {"df", "-T", ".", NULL};
+	char line[PATH_MAX];
+	FILE *file;
+
+	SAFE_CMD(df_cmd, "1.txt", NULL);
+	file = SAFE_FOPEN("1.txt", "r");
+
+	while (fgets(line, sizeof(line), file) != NULL) {
+		sscanf(line, "%s", buf);
+		if (strstr(buf, "/dev/") != NULL)
+			break;
+	}
+	SAFE_FCLOSE(file);
+}
+
+static void verify_ioctl_loop(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	loopconfig.info.lo_offset = tc->multi * logical_block_size / 2;
+
+	tst_res(TINFO, "%s", tc->message);
+	/*
+	 * When we call loop_configure ioctl successfully and detach it,
+	 * the subquent loo_configure without non-zero lo_offset or sizelimit
+	 * may trigger the blk_update_request I/O error. To avoid this, sleep
+	 * 1s to ensure last blk_update_request has completed.
+	 */
+	sleep(1);
+
+	/*
+	 * loop_cofigure calls loop_update_dio() function, it will ignore the result
+	 * of setting dio. It is different from loop_set_dio.
+	 */
+	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_CONFIGURE, &loopconfig), TST_RETVAL_EQ0);
+	check_dio_value(tc->dio_value);
+	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_CLR_FD, 0), TST_RETVAL_EQ0);
+}
+
+static void setup(void)
+{
+	int ret;
+	char buf[100];
+
+	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
+		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");
+
+	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
+	if (dev_num < 0)
+		tst_brk(TBROK, "Failed to find free loop device");
+
+	sprintf(sys_loop_diopath, "/sys/block/loop%d/loop/dio", dev_num);
+	tst_fill_file("test.img", 0, 1024, 1024);
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
+	file_fd = SAFE_OPEN("test.img", O_RDWR);
+
+	find_backing_bdpath(buf);
+	block_devfd = SAFE_OPEN(buf, O_RDWR);
+
+	SAFE_IOCTL(block_devfd, BLKSSZGET, &logical_block_size);
+	tst_res(TINFO, "backing dev logical_block_size is %d", logical_block_size);
+	SAFE_CLOSE(block_devfd);
+	loopconfig.fd = -1;
+	ret = ioctl(dev_fd, LOOP_CONFIGURE, &loopconfig);
+
+	if (ret && errno != EBADF)
+		tst_brk(TCONF | TERRNO, "LOOP_CONFIGURE is not supported");
+	loopconfig.fd = file_fd;
+	loopconfig.info.lo_flags = LO_FLAGS_DIRECT_IO;
+}
+
+static void cleanup(void)
+{
+	if (dev_fd > 0)
+		SAFE_CLOSE(dev_fd);
+	if (block_devfd > 0)
+		SAFE_CLOSE(block_devfd);
+	if (file_fd > 0)
+		SAFE_CLOSE(file_fd);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_ioctl_loop,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.needs_drivers = (const char *const []) {
+		"loop",
+		NULL
+	},
+	.needs_cmds = (const char *const []) {
+		"df",
+		NULL
+	}
+};
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
