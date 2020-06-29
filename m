Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C520CE51
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:43:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 758A33C577C
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:43:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 50B103C5772
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:43:33 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2F54E1A00A52
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:43:33 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id a127so7775800pfa.12
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 04:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PixhnsgV8SIaCS29jhJ8h45WFqz1z0197j1uRg0D1DE=;
 b=daEO0woLd67IBefkqy8ThSiMo8qyO7sFyXjljISTX2U1t4wjL/5zVXa5k4FDnMz4jb
 uWUxvAPjsg4LD4chZq7r5J/li+1gAwFj94MfrVfoSiD5PgoEbLdzbnFybu5uVZJikQZg
 UCs+ZOZ9dRWNQkKVOQJK4S9xBdzT3PRUCT+N9Xk/vsmevOB5yB8jC2ixdFdv4p900x6/
 w56iX/J+KsKslws2TRapNWIa+2tV23x8aBk6hOLrNBYKSxIALcYDRTbkIOsFXSePeRIx
 tS7kkVd6R8O1jUmsi2PjMS5SJYYzZXA7M46Qw98ZYMgcuNuALIKujmBQTcRlkLrxZC8D
 dBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PixhnsgV8SIaCS29jhJ8h45WFqz1z0197j1uRg0D1DE=;
 b=lIlp/xX/NTnJ5CzAlEaZ/Xtv7lQm+IJDoanXp66E/AJHtwFMHE68LCrzdMt4h6quh8
 nNt8mVxu+HUlPccfZj+07bAat2g6s0ZkrwLePGRFzRMX5z41zaIGYrfNcAW/G7qR7eHA
 XPpuOuztGtwQqxNFqbFiphNL62xq52nHhEHLBIwDXlJEARO4S7+zNfv6Ad98fDU0dorv
 ZQLxrC/9dwy8f3wnJ/WfWgJ65nw+MywYmadmN53vlBqY/4E4GQLJ2srCQvIszc79f5Ci
 Ze9p2v4qY+cWhQ57oHwxeCk5gGYYAJtr25nmRvuoCxMv96Kph6tevFU0E6wFP4n1vff4
 0+LQ==
X-Gm-Message-State: AOAM5315sRLSD3aVBPbLH0RSvoo0lTwKtNmy3hSPkHYea/sgY7Um93cs
 yHvFdJxgIgV2nizRx37Lw8fyYw+NAOA=
X-Google-Smtp-Source: ABdhPJzXyG2mORpeQ3BSKIQFBc1DCQWY3ygHeuWCmEdP+DP0oJYMhlNUOky+UKgKZGCiw34kOkgHTA==
X-Received: by 2002:a63:141:: with SMTP id 62mr9699681pgb.366.1593431011143;
 Mon, 29 Jun 2020 04:43:31 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id 4sm29578395pgk.68.2020.06.29.04.43.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 04:43:30 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 29 Jun 2020 17:13:24 +0530
Message-Id: <7d8f71c73ac4518375b81651f82ef040c02082a1.1593430825.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <7c68854a1b6ef828ed8dd83cb611bd5b5d53c2f8.1593430825.git.viresh.kumar@linaro.org>
References: <7c68854a1b6ef828ed8dd83cb611bd5b5d53c2f8.1593430825.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/timer_settime01: Make sure the timer
 fires
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
Cyril/Arnd,

This works well for all clocks except CLOCK_PROCESS_CPUTIME_ID and
CLOCK_THREAD_CPUTIME_ID for some reason. I tried to read the values for
those clocks by sleeping for 1 second and then reading values using
timer_gettime() in a loop, and the value incremented every 15-16 seconds
by a value of 1 (which was in ms if I am not wrong).

No idea what the hell is going on here and so need experts advice :)

 .../syscalls/timer_settime/timer_settime01.c  | 72 +++++++++++++------
 1 file changed, 52 insertions(+), 20 deletions(-)

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index 52c435ee3d91..d786938c7aa5 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -38,25 +38,25 @@ static struct testcase {
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
 
@@ -64,8 +64,23 @@ static void run(unsigned int n)
 {
 	struct test_variants *tv = &variants[tst_variant];
 	struct testcase *tc = &tcases[n];
+	struct sigevent ev = {
+		.sigev_notify = SIGEV_SIGNAL,
+		.sigev_signo = SIGABRT,
+	};
 	long long val;
+	sigset_t set;
 	unsigned int i;
+	int sig;
+
+	if (sigemptyset(&set) == -1)
+		tst_brk(TBROK, "sigemptyset() failed");
+
+	if (sigaddset(&set, SIGABRT) == -1)
+		tst_brk(TBROK, "sigaddset() failed");
+
+	if (sigprocmask(SIG_BLOCK, &set, NULL) == -1)
+		tst_brk(TBROK, "sigprocmask() failed");
 
 	tst_res(TINFO, "Testing for %s:", tc->description);
 
@@ -78,7 +93,7 @@ static void run(unsigned int n)
 				continue;
 		}
 
-		TEST(tst_syscall(__NR_timer_create, clock, NULL, &timer));
+		TEST(tst_syscall(__NR_timer_create, clock, &ev, &timer));
 		if (TST_RET != 0) {
 			if (possibly_unsupported(clock) &&
 				(TST_ERR == EINVAL || TST_ERR == ENOTSUP)) {
@@ -101,7 +116,7 @@ static void run(unsigned int n)
 
 		if (tc->flag & TIMER_ABSTIME) {
 			timenow.type = tv->type;
-			if (tv->gettime(clock, tst_ts_get(&timenow)) < 0) {
+			if (tv->cgettime(clock, tst_ts_get(&timenow)) < 0) {
 				tst_res(TFAIL, "%s: clock_gettime(%s) failed - skipping the test",
 					tv->desc, get_clock_str(clock));
 				continue;
@@ -119,11 +134,35 @@ static void run(unsigned int n)
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
+		if (sigwait(&set, &sig) == -1) {
+			tst_brk(TBROK, "%s: %s: sigwait() failed", tv->desc,
+				get_clock_str(clock));
+		} else if (tc->it_interval_tv_sec) {
+			if (sigwait(&set, &sig) == -1) {
+				tst_brk(TBROK, "%s: %s: Second sigwait() failed",
+					tv->desc, get_clock_str(clock));
+			}
+		}
+
+		tst_res(TPASS, "%s: timer_settime(%s) passed", tv->desc,
+			get_clock_str(clock));
+
 		TEST(tst_syscall(__NR_timer_delete, timer));
 		if (TST_RET != 0) {
 			tst_res(TFAIL | TTERRNO, "%s: %s: timer_delete() failed!",
@@ -132,16 +171,9 @@ static void run(unsigned int n)
 	}
 }
 
-static void sighandler(int sig)
-{
-	/* sighandler for CLOCK_*_ALARM */
-	tst_res(TINFO, "Caught signal %s", tst_strsig(sig));
-}
-
 static void setup(void)
 {
 	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
-	SAFE_SIGNAL(SIGALRM, sighandler);
 }
 
 static struct tst_test test = {
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
