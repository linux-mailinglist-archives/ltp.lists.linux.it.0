Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D3EA68DF
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 14:48:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E90873C2187
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 14:48:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A30F33C212F
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 14:48:36 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D99BB1401A6E
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 14:48:33 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,463,1559491200"; d="scan'208";a="74768117"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Sep 2019 20:48:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id DA3954CDE64D
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 20:48:24 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.220.73) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 3 Sep 2019 20:48:22 +0800
From: Jinhui huang <huangjh.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 3 Sep 2019 20:48:09 +0800
Message-ID: <1567514890-1216-1-git-send-email-huangjh.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.73]
X-yoursite-MailScanner-ID: DA3954CDE64D.A013F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangjh.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] kernel/uevents: Fix compiler errors
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

1)Add uevents into "kernel/Makefile".
2)Define "sys/socket.h" in uevent02.c for struct sockaddr, fix incomplete
  types on old relesase.
3)Add "lapi/uinput.h" and define "UI_GET_SYSNAME", then define the header
  file in uevent03.c, fix implicit declaration on old relesase.

Signed-off-by: Jinhui huang <huangjh.jy@cn.fujitsu.com>
---
 include/lapi/uinput.h               | 16 ++++++++++++++++
 testcases/kernel/Makefile           |  1 +
 testcases/kernel/uevents/uevent02.c |  1 +
 testcases/kernel/uevents/uevent03.c |  3 +--
 4 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 include/lapi/uinput.h

diff --git a/include/lapi/uinput.h b/include/lapi/uinput.h
new file mode 100644
index 0000000..87e3384
--- /dev/null
+++ b/include/lapi/uinput.h
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Authors: Jinhui huang <huangjh.jy@cn.fujitsu.com>
+ */
+
+#ifndef __LAPI_UINPUT_H_
+#define __LAPI_UINPUT_H_
+
+#include <linux/uinput.h>
+
+#ifndef UI_GET_SYSNAME
+#define UI_GET_SYSNAME(len)	_IOC(_IOC_READ, UINPUT_IOCTL_BASE, 44, len)
+#endif
+
+#endif /* __LAPI_UINPUT_H_ */
diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
index 03ea253..3319b31 100644
--- a/testcases/kernel/Makefile
+++ b/testcases/kernel/Makefile
@@ -54,6 +54,7 @@ SUBDIRS			+= connectors \
 			   security \
 			   sound \
 			   tracing \
+			   uevents \
 
 ifeq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
 SUBDIRS			+= power_management
diff --git a/testcases/kernel/uevents/uevent02.c b/testcases/kernel/uevents/uevent02.c
index b94748c..9dd4cd6 100644
--- a/testcases/kernel/uevents/uevent02.c
+++ b/testcases/kernel/uevents/uevent02.c
@@ -14,6 +14,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/wait.h>
+#include <sys/socket.h>
 #include <linux/if.h>
 #include <linux/if_tun.h>
 
diff --git a/testcases/kernel/uevents/uevent03.c b/testcases/kernel/uevents/uevent03.c
index 991737e..9b901dc 100644
--- a/testcases/kernel/uevents/uevent03.c
+++ b/testcases/kernel/uevents/uevent03.c
@@ -16,11 +16,10 @@
 #include <sys/wait.h>
 #include <sys/sysmacros.h>
 
-#include <linux/uinput.h>
-
 #include "tst_test.h"
 #include "tst_uinput.h"
 #include "uevent.h"
+#include "lapi/uinput.h"
 
 static int mouse_fd;
 
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
