Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 110EF4C3C72
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Feb 2022 04:36:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A39AD3CA152
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Feb 2022 04:36:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 63F863C9D13
 for <ltp@lists.linux.it>; Fri, 25 Feb 2022 04:36:18 +0100 (CET)
Received: from cxsh.intel-email.com (cxsh.intel-email.com [121.46.250.151])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 44D111400985
 for <ltp@lists.linux.it>; Fri, 25 Feb 2022 04:36:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by cxsh.intel-email.com (Postfix) with ESMTP id 28F19DDA7AE
 for <ltp@lists.linux.it>; Fri, 25 Feb 2022 11:36:03 +0800 (CST)
Received: from cxsh.intel-email.com (localhost [127.0.0.1])
 by cxsh.intel-email.com (Postfix) with ESMTP id D56D6DDA7F5
 for <ltp@lists.linux.it>; Fri, 25 Feb 2022 11:36:02 +0800 (CST)
Authentication-Results: cxsh.intel-email.com; none
Received: from FZEX3.ruijie.com.cn (unknown [120.35.11.201])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by cxsh.intel-email.com (Postfix) with ESMTPS id 3A6EEDDA7D5
 for <ltp@lists.linux.it>; Fri, 25 Feb 2022 11:36:00 +0800 (CST)
Received: from localhost.localdomain (172.29.46.186) by FZEX3.ruijie.com.cn
 (192.168.58.89) with Microsoft SMTP Server id 14.3.123.3; Fri, 25 Feb 2022
 11:35:59 +0800
From: xiaoshoukui <xiaoshoukui@ruijie.com.cn>
To: <ltp@lists.linux.it>
Date: Thu, 24 Feb 2022 22:34:56 -0500
Message-ID: <20220225033456.63578-1-xiaoshoukui@ruijie.com.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [172.29.46.186]
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] Add pty06 test for use-after-free in
 con_shutdown()
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

Signed-off-by: xiaoshoukui <xiaoshoukui@ruijie.com.cn>
---
 testcases/kernel/pty/Makefile |  4 +-
 testcases/kernel/pty/pty06.c  | 78 +++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+), 2 deletions(-)
 create mode 100644 testcases/kernel/pty/pty06.c

diff --git a/testcases/kernel/pty/Makefile b/testcases/kernel/pty/Makefile
index d4c6c87f0..51b7356c2 100644
--- a/testcases/kernel/pty/Makefile
+++ b/testcases/kernel/pty/Makefile
@@ -6,7 +6,7 @@ top_srcdir		?= ../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-pty03 pty05: CFLAGS += -pthread
-pty03 pty05: LDLIBS += -lrt
+pty03 pty05 pty06: CFLAGS += -pthread
+pty03 pty05 pty06: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/pty/pty06.c b/testcases/kernel/pty/pty06.c
new file mode 100644
index 000000000..9fcd341e6
--- /dev/null
+++ b/testcases/kernel/pty/pty06.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2022 xiaoshoukui <xiaoshoukui@ruijie.com.cn>
+ *
+ * Test based on Syzkaller reproducer:
+ * https://syzkaller.appspot.com/bug?extid=522643ab5729b0421998
+ *
+ * The VT_DISALLOCATE ioctl can free a virtual console while tty_release()
+ * is still running, causing a use-after-free in con_shutdown().	This
+ * occurs because VT_DISALLOCATE only considers a virtual console to be
+ * in-use if it has a tty_struct with count > 0.	But actually when
+ * count == 0, the tty is still in the process of being closed.
+ *
+ * Fixed by commit ca4463bf8438:
+ * "vt: vt_ioctl: fix VT_DISALLOCATE freeing in-use virtual console"
+ *
+ */
+
+#define _GNU_SOURCE
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <errno.h>
+#include <termios.h>
+#include <linux/vt.h>
+#include "lapi/ioctl.h"
+
+#include "tst_test.h"
+#include "tst_safe_stdio.h"
+#include "tst_fuzzy_sync.h"
+
+#define BUF_SIZE 256
+static char tty_path_a[BUF_SIZE];
+static char tty_path_b[BUF_SIZE];
+static int tst_tty_port = 8;
+static struct tst_fzsync_pair fzp;
+
+static void *open_close(void *unused) {
+    sprintf(tty_path_b, "/dev/tty%d", tst_tty_port);
+    while (tst_fzsync_run_b(&fzp)) {
+        tst_fzsync_start_race_b(&fzp);
+        int fd = SAFE_OPEN(tty_path_b, O_RDWR);
+        SAFE_CLOSE(fd);
+        tst_fzsync_end_race_b(&fzp);
+    }
+    return unused;
+}
+
+static void do_test(void) {
+    sprintf(tty_path_a, "/dev/tty%d", tst_tty_port + 1);
+    int fd = SAFE_OPEN(tty_path_a, O_RDWR);
+    tst_fzsync_pair_reset(&fzp, open_close);
+    while (tst_fzsync_run_a(&fzp)) {
+        tst_fzsync_start_race_a(&fzp);
+        ioctl(fd, VT_DISALLOCATE, tst_tty_port);
+        tst_fzsync_end_race_a(&fzp);
+    }
+    tst_res(TPASS, "Did not crash with VT_DISALLOCATE");
+}
+
+static void setup(void) {
+    tst_fzsync_pair_init(&fzp);
+}
+
+static void cleanup(void) {
+    tst_fzsync_pair_cleanup(&fzp);
+}
+
+static struct tst_test test = {
+        .test_all = do_test,
+        .setup = setup,
+        .cleanup = cleanup,
+        .needs_root = 1,
+        .tags = (const struct tst_tag[]) {
+                {"linux-git", "ca4463bf8438"},
+                {}
+        }
+};
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
