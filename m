Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DE86D3763D9
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 12:33:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA76D3C566E
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 12:33:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 843633C7009
 for <ltp@lists.linux.it>; Fri,  7 May 2021 12:33:11 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EA7D110001A1
 for <ltp@lists.linux.it>; Fri,  7 May 2021 12:33:10 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id C93ED9FBF9;
 Fri,  7 May 2021 10:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1620383590; bh=QYPfNfWg+qg83Ub72oxqCpqIqlFkyAY/+xl7LgFeat0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=pOnt7nw2mZUnI4knyv2Vz44+hOOSodgvQ0kJGZtRg0CY80n0mV9BLlyQlZscCaDZa
 rlbnR3c9AKRa9qEmTWehZyV1UYtAeMoaIxB38okwE/GDwe/JiEMAhI4drygHhXoxqd
 5k9TaXU/wRh+NfRtArCHKPGH9IqSdAPym0bc+jUk=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz,
	liwang@redhat.com
Date: Fri,  7 May 2021 12:32:58 +0200
Message-Id: <20210507103258.232174-3-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507103258.232174-1-lkml@jv-coder.de>
References: <20210507103258.232174-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 2/2] shell: Prevent orphan timeout sleep processes
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

Co-authored-by: Li Wang <liwang@redhat.com>
Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/lib/tst_test.sh | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 951518785..7ceddff04 100644
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
+	#trap "kill $sleep_pid; exit" TERM
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
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
