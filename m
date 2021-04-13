Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5502A35D687
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 06:39:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14FC53C1C6C
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 06:39:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 591AA3C1AF7
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 06:38:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 366111401108
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 06:38:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94916B0C6;
 Tue, 13 Apr 2021 04:38:56 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 13 Apr 2021 06:38:44 +0200
Message-Id: <20210413043844.5612-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413043844.5612-1-pvorel@suse.cz>
References: <20210413043844.5612-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/2] commands: Add shell pipe test
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
The same as v2.

 runtest/commands                         |  1 +
 runtest/smoketest                        |  1 +
 testcases/commands/shell/shell_pipe01.sh | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)
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
index ec0c088cb..85f377192 100644
--- a/runtest/smoketest
+++ b/runtest/smoketest
@@ -13,3 +13,4 @@ utime01A symlink01 -T utime01
 rename01A symlink01 -T rename01
 splice02 splice02 -n 20
 route4-change-dst route-change-dst.sh
+shell_test01 echo "SUCCESS" | shell_pipe01.sh
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
