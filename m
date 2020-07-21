Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19557227B17
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 10:52:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8252F3C4DD1
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 10:52:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A6D193C2A9C
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 10:52:21 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C21646014B2
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 10:51:04 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id u185so10412090pfu.1
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=qG8jBKcqxDNxYScNSHqNxlUl3LvfL9W/xh3tFC0E0mA=;
 b=GzvbRrPo9T0QBbCSn487OfjQUsKt11AFdxlfeFSz1raxzV52g/23Tjf5cB3gslJehj
 oFkXlKCq4JQUecNUK6wjcfLuuO0MbjQ3C7ga1CEqde473CwX+DuPK4BhZi/F+aG3IZdG
 mEvtvLg0VA6TdHUfE83H4GEluXkveJUFK3plamZ7zoI62tYfynCB5hhZQw9llDMlCCr5
 L19qdaNSVaw0dbMzns4ntmwtuPRJI210IjMjZUcBEddF9L8f6tpR9g6DQWUBQZjeC+Rt
 LiC/Y6QypFDEtGh/FgH45om9S9jGlPT/vXx4WTtg6TQ0/+u2EDDwFsQ4hrtuDQuR0bD/
 FDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=qG8jBKcqxDNxYScNSHqNxlUl3LvfL9W/xh3tFC0E0mA=;
 b=KWh4obK0p/Cp9QtFUZER7ZHIy7fRgD3wJ8s4PY3opnPM+TPkpmQvgt1jSqO+ynDKDy
 2b7O/VHbP4Y3KJCso1uET8sJFZrouAr1huhnJcjC/LlxVUNSgo/JBU16RQbSJn6Q6m8c
 AxA+waqkuA+OqRjAqFqf7AjfFuMftNdrQ9e/M2Z0gQJUWtIIEhrAzMDNMJmcIP8ig6W3
 66P+js+ltptrAOYYXKNapb++lA9dHZTqcUwhUYNLUD4asiYdmoPewG2oQFQVdkVjsnv+
 cDkrAotgD3pMK8LiqLQ0R8UOroLAEbUAZXHwntmbXj2RVNbGlgwI8omvefx9N0f2BoCu
 sawg==
X-Gm-Message-State: AOAM530JdRt4aygx6tSFZ4W+pEuLaJbzuYYjuY1L8BxdIJPG4dorEoiP
 MoIKO/puCEBqQaZXvhmbPse1EEhYrzA=
X-Google-Smtp-Source: ABdhPJxRVvaFD5ap3PgDhbg4kHRK0V0hEumDM3NavCxDJ4/gErKuuP1yzyglaHHEvgMzei8Hug/bdw==
X-Received: by 2002:a65:4507:: with SMTP id n7mr21175987pgq.180.1595321539039; 
 Tue, 21 Jul 2020 01:52:19 -0700 (PDT)
Received: from localhost ([223.179.133.67])
 by smtp.gmail.com with ESMTPSA id m20sm16379814pgn.62.2020.07.21.01.52.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Jul 2020 01:52:18 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 21 Jul 2020 14:22:02 +0530
Message-Id: <cbc237432704066f3e394c3e40943ddfd90bcbc6.1595321086.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1595321086.git.viresh.kumar@linaro.org>
References: <cover.1595321086.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1595321086.git.viresh.kumar@linaro.org>
References: <cover.1595321086.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V2 1/3] syscalls: sigwaitinfo: Suppress all warnings
 around unused parameter
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

Suppress the warnings using LTP_ATTRIBUTE_UNUSED.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c    | 26 +++++++++++++---------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
index 05e62999ca6c..86fce4427a6d 100644
--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
@@ -50,7 +50,7 @@ static void report_success_cond(const char *func, int line,
 #define REPORT_SUCCESS(exp_return, exp_errno)					\
 	REPORT_SUCCESS_COND(exp_return, exp_errno, 1, "");
 
-static void empty_handler(int sig)
+static void empty_handler(int sig LTP_ATTRIBUTE_UNUSED)
 {
 }
 
@@ -74,7 +74,7 @@ static int my_sigwait(const sigset_t * set, siginfo_t * info,
 
 #ifdef TEST_SIGWAITINFO
 static int my_sigwaitinfo(const sigset_t * set, siginfo_t * info,
-			  void *timeout)
+			  void *timeout LTP_ATTRIBUTE_UNUSED)
 {
 	return sigwaitinfo(set, info);
 }
@@ -106,7 +106,8 @@ static int my_rt_sigtimedwait_time64(const sigset_t * set, siginfo_t * info,
 #endif
 #endif
 
-void test_empty_set(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
+void test_empty_set(swi_func sigwaitinfo, int signo,
+		    enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
 	sigset_t sigs;
 	siginfo_t si;
@@ -150,7 +151,7 @@ void test_timeout(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
  * by POSIX; but works for non-ignored signals under Linux
  */
 void test_unmasked_matching(swi_func sigwaitinfo, int signo,
-			    enum tst_ts_type type)
+			    enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
 	sigset_t sigs;
 	siginfo_t si;
@@ -172,7 +173,7 @@ void test_unmasked_matching(swi_func sigwaitinfo, int signo,
 }
 
 void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo,
-				   enum tst_ts_type type)
+				   enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
 	sigset_t sigs;
 	pid_t child;
@@ -190,7 +191,7 @@ void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo,
 }
 
 void test_masked_matching(swi_func sigwaitinfo, int signo,
-			  enum tst_ts_type type)
+			  enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
 	sigset_t sigs, oldmask;
 	siginfo_t si;
@@ -229,7 +230,7 @@ void test_masked_matching(swi_func sigwaitinfo, int signo,
 }
 
 void test_masked_matching_rt(swi_func sigwaitinfo, int signo,
-			     enum tst_ts_type type)
+			     enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
 	sigset_t sigs, oldmask;
 	siginfo_t si;
@@ -281,7 +282,7 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo,
 }
 
 void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
-				 enum tst_ts_type type)
+				 enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
 	sigset_t sigs, oldmask;
 	pid_t child;
@@ -316,7 +317,8 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	SAFE_WAIT(NULL);
 }
 
-void test_bad_address(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
+void test_bad_address(swi_func sigwaitinfo, int signo,
+		      enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
 	sigset_t sigs, oldmask;
 	pid_t child;
@@ -345,7 +347,8 @@ void test_bad_address(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 	SAFE_WAIT(NULL);
 }
 
-void test_bad_address2(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
+void test_bad_address2(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
+		       enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
 	pid_t pid;
 	int status;
@@ -391,7 +394,8 @@ void test_bad_address2(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 	}
 }
 
-void test_bad_address3(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
+void test_bad_address3(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
+		       enum tst_ts_type type LTP_ATTRIBUTE_UNUSED)
 {
 	sigset_t sigs;
 	SUCCEED_OR_DIE(sigemptyset, "sigemptyset failed", &sigs);
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
