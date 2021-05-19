Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BDE3889FF
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 10:58:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D0733C3060
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 10:58:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A0FBC3C0BAF
 for <ltp@lists.linux.it>; Wed, 19 May 2021 10:58:20 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AFD1210000C6
 for <ltp@lists.linux.it>; Wed, 19 May 2021 10:58:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621414698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SecjUPYJYoJamkJGe9zUKqyUu33fWA40HAZ3RHtuPX0=;
 b=gYhLdKdqETqIUlrXKmb0AM4mnny7be/zDpmkxqazwMOue3DJz3SLpnTOKXBC9zpyQ+c0qp
 9/KjDfFgBs+2zP27imgioiVzv0uy+LOl74x5ztGrQv0lrGahpwrQJ9ipm12bppbMzGE29Q
 NVBzPuMPW7BKR0kxvH3/N5PDaFQAnhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-Cn-iNWSTMJWG7gq0CqYOGQ-1; Wed, 19 May 2021 04:58:16 -0400
X-MC-Unique: Cn-iNWSTMJWG7gq0CqYOGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E776818401;
 Wed, 19 May 2021 08:58:15 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 307115C1CF;
 Wed, 19 May 2021 08:58:13 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 19 May 2021 16:58:12 +0800
Message-Id: <20210519085812.27263-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] tst_test: using SIGTERM to terminate process
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

We'd better avoid using SIGINT for process terminating becuasue,
it has different behavoir on kind of shell.

From Joerg Vehlow's test:

 - bash does not seem to care about SIGINT delivery to background
   processes, but can be blocked using trap

 - zsh ignores SIGINT for background processes by default, but can be
   allowed using trap

 - dash and busybox sh ignore the signal to background processes, and
   this cannot be changed with trap

This patch cover the below situations:

 1. SIGINT (Ctrl^C) for terminating the main process and do cleanup
    correctly before a timeout

 2. Test finish normally and retrieves the _tst_timeout_process in the
    background via SIGTERM(sending by _tst_cleanup_timer)

 3. Test timed out occurs and _tst_kill_test sending SIGTERM to
    terminating all process, and the main process do cleanup work

 4. Test timed out occurs but still have process alive after _tst_kill_test
    sending SIGTERM, then sending SIGKILL to the whole group

 5. Test terminated by SIGTERM unexpectly (e.g. system shutdown or process
    manager) and do cleanup work as well

Co-authored-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Signed-off-by: Li Wang <liwang@redhat.com>
Reviewed-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 lib/newlib_tests/shell/test_timeout.sh | 2 +-
 lib/newlib_tests/shell/timeout03.sh    | 5 +++--
 testcases/lib/tst_test.sh              | 9 +++++----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/lib/newlib_tests/shell/test_timeout.sh b/lib/newlib_tests/shell/test_timeout.sh
index b05680cb1..c70e22f27 100755
--- a/lib/newlib_tests/shell/test_timeout.sh
+++ b/lib/newlib_tests/shell/test_timeout.sh
@@ -28,7 +28,7 @@ timeout02.sh|  -10|0|  |2
 timeout02.sh| -0.1|0|  |0
 timeout02.sh| -1.1|0|  |2
 timeout02.sh|-10.1|0|  |2
-timeout03.sh|     |0|12|137| | | |Test kill if test does not terminate by SIGINT
+timeout03.sh|     |0|12|137| | | |Test is killed, if it does not terminate after SIGTERM
 timeout04.sh|     |0|  |  2|0|0|1|Verify that timeout is enforced
 timeout02.sh|    2|1| 2|   |1|0|0|Test termination of timeout process
 "
diff --git a/lib/newlib_tests/shell/timeout03.sh b/lib/newlib_tests/shell/timeout03.sh
index cd548d9a2..dabef32a2 100755
--- a/lib/newlib_tests/shell/timeout03.sh
+++ b/lib/newlib_tests/shell/timeout03.sh
@@ -6,8 +6,9 @@
 # expected output:
 # timeout03 1 TINFO: timeout per run is 0h 0m 1s
 # timeout03 1 TINFO: testing killing test after TST_TIMEOUT
-# timeout03 1 TBROK: Test timeouted, sending SIGINT! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
-# timeout03 1 TBROK: test interrupted or timed out
+# timeout03 1 TBROK: Test timed out, sending SIGTERM! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
+# Terminated
+# timeout03 1 TBROK: test terminated
 # timeout03 1 TPASS: test run cleanup after timeout
 # timeout03 1 TINFO: Test is still running, waiting 10s
 # timeout03 1 TINFO: Test is still running, waiting 9s
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 3a5651c01..66ffde4eb 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -21,7 +21,8 @@ export TST_LIB_LOADED=1
 . tst_security.sh
 
 # default trap function
-trap "tst_brk TBROK 'test interrupted or timed out'" INT
+trap "tst_brk TBROK 'test interrupted'" INT
+trap "unset _tst_setup_timer_pid; tst_brk TBROK 'test terminated'" TERM
 
 _tst_do_exit()
 {
@@ -439,9 +440,9 @@ _tst_kill_test()
 {
 	local i=10
 
-	trap '' INT
-	tst_res TBROK "Test timeouted, sending SIGINT! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
-	kill -INT -$pid
+	trap '' TERM
+	tst_res TBROK "Test timed out, sending SIGTERM! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
+	kill -TERM -$pid
 	tst_sleep 100ms
 
 	while kill -0 $pid >/dev/null 2>&1 && [ $i -gt 0 ]; do
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
