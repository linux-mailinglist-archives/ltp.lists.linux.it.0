Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B129332946D
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 23:02:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60EF63C6FA8
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 23:02:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5CF6B3C575A
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 23:02:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0C1C41A00926
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 23:02:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97C8CAF48;
 Mon,  1 Mar 2021 22:02:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  1 Mar 2021 23:02:20 +0100
Message-Id: <20210301220222.22705-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301220222.22705-1-pvorel@suse.cz>
References: <20210301220222.22705-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 5/7] tst_test.sh: Introduce tst_set_timeout(timeout)
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

to sync with C API. This allows to setup timer after test has started.
It's useful when test length depends on input decided during setup.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v3.

 doc/test-writing-guidelines.txt | 16 ++++++++++++----
 testcases/lib/tst_test.sh       | 23 ++++++++++++++++++-----
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index dd1911ceb..50696e14a 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2393,8 +2393,8 @@ tst_run
 '$TST_TEST_DATA' can be used with '$TST_CNT'. If '$TST_TEST_DATA_IFS' not specified,
 space as default value is used. Of course, it's possible to use separate functions.
 
-2.3.2 Library environment variables for shell
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+2.3.2 Library environment variables and functions for shell
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Similarily to the C library various checks and preparations can be requested
 simply by setting right '$TST_NEEDS_FOO'.
@@ -2415,11 +2415,19 @@ simply by setting right '$TST_NEEDS_FOO'.
 | 'TST_TIMEOUT'      | Maximum timeout set for the test in sec. Must be int >= 1,
                        or -1 (special value to disable timeout), default is 300.
                        Variable is meant be set in tests, not by user.
-                       It's equivalent of `tst_test.timeout` in C.
+                       It's an equivalent of `tst_test.timeout` in C, can be set
+                       via 'tst_set_timeout(timeout)' after test has started.
+|=============================================================================
+
+[options="header"]
+|=============================================================================
+| Function name              | Action done
+| 'tst_set_timeout(timeout)' | Maximum timeout set for the test in sec.
+                               See 'TST_TIMEOUT' variable.
 |=============================================================================
 
 NOTE: Network tests (see testcases/network/README.md) use additional variables
-in 'tst_net.sh'.
+and functions in 'tst_net.sh'.
 
 Checking for presence of commands
 +++++++++++++++++++++++++++++++++
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 69f007d89..58056e28b 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) Linux Test Project, 2014-2020
+# Copyright (c) Linux Test Project, 2014-2021
 # Author: Cyril Hrubis <chrubis@suse.cz>
 #
 # LTP test library for shell.
@@ -23,6 +23,14 @@ export TST_LIB_LOADED=1
 # default trap function
 trap "tst_brk TBROK 'test interrupted'" INT
 
+_tst_cleanup_timer()
+{
+	if [ -n "$_tst_setup_timer_pid" ]; then
+		kill $_tst_setup_timer_pid 2>/dev/null
+		wait $_tst_setup_timer_pid 2>/dev/null
+	fi
+}
+
 _tst_do_exit()
 {
 	local ret=0
@@ -48,10 +56,7 @@ _tst_do_exit()
 		[ "$TST_TMPDIR_RHOST" = 1 ] && tst_cleanup_rhost
 	fi
 
-	if [ -n "$_tst_setup_timer_pid" ]; then
-		kill $_tst_setup_timer_pid 2>/dev/null
-		wait $_tst_setup_timer_pid 2>/dev/null
-	fi
+	_tst_cleanup_timer
 
 	if [ $TST_FAIL -gt 0 ]; then
 		ret=$((ret|1))
@@ -459,6 +464,8 @@ _tst_setup_timer()
 
 	tst_res TINFO "timeout per run is ${h}h ${m}m ${s}s"
 
+	_tst_cleanup_timer
+
 	sleep $sec && tst_res TBROK "test killed, timeout! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill -9 -$pid &
 
 	_tst_setup_timer_pid=$!
@@ -492,6 +499,12 @@ tst_require_module()
 	tst_res TINFO "Found module at '$TST_MODPATH'"
 }
 
+tst_set_timeout()
+{
+	TST_TIMEOUT="$1"
+	_tst_setup_timer
+}
+
 tst_run()
 {
 	local _tst_i
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
