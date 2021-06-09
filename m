Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B9B3A13EC
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 14:13:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 325933C8FD2
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 14:13:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4563E3C7AE2
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 14:12:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CE5BF1401193
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 14:12:49 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 89A681FD58;
 Wed,  9 Jun 2021 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623240769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N44uYng1WKlrb5cQgaRul9BnA60FnHk5L5aDmF4D1QY=;
 b=RrpcLZ2CFb3dvDk5VWZSyG7l5P3/9hyg5gYfLi8bRsn6uLWH3L9Wxvd3VpOz5UEgdDi5g7
 uykKxpGxZonRZ148jGU1DWtQvUwmNAyev5OYifwUwrh4N1E5jcz/DIu4UJ+I2eP2jskrXQ
 fHYbHn8zCdTp6EkYdNZWljxnTmIlci4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623240769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N44uYng1WKlrb5cQgaRul9BnA60FnHk5L5aDmF4D1QY=;
 b=+dttUXzMsK6PYC4xu7pyqN6LHz/Q7J/PHIyQohj6lqThEllJWZm05kjK4NRhMwaFDlZavD
 xOQjaxfNfnwpfWCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 67C3F118DD;
 Wed,  9 Jun 2021 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623240769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N44uYng1WKlrb5cQgaRul9BnA60FnHk5L5aDmF4D1QY=;
 b=RrpcLZ2CFb3dvDk5VWZSyG7l5P3/9hyg5gYfLi8bRsn6uLWH3L9Wxvd3VpOz5UEgdDi5g7
 uykKxpGxZonRZ148jGU1DWtQvUwmNAyev5OYifwUwrh4N1E5jcz/DIu4UJ+I2eP2jskrXQ
 fHYbHn8zCdTp6EkYdNZWljxnTmIlci4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623240769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N44uYng1WKlrb5cQgaRul9BnA60FnHk5L5aDmF4D1QY=;
 b=+dttUXzMsK6PYC4xu7pyqN6LHz/Q7J/PHIyQohj6lqThEllJWZm05kjK4NRhMwaFDlZavD
 xOQjaxfNfnwpfWCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id TIIpGEGwwGD+cwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 09 Jun 2021 12:12:49 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  9 Jun 2021 13:46:58 +0200
Message-Id: <20210609114659.2445-4-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609114659.2445-1-chrubis@suse.cz>
References: <20210609114659.2445-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] lib: Introduce concept of max_test_runtime
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
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is an attempt on how to handle a cap on a test runtime correctly it
consists of several pieces namely:

* The idea of test maximal runtime is uncoupled from  test timeout

  - the maximal runtime is simply a cap for how long should an instance
    of a test run, it's mainly used by CVE reproducers that attempt to
    trigger a race until they run out of time, such test may exit sooner
    but must not run longer than the cap

  - the tst_timeout_remaining() is replaced with tst_remaining_runtime()
    which accounts correctly for .test_variants and .all_filesystems

* The default value for a test max_runtime is computed from test timeout

  - we scale the timeout down so that the there is some room for test to
    properly exit once test runtime was exhausted, this is our base for
    a test max_runtime

  - the scaled value is then divided, if needed, so that we end up a
    correct maximal runtime for an instance of a test, i.e. we have
    max runtime for an instance fork_testrun() that is inside of
    .test_variants and .all_filesystems loops

  - this also allows us to controll the test max runtime by setting a
    test timeout

* The maximal runtime, per whole test, can be passed down to the test

  - If LTP_MAX_TEST_RUNTIME is set in test environment it's used as a
    base for max_runtime instead of the scaled down timeout, it's still
    divided into pieces so that we have correct runtime cap for an
    fork_testrun() instance

  - We also make sure that test timeout is adjusted, if needed, to
    accomodate for the new test runtime cap, i.e. if upscaled runtime is
    greater than timeout, the test timeout is adjusted

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_fuzzy_sync.h                      |  4 +-
 include/tst_test.h                            |  7 +-
 lib/newlib_tests/.gitignore                   |  3 +-
 .../{test18.c => test_runtime01.c}            |  7 +-
 lib/newlib_tests/test_runtime02.c             | 31 +++++++++
 lib/tst_test.c                                | 64 ++++++++++++++++++-
 testcases/kernel/crypto/af_alg02.c            |  2 +-
 testcases/kernel/crypto/pcrypt_aead01.c       |  2 +-
 testcases/kernel/mem/mtest01/mtest01.c        |  6 +-
 testcases/kernel/mem/mtest06/mmap1.c          | 13 ++--
 .../kernel/syscalls/move_pages/move_pages12.c |  4 +-
 11 files changed, 117 insertions(+), 26 deletions(-)
 rename lib/newlib_tests/{test18.c => test_runtime01.c} (59%)
 create mode 100644 lib/newlib_tests/test_runtime02.c

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index 8f97bb8f6..93adbb909 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -319,7 +319,7 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
 		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, tst_fzsync_thread_wrapper, &wrap_run_b);
 	}
 
-	pair->exec_time_start = (float)tst_timeout_remaining();
+	pair->exec_time_start = (float)tst_remaining_runtime();
 }
 
 /**
@@ -663,7 +663,7 @@ static inline void tst_fzsync_wait_b(struct tst_fzsync_pair *pair)
 static inline int tst_fzsync_run_a(struct tst_fzsync_pair *pair)
 {
 	int exit = 0;
-	float rem_p = 1 - tst_timeout_remaining() / pair->exec_time_start;
+	float rem_p = 1 - tst_remaining_runtime() / pair->exec_time_start;
 
 	if ((pair->exec_time_p * SAMPLING_SLICE < rem_p)
 		&& (pair->sampling > 0)) {
diff --git a/include/tst_test.h b/include/tst_test.h
index 6ad355506..491fedc3e 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -290,7 +290,12 @@ const char *tst_strsig(int sig);
  */
 const char *tst_strstatus(int status);
 
-unsigned int tst_timeout_remaining(void);
+/*
+ * Returns remaining test runtime. Test that runs for more than a few seconds
+ * should check if they should exit by calling this function regularly.
+ */
+unsigned int tst_remaining_runtime(void);
+
 unsigned int tst_multiply_timeout(unsigned int timeout);
 void tst_set_timeout(int timeout);
 
diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index b95ead2c2..464d98aed 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -23,7 +23,6 @@ tst_safe_fileops
 tst_res_hexd
 tst_strstatus
 test17
-test18
 test19
 test20
 test22
@@ -43,3 +42,5 @@ test_macros02
 test_macros03
 tst_fuzzy_sync01
 tst_fuzzy_sync02
+test_runtime01
+test_runtime02
diff --git a/lib/newlib_tests/test18.c b/lib/newlib_tests/test_runtime01.c
similarity index 59%
rename from lib/newlib_tests/test18.c
rename to lib/newlib_tests/test_runtime01.c
index 026435d7d..56f5ac44e 100644
--- a/lib/newlib_tests/test18.c
+++ b/lib/newlib_tests/test_runtime01.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2018, Linux Test Project
+ * Copyright (c) 2021, Linux Test Project
  */
 
 #include <stdlib.h>
@@ -9,11 +9,10 @@
 
 static void run(void)
 {
-	do {
+	while (tst_remaining_runtime())
 		sleep(1);
-	} while (tst_timeout_remaining() >= 4);
 
-	tst_res(TPASS, "Timeout remaining: %d", tst_timeout_remaining());
+	tst_res(TPASS, "Timeout remaining: %d", tst_remaining_runtime());
 }
 
 static struct tst_test test = {
diff --git a/lib/newlib_tests/test_runtime02.c b/lib/newlib_tests/test_runtime02.c
new file mode 100644
index 000000000..12e4813ef
--- /dev/null
+++ b/lib/newlib_tests/test_runtime02.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021, Linux Test Project
+ */
+/*
+ * This test is set up so that the timeout is not long enough to guarantee
+ * enough runtime for two iterations, i.e. the timeout without offset and after
+ * scaling is too small and the tests ends up with TBROK.
+ *
+ * You can fix this by exporting LTP_MAX_TEST_RUNTIME=10 before executing the
+ * test, in that case the runtime would be divided between iterations and timeout
+ * adjusted so that it provides enough safeguards for the test to finish.
+ */
+
+#include <stdlib.h>
+#include <unistd.h>
+#include "tst_test.h"
+
+static void run(void)
+{
+	while (tst_remaining_runtime())
+		sleep(1);
+
+	tst_res(TPASS, "Timeout remaining: %d", tst_remaining_runtime());
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.timeout = 5,
+	.test_variants = 2
+};
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 7c9061d6d..23b52583a 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -62,6 +62,7 @@ struct results {
 	int warnings;
 	int broken;
 	unsigned int timeout;
+	unsigned int max_runtime;
 };
 
 static struct results *results;
@@ -1255,17 +1256,74 @@ static void sigint_handler(int sig LTP_ATTRIBUTE_UNUSED)
 	}
 }
 
-unsigned int tst_timeout_remaining(void)
+#define RUNTIME_TIMEOUT_OFFSET 5
+#define RUNTIME_TIMEOUT_SCALE  0.9
+
+static unsigned int timeout_to_runtime(void)
+{
+	if (results->timeout <= RUNTIME_TIMEOUT_OFFSET) {
+		tst_res(TWARN, "Timeout too short for runtime offset %i!",
+		        RUNTIME_TIMEOUT_OFFSET);
+		return 1;
+	}
+
+	return (results->timeout - RUNTIME_TIMEOUT_OFFSET) * RUNTIME_TIMEOUT_SCALE;
+}
+
+static unsigned int runtime_to_timeout(unsigned int runtime)
+{
+	return runtime / RUNTIME_TIMEOUT_SCALE + RUNTIME_TIMEOUT_OFFSET;
+}
+
+static unsigned int divide_runtime(unsigned int runtime)
+{
+	if (tst_test->test_variants)
+		runtime = 1.00 * runtime / tst_test->test_variants;
+
+	if (tst_test->all_filesystems)
+		runtime = 1.00 * runtime / tst_fs_max_types();
+
+	return runtime;
+}
+
+unsigned int tst_remaining_runtime(void)
 {
 	static struct timespec now;
 	unsigned int elapsed;
 
+	if (!results->max_runtime) {
+		const char *runtime = getenv("LTP_MAX_TEST_RUNTIME");
+
+		if (runtime) {
+			results->max_runtime = atoi(runtime);
+		} else {
+			results->max_runtime = timeout_to_runtime();
+		}
+
+		if (!results->max_runtime)
+			tst_brk(TBROK, "Test runtime too small!");
+
+
+		if (runtime_to_timeout(results->max_runtime) > results->timeout) {
+			results->timeout = runtime_to_timeout(results->max_runtime);
+			tst_res(TINFO, "runtime > timeout, adjusting test timeout to %u", results->timeout);
+			heartbeat();
+		}
+
+		results->max_runtime = divide_runtime(results->max_runtime);
+
+		if (!results->max_runtime)
+			tst_brk(TBROK, "Test runtime too small!");
+
+		tst_res(TINFO, "Max runtime per iteration %us", results->max_runtime);
+	}
+
 	if (tst_clock_gettime(CLOCK_MONOTONIC, &now))
 		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");
 
 	elapsed = (tst_timespec_diff_ms(now, tst_start_time) + 500) / 1000;
-	if (results->timeout > elapsed)
-		return results->timeout - elapsed;
+	if (results->max_runtime > elapsed)
+		return results->max_runtime - elapsed;
 
 	return 0;
 }
diff --git a/testcases/kernel/crypto/af_alg02.c b/testcases/kernel/crypto/af_alg02.c
index 31d30777c..26f184854 100644
--- a/testcases/kernel/crypto/af_alg02.c
+++ b/testcases/kernel/crypto/af_alg02.c
@@ -61,7 +61,7 @@ static void run(void)
 	TST_CHECKPOINT_WAIT(0);
 
 	while (pthread_kill(thr, 0) != ESRCH) {
-		if (tst_timeout_remaining() <= 10) {
+		if (!tst_remaining_runtime()) {
 			pthread_cancel(thr);
 			tst_brk(TBROK,
 				"Timed out while reading from request socket.");
diff --git a/testcases/kernel/crypto/pcrypt_aead01.c b/testcases/kernel/crypto/pcrypt_aead01.c
index 0609af9f6..7fe6aed14 100644
--- a/testcases/kernel/crypto/pcrypt_aead01.c
+++ b/testcases/kernel/crypto/pcrypt_aead01.c
@@ -55,7 +55,7 @@ void run(void)
 		if (TST_RET)
 			tst_brk(TBROK | TRERRNO, "del_alg");
 
-		if (tst_timeout_remaining() < 10) {
+		if (!tst_remaining_runtime()) {
 			tst_res(TINFO, "Time limit reached, stopping at "
 				"%d iterations", i);
 			break;
diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
index 9676ea4b5..b205722e3 100644
--- a/testcases/kernel/mem/mtest01/mtest01.c
+++ b/testcases/kernel/mem/mtest01/mtest01.c
@@ -155,10 +155,10 @@ static void child_loop_alloc(unsigned long long alloc_bytes)
 	}
 	if (dowrite)
 		tst_res(TINFO, "... [t=%d] %lu bytes allocated and used in child %d",
-				tst_timeout_remaining(), bytecount, getpid());
+				tst_remaining_runtime(), bytecount, getpid());
 	else
 		tst_res(TINFO, "... [t=%d] %lu bytes allocated only in child %d",
-				tst_timeout_remaining(), bytecount, getpid());
+				tst_remaining_runtime(), bytecount, getpid());
 
 	kill(getppid(), SIGRTMIN);
 	raise(SIGSTOP);
@@ -195,7 +195,7 @@ static void mem_test(void)
 
 	/* wait in the loop for all children finish allocating */
 	while (children_done < pid_cntr) {
-		if (tst_timeout_remaining() < STOP_THRESHOLD) {
+		if (!tst_remaining_runtime()) {
 			tst_res(TWARN,
 				"the remaininig time is not enough for testing");
 
diff --git a/testcases/kernel/mem/mtest06/mmap1.c b/testcases/kernel/mem/mtest06/mmap1.c
index 10c47c35c..699c20988 100644
--- a/testcases/kernel/mem/mtest06/mmap1.c
+++ b/testcases/kernel/mem/mtest06/mmap1.c
@@ -35,9 +35,6 @@
 #define GIGABYTE (1L*1024*1024*1024)
 #define TEST_FILENAME "ashfile"
 
-/* seconds remaining before reaching timeout */
-#define STOP_THRESHOLD 10
-
 #define PROGRESS_SEC 3
 
 static int file_size = 1024;
@@ -224,8 +221,8 @@ static void run(void)
 	pthread_t thid[2];
 	int start, last_update;
 
-	start = last_update = tst_timeout_remaining();
-	while (tst_timeout_remaining() > STOP_THRESHOLD) {
+	start = last_update = tst_remaining_runtime();
+	while (tst_remaining_runtime()) {
 		int fd = mkfile(file_size);
 
 		tst_atomic_store(0, &mapcnt);
@@ -240,11 +237,11 @@ static void run(void)
 
 		close(fd);
 
-		if (last_update - tst_timeout_remaining() >= PROGRESS_SEC) {
-			last_update = tst_timeout_remaining();
+		if (last_update - tst_remaining_runtime() >= PROGRESS_SEC) {
+			last_update = tst_remaining_runtime();
 			tst_res(TINFO, "[%03d] mapped: %lu, sigsegv hit: %lu, "
 				"threads spawned: %lu",
-				start - tst_timeout_remaining(),
+				start - tst_remaining_runtime(),
 				map_count, mapped_sigsegv_count,
 				threads_spawned);
 			tst_res(TINFO, "      repeated_reads: %ld, "
diff --git a/testcases/kernel/syscalls/move_pages/move_pages12.c b/testcases/kernel/syscalls/move_pages/move_pages12.c
index 220130f4b..fa45c41a5 100644
--- a/testcases/kernel/syscalls/move_pages/move_pages12.c
+++ b/testcases/kernel/syscalls/move_pages/move_pages12.c
@@ -153,7 +153,7 @@ static void do_test(unsigned int n)
 	void *ptr;
 	pid_t cpid = -1;
 	int status;
-	unsigned int twenty_percent = (tst_timeout_remaining() / 5);
+	unsigned int twenty_percent = (tst_remaining_runtime() / 5);
 
 	addr = SAFE_MMAP(NULL, tcases[n].tpages * hpsz, PROT_READ | PROT_WRITE,
 		MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
@@ -198,7 +198,7 @@ static void do_test(unsigned int n)
 
 		SAFE_MUNMAP(addr, tcases[n].tpages * hpsz);
 
-		if (tst_timeout_remaining() < twenty_percent)
+		if (tst_remaining_runtime() < twenty_percent)
 			break;
 	}
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
