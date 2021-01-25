Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 127BB30298B
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 19:06:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF1413C5F29
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 19:06:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 795BA3C288C
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 19:06:40 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EA32F60008D
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 19:06:39 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1E6DB7D9
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 18:06:38 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 25 Jan 2021 19:06:30 +0100
Message-Id: <20210125180630.15163-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] lib: Add test for tst_check_driver()
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
Hi Cyril,

thanks for previous review. I modified the test more thus sending v2.

Changes v1-v2:
* Check two version of module (using '_' and '-' also on built-in
  modules) => more coverage.
* Fix test when $MODULES_DIR exists, but does not contain modules
(in v1 it TBROK: Test didn't report any results), now at least check non-existing module:

Kind regards,
Petr

tst_check_driver 1 TINFO: timeout per run is 0h 5m 0s
tst_check_driver 1 TINFO: using modules directory '/tmp/xx'
tst_check_driver 1 TINFO: check loadable module detection
tst_check_driver 1 TCONF: no modules found
tst_check_driver 2 TINFO: check non-existing module detection
tst_check_driver 2 TPASS: tst_check_drivers not-existing-kernel-module failed as expected
tst_check_driver 3 TINFO: check built-in module detection
tst_check_driver 3 TCONF: missing '/tmp/xx/modules.builtin'

Kind regards,
Petr

 lib/newlib_tests/shell/tst_check_driver.sh | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100755 lib/newlib_tests/shell/tst_check_driver.sh

diff --git a/lib/newlib_tests/shell/tst_check_driver.sh b/lib/newlib_tests/shell/tst_check_driver.sh
new file mode 100755
index 000000000..b1418ef8e
--- /dev/null
+++ b/lib/newlib_tests/shell/tst_check_driver.sh
@@ -0,0 +1,63 @@
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
+test_drivers()
+{
+	local paths="$@"
+	local drv
+
+	if [ -z "$paths" ]; then
+		tst_res TCONF "no modules found"
+		return
+	fi
+
+	for drv in $paths; do
+		drv="$(echo $drv | sed 's/.*\/\([^/]\+\)\.ko.*/\1/')"
+		EXPECT_PASS tst_check_drivers $drv
+		drv="$(echo $drv | sed 's/_/-/g')"
+		EXPECT_PASS tst_check_drivers $drv
+	done
+}
+
+test1()
+{
+	tst_res TINFO "check loadable module detection"
+	test_drivers $(find $MODULES_DIR | grep -E '_[^/]+\.ko' | head -3)
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
+
+	tst_res TINFO "check built-in module detection"
+
+	[ -f "$f" ] || \
+		tst_brk TCONF "missing '$f'"
+
+	test_drivers $(grep -E '_[^/]+\.ko' $f | head -3)
+}
+
+tst_run
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
