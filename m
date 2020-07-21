Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2505A227B1D
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 10:52:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB92C3C4DC9
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 10:52:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A80E33C26CC
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 10:52:28 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EDF34600101
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 10:52:27 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id a9so1252529pjd.3
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 01:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=zKmogfo7mTDQsIq7FFjrfYL2tUl5yxsTudGLY9Pno9E=;
 b=xS2Yh6NRTHXzyJyzJGjwfkBdCJFu1vtqPdjdYp1/1xOGsXa6MF3kYwI4D+gEn7SmNd
 ePUaowuxHCJE/FLpMBlHR2snrF/EAAuF48hFVAziRSMSQB1sq0mTGnlqYrX4c9/bt4f0
 IJee3r+CRveSjaYInqMDCV+NZB+3wX6e4LgQ4OmY4mXECnMUVLZ2JzTQIEhBsHV+ShVo
 gtTirLTy61wbNUnQHiS2eWA5UyN5KlYgGZr0/8Ciam1Xt0cHuZtHQ5n1WFvLWrfBYqmt
 +SqsbfPzckrhx6EKrFWR78uunQkTaY7PTdrvVCZDAep3BfbMtf0xzeU0gHd/MO55+JF3
 BnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=zKmogfo7mTDQsIq7FFjrfYL2tUl5yxsTudGLY9Pno9E=;
 b=aKXLorViLxDNmmaOEuM019NM3I2oXXQ+sdbWATb5Es7L3T62vrF06NcyOCIe77iDmI
 +957yDV0di8QW//nLT1jIWZ7sOMzIF0zpn4YcBXzEYTW71gnXE00BS6zzewcpttfLIUm
 Cdue55/0t1z7Ovl3/b0V1cOuDA8IeHL1kYrzSXx5rj7TuvFBSOTKdlc/DEgIPSnyRKAY
 x9pHhVa8VBGrjtCzOkeK4mYSrXW1eaXQ6/Ot5CV4YLnWFEVkdYgJEtpmA1cS3GFy1rpM
 As5QnWKlriRZ79kDM6sTNH7LnhMwj3DZz2aOJeowrOLSVVrT/kv+SWcqqZp1PeN8sIeq
 ZFTw==
X-Gm-Message-State: AOAM532BeO9kgI9WDDWnVT9JVF5+9rNrSfOJPPpE0dopCRxR0mdHg4du
 uShIOZVl+ft4ecVYjSag84kyCK58G+k=
X-Google-Smtp-Source: ABdhPJz7OwEChLdSwIpE1z7/sbteq9oq8xkLhsrXNIgbc6vCJ3OWDMx/zwHciTfkbTVRRYcuP7W1TA==
X-Received: by 2002:a17:90a:a0a:: with SMTP id
 o10mr3640354pjo.12.1595321546065; 
 Tue, 21 Jul 2020 01:52:26 -0700 (PDT)
Received: from localhost ([223.179.133.67])
 by smtp.gmail.com with ESMTPSA id b14sm19467441pfo.28.2020.07.21.01.52.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Jul 2020 01:52:25 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 21 Jul 2020 14:22:03 +0530
Message-Id: <8fbd46e33184029f89829af3cd471c05ee6ce496.1595321086.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1595321086.git.viresh.kumar@linaro.org>
References: <cover.1595321086.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1595321086.git.viresh.kumar@linaro.org>
References: <cover.1595321086.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V2 2/3] syscalls: sigwaitinfo: Remove SUCCEED_OR_DIE()
 macro
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The macro makes it less readable and there isn't a great deal of code it
is trying to remove. Get rid of it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c    | 156 ++++++++++++++-------
 1 file changed, 109 insertions(+), 47 deletions(-)

diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
index 86fce4427a6d..5e1baf9df774 100644
--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
@@ -10,13 +10,6 @@
 #include "lapi/syscalls.h"
 #include "tst_sig_proc.h"
 
-#define SUCCEED_OR_DIE(syscall, message, ...)				 \
-	(errno = 0,							 \
-		({int ret=syscall(__VA_ARGS__);				 \
-			if (ret==-1)					 \
-				tst_brk(TBROK|TERRNO, message);\
-			ret;}))
-
 /* Report success iff TST_RET and TST_ERR are equal to
 	 exp_return and exp_errno, resp., and cond is true. If cond is not
 	 true, report condition_errmsg
@@ -113,7 +106,10 @@ void test_empty_set(swi_func sigwaitinfo, int signo,
 	siginfo_t si;
 	pid_t child;
 
-	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
+	TEST(sigemptyset(&sigs));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
+
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, INT_MAX, 100000);
 
@@ -135,7 +131,9 @@ void test_timeout(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 	tst_ts_set_sec(&ts, 1);
 	tst_ts_set_nsec(&ts, 0);
 
-	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
+	TEST(sigemptyset(&sigs));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, INT_MAX, 100000);
@@ -157,8 +155,13 @@ void test_unmasked_matching(swi_func sigwaitinfo, int signo,
 	siginfo_t si;
 	pid_t child;
 
-	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
-	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, signo);
+	TEST(sigemptyset(&sigs));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
+
+	TEST(sigaddset(&sigs, signo));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, INT_MAX, 100000);
@@ -178,8 +181,14 @@ void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	sigset_t sigs;
 	pid_t child;
 
-	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
-	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, signo);
+	TEST(sigemptyset(&sigs));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
+
+	TEST(sigaddset(&sigs, signo));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, INT_MAX, 100000);
 
@@ -197,16 +206,27 @@ void test_masked_matching(swi_func sigwaitinfo, int signo,
 	siginfo_t si;
 	pid_t child;
 
-	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
-	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, signo);
+	TEST(sigemptyset(&sigs));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
+
+	TEST(sigaddset(&sigs, signo));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+
 	/* let's not get interrupted by our dying child */
-	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, SIGCHLD);
+	TEST(sigaddset(&sigs, SIGCHLD));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
 
-	SUCCEED_OR_DIE(sigprocmask, "sigprocmask failed", SIG_SETMASK, &sigs,
-		       &oldmask);
+	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigprocmask() failed");
 
 	/* don't wait on a SIGCHLD */
-	SUCCEED_OR_DIE(sigdelset, "sigaddset failed", &sigs, SIGCHLD);
+	TEST(sigdelset(&sigs, SIGCHLD));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigdelset() failed");
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, 1, 0);
@@ -216,8 +236,9 @@ void test_masked_matching(swi_func sigwaitinfo, int signo,
 			    && si.si_code == SI_USER
 			    && si.si_signo == signo, "Struct siginfo mismatch");
 
-	SUCCEED_OR_DIE(sigprocmask, "restoring original signal mask failed",
-		       SIG_SETMASK, &oldmask, &oldmask);
+	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "restoring original signal mask failed");
 
 	if (sigismember(&oldmask, signo))
 		tst_res(TPASS, "sigwaitinfo restored the original mask");
@@ -239,17 +260,31 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo,
 
 	signo = SIGRTMIN + 1;
 
-	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
-	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, signo);
-	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, signo + 1);
+	TEST(sigemptyset(&sigs));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
+
+	TEST(sigaddset(&sigs, signo));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+
+	TEST(sigaddset(&sigs, signo + 1));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+
 	/* let's not get interrupted by our dying child */
-	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, SIGCHLD);
+	TEST(sigaddset(&sigs, SIGCHLD));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
 
-	SUCCEED_OR_DIE(sigprocmask, "sigprocmask failed", SIG_SETMASK, &sigs,
-		       &oldmask);
+	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigprocmask() failed");
 
 	/* don't wait on a SIGCHLD */
-	SUCCEED_OR_DIE(sigdelset, "sigdelset failed", &sigs, SIGCHLD);
+	TEST(sigdelset(&sigs, SIGCHLD));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigdelset() failed");
 
 	/* Run a child that will wake us up */
 	child[0] = create_sig_proc(signo, 1, 0);
@@ -271,8 +306,9 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo,
 			    && si.si_signo == signo + 1,
 			    "Struct siginfo mismatch");
 
-	SUCCEED_OR_DIE(sigprocmask, "restoring original signal mask failed",
-		       SIG_SETMASK, &oldmask, &oldmask);
+	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "restoring original signal mask failed");
 
 	if (sigismember(&oldmask, signo))
 		tst_res(TPASS, "sigwaitinfo restored the original mask");
@@ -287,16 +323,27 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	sigset_t sigs, oldmask;
 	pid_t child;
 
-	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
-	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, signo);
+	TEST(sigemptyset(&sigs));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
+
+	TEST(sigaddset(&sigs, signo));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+
 	/* let's not get interrupted by our dying child */
-	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, SIGCHLD);
+	TEST(sigaddset(&sigs, SIGCHLD));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
 
-	SUCCEED_OR_DIE(sigprocmask, "sigprocmask failed", SIG_SETMASK, &sigs,
-		       &oldmask);
+	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigprocmask() failed");
 
 	/* don't wait on a SIGCHLD */
-	SUCCEED_OR_DIE(sigdelset, "sigaddset failed", &sigs, SIGCHLD);
+	TEST(sigdelset(&sigs, SIGCHLD));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigdelset() failed");
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, 1, 0);
@@ -304,8 +351,9 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	TEST(sigwaitinfo(&sigs, NULL, NULL));
 	REPORT_SUCCESS(signo, 0);
 
-	SUCCEED_OR_DIE(sigprocmask, "restoring original signal mask failed",
-		       SIG_SETMASK, &oldmask, &oldmask);
+	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "restoring original signal mask failed");
 
 	if (sigismember(&oldmask, signo))
 		tst_res(TPASS, "sigwaitinfo restored the original mask");
@@ -323,16 +371,27 @@ void test_bad_address(swi_func sigwaitinfo, int signo,
 	sigset_t sigs, oldmask;
 	pid_t child;
 
-	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
-	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, signo);
+	TEST(sigemptyset(&sigs));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
+
+	TEST(sigaddset(&sigs, signo));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+
 	/* let's not get interrupted by our dying child */
-	SUCCEED_OR_DIE(sigaddset, "sigaddset failed", &sigs, SIGCHLD);
+	TEST(sigaddset(&sigs, SIGCHLD));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
 
-	SUCCEED_OR_DIE(sigprocmask, "sigprocmask failed", SIG_SETMASK, &sigs,
-		       &oldmask);
+	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigprocmask() failed");
 
 	/* don't wait on a SIGCHLD */
-	SUCCEED_OR_DIE(sigdelset, "sigaddset failed", &sigs, SIGCHLD);
+	TEST(sigdelset(&sigs, SIGCHLD));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigdelset() failed");
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, 1, 0);
@@ -340,8 +399,9 @@ void test_bad_address(swi_func sigwaitinfo, int signo,
 	TEST(sigwaitinfo(&sigs, (void *)1, NULL));
 	REPORT_SUCCESS(-1, EFAULT);
 
-	SUCCEED_OR_DIE(sigprocmask, "sigprocmask failed", SIG_SETMASK, &oldmask,
-		       &oldmask);
+	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigprocmask() failed");
 
 	SAFE_KILL(child, SIGTERM);
 	SAFE_WAIT(NULL);
@@ -398,7 +458,9 @@ void test_bad_address3(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 		       enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
 	sigset_t sigs;
-	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
+	TEST(sigemptyset(&sigs));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
 
 	TEST(sigwaitinfo(&sigs, NULL, (void *)1));
 	REPORT_SUCCESS(-1, EFAULT);
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
