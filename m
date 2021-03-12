Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6D33394F5
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 18:32:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F02C43C685D
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 18:32:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D1D883C5548
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 18:32:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7AC1E601101
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 18:32:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B76B0AF69;
 Fri, 12 Mar 2021 17:32:08 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 12 Mar 2021 18:31:59 +0100
Message-Id: <20210312173201.27708-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173201.27708-1-pvorel@suse.cz>
References: <20210312173201.27708-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] tst_test.sh: Run cleanup also after test timeout
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

Also timeout requires to run a test cleanup (e.g. zram01.sh).
Thus send first SIGINT, but keep also SIGKILL for safety reasons
(after 5 sec to give some time to the cleanup function and
_tst_check_security_modules()).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 58056e28b..1aa940f61 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -21,7 +21,7 @@ export TST_LIB_LOADED=1
 . tst_security.sh
 
 # default trap function
-trap "tst_brk TBROK 'test interrupted'" INT
+trap "tst_brk TBROK 'test interrupted or timed out'" INT
 
 _tst_cleanup_timer()
 {
@@ -442,6 +442,26 @@ _tst_multiply_timeout()
 	return 0
 }
 
+_tst_kill_test()
+{
+	local i=10
+
+	tst_res TBROK "Test timeouted, sending SIGTERM! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
+	kill -INT -$pid
+	tst_sleep 100ms
+
+	while kill -0 $pid 2>&1 > /dev/null && [ $i -gt 0 ]; do
+		tst_res TINFO "Test is still running, waiting ${i}s"
+		sleep 1
+		i=$((i-1))
+	done
+
+	if kill -0 $pid 2>&1 > /dev/null; then
+		tst_res TBROK "Test still running, sending SIGKILL"
+		kill -KILL -$pid
+	fi
+}
+
 _tst_setup_timer()
 {
 	TST_TIMEOUT=${TST_TIMEOUT:-300}
@@ -465,8 +485,7 @@ _tst_setup_timer()
 	tst_res TINFO "timeout per run is ${h}h ${m}m ${s}s"
 
 	_tst_cleanup_timer
-
-	sleep $sec && tst_res TBROK "test killed, timeout! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill -9 -$pid &
+	sleep $sec && _tst_kill_test &
 
 	_tst_setup_timer_pid=$!
 }
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
