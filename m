Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5548AA9EBF
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 11:47:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2BDA3C2150
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 11:47:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 523403C2098
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 11:47:50 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6AFB52015FF
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 11:47:47 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="74884793"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 17:46:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 5376F4CDFCE9
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 17:46:33 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 5 Sep 2019 17:46:32 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 5 Sep 2019 17:46:27 +0800
Message-ID: <1567676787-3050-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 5376F4CDFCE9.A25E4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,WEIRD_QUOTING autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] uevent03: Use a generic way to get sysname
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

UI_GET_NAME was introduced since 3.15, this ioctl is used
to get sysname. For better compatibility, we can use a generic
way to get sysname by parsing /proc/bus/input/devices.
So this case can also run on old kernel.

Also remove useless lapi/uinput.h.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/lapi/uinput.h               | 16 ---------
 include/tst_uinput.h                |  8 +++++
 libs/libltpuinput/tst_uinput.c      | 40 ++++++++++++++++++++++
 testcases/kernel/uevents/uevent03.c | 52 +++++++++++------------------
 4 files changed, 67 insertions(+), 49 deletions(-)
 delete mode 100644 include/lapi/uinput.h

diff --git a/include/lapi/uinput.h b/include/lapi/uinput.h
deleted file mode 100644
index 87e338497..000000000
--- a/include/lapi/uinput.h
+++ /dev/null
@@ -1,16 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
- * Authors: Jinhui huang <huangjh.jy@cn.fujitsu.com>
- */
-
-#ifndef __LAPI_UINPUT_H_
-#define __LAPI_UINPUT_H_
-
-#include <linux/uinput.h>
-
-#ifndef UI_GET_SYSNAME
-#define UI_GET_SYSNAME(len)	_IOC(_IOC_READ, UINPUT_IOCTL_BASE, 44, len)
-#endif
-
-#endif /* __LAPI_UINPUT_H_ */
diff --git a/include/tst_uinput.h b/include/tst_uinput.h
index dddbd9921..47e36cd7f 100644
--- a/include/tst_uinput.h
+++ b/include/tst_uinput.h
@@ -20,6 +20,14 @@ int open_uinput(void);
  */
 void create_input_device(int fd);
 
+/**
+ * Parses /proc/bus/input/devices and returns the sysfs strings for our
+ * virtual device, which is the path of input devices.
+ *
+ * Returns newly allocated string, or NULL in a case of failure.
+ */
+char *get_input_sysfs(void);
+
 /**
  * Parses /proc/bus/input/devices and returns the handlers strings for our
  * virtual device, which is list of input devices that receive events from the
diff --git a/libs/libltpuinput/tst_uinput.c b/libs/libltpuinput/tst_uinput.c
index 4b22fef2a..a2691030b 100644
--- a/libs/libltpuinput/tst_uinput.c
+++ b/libs/libltpuinput/tst_uinput.c
@@ -42,8 +42,21 @@ int open_uinput(void)
 	return -1;
 }
 
+
+#define SYSFS_PREFIX "Sysfs="
 #define HANDLERS_PREFIX "Handlers="
 
+static char *parse_sysfs(char *line)
+{
+	char *sysfs;
+
+	sysfs = strstr(line, SYSFS_PREFIX) + sizeof(SYSFS_PREFIX) - 1;
+
+	sysfs[strlen(sysfs) - 1] = 0;
+
+	return strdup(sysfs);
+}
+
 static char *parse_handlers(char *line)
 {
 	char *handlers;
@@ -55,6 +68,33 @@ static char *parse_handlers(char *line)
 	return strdup(handlers);
 }
 
+char *get_input_sysfs(void)
+{
+	FILE *file;
+	char line[1024];
+	int flag = 0;
+
+	file = fopen("/proc/bus/input/devices", "r");
+	if (!file)
+		return NULL;
+
+	while (fgets(line, sizeof(line), file)) {
+		if (strstr(line, "N: Name=\""VIRTUAL_DEVICE"\""))
+			flag = 1;
+
+		if (flag) {
+			if (line[0] == 'S')
+				return parse_sysfs(line);
+
+			if (line[0] == '\n')
+				flag = 0;
+		}
+	}
+
+	fclose(file);
+	return NULL;
+}
+
 char *get_input_handlers(void)
 {
 	FILE *file;
diff --git a/testcases/kernel/uevents/uevent03.c b/testcases/kernel/uevents/uevent03.c
index f6769849e..f87160b7f 100644
--- a/testcases/kernel/uevents/uevent03.c
+++ b/testcases/kernel/uevents/uevent03.c
@@ -15,11 +15,10 @@
 #include <stdlib.h>
 #include <sys/wait.h>
 #include <sys/sysmacros.h>
-
+#include <linux/uinput.h>
 #include "tst_test.h"
 #include "tst_uinput.h"
 #include "uevent.h"
-#include "lapi/uinput.h"
 
 static int mouse_fd;
 
@@ -52,8 +51,7 @@ static void get_minor_major(char *device, char *minor, char *major, size_t buf_s
 
 static void verify_uevent(void)
 {
-	int pid, fd, ret;
-	char sysname[64];
+	int pid, fd;
 	char add_msg[1024];
 	char rem_msg[1024];
 	char dev_path[1024];
@@ -71,8 +69,7 @@ static void verify_uevent(void)
 	char major_event1[MINOR_MAJOR_SIZE];
 	char major_event2[MINOR_MAJOR_SIZE];
 
-	char *handlers, *handler1, *handler2;
-
+	char *handlers, *handler1, *handler2, *sysname;
 	struct uevent_desc add = {
 		.msg = add_msg,
 		.value_cnt = 7,
@@ -167,20 +164,12 @@ static void verify_uevent(void)
 
 	create_uinput_mouse();
 
-	ret = ioctl(mouse_fd, UI_GET_SYSNAME(sizeof(sysname)), sysname);
-	if (ret < 0) {
-		if (errno == EINVAL) {
-			tst_brk(TCONF,
-				"kernel does not support UI_GET_SYSNAME");
-		} else {
-			tst_brk(TBROK,
-				"ioctl(%d, %s,...) failed",
-				mouse_fd, "UI_GET_SYSNAME");
-		}
-	}
-
+	sysname = get_input_sysfs();
 	handlers = get_input_handlers();
 
+	if (!sysname)
+		tst_brk(TBROK, "Expected /devices/virtual/input/inputN sysname!");
+
 	tst_res(TINFO, "Sysname: %s", sysname);
 	tst_res(TINFO, "Handlers: %s", handlers);
 
@@ -198,41 +187,38 @@ static void verify_uevent(void)
 
 	destroy_uinput_mouse();
 
-	snprintf(add_msg, sizeof(add_msg),
-	         "add@/devices/virtual/input/%s", sysname);
-
-	snprintf(rem_msg, sizeof(rem_msg),
-	         "remove@/devices/virtual/input/%s", sysname);
+	snprintf(add_msg, sizeof(add_msg), "add@%s", sysname);
 
-	snprintf(dev_path, sizeof(dev_path),
-	         "DEVPATH=/devices/virtual/input/%s", sysname);
+	snprintf(rem_msg, sizeof(rem_msg), "remove@%s", sysname);
 
+	snprintf(dev_path, sizeof(dev_path), "DEVPATH=%s", sysname);
 
 	snprintf(add_msg_event1, sizeof(add_msg_event1),
-	         "add@/devices/virtual/input/%s/%s", sysname, handler1);
+		"add@%s/%s", sysname, handler1);
 
 	snprintf(rem_msg_event1, sizeof(rem_msg_event1),
-	         "remove@/devices/virtual/input/%s/%s", sysname, handler1);
+		"remove@%s/%s", sysname, handler1);
 
 	snprintf(dev_path_event1, sizeof(dev_path_event1),
-	         "DEVPATH=/devices/virtual/input/%s/%s", sysname, handler1);
+		"DEVPATH=%s/%s", sysname, handler1);
 
 	snprintf(dev_name1, sizeof(dev_name1),
-	         "DEVNAME=input/%s", handler1);
+		"DEVNAME=input/%s", handler1);
 
 
 	snprintf(add_msg_event2, sizeof(add_msg_event2),
-	         "add@/devices/virtual/input/%s/%s", sysname, handler2);
+		"add@%s/%s", sysname, handler2);
 
 	snprintf(rem_msg_event2, sizeof(rem_msg_event2),
-	         "remove@/devices/virtual/input/%s/%s", sysname, handler2);
+		"remove@%s/%s", sysname, handler2);
 
 	snprintf(dev_path_event2, sizeof(dev_path_event2),
-	         "DEVPATH=/devices/virtual/input/%s/%s", sysname, handler2);
+		"DEVPATH=%s/%s", sysname, handler2);
 
 	snprintf(dev_name2, sizeof(dev_name2),
-	         "DEVNAME=input/%s", handler2);
+		"DEVNAME=input/%s", handler2);
 
+	free(sysname);
 	free(handlers);
 
 	pid = SAFE_FORK();
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
