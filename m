Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D88221B0E7
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 10:02:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 329D73C53A1
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 10:02:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1655D3C53B0
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 10:01:59 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B77DA1001BCA
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 10:01:58 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id u5so2198875pfn.7
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 01:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y9C/PBAnVwoYqqs6FnjygZfEACWzBjnmjYFI5B7Eg20=;
 b=YMFldK+XIFwl/QtfLGuNZfYrWdG2aTEx0f/oH254Cf0mTs9CHpepMLTnEeTCCM5r1H
 4lLNaf8DsWAYs8WycLn7/6ot3yQHEUtqVVNdlL9Ga7VHPOT/ipWOAM2HWbAPRqZv5gSn
 z3pVRY5h/Qxm1IAOTVZ10hiaRRUjYxLuyLJFXN12ezVXMwbhWKNRKP1N7LLaMnYJGc1k
 b9bx5sfQyVzdlH/I8Tor8yoP+WPQy71Jxb+oDPiiW8dyqrANE7qdhwUca7AUUk8DWTz0
 CSCcn83KOCt7mQ8pJpnRC106YmRWBgqbcKk4CJJDI1h3E+B/TsHF4A2C8f3YOF03ln8Z
 yafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9C/PBAnVwoYqqs6FnjygZfEACWzBjnmjYFI5B7Eg20=;
 b=PtBaJr3q8jit7wZKb0/4x//R0FcPiWXZ8bm76Yy9CM+RMcpvcpksAOHwSzwfVmA0uI
 lA30upKMNsbfPM6rw+JCKRJ/OYHSv5r69jUWh9DrfHL7picH8el0BtyhGPEdbrLNCUit
 FB1jvV7Ssx9sTewwJj0wM2X5wTgDS/5V2Gfew9rzttIkPukTKzD7zAKQJCIAS0/APyvQ
 EbSTYw/2FjOpgAPruD9lP2POaIxNlAb3H7N1GKTn1tuh+hmKs+SVEx4el3GnycH09GET
 pbfRyI5lnBx2B2f82/EJbHVreqQI2SbBNZVoMDLrqUzPApwACUCsrba7MmPLDB/Gg9c9
 Qbzg==
X-Gm-Message-State: AOAM532SjIDKFr/3csAA9/FFP//Frh6rI0mKl3102XOhje74alJsE+2R
 kV84VatVyFJ81uTG5d8OYKqczvAcuMQ=
X-Google-Smtp-Source: ABdhPJwCrTrLg6grgK7N80RnM06Xn8FUIiVt+xkXsJO6EY7xAK0iE1LafSOLj8baszzPrYWmfdorBQ==
X-Received: by 2002:a62:195:: with SMTP id 143mr53668792pfb.226.1594368116958; 
 Fri, 10 Jul 2020 01:01:56 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id r8sm4893743pfg.147.2020.07.10.01.01.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jul 2020 01:01:56 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 10 Jul 2020 13:31:46 +0530
Message-Id: <14af8f9651d97f7176b727e3c26d4f4b16d6cd69.1594367611.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1594367611.git.viresh.kumar@linaro.org>
References: <cover.1594367611.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC 1/3] syscalls: sigwaitinfo: Suppress all warnings around
 unused parameter
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

Suppress the warnings using LTP_ATTRIBUTE_UNUSED.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/sigwaitinfo/sigwaitinfo01.c      | 26 +++++++++++--------
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
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
