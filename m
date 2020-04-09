Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C311A32BF
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:45:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D00733C2CD8
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:45:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 031663C220D
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:44:54 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id D43F11000A24
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:44:50 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,362,1580745600"; d="scan'208";a="88748942"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 18:44:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4983550A9971
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 18:34:25 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 18:44:50 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 9 Apr 2020 18:44:52 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 9 Apr 2020 18:44:41 +0800
Message-ID: <1586429086-22975-6-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 4983550A9971.AC1F3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 06/10] syscalls/ioctl_loop04: Add LOOP_SET_CAPACITY
 ioctl test
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

LOOP_SET_CAPACITY can update a live loop device size when we
change the size of the underlying backing file. Also check sys
value.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/ioctl/.gitignore    |  1 +
 .../kernel/syscalls/ioctl/ioctl_loop04.c      | 97 +++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 46d877fa3..51ad8ff69 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -531,6 +531,7 @@ ioctl08      ioctl08
 ioctl_loop01 ioctl_loop01
 ioctl_loop02 ioctl_loop02
 ioctl_loop03 ioctl_loop03
+ioctl_loop04 ioctl_loop04
 
 ioctl_ns01 ioctl_ns01
 ioctl_ns02 ioctl_ns02
diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
index 1501c2779..039a5251c 100644
--- a/testcases/kernel/syscalls/ioctl/.gitignore
+++ b/testcases/kernel/syscalls/ioctl/.gitignore
@@ -9,6 +9,7 @@
 /ioctl_loop01
 /ioctl_loop02
 /ioctl_loop03
+/ioctl_loop04
 /ioctl_ns01
 /ioctl_ns02
 /ioctl_ns03
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop04.c b/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
new file mode 100644
index 000000000..ae110570e
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ *
+ * This is a basic ioctl test about loopdevice.
+ *
+ * It is designed to test LOOP_SET_CAPACITY can update a live
+ * loop device size when we change the size of the underlying
+ * backing file. Also check sys value.
+ */
+#include <stdio.h>
+#include <unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include "ioctl_loop_support.h"
+#include "lapi/loop.h"
+#include "tst_test.h"
+
+#define OLD_SIZE 10240
+#define NEW_SIZE 5120
+
+static char dev_path[1024], sys_loop_sizepath[1024];
+static char *wrbuf;
+static int dev_num, dev_fd, file_fd, attach_flag;
+
+static void verify_ioctl_loop(void)
+{
+	struct loop_info loopinfoget;
+
+	memset(&loopinfoget, 0, sizeof(loopinfoget));
+	tst_fill_file("test.img", 0, 1024, OLD_SIZE/1024);
+	tst_attach_device(dev_path, "test.img");
+	attach_flag = 1;
+
+	check_sys_value(sys_loop_sizepath, OLD_SIZE/512);
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
+	file_fd = SAFE_OPEN("test.img", O_RDWR);
+	SAFE_IOCTL(dev_fd, LOOP_GET_STATUS, &loopinfoget);
+
+	if (loopinfoget.lo_flags & LO_FLAGS_READ_ONLY)
+		tst_brk(TCONF, "Current environment has unexpected LO_FLAGS_READ_ONLY flag");
+
+	SAFE_TRUNCATE("test.img", NEW_SIZE);
+	SAFE_IOCTL(dev_fd, LOOP_SET_CAPACITY);
+
+	/*check that we can't write data beyond 5K into loop device*/
+	TEST(write(dev_fd, wrbuf, OLD_SIZE));
+	if (TST_RET == NEW_SIZE) {
+		tst_res(TPASS, "LOOP_SET_CAPACITY has updated loop size(%d) to %d", OLD_SIZE, NEW_SIZE);
+		check_sys_value(sys_loop_sizepath, NEW_SIZE/512);
+	} else {
+		tst_res(TFAIL, "LOOP_SET_CAPACITY doesn't updated loop size to %d, its size is %ld",
+				NEW_SIZE, TST_RET);
+	}
+
+	SAFE_CLOSE(file_fd);
+	SAFE_CLOSE(dev_fd);
+	tst_detach_device(dev_path);
+	unlink("test.img");
+	attach_flag = 0;
+}
+
+static void setup(void)
+{
+	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
+	if (dev_num < 0)
+		tst_brk(TBROK, "Failed to find free loop device");
+
+	wrbuf = SAFE_MALLOC(OLD_SIZE);
+	memset(wrbuf, 'x', OLD_SIZE);
+	sprintf(sys_loop_sizepath, "/sys/block/loop%d/size", dev_num);
+}
+
+static void cleanup(void)
+{
+	if (dev_fd > 0)
+		SAFE_CLOSE(dev_fd);
+	if (file_fd > 0)
+		SAFE_CLOSE(file_fd);
+	if (wrbuf)
+		free(wrbuf);
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
