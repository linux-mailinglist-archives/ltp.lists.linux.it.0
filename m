Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DDECDBF6
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 08:50:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C48F53C1C7C
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 08:50:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1C9573C038C
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 08:50:25 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6C5872000DE
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 08:50:24 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 673839F7FC;
 Mon,  7 Oct 2019 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570431023; bh=eyJdU7mYiMd8x+Z2gtwZiA7frCn0PnNztrOrJQeif1U=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=iDw+jrpqOxmDnHAygXOGJhHgjFDfmTBbOmdIBWy+8JZTDHOm27QzCrzMXUAzyS+5j
 iUBYUpRlsG0ZHymwv0kwoelc4ceBP5lLegopK6oiCN4WHJsNKSkqXmfO4mmcp1j+FH
 Y5+MP0ZP3nUMCOrcv6UvctjSNE4pRIEqZhAPw8OE=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Mon,  7 Oct 2019 08:50:17 +0200
Message-Id: <20191007065017.86054-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3] lsmod01: Add kernel module
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

The test fails, if no kernel module is loaded. Now at least one module is
always loaded.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/commands/.gitignore          |  1 +
 testcases/commands/lsmod/Makefile      | 15 ++++++++++++
 testcases/commands/lsmod/lsmod01.sh    | 32 ++++++++++++++++++++++++++
 testcases/commands/lsmod/ltp_lsmod01.c | 28 ++++++++++++++++++++++
 4 files changed, 76 insertions(+)
 create mode 100644 testcases/commands/lsmod/ltp_lsmod01.c

diff --git a/testcases/commands/.gitignore b/testcases/commands/.gitignore
index 0ed343881..ed5e13e29 100644
--- a/testcases/commands/.gitignore
+++ b/testcases/commands/.gitignore
@@ -2,3 +2,4 @@
 /ldd/datafiles/*.obj.so
 /eject/eject_check_tray
 /insmod/ltp_insmod01.ko
+/lsmod/ltp_lsmod01.ko
diff --git a/testcases/commands/lsmod/Makefile b/testcases/commands/lsmod/Makefile
index 2af91b3de..8fc3b1436 100644
--- a/testcases/commands/lsmod/Makefile
+++ b/testcases/commands/lsmod/Makefile
@@ -13,10 +13,25 @@
 #    GNU General Public License for more details.
 #
 
+ifneq ($(KERNELRELEASE),)
+
+obj-m := ltp_lsmod01.o
+
+else
+
 top_srcdir		?= ../../..
 
+include $(top_srcdir)/include/mk/testcases.mk
+
+REQ_VERSION_MAJOR       := 2
+REQ_VERSION_PATCH       := 6
+MAKE_TARGETS            := ltp_lsmod01.ko
+
 include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= lsmod01.sh
 
+include $(top_srcdir)/include/mk/module.mk
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+endif
diff --git a/testcases/commands/lsmod/lsmod01.sh b/testcases/commands/lsmod/lsmod01.sh
index ad170dcd4..c761a91af 100755
--- a/testcases/commands/lsmod/lsmod01.sh
+++ b/testcases/commands/lsmod/lsmod01.sh
@@ -5,11 +5,43 @@
 #
 # Test basic functionality of lsmod command.
 
+TST_CLEANUP=cleanup
+TST_SETUP=setup
 TST_TESTFUNC=lsmod_test
 TST_NEEDS_TMPDIR=1
 TST_NEEDS_CMDS="lsmod"
+TST_NEEDS_MODULE="ltp_lsmod01.ko"
 . tst_test.sh
 
+inserted=0
+
+setup()
+{
+	if [ -z "$(cat /proc/modules)" ]; then
+		tst_res TINFO "Loading dummy kernel module"
+		insmod "$TST_MODPATH"
+		if [ $? -ne 0 ]; then
+			tst_res TBROK "insmod failed"
+			return
+		fi
+
+		inserted=1
+	fi
+}
+
+cleanup()
+{
+	if [ $inserted -ne 0 ]; then
+		tst_res TINFO "Unloading dummy kernel module"
+		rmmod ltp_lsmod01
+		if [ $? -ne 0 ]; then
+			tst_res TWARN "rmmod failed"
+		fi
+		inserted=0
+	fi
+}
+
+
 lsmod_test()
 {
 	lsmod_output=$(lsmod | awk '!/Module/{print $1, $2, $3}' | sort)
diff --git a/testcases/commands/lsmod/ltp_lsmod01.c b/testcases/commands/lsmod/ltp_lsmod01.c
new file mode 100644
index 000000000..19f9d9145
--- /dev/null
+++ b/testcases/commands/lsmod/ltp_lsmod01.c
@@ -0,0 +1,28 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) 2016 Fujitsu Ltd.
+ * Author: Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
+ *
+ * Description:
+ *  This is a kernel loadable module programme used by lssmod01.sh
+ *  testcase which inserts this module for test of lsmod command.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+static int test_init(void)
+{
+	return 0;
+}
+
+static void test_exit(void)
+{
+
+}
+
+MODULE_LICENSE("GPL");
+
+module_init(test_init);
+module_exit(test_exit);
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
