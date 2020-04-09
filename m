Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 179C11A32BB
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:45:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A66E53C2CDD
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:45:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9C6D33C2CE3
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:44:48 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 678ED600CED
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:44:45 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,362,1580745600"; d="scan'208";a="88748934"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 18:44:38 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 31F4050A9999
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 18:34:14 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 18:44:38 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 9 Apr 2020 18:44:41 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 9 Apr 2020 18:44:37 +0800
Message-ID: <1586429086-22975-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 31F4050A9999.ABDF8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 02/10] syscalls/ioctl:add common c file for loop
 ioctl
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
 testcases/kernel/syscalls/ioctl/Makefile      |  5 +++
 .../syscalls/ioctl/ioctl_loop_support.c       | 40 +++++++++++++++++++
 .../syscalls/ioctl/ioctl_loop_support.h       | 12 ++++++
 3 files changed, 57 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop_support.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop_support.h

diff --git a/testcases/kernel/syscalls/ioctl/Makefile b/testcases/kernel/syscalls/ioctl/Makefile
index c2ff6c8e7..7bdc7daf0 100644
--- a/testcases/kernel/syscalls/ioctl/Makefile
+++ b/testcases/kernel/syscalls/ioctl/Makefile
@@ -7,6 +7,11 @@ include $(top_srcdir)/include/mk/testcases.mk
 
 INSTALL_TARGETS		+= test_ioctl
 
+FILTER_OUT_MAKE_TARGETS += ioctl_loop_support
+
+LOOP_TARGETS            := $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/ioctl_loop[0-9]*.c))
+$(LOOP_TARGETS): %: ioctl_loop_support.o
+
 ifeq ($(ANDROID),1)
 FILTER_OUT_MAKE_TARGETS	+= ioctl02
 endif
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop_support.c b/testcases/kernel/syscalls/ioctl/ioctl_loop_support.c
new file mode 100644
index 000000000..75c7b1b9a
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop_support.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+#define TST_NO_DEFAULT_MAIN
+#include "ioctl_loop_support.h"
+#include "tst_test.h"
+
+void check_sys_value(char *path, int setvalue)
+{
+	int getvalue;
+
+	SAFE_FILE_SCANF(path, "%d", &getvalue);
+	if (setvalue == getvalue)
+		tst_res(TPASS, "%s value is %d", path, setvalue);
+	else
+		tst_res(TFAIL, "%s value expected %d got %d", path, setvalue, getvalue);
+}
+
+void check_sys_string(char *path, char *setmessage)
+{
+	char getmessage[1024];
+
+	SAFE_FILE_SCANF(path, "%s", getmessage);
+	if (strcmp(setmessage, getmessage))
+		tst_res(TFAIL, "%s expected %s got %s", path, setmessage, getmessage);
+	else
+		tst_res(TPASS, "%s string is %s", path, getmessage);
+}
+
+void check_support_cmd(int dev_fd, int ioctl_flag, int value, char *message)
+{
+	int ret = 0;
+
+	ret = ioctl(dev_fd, ioctl_flag, value);
+	if (ret && errno == EINVAL)
+		tst_brk(TCONF, "Current environment doesn't support this flag(%s)",
+				message);
+}
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop_support.h b/testcases/kernel/syscalls/ioctl/ioctl_loop_support.h
new file mode 100644
index 000000000..ade64e82e
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop_support.h
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+#ifndef IOCTL_LOOP_H
+#define IOCTL_lOOP_H
+#include <linux/loop.h>
+void check_sys_value(char *path, int setvalue);
+void check_sys_string(char *path, char *setmessage);
+void check_support_cmd(int dev_fd, int ioctl_flag, int value, char *message);
+#endif
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
