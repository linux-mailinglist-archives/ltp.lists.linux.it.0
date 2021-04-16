Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF336260B
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 18:54:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99E2E3C6F8A
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 18:54:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C302A3C1AE3
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 18:54:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 30AC720096E
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 18:54:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CB2BB26C;
 Fri, 16 Apr 2021 16:54:00 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 16 Apr 2021 18:53:55 +0200
Message-Id: <20210416165355.5160-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210416165355.5160-1-pvorel@suse.cz>
References: <20210416165355.5160-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/2] commands: Add shell pipe test
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
Cc: Martin Loviska <mloviska@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds basic shell pipe testing, which was removed from splice02
in 85cebe238 ("splice02: Generate input in C").

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v3->v4:
* Add missing Makefile

 runtest/commands                         |  1 +
 runtest/smoketest                        |  1 +
 testcases/commands/shell/Makefile        | 10 ++++++++++
 testcases/commands/shell/shell_pipe01.sh | 17 +++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 testcases/commands/shell/Makefile
 create mode 100755 testcases/commands/shell/shell_pipe01.sh

diff --git a/runtest/commands b/runtest/commands
index 058266b54..8cfad0449 100644
--- a/runtest/commands
+++ b/runtest/commands
@@ -41,3 +41,4 @@ gdb01_sh gdb01.sh
 unshare01_sh unshare01.sh
 sysctl01_sh sysctl01.sh
 sysctl02_sh sysctl02.sh
+shell_test01 echo "SUCCESS" | shell_pipe01.sh
diff --git a/runtest/smoketest b/runtest/smoketest
index 2224d8f74..7f395936e 100644
--- a/runtest/smoketest
+++ b/runtest/smoketest
@@ -13,3 +13,4 @@ utime01A symlink01 -T utime01
 rename01A symlink01 -T rename01
 splice02 splice02 -s 20
 route4-change-dst route-change-dst.sh
+shell_test01 echo "SUCCESS" | shell_pipe01.sh
diff --git a/testcases/commands/shell/Makefile b/testcases/commands/shell/Makefile
new file mode 100644
index 000000000..c696ec35a
--- /dev/null
+++ b/testcases/commands/shell/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) Linux Test Project, 2021
+
+top_srcdir		?= ../../..
+
+include $(top_srcdir)/include/mk/env_pre.mk
+
+INSTALL_TARGETS		:= *.sh
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/commands/shell/shell_pipe01.sh b/testcases/commands/shell/shell_pipe01.sh
new file mode 100755
index 000000000..3c8ef49fb
--- /dev/null
+++ b/testcases/commands/shell/shell_pipe01.sh
@@ -0,0 +1,17 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+
+TST_TESTFUNC=do_test
+
+. tst_test.sh
+
+do_test()
+{
+	tst_res TINFO "expecting SUCCESS string passed from stdin"
+
+	read line
+	EXPECT_PASS [ "$line" = "SUCCESS" ]
+}
+
+tst_run
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
