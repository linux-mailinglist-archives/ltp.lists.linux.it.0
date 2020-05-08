Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E6C1CA23A
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:27:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 971BB3C25E3
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:27:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EAF373C719A
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:36 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B25D16012A7
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:21 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id h12so4706659pjz.1
 for <ltp@lists.linux.it>; Thu, 07 May 2020 21:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bWJn/07jPnPCNbynOWhHoV55rdg10kaOZpxG2jv3pDY=;
 b=qzW0zj97FvFlEhBSx/8PYmdF1M4IJMoWnF81Rl4VLeQQ/BpTwQj3BqB0sKNauntxg3
 cHhYOL6jhoIqacIkkJDbujy3PgwHijueCmvazmOEWPlrUbtLtBWt5N/po/X7inzNzQ6W
 NkRIf6ScgdPYp8V5DlDdiKwtZAtcpHbazMbRy9HXguFstDAqe9wBriBIm5aR2qG940vp
 kC2Z3cCKL++6U7rPtXjV8sxo4wC7trDGXM11Yw7hqbRt3WEjvTSDP9bOvEi7w2TbtU8H
 GE7ZDil6O/jykcxCTEPxlcc8Apb6kZKdTAWl3sP8+IJ1At4vDCPGOs6eXQ3VHb/BD5kt
 uKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bWJn/07jPnPCNbynOWhHoV55rdg10kaOZpxG2jv3pDY=;
 b=O69qHY8US07I5eokeCto2lO/dLmEqWI+Om93r8tgbDJj7P+hQy5G1MtnEOFSRuoNoe
 6k2uvaIsP5K8XyZZpNtkmCZBL+ww3Zy4uorcG/X9lXWPM+gxVRZtR70aMIpR8n6C8mAO
 ab7FmFKolQABDIcdgSM59xXBKiDqgeNU7aJun34Px/Q7h9iKbp7b71CiJi0gr618VLoV
 sU0a8cRx8aD1WmlZHHWE150QBVcdloUubVGZ8Wf2IPqPD+s7dXffy5PJBbVh/H1qXYqD
 klpVHWxC//vaBaGc2gJEO/YLCvlr6ICVGm9HNAroaRe7oEtUYTRNWjPPlevkycbJboyd
 laxQ==
X-Gm-Message-State: AGi0PuZgAxTB/s5L0zjw+AnZb+bOHGjBfXDhl5dCNUsvk6gQc7JEWV8Z
 x/F7KUCk494fFn1CU7NiqssrWkeVxTA=
X-Google-Smtp-Source: APiQypJwyKSr/vUbUmMGJB0xUTr6C9pEg8J87wjnPj8oYYHVyrwlSVMRuBW8Ho/jx5EW9/9cH82rdg==
X-Received: by 2002:a17:90a:c385:: with SMTP id
 h5mr3864663pjt.52.1588911874132; 
 Thu, 07 May 2020 21:24:34 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id c15sm361136pfp.34.2020.05.07.21.24.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:24:33 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri,  8 May 2020 09:53:54 +0530
Message-Id: <ad1976850359a87242aedf7c62a67fcbf808ca27.1588911607.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1588911607.git.viresh.kumar@linaro.org>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V2 09/17] syscalls/rt_sigtimedwait: Add support for
 time64 tests
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
index 1b976a271d28..60d0a2b7cf04 100644
--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
@@ -2,11 +2,13 @@
 /* Copyright (c) Jiri Palecek<jpalecek@web.de>, 2009 */
 
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
@@ -54,12 +56,12 @@ static void empty_handler(int sig)
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
@@ -73,7 +75,7 @@ static int my_sigwait(const sigset_t * set, siginfo_t * info,
 
 #ifdef TEST_SIGWAITINFO
 static int my_sigwaitinfo(const sigset_t * set, siginfo_t * info,
-			  struct timespec *timeout)
+			  void *timeout)
 {
 	return sigwaitinfo(set, info);
 }
@@ -81,7 +83,7 @@ static int my_sigwaitinfo(const sigset_t * set, siginfo_t * info,
 
 #ifdef TEST_SIGTIMEDWAIT
 static int my_sigtimedwait(const sigset_t * set, siginfo_t * info,
-			   struct timespec *timeout)
+			   void *timeout)
 {
 	return sigtimedwait(set, info, timeout);
 }
@@ -89,14 +91,23 @@ static int my_sigtimedwait(const sigset_t * set, siginfo_t * info,
 
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
@@ -113,19 +124,23 @@ void test_empty_set(swi_func sigwaitinfo, int signo)
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
@@ -135,7 +150,8 @@ void test_timeout(swi_func sigwaitinfo, int signo)
 /* Note: sigwait-ing for a signal that is not blocked is unspecified
  * by POSIX; but works for non-ignored signals under Linux
  */
-void test_unmasked_matching(swi_func sigwaitinfo, int signo)
+void test_unmasked_matching(swi_func sigwaitinfo, int signo,
+			    enum tst_ts_type type)
 {
 	sigset_t sigs;
 	siginfo_t si;
@@ -156,7 +172,8 @@ void test_unmasked_matching(swi_func sigwaitinfo, int signo)
 	SAFE_WAIT(NULL);
 }
 
-void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo)
+void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo,
+				   enum tst_ts_type type)
 {
 	sigset_t sigs;
 	pid_t child;
@@ -173,7 +190,8 @@ void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo)
 	SAFE_WAIT(NULL);
 }
 
-void test_masked_matching(swi_func sigwaitinfo, int signo)
+void test_masked_matching(swi_func sigwaitinfo, int signo,
+			  enum tst_ts_type type)
 {
 	sigset_t sigs, oldmask;
 	siginfo_t si;
@@ -211,7 +229,8 @@ void test_masked_matching(swi_func sigwaitinfo, int signo)
 	SAFE_WAIT(NULL);
 }
 
-void test_masked_matching_rt(swi_func sigwaitinfo, int signo)
+void test_masked_matching_rt(swi_func sigwaitinfo, int signo,
+			     enum tst_ts_type type)
 {
 	sigset_t sigs, oldmask;
 	siginfo_t si;
@@ -262,7 +281,8 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo)
 			 "sigwaitinfo failed to restore the original mask");
 }
 
-void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo)
+void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
+				 enum tst_ts_type type)
 {
 	sigset_t sigs, oldmask;
 	pid_t child;
@@ -297,7 +317,7 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo)
 	SAFE_WAIT(NULL);
 }
 
-void test_bad_address(swi_func sigwaitinfo, int signo)
+void test_bad_address(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 {
 	sigset_t sigs, oldmask;
 	pid_t child;
@@ -326,7 +346,7 @@ void test_bad_address(swi_func sigwaitinfo, int signo)
 	SAFE_WAIT(NULL);
 }
 
-void test_bad_address2(swi_func sigwaitinfo, int signo)
+void test_bad_address2(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 {
 	pid_t pid;
 	int status;
@@ -372,7 +392,7 @@ void test_bad_address2(swi_func sigwaitinfo, int signo)
 	}
 }
 
-void test_bad_address3(swi_func sigwaitinfo, int signo)
+void test_bad_address3(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 {
 	sigset_t sigs;
 	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
@@ -388,28 +408,28 @@ struct test_desc {
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
@@ -440,15 +460,48 @@ struct test_desc {
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
@@ -464,6 +517,7 @@ static void cleanup(void)
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
