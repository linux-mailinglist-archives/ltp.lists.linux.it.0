Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B9922B0B1
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 15:42:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB86F3C4D4A
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 15:42:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id F317D3C4D4B
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 15:42:28 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 08CEB601A60
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 15:42:28 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id cv18so4341018pjb.1
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 06:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=bwG97sI0Axe0wnBZP+dvNkKNQ080yJ8vm/ENReRAas8=;
 b=cIYRzjBTqbpDPzXgqgPLv5v8eErG9LocReSrIfX3dtJvXvfLFfV2Q9nL3mOKP8m3g6
 NvskOTXLTmtOIRM1ErjkcGcipcAHhCcVduqGBIvzejP5g4lpXTqMaYIDt736gylnRWjt
 hARGYUT3D76+n58QV04/VLxpOo3zgdvD2S3jjzdUZzvJh6cL3shtZxLva45jG36MQVAg
 0SW1zXEmaWXMc0PKS6a61PRejf89W0O+VpU+aze8Joj13a6tUNOs4w38yEYFK/gNCTwd
 P6LundrFN/f80DfL7hrMskOZfLlrW5GjYJRQ2X41CuKeo6k6/IxiI+07PpXkIWGyGlUZ
 Khog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=bwG97sI0Axe0wnBZP+dvNkKNQ080yJ8vm/ENReRAas8=;
 b=rt6aEh7sUqqOneT1PwOncHD2Ba50d91W6w8QlaHuCX5Io8joOtc3Soy33R8PxTdCII
 Gu/+EN/tmRZIrpi5CIatnrMyZRgYjVAL8cyFgzkTDiIhjSE/j45LLvssue0wZ0kAbDb1
 pOqFS6RvQkcCfq8yjC26m1cwarshfaLzngcnzN3yMXgW7u7jNJkmNcQbUvf+RYymGoee
 EMeDxkc9boz2Y37n+Vo9gye8z3a99NHZX7v/xyoRw7q13Dlk8hRQoorNE/qZESXQQ5cx
 pHDaLBceXS/raT+IZCQtH80m8m6TvWVUsUHLpSFDS9hopM4eF0V/lvtb4iJ2aRbaPF6t
 ogMg==
X-Gm-Message-State: AOAM533CIZA2T1FTGC/OWFJAMB04DwzAT7t8m+F2fyqZFdLf2skEhrQN
 Wk8PwQggl3C/+jXCdEMrUSz4nbw24Xg=
X-Google-Smtp-Source: ABdhPJzz4caNPNqdDQOUu3vEjhya1eCYp8tFwVjW6uUBerssITycwxdHBK7YEs1u2OdTdnCoCpx/iw==
X-Received: by 2002:a17:90a:80c3:: with SMTP id
 k3mr485000pjw.102.1595511746255; 
 Thu, 23 Jul 2020 06:42:26 -0700 (PDT)
Received: from localhost ([182.77.116.224])
 by smtp.gmail.com with ESMTPSA id f29sm3104920pga.59.2020.07.23.06.42.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 06:42:25 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 23 Jul 2020 19:12:06 +0530
Message-Id: <8b0c584c86d4f45212ccf418e9840a53b6e62a09.1595511710.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
In-Reply-To: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] libs: sigwait: Add SAFE_SIG*() macros
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

Add them to simplify code.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_safe_macros.h    |  43 ++++++++++++++++++
 libs/libltpsigwait/sigwait.c | 103 ++++++++++---------------------------------
 2 files changed, 67 insertions(+), 79 deletions(-)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index c39d8768b1fb..3fce473cc380 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -431,6 +431,49 @@ int safe_sigaction(const char *file, const int lineno,
 #define SAFE_SIGACTION(signum, act, oldact) \
 	safe_sigaction(__FILE__, __LINE__, (signum), (act), (oldact))
 
+static inline void safe_sigaddset(const char *file, const int lineno,
+				  sigset_t *sigs, int signo)
+{
+	int rval;
+
+	rval = sigaddset(sigs, signo);
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO, "sigaddset(%d) failed",
+			 signo);
+	}
+}
+
+#define SAFE_SIGADDSET(sigs, signo) \
+	safe_sigaddset(__FILE__, __LINE__, (sigs), (signo))
+
+static inline void safe_sigdelset(const char *file, const int lineno,
+				  sigset_t *sigs, int signo)
+{
+	int rval;
+
+	rval = sigdelset(sigs, signo);
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO, "sigdelset(%d) failed",
+			 signo);
+	}
+}
+
+#define SAFE_SIGDELSET(sigs, signo) \
+	safe_sigdelset(__FILE__, __LINE__, (sigs), (signo))
+
+static inline void safe_sigemptyset(const char *file, const int lineno,
+				    sigset_t *sigs)
+{
+	int rval;
+
+	rval = sigemptyset(sigs);
+	if (rval == -1)
+		tst_brk_(file, lineno, TBROK | TERRNO, "sigemptyset() failed");
+}
+
+#define SAFE_SIGEMPTYSET(sigs) \
+	safe_sigemptyset(__FILE__, __LINE__, (sigs))
+
 #define SAFE_EXECLP(file, arg, ...) do {                   \
 	execlp((file), (arg), ##__VA_ARGS__);              \
 	tst_brk_(__FILE__, __LINE__, TBROK | TERRNO,       \
diff --git a/libs/libltpsigwait/sigwait.c b/libs/libltpsigwait/sigwait.c
index bb8d2dd05a30..0a658625a984 100644
--- a/libs/libltpsigwait/sigwait.c
+++ b/libs/libltpsigwait/sigwait.c
@@ -49,9 +49,7 @@ void test_empty_set(swi_func sigwaitinfo, int signo,
 	siginfo_t si;
 	pid_t child;
 
-	TEST(sigemptyset(&sigs));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
+	SAFE_SIGEMPTYSET(&sigs);
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, INT_MAX, 100000);
@@ -74,9 +72,7 @@ void test_timeout(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 	tst_ts_set_sec(&ts, 1);
 	tst_ts_set_nsec(&ts, 0);
 
-	TEST(sigemptyset(&sigs));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
+	SAFE_SIGEMPTYSET(&sigs);
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, INT_MAX, 100000);
@@ -98,13 +94,8 @@ void test_unmasked_matching(swi_func sigwaitinfo, int signo,
 	siginfo_t si;
 	pid_t child;
 
-	TEST(sigemptyset(&sigs));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
-
-	TEST(sigaddset(&sigs, signo));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+	SAFE_SIGEMPTYSET(&sigs);
+	SAFE_SIGADDSET(&sigs, signo);
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, INT_MAX, 100000);
@@ -124,13 +115,8 @@ void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	sigset_t sigs;
 	pid_t child;
 
-	TEST(sigemptyset(&sigs));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
-
-	TEST(sigaddset(&sigs, signo));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+	SAFE_SIGEMPTYSET(&sigs);
+	SAFE_SIGADDSET(&sigs, signo);
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, INT_MAX, 100000);
@@ -149,27 +135,18 @@ void test_masked_matching(swi_func sigwaitinfo, int signo,
 	siginfo_t si;
 	pid_t child;
 
-	TEST(sigemptyset(&sigs));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
-
-	TEST(sigaddset(&sigs, signo));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+	SAFE_SIGEMPTYSET(&sigs);
+	SAFE_SIGADDSET(&sigs, signo);
 
 	/* let's not get interrupted by our dying child */
-	TEST(sigaddset(&sigs, SIGCHLD));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+	SAFE_SIGADDSET(&sigs, SIGCHLD);
 
 	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
 	if (TST_RET == -1)
 		tst_brk(TBROK | TTERRNO, "sigprocmask() failed");
 
 	/* don't wait on a SIGCHLD */
-	TEST(sigdelset(&sigs, SIGCHLD));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigdelset() failed");
+	SAFE_SIGDELSET(&sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, 1, 0);
@@ -203,31 +180,19 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo,
 
 	signo = SIGRTMIN + 1;
 
-	TEST(sigemptyset(&sigs));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
-
-	TEST(sigaddset(&sigs, signo));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
-
-	TEST(sigaddset(&sigs, signo + 1));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+	SAFE_SIGEMPTYSET(&sigs);
+	SAFE_SIGADDSET(&sigs, signo);
+	SAFE_SIGADDSET(&sigs, signo + 1);
 
 	/* let's not get interrupted by our dying child */
-	TEST(sigaddset(&sigs, SIGCHLD));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+	SAFE_SIGADDSET(&sigs, SIGCHLD);
 
 	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
 	if (TST_RET == -1)
 		tst_brk(TBROK | TTERRNO, "sigprocmask() failed");
 
 	/* don't wait on a SIGCHLD */
-	TEST(sigdelset(&sigs, SIGCHLD));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigdelset() failed");
+	SAFE_SIGDELSET(&sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
 	child[0] = create_sig_proc(signo, 1, 0);
@@ -266,27 +231,18 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	sigset_t sigs, oldmask;
 	pid_t child;
 
-	TEST(sigemptyset(&sigs));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
-
-	TEST(sigaddset(&sigs, signo));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+	SAFE_SIGEMPTYSET(&sigs);
+	SAFE_SIGADDSET(&sigs, signo);
 
 	/* let's not get interrupted by our dying child */
-	TEST(sigaddset(&sigs, SIGCHLD));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+	SAFE_SIGADDSET(&sigs, SIGCHLD);
 
 	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
 	if (TST_RET == -1)
 		tst_brk(TBROK | TTERRNO, "sigprocmask() failed");
 
 	/* don't wait on a SIGCHLD */
-	TEST(sigdelset(&sigs, SIGCHLD));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigdelset() failed");
+	SAFE_SIGDELSET(&sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, 1, 0);
@@ -314,27 +270,18 @@ void test_bad_address(swi_func sigwaitinfo, int signo,
 	sigset_t sigs, oldmask;
 	pid_t child;
 
-	TEST(sigemptyset(&sigs));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
-
-	TEST(sigaddset(&sigs, signo));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+	SAFE_SIGEMPTYSET(&sigs);
+	SAFE_SIGADDSET(&sigs, signo);
 
 	/* let's not get interrupted by our dying child */
-	TEST(sigaddset(&sigs, SIGCHLD));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigaddset() failed");
+	SAFE_SIGADDSET(&sigs, SIGCHLD);
 
 	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
 	if (TST_RET == -1)
 		tst_brk(TBROK | TTERRNO, "sigprocmask() failed");
 
 	/* don't wait on a SIGCHLD */
-	TEST(sigdelset(&sigs, SIGCHLD));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigdelset() failed");
+	SAFE_SIGDELSET(&sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
 	child = create_sig_proc(signo, 1, 0);
@@ -396,10 +343,8 @@ void test_bad_address3(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 		       enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
 	sigset_t sigs;
-	TEST(sigemptyset(&sigs));
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "sigemptyset() failed");
 
+	SAFE_SIGEMPTYSET(&sigs);
 	TEST(sigwaitinfo(&sigs, NULL, (void *)1));
 	REPORT_SUCCESS(-1, EFAULT);
 }
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
