Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A78F232156
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 17:13:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED5C93C2628
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 17:13:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 167D03C05A1
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 17:13:51 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2B6F41A00913
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 17:13:50 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id m16so11918696pls.5
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 08:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WCb4g8CRy0rEd5jI9plL26mLEr3Mcxvquf1XSgSbQ6Q=;
 b=xCH1DWOSCj7T+O0NYgsxpkrb/InnwfKq2qCzyTIXsw43iidQTleVBhzXFXQn1TRfSY
 2muiwSNbbRLVLEIA0fn0rHvtUedokhowJf+8QLzehqG2SB94JNzQlK1tBRkwpvP6v6lc
 oKuf431SiwNTINeYEpE/vbOvxy7AMGlm3mEqQEiPsV0k4Y3kxr8Su8bGhtl+M6swC86s
 bkpg/gQbfuqJ+Xk+Homqtwu/RuYcrW6dMFampzyDBrw5QW6fI5Ibs5WPAbgpvfD/Xe8K
 gAlMo/nqMUiQHCxrepPUFh6tYHk++79BuJ88RgLnf2S82Er0AXsg8LnYZzqdyqC6Narh
 XzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WCb4g8CRy0rEd5jI9plL26mLEr3Mcxvquf1XSgSbQ6Q=;
 b=PJUE5pw9n0ZisMoEcnEC6bhx0dDkRK7oRJGPIc17BLio/OJUr/GvIvs3jJ8nzPZniR
 HUhmmfv2CZbQi5MeWH874hM/eHjJaYNTJi/EBOKTLw6A5U+fje687i+4IkZL3a7unR2O
 LMJgjaNg+Nx6s+apcpQeYayHsy+0w9K8GPxslVEfI+SpZQKdLFepisA6xYenalzABZpO
 XDPinL6FUaoejRIrNBT8RbtgWB9U8G6Fnlx1tP50RO0P4W339I79ZPh3sQF4PPiq0/so
 a+3k7YjB+zV5riO2dG5e5o6ycw20bI0I9io7BWI0f/a7vx4lIXpuNxVJ1eCWVUPuRCsm
 aAig==
X-Gm-Message-State: AOAM533xSqUJiyeYQDy3URYRz3zrMMRYE5MzspQSGQZNkqlbi9BRUXpc
 X8POPUz8CgTMIWzL9WuBYTNsWTfgIlM=
X-Google-Smtp-Source: ABdhPJw0VdA7e5vBVzfoECeF0u2uBnRvsDNJyTY2lQ2ynRcsyMIDhRXEonfU6p6JEA0Faxb7Y/4Whg==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id
 mh18mr2524574pjb.18.1596035626981; 
 Wed, 29 Jul 2020 08:13:46 -0700 (PDT)
Received: from localhost ([106.215.77.228])
 by smtp.gmail.com with ESMTPSA id a13sm2899737pfn.171.2020.07.29.08.13.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 08:13:46 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 29 Jul 2020 20:43:42 +0530
Message-Id: <ec86df91b3664ff7555717ac547d9e2c579d236a.1596035606.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <53c9ed8dc17ea6fa0b46502cd1c724a3a8539c8c.1595842740.git.viresh.kumar@linaro.org>
References: <53c9ed8dc17ea6fa0b46502cd1c724a3a8539c8c.1595842740.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2 resend 2/2] libs: sigwait: Get rid of
 REPORT_SUCCESS() macro
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
 libs/libltpsigwait/sigwait.c | 133 +++++++++++++++++++++++++------------------
 1 file changed, 78 insertions(+), 55 deletions(-)

diff --git a/libs/libltpsigwait/sigwait.c b/libs/libltpsigwait/sigwait.c
index fd32efd8aa9f..1eecdc59a772 100644
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
@@ -55,7 +22,14 @@ void test_empty_set(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
-	REPORT_SUCCESS(-1, EINTR);
+	if (TST_RET == -1) {
+		if (TST_ERR == EINTR)
+			tst_res(TPASS, "Wait interrupted by a signal");
+		else
+			tst_res(TFAIL | TTERRNO, "Expected error number EINTR, got");
+	} else {
+		tst_res(TFAIL, "Expected return value -1, got: %ld", TST_RET);
+	}
 
 	SAFE_KILL(child, SIGTERM);
 	SAFE_WAIT(NULL);
@@ -78,7 +52,14 @@ void test_timeout(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, tst_ts_get(&ts)));
-	REPORT_SUCCESS(-1, EAGAIN);
+	if (TST_RET == -1) {
+		if (TST_ERR == EAGAIN)
+			tst_res(TPASS, "Wait interrupted by a signal");
+		else
+			tst_res(TFAIL | TTERRNO, "Expected error number EAGAIN, got");
+	} else {
+		tst_res(TFAIL, "Expected return value -1, got: %ld", TST_RET);
+	}
 
 	SAFE_KILL(child, SIGTERM);
 	SAFE_WAIT(NULL);
@@ -101,9 +82,15 @@ void test_unmasked_matching(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
-	REPORT_SUCCESS_COND(signo, 0, si.si_pid == child
-			    && si.si_code == SI_USER
-			    && si.si_signo == signo, "Struct siginfo mismatch");
+	if (TST_RET == signo) {
+		if (si.si_pid == child && si.si_code == SI_USER &&
+		    si.si_signo == signo)
+			tst_res(TPASS, "Wait interrupted by a signal");
+		else
+			tst_res(TFAIL, "struct siginfo mismatch");
+	} else {
+		tst_res(TFAIL | TTERRNO, "sigwaitinfo() failed");
+	}
 
 	SAFE_KILL(child, SIGTERM);
 	SAFE_WAIT(NULL);
@@ -122,7 +109,10 @@ void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, NULL, NULL));
-	REPORT_SUCCESS(signo, 0);
+	if (TST_RET == signo)
+		tst_res(TPASS, "Wait interrupted by a signal");
+	else
+		tst_res(TFAIL | TTERRNO, "sigwaitinfo() failed");
 
 	SAFE_KILL(child, SIGTERM);
 	SAFE_WAIT(NULL);
@@ -152,9 +142,15 @@ void test_masked_matching(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
-	REPORT_SUCCESS_COND(signo, 0, si.si_pid == child
-			    && si.si_code == SI_USER
-			    && si.si_signo == signo, "Struct siginfo mismatch");
+	if (TST_RET == signo) {
+		if (si.si_pid == child && si.si_code == SI_USER &&
+		    si.si_signo == signo)
+			tst_res(TPASS, "Wait interrupted by a signal");
+		else
+			tst_res(TFAIL, "struct siginfo mismatch");
+	} else {
+		tst_res(TFAIL | TTERRNO, "sigwaitinfo() failed");
+	}
 
 	TEST(sigprocmask(SIG_SETMASK, &oldmask, &sigs));
 	if (TST_RET == -1)
@@ -203,16 +199,27 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo,
 	SAFE_WAITPID(child[1], &status, 0);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
-	REPORT_SUCCESS_COND(signo, 0, si.si_pid == child[0]
-			    && si.si_code == SI_USER
-			    && si.si_signo == signo, "Struct siginfo mismatch");
+	if (TST_RET == signo) {
+		if (si.si_pid == child[0] && si.si_code == SI_USER &&
+		    si.si_signo == signo)
+			tst_res(TPASS, "Wait interrupted by a signal");
+		else
+			tst_res(TFAIL, "struct siginfo mismatch");
+	} else {
+		tst_res(TFAIL | TTERRNO, "sigwaitinfo() failed");
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
+			tst_res(TPASS, "Wait interrupted by a signal");
+		else
+			tst_res(TFAIL, "struct siginfo mismatch");
+	} else {
+		tst_res(TFAIL | TTERRNO, "sigwaitinfo() failed");
+	}
 
 	TEST(sigprocmask(SIG_SETMASK, &oldmask, &sigs));
 	if (TST_RET == -1)
@@ -248,7 +255,10 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, NULL, NULL));
-	REPORT_SUCCESS(signo, 0);
+	if (TST_RET == signo)
+		tst_res(TPASS, "Wait interrupted by a signal");
+	else
+		tst_res(TFAIL | TTERRNO, "sigwaitinfo() failed");
 
 	TEST(sigprocmask(SIG_SETMASK, &oldmask, &sigs));
 	if (TST_RET == -1)
@@ -287,7 +297,14 @@ void test_bad_address(swi_func sigwaitinfo, int signo,
 	child = create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, (void *)1, NULL));
-	REPORT_SUCCESS(-1, EFAULT);
+	if (TST_RET == -1) {
+		if (TST_ERR == EFAULT)
+			tst_res(TPASS, "Wait interrupted by a signal");
+		else
+			tst_res(TFAIL | TTERRNO, "Expected error number EFAULT, got");
+	} else {
+		tst_res(TFAIL, "Expected return value -1, got: %ld", TST_RET);
+	}
 
 	TEST(sigprocmask(SIG_SETMASK, &oldmask, NULL));
 	if (TST_RET == -1)
@@ -316,8 +333,7 @@ void test_bad_address2(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 		if (TST_RET == -1 && TST_ERR == EFAULT)
 			_exit(0);
 
-		tst_res(TINFO | TTERRNO, "swi_func returned: %ld",
-			TST_RET);
+		tst_res(TINFO | TTERRNO, "swi_func returned: %ld", TST_RET);
 		_exit(1);
 	}
 
@@ -325,7 +341,7 @@ void test_bad_address2(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 
 	if ((WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV)
 		|| (WIFEXITED(status) && WEXITSTATUS(status) == 0)) {
-		tst_res(TPASS, "Test passed");
+		tst_res(TPASS, "Wait interrupted by a signal");
 		return;
 	}
 
@@ -346,7 +362,14 @@ void test_bad_address3(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 
 	SAFE_SIGEMPTYSET(&sigs);
 	TEST(sigwaitinfo(&sigs, NULL, (void *)1));
-	REPORT_SUCCESS(-1, EFAULT);
+	if (TST_RET == -1) {
+		if (TST_ERR == EFAULT)
+			tst_res(TPASS, "Wait interrupted by a signal");
+		else
+			tst_res(TFAIL | TTERRNO, "Expected error number EFAULT, got");
+	} else {
+		tst_res(TFAIL, "Expected return value -1, got: %ld", TST_RET);
+	}
 }
 
 static void empty_handler(int sig LTP_ATTRIBUTE_UNUSED)
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
