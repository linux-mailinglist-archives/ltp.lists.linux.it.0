Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 716A91A32C8
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:46:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9F6D3C2CC8
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:46:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1A2E03C2CE7
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:45:09 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 76B1E1400DDF
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:45:01 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,362,1580745600"; d="scan'208";a="88748947"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 18:44:56 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 39D2D50A9984
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 18:34:32 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 18:44:56 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 9 Apr 2020 18:44:59 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 9 Apr 2020 18:44:44 +0800
Message-ID: <1586429086-22975-9-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 39D2D50A9984.AD0E8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 09/10] syscalls/ioctl_loop07: Add dio with logic
 block size error test
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

This is a basic ioctl test about loopdevice LOOP_SET_BLOCK_SIZE
and LOOP_SET_DIRECT_IO. When logical blocksize is 1024, set dio
with  512 offset will fail.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/ioctl/.gitignore    |  1 +
 .../kernel/syscalls/ioctl/ioctl_loop07.c      | 85 +++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop07.c

diff --git a/runtest/syscalls b/runtest/syscalls
index e9b0a8f60..f83561724 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -534,6 +534,7 @@ ioctl_loop03 ioctl_loop03
 ioctl_loop04 ioctl_loop04
 ioctl_loop05 ioctl_loop05
 ioctl_loop06 ioctl_loop06
+ioctl_loop07 ioctl_loop07
 
 ioctl_ns01 ioctl_ns01
 ioctl_ns02 ioctl_ns02
diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
index ec19b4901..3a3d49adc 100644
--- a/testcases/kernel/syscalls/ioctl/.gitignore
+++ b/testcases/kernel/syscalls/ioctl/.gitignore
@@ -12,6 +12,7 @@
 /ioctl_loop04
 /ioctl_loop05
 /ioctl_loop06
+/ioctl_loop07
 /ioctl_ns01
 /ioctl_ns02
 /ioctl_ns03
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop07.c b/testcases/kernel/syscalls/ioctl/ioctl_loop07.c
new file mode 100644
index 000000000..c58a92b3c
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop07.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ *
+ * This is a basic ioctl test about loopdevice LOOP_SET_BLOCK_SIZE
+ * and LOOP_SET_DIRECT_IO.
+ * When blocksize is 1024(default align size is 512), set dio with
+ * 512 offset will fail.
+ */
+
+#include <stdio.h>
+#include <linux/loop.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include <stdlib.h>
+#include <sys/mount.h>
+#include "ioctl_loop_support.h"
+#include "lapi/loop.h"
+#include "tst_test.h"
+
+static char dev_path[1024], sys_loop_logicalpath[1024];
+static int dev_num, dev_fd, attach_flag, logical_block_size;
+
+static void verify_ioctl_loop(void)
+{
+	check_sys_value(sys_loop_logicalpath, 1024);
+	SAFE_IOCTL(dev_fd, BLKSSZGET, &logical_block_size);
+	if (logical_block_size == 1024)
+		tst_res(TPASS, "logical block size is 1024 by using BLKSSZGET ioctl");
+	else
+		tst_res(TFAIL, "expected logical block size is 1024 but got %d by using BLKSSZGET ioctl",
+				logical_block_size);
+	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "LOOP_SET_DIRECT_IO succeeded unexpectedly");
+		return;
+	}
+	if (TST_ERR == EINVAL)
+		tst_res(TPASS | TTERRNO, "LOOP_SET_DIRECT_IO failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed expected EINVAL got");
+}
+
+static void setup(void)
+{
+	struct loop_info loopinfo;
+
+	memset(&loopinfo, 0, sizeof(loopinfo));
+	loopinfo.lo_offset = 512;
+	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
+	if (dev_num < 0)
+		tst_brk(TBROK, "Failed to find free loop device");
+
+	sprintf(sys_loop_logicalpath, "/sys/block/loop%d/queue/logical_block_size", dev_num);
+	tst_fill_file("test.img", 0, 1024 * 1024, 1);
+	tst_attach_device(dev_path, "test.img");
+	attach_flag = 1;
+
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
+	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
+	check_support_cmd(dev_fd, LOOP_SET_DIRECT_IO, 0, "LOOP_SET_DIRECT_IO");
+	check_support_cmd(dev_fd, LOOP_SET_BLOCK_SIZE, 512, "LOOP_SET_BLOCK_SIZE");
+	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, 1024), TST_RETVAL_EQ0);
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
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_ioctl_loop,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.needs_drivers = (const char *const []) {
+		"loop",
+		NULL
+	}
+};
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
