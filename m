Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B51A32C3
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:45:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D274C3C2CC6
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:45:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 969673C2CC7
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:45:04 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 41048601430
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:45:00 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,362,1580745600"; d="scan'208";a="88748946"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 18:44:56 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 93DF5406AB15
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 18:34:27 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 18:44:51 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 9 Apr 2020 18:44:54 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 9 Apr 2020 18:44:42 +0800
Message-ID: <1586429086-22975-7-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 93DF5406AB15.AFC24
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 07/10] syscalls/ioctl_loop05: Add
 LOOP_SET_DIRECT_IO ioctl test
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

LOOP_SET_DIRECT_IO can update a live loop device dio mode. It needs the
backing file also supports dio mode and the lo_offset is aligned with
the logical block size(getting by BLKSSZGET ioctl).

It was introduced into kernel since 4.10
commit ab1cb278bc70 ("block: loop: introduce ioctl command of LOOP_SET_DIRECT_IO").

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/ioctl/.gitignore    |   1 +
 .../kernel/syscalls/ioctl/ioctl_loop05.c      | 125 ++++++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop05.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 51ad8ff69..8b120b43a 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -532,6 +532,7 @@ ioctl_loop01 ioctl_loop01
 ioctl_loop02 ioctl_loop02
 ioctl_loop03 ioctl_loop03
 ioctl_loop04 ioctl_loop04
+ioctl_loop05 ioctl_loop05
 
 ioctl_ns01 ioctl_ns01
 ioctl_ns02 ioctl_ns02
diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
index 039a5251c..f484d98d6 100644
--- a/testcases/kernel/syscalls/ioctl/.gitignore
+++ b/testcases/kernel/syscalls/ioctl/.gitignore
@@ -10,6 +10,7 @@
 /ioctl_loop02
 /ioctl_loop03
 /ioctl_loop04
+/ioctl_loop05
 /ioctl_ns01
 /ioctl_ns02
 /ioctl_ns03
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
new file mode 100644
index 000000000..16c7a468c
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ *
+ * This is a basic ioctl test about loopdevice.
+ *
+ * It is designed to test LOOP_SET_DIRECT_IO can updata a live
+ * loop device dio mode. It need the backing file also supports
+ * dio mode and the lo_offset is aligned with the logical block size.
+ */
+#include <stdio.h>
+#include <unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include <sys/mount.h>
+#include "ioctl_loop_support.h"
+#include "lapi/loop.h"
+#include "tst_test.h"
+
+#define DIO_MESSAGE "In dio mode"
+#define NON_DIO_MESSAGE "In non dio mode"
+
+static char dev_path[1024], sys_loop_diopath[1024];
+static int dev_num, dev_fd, attach_flag, logical_block_size;
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
+	check_sys_value(sys_loop_diopath, flag);
+}
+
+static void verify_ioctl_loop(void)
+{
+	struct loop_info loopinfo;
+
+	memset(&loopinfo, 0, sizeof(loopinfo));
+
+	tst_res(TINFO, "Without setting lo_offset or sizelimit");
+	SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 1);
+	check_dio_value(1);
+
+	SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
+	check_dio_value(0);
+
+	tst_res(TINFO, "With offset equal to logical_block_size");
+	loopinfo.lo_offset = logical_block_size;
+	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
+	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
+	if (TST_RET == 0) {
+		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded");
+		check_dio_value(1);
+		SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
+	} else {
+		tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed");
+	}
+
+	tst_res(TINFO, "With offset less than or unalign logical_block_size");
+	loopinfo.lo_offset = logical_block_size / 2;
+	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
+
+	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "LOOP_SET_DIRECT_IO succeeded unexpectedly");
+		SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
+		return;
+	}
+	if (TST_ERR == EINVAL)
+		tst_res(TPASS | TTERRNO, "LOOP_SET_DIRECT_IO failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed expected EINVAL got");
+
+	loopinfo.lo_offset = 0;
+	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
+}
+
+static void setup(void)
+{
+	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
+		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag, skip it");
+
+	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
+	if (dev_num < 0)
+		tst_brk(TBROK, "Failed to find free loop device");
+
+	sprintf(sys_loop_diopath, "/sys/block/loop%d/loop/dio", dev_num);
+	tst_fill_file("test.img", 0, 1024, 1024);
+	tst_attach_device(dev_path, "test.img");
+	attach_flag = 1;
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
+	check_support_cmd(dev_fd, LOOP_SET_DIRECT_IO, 0, "LOOP_SET_DIRECT_IO");
+	SAFE_IOCTL(dev_fd, BLKSSZGET, &logical_block_size);
+	tst_res(TINFO, "%s default logical_block_size is %d", dev_path, logical_block_size);
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
