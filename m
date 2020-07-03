Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4AE2131B4
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 04:40:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A4F23C247C
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 04:40:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 02A0A3C0EC0
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 04:40:02 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E02991000952
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 04:40:01 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id u5so13364878pfn.7
 for <ltp@lists.linux.it>; Thu, 02 Jul 2020 19:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LWcYs045wtO223b2piSJh0bmcq36gAnOnX44lVpSh1Q=;
 b=HR8rz+56XHsWORhvjF3chIoOHISAhOd4N7cJyHTk+SK5OJKH6oXKbjHIxCJjk9xKT9
 ZrSAbRFlhXFjAuWjjPwcg1Lg3+vE6ePjRx/eK9vlLKPBQ14YASq3tN0s/00KmlHtdGre
 e9KG6DOlgoWGI27awNsd0Svbe1A8PrxXlJC6KGPgdn5TRhtY7O4y3HZNzcH7NrsP9D/L
 SfBUE8xobhDnxGXHrjFJ56AHScmEoQPr0nJKV5nVt4IU8SCKqYMnQB4fTgPjaTFHP99D
 v4Ste2q4lvKy4A74NS+TOMRlA4rseEiD5rUVJQPd8yL+lNEHpl9QkfCliOWf9KEXwKcI
 lgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LWcYs045wtO223b2piSJh0bmcq36gAnOnX44lVpSh1Q=;
 b=fh6+KJZAd65UKmxoomUuq8OQQ1ZOPu5r2TyaMPjJ6t1iUZzRBMolkKRjQeZ4zzrAGI
 wz49HgDLDe57CLKulsUhV9drALx0TTSaohE+nf8YHfxUIYeTWSQcmwqKjlvps3okpRPm
 rzfP/rZoDnAZe8ZimEwsPtL5YXdCBfWtkO18ZgpE6Ds3C9vAOJuIYmwpepDIB/Q6QUZP
 c24eG9ZgmLLZA5CpSfJ3pqY/L4N65mo6WCsLVbLRjDTULSJfxiEsFmuZeJWumYSdhB2Q
 +vUmug8KrnWC99YgT9kkHtORpZrPXC+p78Wa2DKrlEsbSVEj87tfi40uyCn9+nOwriXh
 FbYA==
X-Gm-Message-State: AOAM532dfR/Bc5NUwqbCFtEXm+zOnoiPlehjD+tCZTZV8yPrK/SR4mTm
 dxw8DOQNosVohebXB4AfG68rHYRDcyk=
X-Google-Smtp-Source: ABdhPJz88kCJjqUAvrflLKEP4fHgdOtPGNEBSsVQaszVNN9iVu8SUXO3va0vVqfBMwkXUEZVle/SXw==
X-Received: by 2002:a62:8482:: with SMTP id
 k124mr21849428pfd.285.1593743999996; 
 Thu, 02 Jul 2020 19:39:59 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id v28sm10053914pgc.44.2020.07.02.19.39.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jul 2020 19:39:59 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri,  3 Jul 2020 08:09:52 +0530
Message-Id: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <7c68854a1b6ef828ed8dd83cb611bd5b5d53c2f8.1593430825.git.viresh.kumar@linaro.org>
References: <7c68854a1b6ef828ed8dd83cb611bd5b5d53c2f8.1593430825.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2] syscalls/timer_settime01: Make sure the timer fires
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
V1.1->V2:
- 1/2 patch removed and solved rebase conflicts.

 .../syscalls/timer_settime/timer_settime01.c  | 70 ++++++++++++++-----
 1 file changed, 52 insertions(+), 18 deletions(-)

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index 08fb56e4943a..67769d088ab8 100644
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
 				tst_res(TFAIL,
 					"clock_gettime(%s) failed - skipping the test",
 					get_clock_str(clock));
@@ -118,23 +132,43 @@ static void run(unsigned int n)
 		TEST(tv->func(timer, tc->flag, tst_its_get(&new_set), tst_its_get(tc->old_ptr)));
 
 		if (TST_RET != 0) {
-			tst_res(TFAIL | TTERRNO, "%s failed",
-					get_clock_str(clock));
-		} else {
-			tst_res(TPASS, "%s was successful",
-					get_clock_str(clock));
+			tst_res(TFAIL | TTERRNO, "timer_settime(%s) failed",
+				get_clock_str(clock));
+		}
+
+		TEST(tv->tgettime(timer, tst_its_get(&new_set)));
+		if (TST_RET != 0) {
+			tst_res(TFAIL | TTERRNO, "timer_gettime(%s) failed",
+				get_clock_str(clock));
+		}
+
+		if (tst_its_get_interval_sec(new_set) > tc->it_interval_tv_sec ||
+		    tst_its_get_value_sec(new_set) > val) {
+			tst_res(TFAIL | TTERRNO,
+				"timer_gettime(%s) reported bad values (%llu: %llu)",
+				get_clock_str(clock),
+				tst_its_get_interval_sec(new_set),
+				tst_its_get_value_sec(new_set));
 		}
 
+		clear_signal();
+
+		/* Wait for another event when interval was set */
+		if (tc->it_interval_tv_sec)
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
