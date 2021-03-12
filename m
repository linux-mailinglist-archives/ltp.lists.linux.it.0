Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5383394F7
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 18:32:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01BA33C6865
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 18:32:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id F2D1F3C6829
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 18:32:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8DD95601E1D
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 18:32:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3781AF6C;
 Fri, 12 Mar 2021 17:32:08 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 12 Mar 2021 18:32:00 +0100
Message-Id: <20210312173201.27708-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173201.27708-1-pvorel@suse.cz>
References: <20210312173201.27708-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] test: Adding timeout03.sh for testing
 _tst_kill_test()
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
new commit in this attempt

 lib/newlib_tests/shell/timeout03.sh | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100755 lib/newlib_tests/shell/timeout03.sh

diff --git a/lib/newlib_tests/shell/timeout03.sh b/lib/newlib_tests/shell/timeout03.sh
new file mode 100755
index 000000000..89a4928b2
--- /dev/null
+++ b/lib/newlib_tests/shell/timeout03.sh
@@ -0,0 +1,47 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+
+# testing shell timeout handling in _tst_kill_test()
+# expected output:
+# timeout03 1 TINFO: timeout per run is 0h 0m 1s
+# timeout03 1 TINFO: testing killing test after TST_TIMEOUT
+# timeout03 1 TBROK: Test timeouted, sending SIGTERM! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
+# timeout03 1 TBROK: test interrupted or timed out
+# timeout03 1 TPASS: test run cleanup after timeout
+# timeout03 1 TINFO: Test is still running, waiting 10s
+# timeout03 1 TINFO: Test is still running, waiting 9s
+# timeout03 1 TINFO: Test is still running, waiting 8s
+# timeout03 1 TINFO: Test is still running, waiting 7s
+# timeout03 1 TINFO: Test is still running, waiting 6s
+# timeout03 1 TINFO: Test is still running, waiting 5s
+# timeout03 1 TINFO: Test is still running, waiting 4s
+# timeout03 1 TINFO: Test is still running, waiting 3s
+# timeout03 1 TINFO: Test is still running, waiting 2s
+# timeout03 1 TINFO: Test is still running, waiting 1s
+# timeout03 1 TBROK: Test still running, sending SIGKILL
+# Killed
+
+TST_TESTFUNC=do_test
+TST_CLEANUP=cleanup
+
+TST_TIMEOUT=1
+. tst_test.sh
+
+do_test()
+{
+	tst_res TINFO "testing killing test after TST_TIMEOUT"
+
+	tst_sleep 2
+	tst_res TFAIL "test: running after TST_TIMEOUT"
+}
+
+cleanup()
+{
+	tst_res TPASS "test run cleanup after timeout"
+
+	tst_sleep 15 # must be higher than wait time in _tst_kill_test
+	tst_res TFAIL "cleanup: running after TST_TIMEOUT"
+}
+
+tst_run
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
