Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C72F99043B
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Aug 2019 16:54:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84A253C1CFF
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Aug 2019 16:54:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 979993C1C8A
 for <ltp@lists.linux.it>; Fri, 16 Aug 2019 16:54:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EB701149834C
 for <ltp@lists.linux.it>; Fri, 16 Aug 2019 16:54:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8D9D1AF40
 for <ltp@lists.linux.it>; Fri, 16 Aug 2019 14:54:14 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 16 Aug 2019 16:54:09 +0200
Message-Id: <20190816145410.8681-5-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190816145410.8681-1-chrubis@suse.cz>
References: <20190816145410.8681-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1 4/5] libs/libltpuinput: Add uinput library.
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

I to be used in the uevent03 test.

Also I will convert the uinput testcases to new library and make use of
this library as well.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_uinput.h           | 31 ++++++++++++
 libs/libltpuinput/Makefile     | 12 +++++
 libs/libltpuinput/tst_uinput.c | 93 ++++++++++++++++++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 include/tst_uinput.h
 create mode 100644 libs/libltpuinput/Makefile
 create mode 100644 libs/libltpuinput/tst_uinput.c

diff --git a/include/tst_uinput.h b/include/tst_uinput.h
new file mode 100644
index 000000000..1d5b5215a
--- /dev/null
+++ b/include/tst_uinput.h
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+#ifndef TST_UINPUT_H__
+#define TST_UINPUT_H__
+
+/**
+ * Tries to open the uinput device.
+ *
+ * Returns file descriptor on success, -1 on failure.
+ */
+int open_uinput(void);
+
+/**
+ * Creates virtual input device.
+ *
+ * @fd File descriptor returned by open_uinput().
+ */
+void create_input_device(int fd);
+
+
+/**
+ * Destroys virtual input device.
+ *
+ * @fd File descriptor returned by open_uinput().
+ */
+void destroy_input_device(int fd);
+
+#endif	/* TST_UINPUT_H__ */
diff --git a/libs/libltpuinput/Makefile b/libs/libltpuinput/Makefile
new file mode 100644
index 000000000..dd2a6c096
--- /dev/null
+++ b/libs/libltpuinput/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Copyright (C) Cyril Hrubis <chrubis@suse.cz>
+
+top_srcdir		?= ../..
+
+include $(top_srcdir)/include/mk/env_pre.mk
+
+LIB			:= libltpuinput.a
+
+include $(top_srcdir)/include/mk/lib.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/libs/libltpuinput/tst_uinput.c b/libs/libltpuinput/tst_uinput.c
new file mode 100644
index 000000000..41a1f7eb0
--- /dev/null
+++ b/libs/libltpuinput/tst_uinput.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2015 Cedric Hnyda <chnyda@suse.com>
+ * Copyright (c) 2019 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+#include <linux/input.h>
+#include <linux/uinput.h>
+#include <stdio.h>
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+
+#include "tst_uinput.h"
+
+#define VIRTUAL_DEVICE "virtual-device-ltp"
+
+static const char *uinput_paths[] = {
+	"/dev/input/uinput",
+	"/dev/uinput",
+};
+
+int open_uinput(void)
+{
+	unsigned int i;
+	int fd;
+
+	for (i = 0; i < ARRAY_SIZE(uinput_paths); i++) {
+		fd = open(uinput_paths[i], O_WRONLY | O_NONBLOCK);
+
+		if (fd > 0) {
+			tst_res(TINFO, "Found uinput dev at %s", uinput_paths[i]);
+			return fd;
+		}
+
+		if (fd < 0 && errno != ENOENT) {
+			tst_brk(TBROK | TERRNO, "open(%s)", uinput_paths[i]);
+		}
+	}
+
+	return -1;
+}
+
+static int check_device(void)
+{
+	FILE *file;
+	char line[256];
+
+	file = fopen("/proc/bus/input/devices", "r");
+	if (!file)
+		return 0;
+
+	while (fgets(line, 256, file)) {
+		if (strstr(line, VIRTUAL_DEVICE))
+			return 1;
+	}
+
+	fclose(file);
+
+	return 0;
+}
+
+void destroy_input_device(int fd)
+{
+	SAFE_IOCTL(fd, UI_DEV_DESTROY, NULL);
+	SAFE_CLOSE(fd);
+}
+
+void create_input_device(int fd)
+{
+	int nb;
+	struct uinput_user_dev uidev = {
+		.name = VIRTUAL_DEVICE,
+		.id = {
+			.bustype = BUS_USB,
+			.vendor = 0x1,
+			.product = 0x1,
+			.version = 1,
+		}
+	};
+
+	SAFE_WRITE(1, fd, &uidev, sizeof(uidev));
+	SAFE_IOCTL(fd, UI_DEV_CREATE, NULL);
+
+	for (nb = 100; nb > 0; nb--) {
+		if (check_device())
+			return;
+		usleep(10000);
+	}
+
+	destroy_input_device(fd);
+	tst_brk(TBROK, "Failed to create device");
+}
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
