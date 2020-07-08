Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6682184F2
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 12:31:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 415633C544D
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 12:31:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F25AE3C2986
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 12:31:15 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 92397600F6F
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 12:30:09 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id s26so6151671pfm.4
 for <ltp@lists.linux.it>; Wed, 08 Jul 2020 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Imd0KuUF0GpZpGkPcl8DP6/fwVXcnHjtHqCv76ikYPo=;
 b=hGCVSR5b5JGcjYPD/fV9CZBcbNzBTQ36SDcsVlMhRwBuyegnLT8hO021xUEuFtcZ1P
 XD9J54cvnLWNGdq6FrEg0fWnjrJo+smOnhlxy4nxNx9URvG5XzvWU6wO8wtk6ZJy2Cz6
 4abOaM1275x4OW+2JjzxCKqoT/TZqiW3I0m6dHlNkjmtmFbmINV+6CJHbe6XrnTRaP6y
 3dO1kN1RCJpBM2gxzY2ucrYCH2uxdo/TmnXAGyuW2KvMKVzjMdBWF5YQVv+nebRH1EK8
 UVJYtvBEP7D92p7Bh8/fP/nTfXuMqlUS61u90YfJNa7Xt/nQhj8N6fSuu7c8Ga881F/M
 QHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Imd0KuUF0GpZpGkPcl8DP6/fwVXcnHjtHqCv76ikYPo=;
 b=uJa17m+KpPbc+VxZXxyw/vVaR+dhpQAGwqR/F1jp/VyxQy/YFuFMt4iQVF4e1hw8y8
 yqDq5u1rnTP7a//BA3t5nQp32ULY5gAI8o/AgrerLtPmdlHEvQjRko5UQev7fi+gIZOx
 EeLgYCjmuMQ/3CbFkEcur4xeFD6B49u9dqLx+gOLjJkIQrSbUnhWCy+wypEAnASkeaAj
 q5xCX6SZMR8KNSL7lWWwOnq9Y3mC4AjEZe0RJ6LcP22O2Vh2N6t68AA1m5txNJvPR+Mn
 BMO5uM0zGmN9V9yaAIK7ZNcuQQQ2nFV+Rc2TThZt4QcEFJJVTaFnASYSPM9r9MZbyBaM
 w+aA==
X-Gm-Message-State: AOAM532eMPjru82WTJzw/A0yE9b2sDeTPFql4VEqabuzW3zdJOnYFJjS
 LVy83prHJiJJZHwDCy7/EDFMfnnEkGE=
X-Google-Smtp-Source: ABdhPJyfruWhPRvlyLEtC6OdKF4ugYEjGkaxuSEYS9S0xhRX5FYtD/18Jij/XP/iht/B1e6/WW4S3Q==
X-Received: by 2002:a63:be47:: with SMTP id g7mr48424156pgo.7.1594204272942;
 Wed, 08 Jul 2020 03:31:12 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id cv7sm4698933pjb.9.2020.07.08.03.31.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jul 2020 03:31:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed,  8 Jul 2020 16:01:04 +0530
Message-Id: <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
References: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V3] syscalls/timer_settime01: Make sure the timer fires
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
V3:
- Changed timer values to 100 ms instead of 1 sec and that resulted in
  few changes.
- Moved some code around to keep related bits together.
- Improved check for testing value read from timer.

 .../syscalls/timer_settime/timer_settime01.c  | 106 ++++++++++++------
 1 file changed, 70 insertions(+), 36 deletions(-)

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index 08fb56e4943a..f9d1456dabe9 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -33,33 +33,61 @@ static timer_t timer;
 
 static struct testcase {
 	struct tst_its		*old_ptr;
-	int			it_value_tv_sec;
-	int			it_interval_tv_sec;
+	int			it_value_tv_usec;
+	int			it_interval_tv_usec;
 	int			flag;
 	char			*description;
 } tcases[] = {
-	{NULL,     5, 0, 0, "general initialization"},
-	{&old_set, 5, 0, 0, "setting old_value"},
-	{&old_set, 0, 5, 0, "using periodic timer"},
-	{&old_set, 5, 0, TIMER_ABSTIME, "using absolute time"},
+	{NULL, 100000, 0, 0, "general initialization"},
+	{&old_set, 100000, 0, 0, "setting old_value"},
+	{&old_set, 100000, 100000, 0, "using periodic timer"},
+	{&old_set, 100000, 0, TIMER_ABSTIME, "using absolute time"},
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
+static void sighandler(int sig)
+{
+	if (sig != SIGALRM)
+		tst_res(TFAIL, "Received incorrect signal: %d", sig);
+
+	caught_signal = 1;
+}
+
+static void setup(void)
+{
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	SAFE_SIGNAL(SIGALRM, sighandler);
+}
+
 static void run(unsigned int n)
 {
 	struct test_variants *tv = &variants[tst_variant];
@@ -96,53 +124,59 @@ static void run(unsigned int n)
 		memset(&old_set, 0, sizeof(old_set));
 
 		new_set.type = old_set.type = tv->type;
-
-		val = tc->it_value_tv_sec;
+		val = tc->it_value_tv_usec;
 
 		if (tc->flag & TIMER_ABSTIME) {
 			timenow.type = tv->type;
-			if (tv->gettime(clock, tst_ts_get(&timenow)) < 0) {
+			if (tv->cgettime(clock, tst_ts_get(&timenow)) < 0) {
 				tst_res(TFAIL,
 					"clock_gettime(%s) failed - skipping the test",
 					get_clock_str(clock));
 				continue;
 			}
-			val += tst_ts_get_sec(timenow);
+			val += tst_ts_to_us(timenow);
 		}
 
-		tst_its_set_interval_sec(&new_set, tc->it_interval_tv_sec);
-		tst_its_set_interval_nsec(&new_set, 0);
-		tst_its_set_value_sec(&new_set, val);
-		tst_its_set_value_nsec(&new_set, 0);
+		tst_its_set_interval_from_us(&new_set, tc->it_interval_tv_usec);
+		tst_its_set_value_from_us(&new_set, val);
 
 		TEST(tv->func(timer, tc->flag, tst_its_get(&new_set), tst_its_get(tc->old_ptr)));
 
 		if (TST_RET != 0) {
-			tst_res(TFAIL | TTERRNO, "%s failed",
-					get_clock_str(clock));
-		} else {
-			tst_res(TPASS, "%s was successful",
-					get_clock_str(clock));
+			tst_res(TFAIL | TTERRNO, "timer_settime(%s) failed",
+				get_clock_str(clock));
 		}
 
+		TEST(tv->tgettime(timer, tst_its_get(&new_set)));
+		if (TST_RET != 0) {
+			tst_res(TFAIL | TTERRNO, "timer_gettime(%s) failed",
+				get_clock_str(clock));
+		} else if ((tst_its_get_interval_nsec(new_set) !=
+				tc->it_interval_tv_usec * 1000) ||
+			   (tst_its_get_value_nsec(new_set) >
+				MAX(tc->it_value_tv_usec * 1000, tc->it_interval_tv_usec * 1000))) {
+			tst_res(TFAIL | TTERRNO,
+				"timer_gettime(%s) reported bad values (%llu: %llu)",
+				get_clock_str(clock),
+				tst_its_get_interval_nsec(new_set),
+				tst_its_get_value_nsec(new_set));
+		}
+
+		clear_signal();
+
+		/* Wait for another event when interval was set */
+		if (tc->it_interval_tv_usec)
+			clear_signal();
+
+		tst_res(TPASS, "timer_settime(%s) passed",
+			get_clock_str(clock));
+
 		TEST(tst_syscall(__NR_timer_delete, timer));
 		if (TST_RET != 0)
 			tst_res(TFAIL | TTERRNO, "timer_delete() failed!");
 	}
 }
 
-static void sighandler(int sig)
-{
-	/* sighandler for CLOCK_*_ALARM */
-	tst_res(TINFO, "Caught signal %s", tst_strsig(sig));
-}
-
-static void setup(void)
-{
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
-	SAFE_SIGNAL(SIGALRM, sighandler);
-}
-
 static struct tst_test test = {
 	.test = run,
 	.needs_root = 1,
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
