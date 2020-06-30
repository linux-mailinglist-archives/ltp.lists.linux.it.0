Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0344620EB80
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 04:36:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3591D3C5764
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 04:36:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EE5F53C2ADD
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 04:36:21 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 27B4960007C
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 04:36:21 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id x8so6966660plm.10
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 19:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1aqF/vXiVyUG8JsfcD7TF0bQy76bWCkewoL8ULT0QyE=;
 b=PYIInuBPWKNNeQBkI3gzmsss1UujqCpR9e6d2X6NdzID+0Fi+ojrYUKXknbewxN9wX
 29r61frzZY++kQ8jV/SovK1Q09PtHd/gt4QzIkSKT1eTySaZvN3riilNM+Cy75/B7CSU
 VmQ5kjMovwWPPOKG8o2GDXRavd4x1CYDU0d6WLlRJRmwLFhtQzxkG2y2dmgW8g8icrfJ
 gPXMMIHJRRs56enG9o5ls77ikex58IrK10BX9wTAqeucWkv3xVzTXKK4ywyPzKeW68Ix
 /4e7T5fy7rtKR7dwIoUnoptYQZXSoYeZHAkzLcUKZJ8K+tZuIR2TQe/Tn9LYb202rlE1
 qHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1aqF/vXiVyUG8JsfcD7TF0bQy76bWCkewoL8ULT0QyE=;
 b=JPgpSBEbHD1QcTZjV/X5OQktHfpGnHYGYwTq00ZVWEJToZYp4TTkzPBlC+6UeMxHHa
 wLi8rAhTbGY6zA/tdTT2wYTjPpYlrEmOCQchALl+wK8ZsSzMVe4REP4/qc/3PPxi+h0j
 tD7lxan5Q6zou9LrKkeix9ZdIamsq2B5O8J5NI55ZLanPVrzDMk0omP+F7kyY7Vb8Wzb
 rbMkVe36GD+kWZG1Sz9/M8IN4AZ6ddtAkSb7EyYCQjs8U7RG/yYywz3sM6H+U01pPn0N
 EmFYvTW3R3Xg2BY8/OZrXbjKUNzdxrPVuRtD7J5nbMCpiICJffvqPeKhK5l32bMuAmIH
 N2iA==
X-Gm-Message-State: AOAM531K4g44pgeR2kyiybqALYdXpWMY3NouUkwhf6Pi9BlY29/0ewyE
 MZ7/gCViAOBnmnPFK7pgx0tW2aHxV7s=
X-Google-Smtp-Source: ABdhPJyyrSv6KFByCxp+BLeD7zu1nRUk38gxQmK+zz6E64e0gNwYq3Y5JCveXSo+3Nn4s8vTuSLZrw==
X-Received: by 2002:a17:90a:6702:: with SMTP id
 n2mr11554442pjj.82.1593484579267; 
 Mon, 29 Jun 2020 19:36:19 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id f29sm919745pga.59.2020.06.29.19.36.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 19:36:18 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 30 Jun 2020 08:06:15 +0530
Message-Id: <aa1007391fe6c4a281b880b38ec4d6f46d56b034.1593484488.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <7c68854a1b6ef828ed8dd83cb611bd5b5d53c2f8.1593430825.git.viresh.kumar@linaro.org>
References: <7c68854a1b6ef828ed8dd83cb611bd5b5d53c2f8.1593430825.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V1.1 2/2] syscalls/timer_settime01: Make sure the
 timer fires
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

This patch improves the testcase by doing multiple things:

- Make sure the timer fires and catch the signals.

- Verify the values set to the itimerspec by reading them again using
  timer_gettime() syscalls.

- Reduce the timer interval, 5 seconds was way too much.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1.1:
- Use busy loop while waiting for signal and use the existing signal
  mechanism.

 .../syscalls/timer_settime/timer_settime01.c  | 63 ++++++++++++++-----
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index 52c435ee3d91..7e53fce23527 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -38,28 +38,42 @@ static struct testcase {
 	int			flag;
 	char			*description;
 } tcases[] = {
-	{NULL,     5, 0, 0, "general initialization"},
-	{&old_set, 5, 0, 0, "setting old_value"},
-	{&old_set, 0, 5, 0, "using periodic timer"},
-	{&old_set, 5, 0, TIMER_ABSTIME, "using absolute time"},
+	{NULL, 1, 0, 0, "general initialization"},
+	{&old_set, 1, 0, 0, "setting old_value"},
+	{&old_set, 1, 1, 0, "using periodic timer"},
+	{&old_set, 1, 0, TIMER_ABSTIME, "using absolute time"},
 };
 
 static struct test_variants {
-	int (*gettime)(clockid_t clk_id, void *ts);
-	int (*func)(timer_t timerid, int flags, void *its,
-		    void *old_its);
+	int (*cgettime)(clockid_t clk_id, void *ts);
+	int (*tgettime)(timer_t timer, void *its);
+	int (*func)(timer_t timerid, int flags, void *its, void *old_its);
 	enum tst_ts_type type;
 	char *desc;
 } variants[] = {
 #if (__NR_timer_settime != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime, .func = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .cgettime = sys_clock_gettime, .tgettime = sys_timer_gettime, .func = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_timer_settime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime64, .func = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .cgettime = sys_clock_gettime64, .tgettime = sys_timer_gettime64, .func = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
+static volatile int caught_signal;
+
+static void clear_signal(void)
+{
+	/*
+	 * The busy loop is intentional. The signal is sent after X
+	 * seconds of CPU time has been accumulated for the process and
+	 * thread specific clocks.
+	 */
+	while (!caught_signal);
+
+	caught_signal = 0;
+}
+
 static void run(unsigned int n)
 {
 	struct test_variants *tv = &variants[tst_variant];
@@ -101,7 +115,7 @@ static void run(unsigned int n)
 
 		if (tc->flag & TIMER_ABSTIME) {
 			timenow.type = tv->type;
-			if (tv->gettime(clock, tst_ts_get(&timenow)) < 0) {
+			if (tv->cgettime(clock, tst_ts_get(&timenow)) < 0) {
 				tst_res(TFAIL, "%s: clock_gettime(%s) failed - skipping the test",
 					tv->desc, get_clock_str(clock));
 				continue;
@@ -119,11 +133,31 @@ static void run(unsigned int n)
 		if (TST_RET != 0) {
 			tst_res(TFAIL | TTERRNO, "%s: timer_settime(%s) failed",
 				tv->desc, get_clock_str(clock));
-		} else {
-			tst_res(TPASS, "%s: timer_settime(%s) was successful",
+		}
+
+		TEST(tv->tgettime(timer, tst_its_get(&new_set)));
+		if (TST_RET != 0) {
+			tst_res(TFAIL | TTERRNO, "%s: timer_gettime(%s) failed",
 				tv->desc, get_clock_str(clock));
 		}
 
+		if (tst_its_get_interval_sec(new_set) > tc->it_interval_tv_sec ||
+		    tst_its_get_value_sec(new_set) > val) {
+			tst_res(TFAIL | TTERRNO, "%s: timer_gettime(%s) reported bad values (%llu: %llu)",
+				tv->desc, get_clock_str(clock),
+				tst_its_get_interval_sec(new_set),
+				tst_its_get_value_sec(new_set));
+		}
+
+		clear_signal();
+
+		/* Wait for another event when interval was set */
+		if (tc->it_interval_tv_sec)
+			clear_signal();
+
+		tst_res(TPASS, "%s: timer_settime(%s) passed", tv->desc,
+			get_clock_str(clock));
+
 		TEST(tst_syscall(__NR_timer_delete, timer));
 		if (TST_RET != 0) {
 			tst_res(TFAIL | TTERRNO, "%s: %s: timer_delete() failed!",
@@ -132,10 +166,9 @@ static void run(unsigned int n)
 	}
 }
 
-static void sighandler(int sig)
+static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
 {
-	/* sighandler for CLOCK_*_ALARM */
-	tst_res(TINFO, "Caught signal %s", tst_strsig(sig));
+	caught_signal = 1;
 }
 
 static void setup(void)
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
