Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5DE1C519E
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:13:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 693D23C284A
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:13:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E9C923C57F3
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:12:26 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 13376601015
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:12:26 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id t40so745326pjb.3
 for <ltp@lists.linux.it>; Tue, 05 May 2020 02:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qeA7BBgB5Q/d3zj9MJtjPaWCar97dattvlPue4GTaaE=;
 b=JINE83SukpU6eTz1b10Mzj4dmPYG0YVMTpLoIOZJZGfy4OtERMiEPSTBDyl4z7K0dg
 2ltx/6ec1GPsp+ige2w2OWALo4/VZc+JH0//GrIYKZWHRs06DEubGBxNTHt9X0jVC/qN
 vETN3LbQmeBy2irDvEvXxlkZKYPUbd+0YUD7FXaMwYev0vrwcm7gKFD0Fggp0qapBgMq
 YpzInOVaUPvmY14qvbK5AsjifS5Q5Ntby8HYbUUQbplBUNmxLY8i+cTeiOlkYgmd1yoa
 Xu6idpNL/g+miR48nCj3RC/xIdGJF+CS71YvtR6I8s9dDBKCnJ93toItrGS0e63yp4+T
 SaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qeA7BBgB5Q/d3zj9MJtjPaWCar97dattvlPue4GTaaE=;
 b=ImAZZgHQGIUJbkFsmSHAr9a+mpl9Wn51437p5wLAZku6NXYfAlResMcZ14DLxMJcQt
 pmmVHpfOXxlrHfUQ3YLX3K8V68H8DiIlfv7T1qZKVluesTIfuY3r9inNStdOs1cE0JKs
 5+jccbI2Yeo19NNO/HyQA1pCGm71kC7NGTeU2Vbq5E9NkGjSa5erYw3rcNWIB/tCrizS
 XR9spIZyUz8hC1L5Y7VGQx4srdE1lRCh8IQwQUeji23z+AOfcbKCQQTQnN3P2XYOr5c9
 x8PpK6dppwMmJi0QnWEcHFLRAXf1jNAxMTRIlQ1HbNuy3PV6ABywH1g0+mrmOxB7GRyI
 hFyA==
X-Gm-Message-State: AGi0PuYh8qQ6xoFBEttWm1zpKFuwVNkukYJXX3OlQing5X84U1+sNkRK
 Sx6Q0E25vee1ixmYorEyDDhHDJ1Z1qg=
X-Google-Smtp-Source: APiQypLYSMJT3y9gXhkQE66Nkndvz6AV9YrsY27pU5EJ6rJAr3z5vE4VsvykC2VCtlDffGkR0d7PRg==
X-Received: by 2002:a17:90b:19cc:: with SMTP id
 nm12mr1916267pjb.34.1588669944188; 
 Tue, 05 May 2020 02:12:24 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id s4sm1136647pgv.78.2020.05.05.02.12.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 02:12:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  5 May 2020 14:42:05 +0530
Message-Id: <26cbca717c2c04f16c0818f2f9ccfa1c5a0887f8.1588669892.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
References: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 5/8] syscalls/rt_sigtimedwait: Add support for time64
 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds support for time64 tests to the existing rt_sigtimedwait()
syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/sigwaitinfo/sigwaitinfo01.c      | 118 +++++++++++++-----
 1 file changed, 86 insertions(+), 32 deletions(-)

diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
index 4eee27b0db29..404036c40aac 100644
--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
@@ -21,11 +21,13 @@
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 #include "tst_test.h"
+#include "tst_timer.h"
 #include <errno.h>
 #include <stdlib.h>
 #include <signal.h>
 #include <limits.h>
 #include "lapi/syscalls.h"
+#include "lapi/abisize.h"
 #include "tst_sig_proc.h"
 
 #define SUCCEED_OR_DIE(syscall, message, ...)				 \
@@ -73,12 +75,12 @@ static void empty_handler(int sig)
 }
 
 typedef int (*swi_func) (const sigset_t * set, siginfo_t * info,
-			 struct timespec * timeout);
-typedef void (*test_func) (swi_func, int);
+			 void * timeout);
+typedef void (*test_func) (swi_func, int, enum tst_ts_type type);
 
 #ifdef TEST_SIGWAIT
 static int my_sigwait(const sigset_t * set, siginfo_t * info,
-		      struct timespec *timeout)
+		      void *timeout)
 {
 	int ret;
 	int err = sigwait(set, &ret);
@@ -92,7 +94,7 @@ static int my_sigwait(const sigset_t * set, siginfo_t * info,
 
 #ifdef TEST_SIGWAITINFO
 static int my_sigwaitinfo(const sigset_t * set, siginfo_t * info,
-			  struct timespec *timeout)
+			  void *timeout)
 {
 	return sigwaitinfo(set, info);
 }
@@ -100,7 +102,7 @@ static int my_sigwaitinfo(const sigset_t * set, siginfo_t * info,
 
 #ifdef TEST_SIGTIMEDWAIT
 static int my_sigtimedwait(const sigset_t * set, siginfo_t * info,
-			   struct timespec *timeout)
+			   void *timeout)
 {
 	return sigtimedwait(set, info, timeout);
 }
@@ -108,14 +110,23 @@ static int my_sigtimedwait(const sigset_t * set, siginfo_t * info,
 
 #ifdef TEST_RT_SIGTIMEDWAIT
 static int my_rt_sigtimedwait(const sigset_t * set, siginfo_t * info,
-			      struct timespec *timeout)
+			      void *timeout)
 {
 	/* _NSIG is always the right number of bits of signal map for all arches */
 	return tst_syscall(__NR_rt_sigtimedwait, set, info, timeout, _NSIG/8);
 }
+
+#if (__NR_rt_sigtimedwait_time64 != __LTP__NR_INVALID_SYSCALL)
+static int my_rt_sigtimedwait_time64(const sigset_t * set, siginfo_t * info,
+				     void *timeout)
+{
+	/* _NSIG is always the right number of bits of signal map for all arches */
+	return tst_syscall(__NR_rt_sigtimedwait_time64, set, info, timeout, _NSIG/8);
+}
+#endif
 #endif
 
-void test_empty_set(swi_func sigwaitinfo, int signo)
+void test_empty_set(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 {
 	sigset_t sigs;
 	siginfo_t si;
@@ -132,19 +143,23 @@ void test_empty_set(swi_func sigwaitinfo, int signo)
 	SAFE_WAIT(NULL);
 }
 
-void test_timeout(swi_func sigwaitinfo, int signo)
+void test_timeout(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 {
 	sigset_t sigs;
 	siginfo_t si;
 	pid_t child;
-	struct timespec ts = {.tv_sec = 1 };
+	struct tst_ts ts;
+
+	ts.type = type;
+	tst_ts_set_sec(&ts, 1);
+	tst_ts_set_nsec(&ts, 0);
 
 	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, INT_MAX, 100000);
 
-	TEST(sigwaitinfo(&sigs, &si, &ts));
+	TEST(sigwaitinfo(&sigs, &si, tst_ts_get(&ts)));
 	REPORT_SUCCESS(-1, EAGAIN);
 
 	SAFE_KILL(child, SIGTERM);
@@ -154,7 +169,8 @@ void test_timeout(swi_func sigwaitinfo, int signo)
 /* Note: sigwait-ing for a signal that is not blocked is unspecified
  * by POSIX; but works for non-ignored signals under Linux
  */
-void test_unmasked_matching(swi_func sigwaitinfo, int signo)
+void test_unmasked_matching(swi_func sigwaitinfo, int signo,
+			    enum tst_ts_type type)
 {
 	sigset_t sigs;
 	siginfo_t si;
@@ -175,7 +191,8 @@ void test_unmasked_matching(swi_func sigwaitinfo, int signo)
 	SAFE_WAIT(NULL);
 }
 
-void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo)
+void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo,
+				   enum tst_ts_type type)
 {
 	sigset_t sigs;
 	pid_t child;
@@ -192,7 +209,8 @@ void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo)
 	SAFE_WAIT(NULL);
 }
 
-void test_masked_matching(swi_func sigwaitinfo, int signo)
+void test_masked_matching(swi_func sigwaitinfo, int signo,
+			  enum tst_ts_type type)
 {
 	sigset_t sigs, oldmask;
 	siginfo_t si;
@@ -230,7 +248,8 @@ void test_masked_matching(swi_func sigwaitinfo, int signo)
 	SAFE_WAIT(NULL);
 }
 
-void test_masked_matching_rt(swi_func sigwaitinfo, int signo)
+void test_masked_matching_rt(swi_func sigwaitinfo, int signo,
+			     enum tst_ts_type type)
 {
 	sigset_t sigs, oldmask;
 	siginfo_t si;
@@ -281,7 +300,8 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo)
 			 "sigwaitinfo failed to restore the original mask");
 }
 
-void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo)
+void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
+				 enum tst_ts_type type)
 {
 	sigset_t sigs, oldmask;
 	pid_t child;
@@ -316,7 +336,7 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo)
 	SAFE_WAIT(NULL);
 }
 
-void test_bad_address(swi_func sigwaitinfo, int signo)
+void test_bad_address(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 {
 	sigset_t sigs, oldmask;
 	pid_t child;
@@ -345,7 +365,7 @@ void test_bad_address(swi_func sigwaitinfo, int signo)
 	SAFE_WAIT(NULL);
 }
 
-void test_bad_address2(swi_func sigwaitinfo, int signo)
+void test_bad_address2(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 {
 	pid_t pid;
 	int status;
@@ -391,7 +411,7 @@ void test_bad_address2(swi_func sigwaitinfo, int signo)
 	}
 }
 
-void test_bad_address3(swi_func sigwaitinfo, int signo)
+void test_bad_address3(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 {
 	sigset_t sigs;
 	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
@@ -407,28 +427,28 @@ struct test_desc {
 } tests[] = {
 #ifdef TEST_RT_SIGTIMEDWAIT
 	{
-	test_empty_set, my_rt_sigtimedwait, SIGUSR1}, {
-	test_unmasked_matching, my_rt_sigtimedwait, SIGUSR1}, {
-	test_masked_matching, my_rt_sigtimedwait, SIGUSR1}, {
-	test_unmasked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
-	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
-	test_bad_address, my_rt_sigtimedwait, SIGUSR1}, {
-	test_bad_address2, my_rt_sigtimedwait, SIGUSR1}, {
-	test_bad_address3, my_rt_sigtimedwait, SIGUSR1}, {
-	test_timeout, my_rt_sigtimedwait, 0},
+	test_empty_set, NULL, SIGUSR1}, {
+	test_unmasked_matching, NULL, SIGUSR1}, {
+	test_masked_matching, NULL, SIGUSR1}, {
+	test_unmasked_matching_noinfo, NULL, SIGUSR1}, {
+	test_masked_matching_noinfo, NULL, SIGUSR1}, {
+	test_bad_address, NULL, SIGUSR1}, {
+	test_bad_address2, NULL, SIGUSR1}, {
+	test_bad_address3, NULL, SIGUSR1}, {
+	test_timeout, NULL, 0},
 	    /* Special cases */
 	    /* 1: sigwaitinfo does respond to ignored signal */
 	{
-	test_masked_matching, my_rt_sigtimedwait, SIGUSR2},
+	test_masked_matching, NULL, SIGUSR2},
 	    /* 2: An ignored signal doesn't cause sigwaitinfo to return EINTR */
 	{
-	test_timeout, my_rt_sigtimedwait, SIGUSR2},
+	test_timeout, NULL, SIGUSR2},
 	    /* 3: The handler is not called when the signal is waited for by sigwaitinfo */
 	{
-	test_masked_matching, my_rt_sigtimedwait, SIGTERM},
+	test_masked_matching, NULL, SIGTERM},
 	    /* 4: Simultaneous realtime signals are delivered in the order of increasing signal number */
 	{
-	test_masked_matching_rt, my_rt_sigtimedwait, -1},
+	test_masked_matching_rt, NULL, -1},
 #endif
 #if defined TEST_SIGWAIT
 	{
@@ -459,15 +479,48 @@ struct test_desc {
 #endif
 };
 
+static struct test_variants {
+	swi_func swi;
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#ifdef TEST_RT_SIGTIMEDWAIT
+
+#if defined(TST_ABI32)
+	{ .swi = my_rt_sigtimedwait, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .swi = my_rt_sigtimedwait, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .swi = my_rt_sigtimedwait, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_rt_sigtimedwait_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .swi = my_rt_sigtimedwait_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+
+#else /* !TEST_RT_SIGTIMEDWAIT */
+
+	{ .swi = NULL, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+
+#endif /* TEST_RT_SIGTIMEDWAIT */
+};
+
 static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct test_desc *tc = &tests[i];
+	swi_func swi;
 
-	tc->tf(tc->swi, tc->signo);
+	swi = tv->swi ? tv->swi : tc->swi;
+
+	tc->tf(swi, tc->signo, tv->type);
 }
 
 static void setup(void)
 {
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+
 	signal(SIGUSR1, empty_handler);
 	signal(SIGALRM, empty_handler);
 	signal(SIGUSR2, SIG_IGN);
@@ -483,6 +536,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test= run,
 	.tcnt = ARRAY_SIZE(tests),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.forks_child = 1,
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
