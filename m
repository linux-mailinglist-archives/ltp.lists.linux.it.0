Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF9B3752DB
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 13:15:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1A903C67D3
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 13:15:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A0A13C56BA
 for <ltp@lists.linux.it>; Thu,  6 May 2021 13:15:18 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9359C20103A
 for <ltp@lists.linux.it>; Thu,  6 May 2021 13:15:17 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 04D999FBF7;
 Thu,  6 May 2021 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1620299716; bh=PE/EYba57Krend9U+uUlLVp5JwQhT62upllMD++OJfM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=JNGwUqpuhC+Gu/UGK7K1tSS0Zi5VL+CyVzD5rdjSTOc/fIyT7M3d2K3GV5B5MBzsQ
 jtMRAnN7dQ03jtpYA6KbGsM/6kYsZm+UgWAc2EVxAn0fIcbwG3548evmb8Omlarv8E
 YyVthWCaAPc4W/Qy8Oo15ScKZskUbQLcvQJ/CzCw=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz,
	liwang@redhat.com
Date: Thu,  6 May 2021 13:14:47 +0200
Message-Id: <20210506111447.211104-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506111447.211104-1-lkml@jv-coder.de>
References: <20210506111447.211104-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] shell: Implement timeout handling in c
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

The shell implementation of the timeout handling failed to terminate the
sleep process, because the command "sleep $sec && _tst_kill_test &" spawns
two processes: A shell, that is used to execute the sleep and
after sleep terminates it executes _tst_kill_test. The pid stored in $! is the
pid of the shell process.
When the test finished, the timeout process is supposed to be killed, but
only the shell process is killed, not the sleep. If the output of the test
is piped somewhere else, the pipe stays open, until the sleep finished,
because it still has stdout open.
Additionally, if a lot of short tests with high timeouts are executed,
a lot of sleep processes will linger around.

The c implementation fixes these issues. It spawns only a single process
for handling the timeout and works otherwise the same:
It sends SIGINT to the process group after the timeout and if
the process is still there after 10 seconds, it sends SIGKILL.
The only changes are the messages printed by the c implementation:
1. The message format is a bit different (It prints the file and line as prefix)
2. TBROK messages are converted to TWARN, because TBROK is not allowed
    to be used in tst_res.
(See changes in timeout03.sh)

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 lib/newlib_tests/shell/timeout03.sh |  34 ++++-----
 testcases/lib/.gitignore            |   1 +
 testcases/lib/Makefile              |   2 +-
 testcases/lib/tst_test.sh           |  22 +-----
 testcases/lib/tst_timeout_kill.c    | 105 ++++++++++++++++++++++++++++
 5 files changed, 125 insertions(+), 39 deletions(-)
 create mode 100644 testcases/lib/tst_timeout_kill.c

diff --git a/lib/newlib_tests/shell/timeout03.sh b/lib/newlib_tests/shell/timeout03.sh
index 30aa0a149..20733ad27 100755
--- a/lib/newlib_tests/shell/timeout03.sh
+++ b/lib/newlib_tests/shell/timeout03.sh
@@ -4,23 +4,23 @@
 
 # testing shell timeout handling in _tst_kill_test()
 # expected output:
-# timeout03 1 TINFO: timeout per run is 0h 0m 1s
-# timeout03 1 TINFO: testing killing test after TST_TIMEOUT
-# timeout03 1 TBROK: Test timeouted, sending SIGINT! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
-# timeout03 1 TBROK: test interrupted or timed out
-# timeout03 1 TPASS: test run cleanup after timeout
-# timeout03 1 TINFO: Test is still running, waiting 10s
-# timeout03 1 TINFO: Test is still running, waiting 9s
-# timeout03 1 TINFO: Test is still running, waiting 8s
-# timeout03 1 TINFO: Test is still running, waiting 7s
-# timeout03 1 TINFO: Test is still running, waiting 6s
-# timeout03 1 TINFO: Test is still running, waiting 5s
-# timeout03 1 TINFO: Test is still running, waiting 4s
-# timeout03 1 TINFO: Test is still running, waiting 3s
-# timeout03 1 TINFO: Test is still running, waiting 2s
-# timeout03 1 TINFO: Test is still running, waiting 1s
-# timeout03 1 TBROK: Test still running, sending SIGKILL
-# Killed
+timeout03 1 TINFO: timeout per run is 0h 0m 1s
+timeout03 1 TINFO: testing killing test after TST_TIMEOUT
+tst_timeout_kill.c:42: TWARN: Test timed out, sending SIGINT!If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
+timeout03 1 TBROK: test interrupted or timed out
+timeout03 1 TPASS: test run cleanup after timeout
+tst_timeout_kill.c:52: TWARN: Test is still running, waiting 10s
+tst_timeout_kill.c:52: TWARN: Test is still running, waiting 9s
+tst_timeout_kill.c:52: TWARN: Test is still running, waiting 8s
+tst_timeout_kill.c:52: TWARN: Test is still running, waiting 7s
+tst_timeout_kill.c:52: TWARN: Test is still running, waiting 6s
+tst_timeout_kill.c:52: TWARN: Test is still running, waiting 5s
+tst_timeout_kill.c:52: TWARN: Test is still running, waiting 4s
+tst_timeout_kill.c:52: TWARN: Test is still running, waiting 3s
+tst_timeout_kill.c:52: TWARN: Test is still running, waiting 2s
+tst_timeout_kill.c:52: TWARN: Test is still running, waiting 1s
+tst_timeout_kill.c:56: TWARN: Test still running, sending SIGKILL
+Killed
 
 TST_TESTFUNC=do_test
 TST_CLEANUP=cleanup
diff --git a/testcases/lib/.gitignore b/testcases/lib/.gitignore
index bc299b6ee..33f40b003 100644
--- a/testcases/lib/.gitignore
+++ b/testcases/lib/.gitignore
@@ -12,3 +12,4 @@
 /tst_rod
 /tst_sleep
 /tst_supported_fs
+/tst_timeout_kill
diff --git a/testcases/lib/Makefile b/testcases/lib/Makefile
index f77da0d56..6ae987f8c 100644
--- a/testcases/lib/Makefile
+++ b/testcases/lib/Makefile
@@ -29,6 +29,6 @@ INSTALL_TARGETS		:= *.sh
 MAKE_TARGETS		:= tst_sleep tst_random tst_checkpoint tst_rod tst_kvcmp\
 			   tst_device tst_net_iface_prefix tst_net_ip_prefix tst_net_vars\
 			   tst_getconf tst_supported_fs tst_check_drivers tst_get_unused_port\
-			   tst_get_median
+			   tst_get_median tst_timeout_kill
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 951518785..d4904fa61 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -443,25 +443,6 @@ _tst_multiply_timeout()
 	return 0
 }
 
-_tst_kill_test()
-{
-	local i=10
-
-	tst_res TBROK "Test timeouted, sending SIGINT! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
-	kill -INT -$pid
-	tst_sleep 100ms
-
-	while kill -0 $pid 2>&1 > /dev/null && [ $i -gt 0 ]; do
-		tst_res TINFO "Test is still running, waiting ${i}s"
-		sleep 1
-		i=$((i-1))
-	done
-
-	if kill -0 $pid 2>&1 > /dev/null; then
-		tst_res TBROK "Test still running, sending SIGKILL"
-		kill -KILL -$pid
-	fi
-}
 
 _tst_setup_timer()
 {
@@ -486,8 +467,7 @@ _tst_setup_timer()
 	tst_res TINFO "timeout per run is ${h}h ${m}m ${s}s"
 
 	_tst_cleanup_timer
-	sleep $sec && _tst_kill_test &
-
+	tst_timeout_kill $sec $pid &
 	_tst_setup_timer_pid=$!
 }
 
diff --git a/testcases/lib/tst_timeout_kill.c b/testcases/lib/tst_timeout_kill.c
new file mode 100644
index 000000000..acaed2473
--- /dev/null
+++ b/testcases/lib/tst_timeout_kill.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <string.h>
+#include <signal.h>
+#include <errno.h>
+
+#define TST_NO_DEFAULT_MAIN
+
+#include "tst_test.h"
+
+static void print_help(void)
+{
+	printf("Usage: tst_timeout_kill interval pid\n\n");
+	printf("       Terminates process group pid after interval seconds\n");
+}
+
+static int kill_safe(__pid_t pid, int signal) {
+	int rc;
+
+	rc = kill(pid, signal);
+	if (rc == -1) {
+		/* The process terminated already */
+		if (errno == ESRCH)
+			return ESRCH;
+		tst_brk(TBROK, "Unable to send signals to process '%d'\n", pid);
+	}
+	return 0;
+}
+
+static int do_timeout(int interval, __pid_t pid)
+{
+	int i;
+
+	sleep(interval);
+
+	tst_res(TWARN, "Test timed out, sending SIGINT! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1");
+
+	if (kill_safe(-pid, SIGINT) == ESRCH)
+		return 0;
+
+	usleep(100000);
+
+	for (i = 0; i < 10; ++i) {
+		if (kill_safe(pid, 0) == ESRCH)
+			return 0;
+		tst_res(TWARN, "Test is still running, waiting %ds", 10 - i);
+		sleep(1);
+	}
+
+	tst_res(TWARN, "Test still running, sending SIGKILL");
+	kill(-pid, SIGKILL);
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int opt;
+	unsigned long interval, pid;
+	char *end;
+
+	while ((opt = getopt(argc, argv, ":h")) != -1) {
+		switch (opt) {
+		case 'h':
+			print_help();
+			return 0;
+		default:
+			print_help();
+			return 1;
+		}
+	}
+
+	if (optind >= argc - 1) {
+		fprintf(stderr, "ERROR: Expected interval and pid argument\n\n");
+		print_help();
+		return 1;
+	}
+
+	interval = strtoul(argv[optind], &end, 10);
+	if (end != argv[optind] + strlen(argv[optind])) {
+		fprintf(stderr, "ERROR: Invalid interval '%s'\n\n", argv[optind]);
+		print_help();
+		return 1;
+	}
+	optind++;
+
+	pid = strtol(argv[optind], &end, 10);
+	if (end != argv[optind] + strlen(argv[optind])) {
+		fprintf(stderr, "ERROR: Invalid pid '%s'\n\n", argv[optind]);
+		print_help();
+		return 1;
+	}
+
+	if (kill_safe(pid, 0) == ESRCH) {
+		fprintf(stderr, "ERROR: Process with pid '%ld' does not exist\n", pid);
+		return 1;
+	}
+
+	return do_timeout(interval, pid);
+}
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
