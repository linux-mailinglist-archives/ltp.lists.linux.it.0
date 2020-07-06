Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E5D2152AA
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 08:24:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B77A03C29E3
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 08:24:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EC70F3C29CA
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 08:24:03 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 69A751000969
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 08:24:01 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,318,1589212800"; d="scan'208";a="95809965"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jul 2020 14:23:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0A9474CE4BDE
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 14:23:55 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 6 Jul 2020 14:23:58 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 6 Jul 2020 14:23:32 +0800
Message-ID: <1594016612-7975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0A9474CE4BDE.AEADA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ioctl09: Add test for BLKRRPART ioctl
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

Fixes #699

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                           |   1 +
 testcases/kernel/syscalls/ioctl/.gitignore |   1 +
 testcases/kernel/syscalls/ioctl/ioctl09.c  | 116 +++++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl09.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 5b3a0862f..aaa81e4ee 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -529,6 +529,7 @@ ioctl05      ioctl05
 ioctl06      ioctl06
 ioctl07      ioctl07
 ioctl08      ioctl08
+ioctl09      ioctl09
 
 ioctl_loop01 ioctl_loop01
 ioctl_loop02 ioctl_loop02
diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
index 3a3d49adc..5fff7a61d 100644
--- a/testcases/kernel/syscalls/ioctl/.gitignore
+++ b/testcases/kernel/syscalls/ioctl/.gitignore
@@ -6,6 +6,7 @@
 /ioctl06
 /ioctl07
 /ioctl08
+/ioctl09
 /ioctl_loop01
 /ioctl_loop02
 /ioctl_loop03
diff --git a/testcases/kernel/syscalls/ioctl/ioctl09.c b/testcases/kernel/syscalls/ioctl/ioctl09.c
new file mode 100644
index 000000000..1b1360c34
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl09.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ *
+ * Basic test for the BLKRRPART ioctl, it is the same as blockdev
+ * --rereadpt command.
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+#include <string.h>
+#include <sys/mount.h>
+#include <stdbool.h>
+#include "lapi/loop.h"
+#include "tst_test.h"
+
+static char dev_path[1024];
+static int dev_num, attach_flag, dev_fd;
+static char loop_partpath[1026], sys_loop_partpath[1026];
+
+static void change_partition(const char *const cmd[])
+{
+	int ret;
+
+	ret = tst_cmd(cmd, NULL, NULL, TST_CMD_PASS_RETVAL);
+	switch (ret) {
+	case 0:
+	break;
+	case 255:
+		tst_res(TCONF, "parted binary not installed or failed");
+	break;
+	default:
+		tst_res(TCONF, "parted exited with %i", ret);
+	break;
+	}
+}
+
+static void check_partition(int part_num, bool value)
+{
+	int ret;
+
+	sprintf(sys_loop_partpath, "/sys/block/loop%d/loop%dp%d", dev_num, dev_num, part_num);
+	sprintf(loop_partpath, "%sp%d", dev_path, part_num);
+
+	ret = access(sys_loop_partpath, F_OK);
+	if (ret == 0)
+		tst_res(value ? TPASS : TFAIL, "access %s succeeds", sys_loop_partpath);
+	else
+		tst_res(value ? TFAIL : TPASS, "access %s fails", sys_loop_partpath);
+
+	ret = access(loop_partpath, F_OK);
+	if (ret == 0)
+		tst_res(value ? TPASS : TFAIL, "access %s succeeds", loop_partpath);
+	else
+		tst_res(value ? TFAIL : TPASS, "access %s fails", loop_partpath);
+}
+
+static void verify_ioctl(void)
+{
+	const char *const cmd_parted_old[] = {"parted", "-s", "test.img", "mklabel", "msdos", "mkpart",
+						"primary", "ext4", "1M", "10M", NULL};
+	const char *const cmd_parted_new[] = {"parted", "-s", "test.img", "mklabel", "msdos", "mkpart",
+						"primary", "ext4", "1M", "10M", "mkpart", "primary", "ext4", "10M", "20M", NULL};
+	struct loop_info loopinfo = {0};
+
+	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
+	if (dev_num < 0)
+		tst_brk(TBROK, "Failed to find free loop device");
+
+	tst_fill_file("test.img", 0, 1024 * 1024, 20);
+
+	change_partition(cmd_parted_old);
+
+	tst_attach_device(dev_path, "test.img");
+	attach_flag = 1;
+
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
+	loopinfo.lo_flags =  LO_FLAGS_PARTSCAN;
+	SAFE_IOCTL(dev_fd, LOOP_SET_STATUS, &loopinfo);
+	check_partition(1, true);
+	check_partition(2, false);
+
+	change_partition(cmd_parted_new);
+	TST_RETRY_FUNC(ioctl(dev_fd, BLKRRPART, 0), TST_RETVAL_EQ0);
+	check_partition(1, true);
+	check_partition(2, true);
+
+	SAFE_CLOSE(dev_fd);
+	tst_detach_device(dev_path);
+	attach_flag = 0;
+	unlink("test.img");
+}
+
+static void cleanup(void)
+{
+	if (dev_fd > 0)
+		SAFE_CLOSE(dev_fd);
+	if (attach_flag)
+		tst_detach_device(dev_path);
+}
+
+static struct tst_test test = {
+	.cleanup = cleanup,
+	.test_all = verify_ioctl,
+	.needs_root = 1,
+	.needs_drivers = (const char *const []) {
+		"loop",
+		NULL
+	},
+	.needs_cmds = (const char *const []) {
+		"parted",
+		NULL
+	},
+	.needs_tmpdir = 1,
+};
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
