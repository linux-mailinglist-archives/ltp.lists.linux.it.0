Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFD230BBEE
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 11:19:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48AD13C746F
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 11:19:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 075303C293B
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 11:19:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A508C600280
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 11:19:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1230AAD37;
 Tue,  2 Feb 2021 10:19:49 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  2 Feb 2021 11:19:42 +0100
Message-Id: <20210202101942.31328-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 1/1] tst_test.sh: Run cleanup also on timeout
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

Also timeout requires to run a test cleanup (e.g. zram01.sh).
Thus send first SIGINT, but keep also SIGKILL for safety reasons
(after 5 sec to give cleanup function some time.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v1->v2:
* put code into separate function
* s/timeout/timed out/

 testcases/lib/tst_test.sh | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 69f007d89..bcf379c8e 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -21,7 +21,7 @@ export TST_LIB_LOADED=1
 . tst_security.sh
 
 # default trap function
-trap "tst_brk TBROK 'test interrupted'" INT
+trap "tst_brk TBROK 'test interrupted or timed out'" INT
 
 _tst_do_exit()
 {
@@ -437,6 +437,14 @@ _tst_multiply_timeout()
 	return 0
 }
 
+_tst_handle_timeout()
+{
+	tst_res TBROK "test killed, timeout! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
+	kill -2 -$pid
+	sleep 5
+	kill -9 -$pid
+}
+
 _tst_setup_timer()
 {
 	TST_TIMEOUT=${TST_TIMEOUT:-300}
@@ -459,7 +467,7 @@ _tst_setup_timer()
 
 	tst_res TINFO "timeout per run is ${h}h ${m}m ${s}s"
 
-	sleep $sec && tst_res TBROK "test killed, timeout! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill -9 -$pid &
+	sleep $sec && _tst_handle_timeout &
 
 	_tst_setup_timer_pid=$!
 }
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
