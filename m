Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C957022B0B3
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 15:43:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92DA33C6274
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 15:43:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 56C0A3C4D38
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 15:42:44 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 323C41401A7D
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 15:42:43 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id m22so3120788pgv.9
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 06:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=E7hNFIz6w/4nLdagc4zl7RkR/i5IFG8awKPUZnvqAs8=;
 b=QVnGTtEwQO+9pcyzuHkFJv/8FXVsG9W10f9dHVo0+CNEMqaTNqggSL+D+8RBPtBm4J
 splE2wJ622CrEKWpEJDpeyOnXu8scJfirrR0umKXWMX1wa119uJHDlvPOaM34Msrpk2d
 ++v+SMn7qS8ZrlYFV5PDwTIYSKQDX37o44sbU8w8cPa+HAAJqQbPkTO2m1eJduwGNRce
 nNB1EatTM6lvPGxG3sHg+nccqgVOPenVE/9MEpqnN6wzWVtBgwyKz7MlJui1+oUA5oYP
 1T6NG6QBfJVAekBjwJ5W9GB6CfQZov9tfKTcE3bUJqFTZGuc/z4d00Wi4FdNqngQzJVZ
 vD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=E7hNFIz6w/4nLdagc4zl7RkR/i5IFG8awKPUZnvqAs8=;
 b=ps9603APKyyj/1E2dEA97a8I87UKX/+yF5w0Ly0/loJZQgHJw8llbKDIKuMMlbyzKi
 GkFGmy9NDTTLufdUaDiXM7HsDrUhmTxT5N+e10H82P4beP+5ZgMG+U1F8uag5K6aFd1A
 P5m9UC44x4pFgN65dXM3i6XwLplg4qf6bBCDV3sdauZRCJCjTe6JoZsY7O4bHWd06iSX
 NMBQlA1fsxBNP+B989X+p6UHG5deEmQFeC+OnA50Utr6PX496DHkY++0QBZOj888Z4wv
 WSbmB4lvHn2BQBRVJwlFz4gzz1xZI63vUvZFiaeKgp1CGyIUvpOQFz6gGUK6c+ptdrPI
 n4Jg==
X-Gm-Message-State: AOAM533RUxGSl+XGfAcxMi33SLsY4VFdd0vm3Y5jjrlT+ABNhktQDHhm
 iGpGrkERT/3VwaY6q9pvbyE02oIoGAQ=
X-Google-Smtp-Source: ABdhPJxoXc2fI/M+fjpLRgzu8i7fSCxBSwprNWzI6jpN0bQbscJyuiJCDd6Ix0vsTXSisH20MoyE1Q==
X-Received: by 2002:a63:d30a:: with SMTP id b10mr4166507pgg.430.1595511753744; 
 Thu, 23 Jul 2020 06:42:33 -0700 (PDT)
Received: from localhost ([182.77.116.224])
 by smtp.gmail.com with ESMTPSA id d18sm2932916pjz.11.2020.07.23.06.42.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 06:42:33 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 23 Jul 2020 19:12:08 +0530
Message-Id: <a83166af3a2b432bb11a0876e18e15705479f32d.1595511710.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
In-Reply-To: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] libs: sigwait: Get rid of REPORT_SUCCESS() macro
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

This is rather making the code difficult to read, get rid of it and its
associated functions.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 libs/libltpsigwait/sigwait.c | 158 +++++++++++++++++++++++++------------------
 1 file changed, 93 insertions(+), 65 deletions(-)

diff --git a/libs/libltpsigwait/sigwait.c b/libs/libltpsigwait/sigwait.c
index dbd33a61f2b1..7315eb2ff13f 100644
--- a/libs/libltpsigwait/sigwait.c
+++ b/libs/libltpsigwait/sigwait.c
@@ -9,39 +9,6 @@
 #include "libsigwait.h"
 #include "tst_sig_proc.h"
 
-/* Report success iff TST_RET and TST_ERR are equal to
-	 exp_return and exp_errno, resp., and cond is true. If cond is not
-	 true, report condition_errmsg
-*/
-static void report_success_cond(const char *func, int line,
-				long exp_return, int exp_errno, int condition,
-				char *condition_errmsg)
-{
-	if (exp_return == TST_RET
-	    && (exp_return != -1 || exp_errno == TST_ERR))
-		if (condition)
-			tst_res(TPASS, "%s (%d): Test passed", func, line);
-		else
-			tst_res(TFAIL, "%s (%d): %s", func, line,
-				 condition_errmsg);
-	else if (TST_RET != -1)
-		tst_res(TFAIL,
-			 "%s (%d): Unexpected return value; expected %ld, got %ld",
-			 func, line, exp_return, TST_RET);
-	else
-		tst_res(TFAIL | TTERRNO, "%s (%d): Unexpected failure",
-			 func, line);
-}
-
-#define REPORT_SUCCESS_COND(exp_return, exp_errno, condition, condition_errmsg)	\
-	report_success_cond(__FUNCTION__, __LINE__, exp_return, exp_errno, condition, condition_errmsg);
-
-/* Report success iff TST_RET and TST_ERR are equal to
-	 exp_return and exp_errno, resp.
-*/
-#define REPORT_SUCCESS(exp_return, exp_errno)					\
-	REPORT_SUCCESS_COND(exp_return, exp_errno, 1, "");
-
 void test_empty_set(swi_func sigwaitinfo, int signo,
 		    enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
@@ -55,7 +22,15 @@ void test_empty_set(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
-	REPORT_SUCCESS(-1, EINTR);
+	if (TST_RET == -1) {
+		if (TST_ERR == EINTR)
+			tst_res(TPASS, "%s: Test passed", __func__);
+		else
+			tst_res(TFAIL | TTERRNO, "%s: Unexpected failure", __func__);
+	} else {
+		tst_res(TFAIL, "%s: Unexpected return value: %ld", __func__,
+			TST_RET);
+	}
 
 	SAFE_KILL(child, SIGTERM);
 	SAFE_WAIT(NULL);
@@ -78,7 +53,15 @@ void test_timeout(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, tst_ts_get(&ts)));
-	REPORT_SUCCESS(-1, EAGAIN);
+	if (TST_RET == -1) {
+		if (TST_ERR == EAGAIN)
+			tst_res(TPASS, "%s: Test passed", __func__);
+		else
+			tst_res(TFAIL | TTERRNO, "%s: Unexpected failure", __func__);
+	} else {
+		tst_res(TFAIL, "%s: Unexpected return value: %ld",
+			__func__, TST_RET);
+	}
 
 	SAFE_KILL(child, SIGTERM);
 	SAFE_WAIT(NULL);
@@ -101,9 +84,15 @@ void test_unmasked_matching(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
-	REPORT_SUCCESS_COND(signo, 0, si.si_pid == child
-			    && si.si_code == SI_USER
-			    && si.si_signo == signo, "Struct siginfo mismatch");
+	if (TST_RET == signo) {
+		if (si.si_pid == child && si.si_code == SI_USER &&
+		    si.si_signo == signo)
+			tst_res(TPASS, "%s: Test passed", __func__);
+		else
+			tst_res(TFAIL, "%s: Struct siginfo mismatch", __func__);
+	} else {
+		tst_res(TFAIL | TTERRNO, "%s: Test failed", __func__);
+	}
 
 	SAFE_KILL(child, SIGTERM);
 	SAFE_WAIT(NULL);
@@ -122,7 +111,10 @@ void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, NULL, NULL));
-	REPORT_SUCCESS(signo, 0);
+	if (TST_RET == signo)
+		tst_res(TPASS, "%s: Test passed", __func__);
+	else
+		tst_res(TFAIL | TTERRNO, "%s: Test failed", __func__);
 
 	SAFE_KILL(child, SIGTERM);
 	SAFE_WAIT(NULL);
@@ -152,19 +144,25 @@ void test_masked_matching(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
-	REPORT_SUCCESS_COND(signo, 0, si.si_pid == child
-			    && si.si_code == SI_USER
-			    && si.si_signo == signo, "Struct siginfo mismatch");
+	if (TST_RET == signo) {
+		if (si.si_pid == child && si.si_code == SI_USER &&
+		    si.si_signo == signo)
+			tst_res(TPASS, "%s: Test passed", __func__);
+		else
+			tst_res(TFAIL, "%s: Struct siginfo mismatch", __func__);
+	} else {
+		tst_res(TFAIL | TTERRNO, "%s: Test failed", __func__);
+	}
 
 	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
 	if (TST_RET == -1)
 		tst_brk(TBROK | TTERRNO, "restoring original signal mask failed");
 
 	if (sigismember(&oldmask, signo))
-		tst_res(TPASS, "sigwaitinfo restored the original mask");
+		tst_res(TPASS, "%s: sigwaitinfo restored the original mask", __func__);
 	else
 		tst_res(TFAIL,
-			 "sigwaitinfo failed to restore the original mask");
+			 "%s: sigwaitinfo failed to restore the original mask", __func__);
 
 	SAFE_KILL(child, SIGTERM);
 	SAFE_WAIT(NULL);
@@ -203,26 +201,37 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo,
 	SAFE_WAITPID(child[1], &status, 0);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
-	REPORT_SUCCESS_COND(signo, 0, si.si_pid == child[0]
-			    && si.si_code == SI_USER
-			    && si.si_signo == signo, "Struct siginfo mismatch");
+	if (TST_RET == signo) {
+		if (si.si_pid == child[0] && si.si_code == SI_USER &&
+		    si.si_signo == signo)
+			tst_res(TPASS, "%s: Test passed", __func__);
+		else
+			tst_res(TFAIL, "%s: Struct siginfo mismatch", __func__);
+	} else {
+		tst_res(TFAIL | TTERRNO, "%s: Test failed", __func__);
+	}
 
 	/* eat the other signal */
 	TEST(sigwaitinfo(&sigs, &si, NULL));
-	REPORT_SUCCESS_COND(signo + 1, 0, si.si_pid == child[1]
-			    && si.si_code == SI_USER
-			    && si.si_signo == signo + 1,
-			    "Struct siginfo mismatch");
+	if (TST_RET == signo + 1) {
+		if (si.si_pid == child[1] && si.si_code == SI_USER &&
+		    si.si_signo == signo + 1)
+			tst_res(TPASS, "%s: Test passed", __func__);
+		else
+			tst_res(TFAIL, "%s: Struct siginfo mismatch", __func__);
+	} else {
+		tst_res(TFAIL | TTERRNO, "%s: Test failed", __func__);
+	}
 
 	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
 	if (TST_RET == -1)
 		tst_brk(TBROK | TTERRNO, "restoring original signal mask failed");
 
 	if (sigismember(&oldmask, signo))
-		tst_res(TPASS, "sigwaitinfo restored the original mask");
+		tst_res(TPASS, "%s: sigwaitinfo restored the original mask", __func__);
 	else
 		tst_res(TFAIL,
-			 "sigwaitinfo failed to restore the original mask");
+			 "%s: sigwaitinfo failed to restore the original mask", __func__);
 }
 
 void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
@@ -248,17 +257,20 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, NULL, NULL));
-	REPORT_SUCCESS(signo, 0);
+	if (TST_RET == signo)
+		tst_res(TPASS, "%s: Test passed", __func__);
+	else
+		tst_res(TFAIL | TTERRNO, "%s: Test failed", __func__);
 
 	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
 	if (TST_RET == -1)
 		tst_brk(TBROK | TTERRNO, "restoring original signal mask failed");
 
 	if (sigismember(&oldmask, signo))
-		tst_res(TPASS, "sigwaitinfo restored the original mask");
+		tst_res(TPASS, "%s: sigwaitinfo restored the original mask", __func__);
 	else
 		tst_res(TFAIL,
-			 "sigwaitinfo failed to restore the original mask");
+			 "%s: sigwaitinfo failed to restore the original mask", __func__);
 
 	SAFE_KILL(child, SIGTERM);
 	SAFE_WAIT(NULL);
@@ -287,7 +299,15 @@ void test_bad_address(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, (void *)1, NULL));
-	REPORT_SUCCESS(-1, EFAULT);
+	if (TST_RET == -1) {
+		if (TST_ERR == EFAULT)
+			tst_res(TPASS, "%s: Test passed", __func__);
+		else
+			tst_res(TFAIL | TTERRNO, "%s: Unexpected failure", __func__);
+	} else {
+		tst_res(TFAIL, "%s: Unexpected return value: %ld",
+			__func__, TST_RET);
+	}
 
 	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
 	if (TST_RET == -1)
@@ -316,8 +336,8 @@ void test_bad_address2(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 		if (TST_RET == -1 && TST_ERR == EFAULT)
 			_exit(0);
 
-		tst_res(TINFO | TTERRNO, "swi_func returned: %ld",
-			TST_RET);
+		tst_res(TINFO | TTERRNO, "%s: swi_func returned: %ld",
+			__func__, TST_RET);
 		_exit(1);
 	}
 
@@ -325,17 +345,17 @@ void test_bad_address2(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 
 	if ((WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV)
 		|| (WIFEXITED(status) && WEXITSTATUS(status) == 0)) {
-		tst_res(TPASS, "Test passed");
+		tst_res(TPASS, "%s: Test passed", __func__);
 		return;
 	}
 
 	if (WIFEXITED(status)) {
-		tst_res(TFAIL, "Unrecognised child exit code: %d",
-			WEXITSTATUS(status));
+		tst_res(TFAIL, "%s: Unrecognised child exit code: %d",
+			__func__, WEXITSTATUS(status));
 	}
 	if (WIFSIGNALED(status)) {
-		tst_res(TFAIL, "Unrecognised child termsig: %d",
-			WTERMSIG(status));
+		tst_res(TFAIL, "%s: Unrecognised child termsig: %d",
+			__func__, WTERMSIG(status));
 	}
 }
 
@@ -346,7 +366,15 @@ void test_bad_address3(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 
 	SAFE_SIGEMPTYSET(&sigs);
 	TEST(sigwaitinfo(&sigs, NULL, (void *)1));
-	REPORT_SUCCESS(-1, EFAULT);
+	if (TST_RET == -1) {
+		if (TST_ERR == EFAULT)
+			tst_res(TPASS, "%s: Test passed", __func__);
+		else
+			tst_res(TFAIL | TTERRNO, "%s: Unexpected failure", __func__);
+	} else {
+		tst_res(TFAIL, "%s: Unexpected return value: %ld",
+			__func__, TST_RET);
+	}
 }
 
 static void empty_handler(int sig LTP_ATTRIBUTE_UNUSED)
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
