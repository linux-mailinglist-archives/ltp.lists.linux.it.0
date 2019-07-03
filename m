Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C00FD5DED1
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 09:24:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20A133C1D77
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 09:24:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7BE493C1D50
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 09:24:24 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D6D6B600D78
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 09:24:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 64848356D2
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 07:24:22 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5650380F8F;
 Wed,  3 Jul 2019 07:24:21 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed,  3 Jul 2019 15:24:17 +0800
Message-Id: <20190703072417.24091-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 03 Jul 2019 07:24:22 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] lib: add tst_no_corefile to avoid corefile dumping
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

If crash is expected in a testcase, we can avoid dumping core file
in calling this function.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Jan Stancek <jstancek@redhat.com>
---

Notes:
    v1 --> v2
        * add a paramenter to hide the message print
        * add notes in test-writing-guidelines.txt

 doc/test-writing-guidelines.txt                | 14 ++++++++++++--
 include/tst_safe_macros.h                      | 18 ++++++++++++++++++
 .../kernel/security/umip/umip_basic_test.c     |  2 ++
 testcases/kernel/syscalls/ipc/shmat/shmat01.c  | 16 +++-------------
 4 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index c6d4e001d..1a77db6bf 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -826,8 +826,8 @@ The 'TST_PROCESS_STATE_WAIT()' waits until process 'pid' is in requested
 It's mostly used with state 'S' which means that process is sleeping in kernel
 for example in 'pause()' or any other blocking syscall.
 
-2.2.10 Signal handlers
-^^^^^^^^^^^^^^^^^^^^^^
+2.2.10 Signals and signal handlers
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 If you need to use signal handlers, keep the code short and simple. Don't
 forget that the signal handler is called asynchronously and can interrupt the
@@ -859,6 +859,16 @@ type defined in C99 but this one *DOES NOT* imply 'volatile' (it's just a
 'typedef' to 'int'). So the correct type for a flag that is changed from a
 signal handler is either 'volatile int' or 'volatile sig_atomic_t'.
 
+If a crash (e.g. triggered by signal SIGSEGV) is expected in testing, you can
+avoid dumping core file via calling this below tst_no_corefile() function.
+Note that this chanage will only effect on that process with this invoke. And
+the parameter 'verbose' is used as message print option.
+
+[source,c]
+-------------------------------------------------------------------------------
+void tst_no_corefile(int verbose);
+-------------------------------------------------------------------------------
+
 2.2.11 Kernel Modules
 ^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 53a888c80..c4ddf84ef 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -394,6 +394,24 @@ static inline int safe_setrlimit(const char *file, const int lineno,
 #define SAFE_SETRLIMIT(resource, rlim) \
 	safe_setrlimit(__FILE__, __LINE__, (resource), (rlim))
 
+/*
+ * Crash is expected, avoid dumping corefile.
+ * 1 is a special value, that disables core-to-pipe.
+ * At the same time it is small enough value for
+ * core-to-file, so it skips creating cores as well.
+ */
+static inline void tst_no_corefile(int verbose)
+{
+       struct rlimit r;
+
+       r.rlim_cur = 1;
+       r.rlim_max = 1;
+       SAFE_SETRLIMIT(RLIMIT_CORE, &r);
+
+       if (verbose)
+	       tst_res(TINFO, "Avoid dumping corefile in process(%d)", getpid());
+}
+
 typedef void (*sighandler_t)(int);
 static inline sighandler_t safe_signal(const char *file, const int lineno,
 				       int signum, sighandler_t handler)
diff --git a/testcases/kernel/security/umip/umip_basic_test.c b/testcases/kernel/security/umip/umip_basic_test.c
index c34d4a1f6..37850ef9f 100644
--- a/testcases/kernel/security/umip/umip_basic_test.c
+++ b/testcases/kernel/security/umip/umip_basic_test.c
@@ -86,6 +86,8 @@ static void verify_umip_instruction(unsigned int n)
 
 	pid = SAFE_FORK();
 	if (pid == 0) {
+		tst_no_corefile(0);
+
 		switch (n) {
 		case 0:
 			asm_sgdt();
diff --git a/testcases/kernel/syscalls/ipc/shmat/shmat01.c b/testcases/kernel/syscalls/ipc/shmat/shmat01.c
index aa9dfd4e5..f75914799 100644
--- a/testcases/kernel/syscalls/ipc/shmat/shmat01.c
+++ b/testcases/kernel/syscalls/ipc/shmat/shmat01.c
@@ -59,19 +59,9 @@ static void *expected_addr(void *in_addr, void *out_addr)
 
 static void do_child(int *in_addr, int expect_crash)
 {
-	if (expect_crash) {
-		/*
-		 * Crash is expected, avoid dumping corefile.
-		 * 1 is a special value, that disables core-to-pipe.
-		 * At the same time it is small enough value for
-		 * core-to-file, so it skips creating cores as well.
-		*/
-		struct rlimit r;
-
-		r.rlim_cur = 1;
-		r.rlim_max = 1;
-		SAFE_SETRLIMIT(RLIMIT_CORE, &r);
-	}
+	if (expect_crash)
+		tst_no_corefile(1);
+
 	*in_addr = 10;
 
 	exit(0);
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
