Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D16FC1A32C7
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:46:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F1123C2CCA
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:46:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4DAB63C2CF5
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:45:07 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A70BC14013B1
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:44:56 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,362,1580745600"; d="scan'208";a="88748945"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 18:44:56 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id DB2EE50A9984
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 18:34:29 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 18:44:54 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 9 Apr 2020 18:44:56 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 9 Apr 2020 18:44:43 +0800
Message-ID: <1586429086-22975-8-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: DB2EE50A9984.A0C64
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 08/10] syscalls/ioctl_loop06: Add
 LOOP_SET_BLOCK_SIZE error test
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/ioctl/.gitignore    |  1 +
 .../kernel/syscalls/ioctl/ioctl_loop06.c      | 90 +++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop06.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 8b120b43a..e9b0a8f60 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -533,6 +533,7 @@ ioctl_loop02 ioctl_loop02
 ioctl_loop03 ioctl_loop03
 ioctl_loop04 ioctl_loop04
 ioctl_loop05 ioctl_loop05
+ioctl_loop06 ioctl_loop06
 
 ioctl_ns01 ioctl_ns01
 ioctl_ns02 ioctl_ns02
diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
index f484d98d6..ec19b4901 100644
--- a/testcases/kernel/syscalls/ioctl/.gitignore
+++ b/testcases/kernel/syscalls/ioctl/.gitignore
@@ -11,6 +11,7 @@
 /ioctl_loop03
 /ioctl_loop04
 /ioctl_loop05
+/ioctl_loop06
 /ioctl_ns01
 /ioctl_ns02
 /ioctl_ns03
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop06.c b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
new file mode 100644
index 000000000..ef98efbca
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ *
+ * This is a basic ioctl error test about loopdevice
+ * LOOP_SET_BLOCK_SIZE.
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include <stdlib.h>
+#include "ioctl_loop_support.h"
+#include "lapi/loop.h"
+#include "tst_test.h"
+
+static char dev_path[1024], sys_loop_logicalpath[1024];
+static int dev_num, dev_fd, attach_flag;
+static unsigned int invalid_value, half_value, unalign_value;
+
+static struct tcase {
+	unsigned int *setvalue;
+	int exp_err;
+	char *message;
+} tcases[] = {
+	{&half_value, EINVAL, "arg < 512"},
+	{&invalid_value, EINVAL, "arg > PAGE_SIZE"},
+	{&unalign_value, EINVAL, "arg != power_of_2"},
+};
+
+static void verify_ioctl_loop(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	tst_res(TINFO, "%s", tc->message);
+	TEST(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, *(tc->setvalue)));
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "LOOP_SET_BLOCK_SIZE succeed unexpectedly");
+		return;
+	}
+	if (TST_ERR == tc->exp_err)
+		tst_res(TPASS | TTERRNO, "LOOP_SET_BLOCK_SIZE failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "LOOP_SET_BLOCK_SIZE failed expected %s got",
+				tst_strerrno(tc->exp_err));
+}
+
+static void setup(void)
+{
+	unsigned int pg_size;
+
+	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
+	if (dev_num < 0)
+		tst_brk(TBROK, "Failed to find free loop device");
+
+	sprintf(sys_loop_logicalpath, "/sys/block/loop%d/logical_block_size", dev_num);
+	tst_fill_file("test.img", 0, 1024, 1024);
+	tst_attach_device(dev_path, "test.img");
+	attach_flag = 1;
+	half_value = 256;
+	pg_size = getpagesize();
+	invalid_value = pg_size * 2 ;
+	unalign_value = pg_size - 1;
+
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
+	check_support_cmd(dev_fd, LOOP_SET_BLOCK_SIZE, 512, "LOOP_SET_BLOCK_SIZE");
+}
+
+static void cleanup(void)
+{
+	if (dev_fd > 0)
+		SAFE_CLOSE(dev_fd);
+	if (attach_flag)
+		tst_detach_device(dev_path);
+	unlink("test.img");
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_ioctl_loop,
+	.tcnt = ARRAY_SIZE(tcases),
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
