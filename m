Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB431A32C6
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:46:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 551A33C2CE5
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:46:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D2C643C2CF2
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:45:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 7A150600EB1
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:45:05 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,362,1580745600"; d="scan'208";a="88748964"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 18:45:02 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id B4006406AB15
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 18:34:34 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 18:44:58 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 9 Apr 2020 18:45:01 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 9 Apr 2020 18:44:45 +0800
Message-ID: <1586429086-22975-10-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: B4006406AB15.AC743
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 10/10] syscalls/ioctl_loop08: Add
 LOOP_SET/GET_STATUS64 sizelimit field test
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

Test its lo_sizelimit field. If lo_sizelimit is 0, it means max
available. If sizelimit is less than loop_size, loopsize will
be truncated.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/ioctl/.gitignore    |  1 +
 .../kernel/syscalls/ioctl/ioctl_loop08.c      | 96 +++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop08.c

diff --git a/runtest/syscalls b/runtest/syscalls
index f83561724..d77c191d2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -535,6 +535,7 @@ ioctl_loop04 ioctl_loop04
 ioctl_loop05 ioctl_loop05
 ioctl_loop06 ioctl_loop06
 ioctl_loop07 ioctl_loop07
+ioctl_loop08 ioctl_loop08
 
 ioctl_ns01 ioctl_ns01
 ioctl_ns02 ioctl_ns02
diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
index 3a3d49adc..97134aa0b 100644
--- a/testcases/kernel/syscalls/ioctl/.gitignore
+++ b/testcases/kernel/syscalls/ioctl/.gitignore
@@ -13,6 +13,7 @@
 /ioctl_loop05
 /ioctl_loop06
 /ioctl_loop07
+/ioctl_loop08
 /ioctl_ns01
 /ioctl_ns02
 /ioctl_ns03
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop08.c b/testcases/kernel/syscalls/ioctl/ioctl_loop08.c
new file mode 100644
index 000000000..150cfa0ef
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop08.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ *
+ * This is a basic ioctl test about loopdevice LOOP_SET_STATUS64
+ * and LOOP_GET_STATUS64.
+ * Test its lo_sizelimit field. If lo_sizelimit is 0,it means max
+ * available. If sizelimit is less than loop_size, loopsize will
+ * be truncated.
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
+static char dev_path[1024], sys_loop_sizepath[1024], sys_loop_sizelimitpath[1024];
+static int dev_num, dev_fd, file_fd, attach_flag;
+
+static struct tcase {
+	unsigned int set_sizelimit;
+	unsigned int exp_loopsize;
+	char *message;
+} tcases[] = {
+	{1024 * 4096, 2048, "When sizelimit is greater than loopsize "},
+	{1024 * 512, 1024, "When sizelimit is less than loopsize"},
+};
+
+static void verify_ioctl_loop(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	struct loop_info64 loopinfo, loopinfoget;
+
+	tst_res(TINFO, "%s", tc->message);
+	memset(&loopinfo, 0, sizeof(loopinfo));
+	memset(&loopinfoget, 0, sizeof(loopinfoget));
+
+	loopinfo.lo_sizelimit = tc->set_sizelimit;
+	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS64, &loopinfo), TST_RETVAL_EQ0);
+
+	check_sys_value(sys_loop_sizepath, tc->exp_loopsize);
+	check_sys_value(sys_loop_sizelimitpath, tc->set_sizelimit);
+	SAFE_IOCTL(dev_fd, LOOP_GET_STATUS64, &loopinfoget);
+	if (loopinfoget.lo_sizelimit == tc->set_sizelimit)
+		tst_res(TPASS, "LOOP_GET_STATUS64 gets correct lo_sizelimit(%d)", tc->set_sizelimit);
+	else
+		tst_res(TFAIL, "LOOP_GET_STATUS64 gets wrong lo_sizelimit(%llu), expect %d",
+				loopinfoget.lo_sizelimit, tc->set_sizelimit);
+	/*Reset*/
+	loopinfo.lo_sizelimit = 0;
+	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
+}
+
+static void setup(void)
+{
+	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
+	if (dev_num < 0)
+		tst_brk(TBROK, "Failed to find free loop device");
+
+	tst_fill_file("test.img", 0, 1024 * 1024, 1);
+	tst_attach_device(dev_path, "test.img");
+	attach_flag = 1;
+
+	sprintf(sys_loop_sizepath, "/sys/block/loop%d/size", dev_num);
+	sprintf(sys_loop_sizelimitpath, "/sys/block/loop%d/loop/sizelimit", dev_num);
+
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
+	tst_res(TINFO, "original loop size 2048 sectors");
+}
+
+static void cleanup(void)
+{
+	if (dev_fd > 0)
+		SAFE_CLOSE(dev_fd);
+	if (file_fd > 0)
+		SAFE_CLOSE(file_fd);
+	if (attach_flag)
+		tst_detach_device(dev_path);
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
