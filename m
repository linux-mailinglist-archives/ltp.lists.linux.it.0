Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2FF2DD32D
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 15:44:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33B5A3C670B
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 15:44:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5DE2F3C0194
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 15:44:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B714B200FE6
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 15:44:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A054AE91;
 Thu, 17 Dec 2020 14:44:34 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 17 Dec 2020 15:44:22 +0100
Message-Id: <20201217144424.19414-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217144424.19414-1-pvorel@suse.cz>
References: <20201217144424.19414-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/3] tst_test.sh: Call cleanup function after test
 start
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

It does not make sense to run the test cleanup function when the setup
function has been run.

And at least some network tests expect setup has been run before running
cleanup (e.g. tcp_fastopen_run.sh).

When shell API was introduced, cleanup function was run only if 1) setup
function was defined 2) and also run. That was inconsistent from C API,
thus e7dc14caa run it always.

But shell API is different from C API: tst_brk can be called from
tst_test.sh (or other library which is run before tst_run, e.g.
tst_net.sh). That was probably the reason, why detection via
$TST_SETUP_STARTED was introduced in initial shell API.

NOTE: using type is better than grep $TST_TEST_PATH, because cleanup
function can be in other library sourced by the test.

Fixes: e7dc14caa ("tst_test.sh: Run cleanup even setup is not defined")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/test-writing-guidelines.txt | 10 +++++++---
 testcases/lib/tst_test.sh       |  4 ++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 99fb34628..f3a55cf26 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2251,11 +2251,15 @@ able to clean up correctly even in this situation. The easiest solution for
 this is to keep track of what was initialized and act accordingly in the
 cleanup.
 
-WARNING: Similar to the C library, calling tst_brk() in the $TST_CLEANUP does
+WARNING: Similar to the C library, calling 'tst_brk' in the $TST_CLEANUP does
          not exit the test and 'TBROK' is converted to 'TWARN'.
 
-Notice also the 'tst_run' function called at the end of the test that actually
-starts the test.
+Notice also the 'tst_run' shell API function called at the end of the test that
+actually starts the test.
+
+WARNING: cleanup function is called only after 'tst_run' has been started.
+Calling 'tst_brk' in shell libraries, e.g. 'tst_test.sh' or 'tst_net.sh' does
+not trigger calling it.
 
 [source,sh]
 -------------------------------------------------------------------------------
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 2417da140..c205bc91b 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -28,7 +28,7 @@ _tst_do_exit()
 	local ret=0
 	TST_DO_EXIT=1
 
-	if [ -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
+	if [ -n "$TST_RUN_STARTED" -a -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
 		$TST_CLEANUP
 	fi
 
@@ -599,7 +599,6 @@ tst_run()
 		fi
 		TST_ITERATIONS=$((TST_ITERATIONS-1))
 	done
-
 	_tst_do_exit
 }
 
@@ -608,6 +607,7 @@ _tst_run_tests()
 	local _tst_data="$1"
 	local _tst_i
 
+	TST_RUN_STARTED=1
 	for _tst_i in $(seq ${TST_CNT:-1}); do
 		if type ${TST_TESTFUNC}1 > /dev/null 2>&1; then
 			_tst_run_test "$TST_TESTFUNC$_tst_i" $_tst_i "$_tst_data"
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
