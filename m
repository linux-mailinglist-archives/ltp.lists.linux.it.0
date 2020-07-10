Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7CF21B0E8
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 10:02:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23D0E3C53AF
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 10:02:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 882BE3C539D
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 10:02:02 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A8DF91401D95
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 10:02:01 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id gc9so2275749pjb.2
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 01:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3iglsmgcmurobxVTemyhkZCT8eqZNjUgaeiBVuvUgV8=;
 b=uMeL91megxnJ5rM9M962G8MqMNQoolCO0dVoRL7C6Kbvuu8JpHahswyazZYkGiSdtC
 ReH1rjHRnZH/7ACIQSChQZSwMGcdoul6/GF9IMo/ur2YhKgcpbNTRpyqor2mIBJwBHVe
 AWvVr29zx2mzHVe96JavZFWRjVUkuJDnk+wx48mOwGwV0I/dOwNRYEOHvKfvjw4b92vh
 TH22KitwTR0vGnT6m76o086S086suaEJ5gn2LcdTs6MM1K8Sc2xo0fY3873FnML5Zk/t
 upldd5W5H+tg57zA6shM3BYtFOzr1YTbyM4QVC55dTZZY9laMi8tgWyKGrF/pIqOVyNp
 5VWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3iglsmgcmurobxVTemyhkZCT8eqZNjUgaeiBVuvUgV8=;
 b=gUN+GWaWuqbLYe2hPe9m3OhIIomJPxHEAKIjVd+ncsThXBlWmMuLA2sWn5Wf3rEQk7
 DUoEmk0OyYyI5rc0adnHjRhPb5rtX+RRcCWmT/nsOgHDJe3HpdvEfrP0jg24KcqcjYah
 GuPwIhcB2oOykP/mO875YEklW4isZoaw5iHwb3S+1y7e6gjjy3CsLtkJLtDVPLt0QjGj
 +KviDDUc5Ro1Oh+j3DFxhMyszLuJ/oqWFCbVz4kfBwjW8/68IehNPqn8nQT4LpG7K/DC
 UnoYJevooLo67pK7HD+gLktsABllDEfa0NflzXD6/tZ0l4bIRUMXQj4htOmo+ZKzm2pm
 4UWg==
X-Gm-Message-State: AOAM533j/h0XuDuX7Nh4axhQ090eQShdtKIXFSFA/zjDhRM83zV6jItf
 GDQMfQD9mE5MUx6TU/Ida2uKF8O6I+E=
X-Google-Smtp-Source: ABdhPJyI4eCOeo07VdlLVyjwdsY8QyILCaER9lHPUoqb3DRKKXqUwUrydDaOQmhHGT7zJxr669t0pg==
X-Received: by 2002:a17:90b:3809:: with SMTP id
 mq9mr4296277pjb.156.1594368119676; 
 Fri, 10 Jul 2020 01:01:59 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id g19sm5080459pfb.152.2020.07.10.01.01.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jul 2020 01:01:59 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 10 Jul 2020 13:31:47 +0530
Message-Id: <2c5220136e60352f6af9b0dcb49bdcc8f6d9c2ae.1594367611.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1594367611.git.viresh.kumar@linaro.org>
References: <cover.1594367611.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC 2/3] syscalls: sigwaitinfo: Remove SUCCEED_OR_DIE() macro
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The macro makes it less readable and there isn't a great deal of code it
is trying to remove. Get rid of it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/sigwaitinfo/sigwaitinfo01.c      | 156 ++++++++++++------
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
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
