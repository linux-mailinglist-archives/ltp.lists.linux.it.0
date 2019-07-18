Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7026CAFD
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 10:40:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89CDC3C1D47
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 10:39:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0E9183C1C93
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 10:39:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 42BD81A01447
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 10:39:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 665F2AE12;
 Thu, 18 Jul 2019 08:39:54 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 18 Jul 2019 10:39:42 +0200
Message-Id: <20190718083943.7687-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] shell: Use $LTP_TIMEOUT_MUL also in retry
 functions
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

in TST_RETRY_FN_EXP_BACKOFF() and thus in TST_RETRY_FUNC() in new shell API.

This function should also address possibility of slow machine.

Because using on 2 places moved the default definition to the beginning
of the script.
+ use $((...)) instead of expr.
+ move expression using $3 after check whether we have enough parameters

+ document LTP_TIMEOUT_MUL environment variable in wiki.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

I can squash these 2 commits.

General question about Test Writing Guidelines in wiki [1]:
1) we have separate section for C and shell API, which is probably a good
choice, but we're trying to sync them. That leads to things like retry
function documented under chapter for shell API (2.3).

+ That page is too long and without table of contents (not easy to
navigate in it; I tried to add TOC, but without success). Maybe adding
TOC or split the page to 3: 1) general info 2) C API 3) shell API would
help. WDYT?

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines
[2] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#retry-a-function-in-limited-time

 doc/test-writing-guidelines.txt | 2 ++
 testcases/lib/tst_test.sh       | 9 +++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 869e6ed35..782e14f32 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1881,6 +1881,8 @@ simply by setting right '$TST_NEEDS_FOO'.
                        the test (see below).
 | 'TST_NEEDS_MODULE' | Test module name needed for the test (see below).
 | 'TST_NEEDS_DRIVERS'| Checks kernel drivers support for the test.
+| 'LTP_TIMEOUT_MUL'  | Multiply timeout (> 1 is useful for slow machines to
+                       avoid unexpected timeout).
 |=============================================================================
 
 Checking for presence of commands
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 31b3a3951..60d765424 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -17,6 +17,8 @@ export TST_ITERATIONS=1
 export TST_TMPDIR_RHOST=0
 export TST_LIB_LOADED=1
 
+export LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
+
 . tst_ansi_color.sh
 . tst_security.sh
 
@@ -164,12 +166,13 @@ TST_RETRY_FN_EXP_BACKOFF()
 {
 	local tst_fun="$1"
 	local tst_exp=$2
-	local tst_sec=$(expr $3 \* 1000000)
 	local tst_delay=1
+	local tst_sec
 
 	if [ $# -ne 3 ]; then
 		tst_brk TBROK "TST_RETRY_FN_EXP_BACKOFF expects 3 parameters"
 	fi
+	tst_sec=$(($3 * LTP_TIMEOUT_MUL * 1000000))
 
 	if ! tst_is_int "$tst_sec"; then
 		tst_brk TBROK "TST_RETRY_FN_EXP_BACKOFF: tst_sec must be integer ('$tst_sec')"
@@ -185,7 +188,7 @@ TST_RETRY_FN_EXP_BACKOFF()
 			tst_sleep ${tst_delay}us
 			tst_delay=$((tst_delay*2))
 		else
-			tst_brk TBROK "\"$tst_fun\" timed out"
+			tst_brk TBROK "\"$tst_fun\" timed out! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
 		fi
 	done
 
@@ -374,8 +377,6 @@ _tst_rescmp()
 
 _tst_setup_timer()
 {
-	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
-
 	local sec=$((300 * LTP_TIMEOUT_MUL))
 	local h=$((sec / 3600))
 	local m=$((sec / 60 % 60))
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
