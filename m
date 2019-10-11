Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF63D3CCF
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:55:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E7D783C2275
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:55:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4566E3C1453
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:54:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0B50B1001991
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:53:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84D01B04F;
 Fri, 11 Oct 2019 09:54:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Oct 2019 11:54:39 +0200
Message-Id: <20191011095442.10541-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011095442.10541-1-pvorel@suse.cz>
References: <20191011095442.10541-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v5 2/5] shell: Introduce TST_TIMEOUT variable,
 add checks
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

to unify shell API with C API.

TST_TIMEOUT should be set in tests only, it's equivalent
of tst_test->timeout in C API.

Add checks requiring both TST_TIMEOUT and LTP_TIMEOUT_MUL >= 1,
that allow to set TST_TIMEOUT lower than the default 300 sec
(might be useful for some case).

LTP_TIMEOUT_MUL can be float, but will be ceiled to int.
Using float would require awk/bc, which is unnecessary dependency
and code complication (we do not care that much if it's multiplied
precisely as far as the resulting timeout is never smaller than
the precise calculation).

Also added cut dependency to _tst_setup_timer(), but that's not
a problem as it was already required for shell API in tst_run().

Suggested-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Reviewed-by: Li Wang <liwang@redhat.com>
Reviewed-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/test-writing-guidelines.txt |  8 ++++++--
 doc/user-guide.txt              |  2 +-
 testcases/lib/tst_test.sh       | 25 +++++++++++++++++++++++--
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 997272cbe..efff4d40c 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2109,8 +2109,8 @@ tst_run
 '$TST_TEST_DATA' can be used with '$TST_CNT'. If '$TST_TEST_DATA_IFS' not specified,
 space as default value is used. Of course, it's possible to use separate functions.
 
-2.3.2 Library variables
-^^^^^^^^^^^^^^^^^^^^^^^
+2.3.2 Library environment variables for shell
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Similarily to the C library various checks and preparations can be requested
 simply by setting right '$TST_NEEDS_FOO'.
@@ -2126,6 +2126,10 @@ simply by setting right '$TST_NEEDS_FOO'.
                        the test (see below).
 | 'TST_NEEDS_MODULE' | Test module name needed for the test (see below).
 | 'TST_NEEDS_DRIVERS'| Checks kernel drivers support for the test.
+| 'TST_TIMEOUT'      | Maximum timeout set for the test in sec. Must be int >= 1,
+                       or -1 (special value to disable timeout), default is 300.
+                       Variable is meant be set in tests, not by user.
+                       It's equivalent of `tst_test.timeout` in C.
 |=============================================================================
 
 NOTE: Network tests (see testcases/network/README.md) use additional variables
diff --git a/doc/user-guide.txt b/doc/user-guide.txt
index 8913c3221..7f6334ec2 100644
--- a/doc/user-guide.txt
+++ b/doc/user-guide.txt
@@ -15,7 +15,7 @@ For running LTP network tests see `testcases/network/README.md`.
                           'n' or '0': never colorize.
 | 'LTP_TIMEOUT_MUL'     | Multiply timeout, must be number >= 1 (> 1 is useful for
                           slow machines to avoid unexpected timeout).
-                          Variable is also used in shell tests.
+                          Variable is also used in shell tests, but here ceiled to int.
 | 'PATH'                | It's required to addjust path:
                           `PATH="$PATH:$LTPROOT/testcases/bin"`
 | 'TMPDIR'              | Base directory for template directory, which is required by C tests
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index ca63745fd..8713c1cdd 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -379,9 +379,30 @@ _tst_rescmp()
 
 _tst_setup_timer()
 {
+	TST_TIMEOUT=${TST_TIMEOUT:-300}
 	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
 
-	local sec=$((300 * LTP_TIMEOUT_MUL))
+	if [ "$TST_TIMEOUT" = -1 ]; then
+		tst_res TINFO "Timeout per run is disabled"
+		return
+	fi
+
+	local err="LTP_TIMEOUT_MUL must be number >= 1!"
+
+	tst_is_num "$LTP_TIMEOUT_MUL" || tst_brk TCONF "$err ($LTP_TIMEOUT_MUL)"
+
+	if ! tst_is_int "$LTP_TIMEOUT_MUL"; then
+		LTP_TIMEOUT_MUL=$(echo "$LTP_TIMEOUT_MUL" | cut -d. -f1)
+		LTP_TIMEOUT_MUL=$((LTP_TIMEOUT_MUL+1))
+		tst_res TINFO "ceiling LTP_TIMEOUT_MUL to $LTP_TIMEOUT_MUL"
+	fi
+	[ "$LTP_TIMEOUT_MUL" -ge 1 ] || tst_brk TCONF "$err ($LTP_TIMEOUT_MUL)"
+
+	if ! tst_is_int "$TST_TIMEOUT" || [ "$TST_TIMEOUT" -lt 1 ]; then
+		tst_brk TBROK "TST_TIMEOUT must be int >= 1! ($TST_TIMEOUT)"
+	fi
+
+	local sec=$((TST_TIMEOUT * LTP_TIMEOUT_MUL))
 	local h=$((sec / 3600))
 	local m=$((sec / 60 % 60))
 	local s=$((sec % 60))
@@ -418,7 +439,7 @@ tst_run()
 			NEEDS_CMDS|NEEDS_MODULE|MODPATH|DATAROOT);;
 			NEEDS_DRIVERS|FS_TYPE|MNTPOINT|MNT_PARAMS);;
 			IPV6|IPVER|TEST_DATA|TEST_DATA_IFS);;
-			RETRY_FUNC|RETRY_FN_EXP_BACKOFF);;
+			RETRY_FUNC|RETRY_FN_EXP_BACKOFF|TIMEOUT);;
 			NET_MAX_PKT);;
 			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
 			esac
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
