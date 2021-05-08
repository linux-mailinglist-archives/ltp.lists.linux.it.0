Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02126376FDF
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 07:52:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B79D23C557D
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 07:52:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A1A133C67BC
 for <ltp@lists.linux.it>; Sat,  8 May 2021 07:51:24 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1D42714002BF
 for <ltp@lists.linux.it>; Sat,  8 May 2021 07:51:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620453082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hQGHeSO3acEBrIuGSQPreigZb3f1eizf8Po2/AR9UdA=;
 b=DJBy+fufz8sg/bIOvNj25nO1qByKcjJkprAflUo4TkvrGNUFx/0g+y1aC9XSirEpcSX3Pf
 G4J7yCOVrArHrH9HF+wWr4ggwAuBWoVuuIi9dbJdc6EBowEnSs+kkut4t4UkMGo0Jlde63
 frkAX49UGE3R2zZH4O06GmQSzsemb64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-EPAz4-wOPSiF-0qkvApONA-1; Sat, 08 May 2021 01:51:17 -0400
X-MC-Unique: EPAz4-wOPSiF-0qkvApONA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D14118397A8;
 Sat,  8 May 2021 05:51:16 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 100A270137;
 Sat,  8 May 2021 05:51:14 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sat,  8 May 2021 13:51:07 +0800
Message-Id: <20210508055109.16914-3-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/4] shell: Prevent orphan timeout sleep processes
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

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

The implementation of the timeout handling failed to terminate the sleep
process, because the command "sleep $sec && _tst_kill_test &" spawns two
processes: A shell, that is used to execute the sleep and after sleep
terminates it executes _tst_kill_test. The pid stored in $! is the pid of
the shell process.
When the test finished, the timeout process is supposed to be killed, but
only the shell process is killed, not the sleep. If the output of the test
is piped somewhere else, the pipe stays open, until the sleep finished,
because it still has stdout open.
Additionally, if a lot of short tests with high timeouts are executed,
a lot of sleep processes will linger around.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Signed-off-by: Li Wang <liwang@redhat.com>
Reviewed-by: Li Wang <liwang@redhat.com>
---
 lib/newlib_tests/shell/timeout03.sh |  4 ++--
 lib/newlib_tests/shell/timeout04.sh |  2 +-
 testcases/lib/tst_test.sh           | 30 ++++++++++++++++++++---------
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/lib/newlib_tests/shell/timeout03.sh b/lib/newlib_tests/shell/timeout03.sh
index 30aa0a149..cd548d9a2 100755
--- a/lib/newlib_tests/shell/timeout03.sh
+++ b/lib/newlib_tests/shell/timeout03.sh
@@ -32,7 +32,7 @@ do_test()
 {
 	tst_res TINFO "testing killing test after TST_TIMEOUT"
 
-	tst_sleep 2
+	sleep 2
 	tst_res TFAIL "test: running after TST_TIMEOUT"
 }
 
@@ -40,7 +40,7 @@ cleanup()
 {
 	tst_res TPASS "test run cleanup after timeout"
 
-	tst_sleep 15 # must be higher than wait time in _tst_kill_test
+	sleep 15 # must be higher than wait time in _tst_kill_test
 	tst_res TFAIL "cleanup: running after TST_TIMEOUT"
 }
 
diff --git a/lib/newlib_tests/shell/timeout04.sh b/lib/newlib_tests/shell/timeout04.sh
index 0a6ba053c..c702905f3 100755
--- a/lib/newlib_tests/shell/timeout04.sh
+++ b/lib/newlib_tests/shell/timeout04.sh
@@ -9,7 +9,7 @@ TST_TIMEOUT=1
 
 do_test()
 {
-	tst_res TINFO "Start"
+    tst_res TINFO "Start"
     sleep 5
     tst_res TFAIL "End"
 }
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 951518785..ed2699175 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -23,14 +23,6 @@ export TST_LIB_LOADED=1
 # default trap function
 trap "tst_brk TBROK 'test interrupted or timed out'" INT
 
-_tst_cleanup_timer()
-{
-	if [ -n "$_tst_setup_timer_pid" ]; then
-		kill $_tst_setup_timer_pid 2>/dev/null
-		wait $_tst_setup_timer_pid 2>/dev/null
-	fi
-}
-
 _tst_do_exit()
 {
 	local ret=0
@@ -463,6 +455,25 @@ _tst_kill_test()
 	fi
 }
 
+_tst_cleanup_timer()
+{
+	if [ -n "$_tst_setup_timer_pid" ]; then
+		kill -TERM $_tst_setup_timer_pid 2>/dev/null
+		wait $_tst_setup_timer_pid 2>/dev/null
+	fi
+}
+
+_tst_timeout_process()
+{
+	local sleep_pid
+
+	sleep $sec &
+	sleep_pid=$!
+	trap "kill $sleep_pid; exit" TERM
+	wait $sleep_pid
+	_tst_kill_test
+}
+
 _tst_setup_timer()
 {
 	TST_TIMEOUT=${TST_TIMEOUT:-300}
@@ -486,7 +497,8 @@ _tst_setup_timer()
 	tst_res TINFO "timeout per run is ${h}h ${m}m ${s}s"
 
 	_tst_cleanup_timer
-	sleep $sec && _tst_kill_test &
+
+	_tst_timeout_process &
 
 	_tst_setup_timer_pid=$!
 }
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
