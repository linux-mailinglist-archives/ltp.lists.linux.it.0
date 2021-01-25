Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0730236C
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 10:58:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7D5C3C528C
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 10:58:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5BA8F3C0EC2
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 10:58:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BFFEF200067
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 10:58:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9DBCCAD19
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 09:58:27 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 25 Jan 2021 10:58:14 +0100
Message-Id: <20210125095814.31741-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] lib: Add test for tst_check_driver()
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

Test for 8f7013ba6.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/shell/tst_check_driver.sh | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100755 lib/newlib_tests/shell/tst_check_driver.sh

diff --git a/lib/newlib_tests/shell/tst_check_driver.sh b/lib/newlib_tests/shell/tst_check_driver.sh
new file mode 100755
index 000000000..1d438700b
--- /dev/null
+++ b/lib/newlib_tests/shell/tst_check_driver.sh
@@ -0,0 +1,64 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+
+TST_TESTFUNC=test
+TST_SETUP=setup
+TST_CNT=3
+TST_NEEDS_CMDS="tst_check_drivers find grep head sed"
+. tst_test.sh
+
+MODULES_DIR="${MODULES_DIR:-/lib/modules/$(uname -r)}"
+
+setup()
+{
+	tst_res TINFO "using modules directory '$MODULES_DIR'"
+
+	[ -d "$MODULES_DIR" ] || \
+		tst_brk TCONF "modules directory '$MODULES_DIR' missing"
+}
+
+get_name()
+{
+	local path="$1"
+	local drv
+
+	echo $path | sed 's/.*\/\([^/]\+\)\.ko.*/\1/'
+}
+
+test1()
+{
+	local drv
+
+	for drv in $(find $MODULES_DIR | grep -E '_[^/]+\.ko' | head -3); do
+		drv="$(get_name $drv)"
+		EXPECT_PASS tst_check_drivers $drv
+
+		drv="$(echo $drv | sed 's/_/-/g')"
+		EXPECT_PASS tst_check_drivers $drv
+	done
+}
+
+test2()
+{
+	tst_res TINFO "check non-existing module detection"
+	EXPECT_FAIL tst_check_drivers not-existing-kernel-module
+}
+
+test3()
+{
+	local f="$MODULES_DIR/modules.builtin"
+	local drv
+
+	tst_res TINFO "check built-in module detection"
+
+	[ -f "$f" ] || \
+		tst_brk TCONF "missing '$f'"
+
+	for drv in $(head -3 $f); do
+		drv="$(get_name $drv)"
+		EXPECT_PASS tst_check_drivers "$(get_name $drv)"
+	done
+}
+
+tst_run
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
