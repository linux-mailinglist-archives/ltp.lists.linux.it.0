Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C351D72B4
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:16:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AAF63C4F1F
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:16:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A1E823C4F1F
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:44 +0200 (CEST)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 70743201103
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:43 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id 5so1572864pjd.0
 for <ltp@lists.linux.it>; Mon, 18 May 2020 01:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LFZd9P5Q5kn9z9zCL7gKYfyvogwPWXJbq0lUe8BU1ic=;
 b=D2HcNRI2BsmBBRg8OjfXruz587YqnrKf3WyTDLsTO2QXPWLV7eCsAwPPK6jQLnZQyH
 Dg46wRvPzMhh9bQhueeR3HHYApf84m94jSYfYBM8QJFkjLtVJ/MZDgQ9+H8zfrcV4UlQ
 E2OsSVN2pHTDE2VhMVjNx6Ypmcqf1PZ7xQiGv2AfygxyTm1c0bAmuVq3VAGKPye7NEap
 BdUfJQ9z9Xd5AVD6aGy5YTsFN+r1K3Xg+VcnBuCZqtzekjBppjzAhdf438Z4HZ3Ha3Od
 Iebvks8dqD7RHhad42E6V0q6oLHKFUOMVKGokJoE3o1CLiD2YZzw1vl1KEhEjBb3wfl3
 97Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LFZd9P5Q5kn9z9zCL7gKYfyvogwPWXJbq0lUe8BU1ic=;
 b=jlTtyPVOuwML6wAcxBXlB25cRaxkosjihwBejEjzctlIFuvBb8d7kyvVKy4GqCnWRk
 HqRimMmWq9qjYv/pkHXcB77n2PN+bGVTai3FF9Xq8u1xAdoYnTpaIbfWE9/tgqVV1LTZ
 kqpO+fCGEF3RvlXkH6cp3uGGcDZtQVoOSNusJcI6/PP8gUUSiJ/8SOvcoECsnKLNZ3kK
 OQyeXDLwd/2ZWvheO5CNi7dgYskFvN1ctOqNW1tW2RZCtAjVMgpGscRoETDzJsOBIWuX
 9F91SXqfcRAVOl2s5g0+b5KBpUg81yyMQh0CTMoPnadRYwQgjOS8cd/UkBqxtXnvGWxO
 Ez2w==
X-Gm-Message-State: AOAM530uI1pUtRQRAVDfcjuUq4mKuqhQMyQrsXx4X9UzHGUvWfB9aEms
 kLTLp0JA11gIKo7JrlGumAt5veYfZ9Y=
X-Google-Smtp-Source: ABdhPJxsGFDnYQpYAeOlUBhXHLGuo2mJo6Erf1BEOqfhQFHKK5WSml7jWnKaFhmm28RK2DvgK8e3sg==
X-Received: by 2002:a17:90a:9f95:: with SMTP id
 o21mr5994325pjp.91.1589789741349; 
 Mon, 18 May 2020 01:15:41 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id i10sm8120072pfa.166.2020.05.18.01.15.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 01:15:40 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 18 May 2020 13:45:00 +0530
Message-Id: <8dfe2144e47fddd03da6417df49e5adf5934e6d8.1589789487.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1589789487.git.viresh.kumar@linaro.org>
References: <cover.1589789487.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V3 08/17] syscalls/sigwaitinfo: Migrate to new test
 framework
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

This migrates the sigwaitinfo tests to use the new test framework.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/sigwaitinfo/sigwaitinfo01.c      | 209 +++++++-----------
 1 file changed, 84 insertions(+), 125 deletions(-)

diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
index 6a30c27f6f2f..1b976a271d28 100644
--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
@@ -1,93 +1,58 @@
-/*
- * Copyright (c) Jiri Palecek<jpalecek@web.de>, 2009
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- */
-#include "test.h"
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) Jiri Palecek<jpalecek@web.de>, 2009 */
+
+#include "tst_test.h"
 #include <errno.h>
+#include <stdlib.h>
 #include <signal.h>
-#include "../utils/include_j_h.h"
-#include "../utils/common_j_h.c"
 #include <limits.h>
 #include "lapi/syscalls.h"
+#include "tst_sig_proc.h"
 
 #define SUCCEED_OR_DIE(syscall, message, ...)				 \
 	(errno = 0,							 \
 		({int ret=syscall(__VA_ARGS__);				 \
 			if (ret==-1)					 \
-				tst_brkm(TBROK|TERRNO, cleanup, message);\
+				tst_brk(TBROK|TERRNO, message);\
 			ret;}))
 
-/* Report success iff TEST_RETURN and TEST_ERRNO are equal to
+/* Report success iff TST_RET and TST_ERR are equal to
 	 exp_return and exp_errno, resp., and cond is true. If cond is not
 	 true, report condition_errmsg
 */
-static void report_success_cond(const char *func, const char *file, int line,
+static void report_success_cond(const char *func, int line,
 				long exp_return, int exp_errno, int condition,
 				char *condition_errmsg)
 {
-	if (exp_return == TEST_RETURN
-	    && (exp_return != -1 || exp_errno == TEST_ERRNO))
+	if (exp_return == TST_RET
+	    && (exp_return != -1 || exp_errno == TST_ERR))
 		if (condition)
-			tst_resm(TPASS, "Test passed");
+			tst_res(TPASS, "%s (%d): Test passed", func, line);
 		else
-			tst_resm(TFAIL, "%s (%s: %d): %s", func, file, line,
+			tst_res(TFAIL, "%s (%d): %s", func, line,
 				 condition_errmsg);
-	else if (TEST_RETURN != -1)
-		tst_resm(TFAIL,
-			 "%s (%s: %d): Unexpected return value; expected %ld, got %ld",
-			 func, file, line, exp_return, TEST_RETURN);
+	else if (TST_RET != -1)
+		tst_res(TFAIL,
+			 "%s (%d): Unexpected return value; expected %ld, got %ld",
+			 func, line, exp_return, TST_RET);
 	else
-		tst_resm(TFAIL | TTERRNO, "%s (%s: %d): Unexpected failure",
-			 func, file, line);
+		tst_res(TFAIL | TTERRNO, "%s (%d): Unexpected failure",
+			 func, line);
 }
 
 #define REPORT_SUCCESS_COND(exp_return, exp_errno, condition, condition_errmsg)	\
-	report_success_cond(__FUNCTION__, __FILE__, __LINE__, exp_return, exp_errno, condition, condition_errmsg);
+	report_success_cond(__FUNCTION__, __LINE__, exp_return, exp_errno, condition, condition_errmsg);
 
-/* Report success iff TEST_RETURN and TEST_ERRNO are equal to
+/* Report success iff TST_RET and TST_ERR are equal to
 	 exp_return and exp_errno, resp.
 */
 #define REPORT_SUCCESS(exp_return, exp_errno)					\
 	REPORT_SUCCESS_COND(exp_return, exp_errno, 1, "");
 
-static void cleanup(void);
-
 static void empty_handler(int sig)
 {
 }
 
-static void setup(void)
-{
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-	signal(SIGUSR1, empty_handler);
-	signal(SIGALRM, empty_handler);
-	signal(SIGUSR2, SIG_IGN);
-
-	TEST_PAUSE;
-}
-
-static void cleanup(void)
-{
-}
-
 typedef int (*swi_func) (const sigset_t * set, siginfo_t * info,
 			 struct timespec * timeout);
 typedef void (*test_func) (swi_func, int);
@@ -110,7 +75,6 @@ static int my_sigwait(const sigset_t * set, siginfo_t * info,
 static int my_sigwaitinfo(const sigset_t * set, siginfo_t * info,
 			  struct timespec *timeout)
 {
-
 	return sigwaitinfo(set, info);
 }
 #endif
@@ -119,7 +83,6 @@ static int my_sigwaitinfo(const sigset_t * set, siginfo_t * info,
 static int my_sigtimedwait(const sigset_t * set, siginfo_t * info,
 			   struct timespec *timeout)
 {
-
 	return sigtimedwait(set, info, timeout);
 }
 #endif
@@ -129,7 +92,7 @@ static int my_rt_sigtimedwait(const sigset_t * set, siginfo_t * info,
 			      struct timespec *timeout)
 {
 	/* _NSIG is always the right number of bits of signal map for all arches */
-	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout, _NSIG/8);
+	return tst_syscall(__NR_rt_sigtimedwait, set, info, timeout, _NSIG/8);
 }
 #endif
 
@@ -141,12 +104,13 @@ void test_empty_set(swi_func sigwaitinfo, int signo)
 
 	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
 	/* Run a child that will wake us up */
-	child = create_sig_proc(100000, signo, UINT_MAX);
+	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
 	REPORT_SUCCESS(-1, EINTR);
 
-	kill(child, SIGTERM);
+	SAFE_KILL(child, SIGTERM);
+	SAFE_WAIT(NULL);
 }
 
 void test_timeout(swi_func sigwaitinfo, int signo)
@@ -159,12 +123,13 @@ void test_timeout(swi_func sigwaitinfo, int signo)
 	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(100000, signo, UINT_MAX);
+	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, &ts));
 	REPORT_SUCCESS(-1, EAGAIN);
 
-	kill(child, SIGTERM);
+	SAFE_KILL(child, SIGTERM);
+	SAFE_WAIT(NULL);
 }
 
 /* Note: sigwait-ing for a signal that is not blocked is unspecified
@@ -180,14 +145,15 @@ void test_unmasked_matching(swi_func sigwaitinfo, int signo)
 	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, signo);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(100000, signo, UINT_MAX);
+	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
 	REPORT_SUCCESS_COND(signo, 0, si.si_pid == child
 			    && si.si_code == SI_USER
 			    && si.si_signo == signo, "Struct siginfo mismatch");
 
-	kill(child, SIGTERM);
+	SAFE_KILL(child, SIGTERM);
+	SAFE_WAIT(NULL);
 }
 
 void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo)
@@ -198,12 +164,13 @@ void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo)
 	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
 	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, signo);
 	/* Run a child that will wake us up */
-	child = create_sig_proc(100000, signo, UINT_MAX);
+	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, NULL, NULL));
 	REPORT_SUCCESS(signo, 0);
 
-	kill(child, SIGTERM);
+	SAFE_KILL(child, SIGTERM);
+	SAFE_WAIT(NULL);
 }
 
 void test_masked_matching(swi_func sigwaitinfo, int signo)
@@ -224,7 +191,7 @@ void test_masked_matching(swi_func sigwaitinfo, int signo)
 	SUCCEED_OR_DIE(sigdelset, "sigaddset failed", &sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(0, signo, 1);
+	child = create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
 	REPORT_SUCCESS_COND(signo, 0, si.si_pid == child
@@ -234,13 +201,14 @@ void test_masked_matching(swi_func sigwaitinfo, int signo)
 	SUCCEED_OR_DIE(sigprocmask, "restoring original signal mask failed",
 		       SIG_SETMASK, &oldmask, &oldmask);
 
-	tst_count--;
-
 	if (sigismember(&oldmask, signo))
-		tst_resm(TPASS, "sigwaitinfo restored the original mask");
+		tst_res(TPASS, "sigwaitinfo restored the original mask");
 	else
-		tst_resm(TFAIL,
+		tst_res(TFAIL,
 			 "sigwaitinfo failed to restore the original mask");
+
+	SAFE_KILL(child, SIGTERM);
+	SAFE_WAIT(NULL);
 }
 
 void test_masked_matching_rt(swi_func sigwaitinfo, int signo)
@@ -265,12 +233,12 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo)
 	SUCCEED_OR_DIE(sigdelset, "sigdelset failed", &sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
-	child[0] = create_sig_proc(0, signo, 1);
-	child[1] = create_sig_proc(0, signo + 1, 1);
+	child[0] = create_sig_proc(signo, 1, 0);
+	child[1] = create_sig_proc(signo + 1, 1, 0);
 
 	/* Ensure that the signals have been sent */
-	waitpid(child[0], &status, 0);
-	waitpid(child[1], &status, 0);
+	SAFE_WAITPID(child[0], &status, 0);
+	SAFE_WAITPID(child[1], &status, 0);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
 	REPORT_SUCCESS_COND(signo, 0, si.si_pid == child[0]
@@ -278,7 +246,6 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo)
 			    && si.si_signo == signo, "Struct siginfo mismatch");
 
 	/* eat the other signal */
-	tst_count--;
 	TEST(sigwaitinfo(&sigs, &si, NULL));
 	REPORT_SUCCESS_COND(signo + 1, 0, si.si_pid == child[1]
 			    && si.si_code == SI_USER
@@ -288,12 +255,10 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo)
 	SUCCEED_OR_DIE(sigprocmask, "restoring original signal mask failed",
 		       SIG_SETMASK, &oldmask, &oldmask);
 
-	tst_count--;
-
 	if (sigismember(&oldmask, signo))
-		tst_resm(TPASS, "sigwaitinfo restored the original mask");
+		tst_res(TPASS, "sigwaitinfo restored the original mask");
 	else
-		tst_resm(TFAIL,
+		tst_res(TFAIL,
 			 "sigwaitinfo failed to restore the original mask");
 }
 
@@ -314,7 +279,7 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo)
 	SUCCEED_OR_DIE(sigdelset, "sigaddset failed", &sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(0, signo, 1);
+	child = create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, NULL, NULL));
 	REPORT_SUCCESS(signo, 0);
@@ -322,14 +287,14 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo)
 	SUCCEED_OR_DIE(sigprocmask, "restoring original signal mask failed",
 		       SIG_SETMASK, &oldmask, &oldmask);
 
-	tst_count--;
-
 	if (sigismember(&oldmask, signo))
-		tst_resm(TPASS, "sigwaitinfo restored the original mask");
+		tst_res(TPASS, "sigwaitinfo restored the original mask");
 	else
-		tst_resm(TFAIL,
+		tst_res(TFAIL,
 			 "sigwaitinfo failed to restore the original mask");
 
+	SAFE_KILL(child, SIGTERM);
+	SAFE_WAIT(NULL);
 }
 
 void test_bad_address(swi_func sigwaitinfo, int signo)
@@ -349,7 +314,7 @@ void test_bad_address(swi_func sigwaitinfo, int signo)
 	SUCCEED_OR_DIE(sigdelset, "sigaddset failed", &sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(0, signo, 1);
+	child = create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, (void *)1, NULL));
 	REPORT_SUCCESS(-1, EFAULT);
@@ -357,7 +322,8 @@ void test_bad_address(swi_func sigwaitinfo, int signo)
 	SUCCEED_OR_DIE(sigprocmask, "sigprocmask failed", SIG_SETMASK, &oldmask,
 		       &oldmask);
 
-	kill(child, SIGTERM);
+	SAFE_KILL(child, SIGTERM);
+	SAFE_WAIT(NULL);
 }
 
 void test_bad_address2(swi_func sigwaitinfo, int signo)
@@ -367,7 +333,7 @@ void test_bad_address2(swi_func sigwaitinfo, int signo)
 
 	switch (pid = fork()) {
 	case -1:
-		tst_brkm(TBROK | TERRNO, NULL, "fork() failed");
+		tst_brk(TBROK | TERRNO, "fork() failed");
 	case 0:
 		signal(SIGSEGV, SIG_DFL);
 
@@ -377,31 +343,31 @@ void test_bad_address2(swi_func sigwaitinfo, int signo)
 		 */
 		TEST(sigwaitinfo((void *)1, NULL, NULL));
 
-		if (TEST_RETURN == -1 && TEST_ERRNO == EFAULT)
+		if (TST_RET == -1 && TST_ERR == EFAULT)
 			_exit(0);
 
-		tst_resm(TINFO | TTERRNO, "swi_func returned: %ld",
-			TEST_RETURN);
+		tst_res(TINFO | TTERRNO, "swi_func returned: %ld",
+			TST_RET);
 		_exit(1);
 		break;
 	default:
 		break;
 	}
 
-	SUCCEED_OR_DIE(waitpid, "waitpid failed", pid, &status, 0);
+	SAFE_WAITPID(pid, &status, 0);
 
 	if ((WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV)
 		|| (WIFEXITED(status) && WEXITSTATUS(status) == 0)) {
-		tst_resm(TPASS, "Test passed");
+		tst_res(TPASS, "Test passed");
 		return;
 	}
 
 	if (WIFEXITED(status)) {
-		tst_resm(TFAIL, "Unrecognised child exit code: %d",
+		tst_res(TFAIL, "Unrecognised child exit code: %d",
 			WEXITSTATUS(status));
 	}
 	if (WIFSIGNALED(status)) {
-		tst_resm(TFAIL, "Unrecognised child termsig: %d",
+		tst_res(TFAIL, "Unrecognised child termsig: %d",
 			WTERMSIG(status));
 	}
 }
@@ -474,38 +440,31 @@ struct test_desc {
 #endif
 };
 
-#if defined TEST_SIGWAITINFO
-const char *TCID = "sigwaitinfo01";
-#elif defined TEST_RT_SIGTIMEDWAIT
-const char *TCID = "rt_sigtimedwait01";
-#elif defined TEST_SIGTIMEDWAIT
-const char *TCID = "sigtimedwait01";
-#elif defined TEST_SIGWAIT
-const char *TCID = "sigwait01";
-#endif
-
-int TST_TOTAL = ARRAY_SIZE(tests);
-
-int main(int argc, char **argv)
+static void run(unsigned int i)
 {
-	unsigned i;
-	int lc;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
+	struct test_desc *tc = &tests[i];
 
-	setup();
+	tc->tf(tc->swi, tc->signo);
+}
 
-	for (lc = 0; TEST_LOOPING(lc); ++lc) {
-		tst_count = 0;
+static void setup(void)
+{
+	signal(SIGUSR1, empty_handler);
+	signal(SIGALRM, empty_handler);
+	signal(SIGUSR2, SIG_IGN);
 
-		for (i = 0; i < ARRAY_SIZE(tests); i++) {
-			alarm(10);	/* arrange a 10 second timeout */
-			tst_resm(TINFO, "%p, %d", tests[i].swi, tests[i].signo);
-			tests[i].tf(tests[i].swi, tests[i].signo);
-		}
-		alarm(0);
-	}
+	alarm(10);	/* arrange a 10 second timeout */
+}
 
-	cleanup();
-	tst_exit();
+static void cleanup(void)
+{
+	alarm(0);
 }
+
+static struct tst_test test = {
+	.test= run,
+	.tcnt = ARRAY_SIZE(tests),
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
