Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3C81DE4DF
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:53:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 025C23C4C18
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:53:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 321323C4CA6
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:52:06 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7864B600913
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:52:05 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id x10so4248885plr.4
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s0R7H3ESXy9BXi4x7K7Cc8ZDcyKc7QY2sKsGQcjvlo8=;
 b=gYpn9v8Kq76bwyLSXkciABaUq29fhuG7B3YdpE9/XtmZ8Svzza5En/oB7URE0iipBJ
 uKo0OZtxPQ0PDiryf6kaNcdosprKpw343NnSC8N61fflQ04VrVamA9tMW5I+UCDm2a7u
 ilnd2O+2sr5ypZ12yxI4V8kPDdRpEz4yiZlrX8ZhKAJ+N7IrrQMIZkwH4qdGLMJK8ViP
 2A5r9KiL58zXgrQYdp/8c3EsB3XtAuvGq6vRfyUvruyUwdOxwBJaQ63MkG5ZUqF7iuFC
 zqlceUQRtjQgZmOFulDd4+N2w5aZ7ii6CH/l3wF7EpcUmlqhxxxGb/y2mLRjcFfO63ef
 rVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s0R7H3ESXy9BXi4x7K7Cc8ZDcyKc7QY2sKsGQcjvlo8=;
 b=YzZ1+tmpOkqpL6bSWCGa3Ka//TsmkTzABW805Ohkg7V+biuDWgLH5LX6W5g3PrUufd
 W4KF8KchaDmWLb44yNlrqadnYdoU6CByzjI9gdOJl1rAJzIfW/lfHNOJRSaATmBci/yx
 2hWhIMkxRlMil9FERvoWftb4fDiCOZAtkdpKDoPIUWGrfmICjsiCEvxHgUSCg66MXtbv
 sNF0VMOdCQ3bdg4DGdI9zHZ3jdYqs789/Ev8oayFWQ1uYFVObxHDGR3HdQwX0sWksnqa
 JeKE8tJacKEMWCki3ciDQDjtuaACP4vx2bAYYv9V7OgZG2kDJP8IBD59yhsxTyZxgVDK
 Vyqg==
X-Gm-Message-State: AOAM531+NwtedBXhdza44KmPp3gOuBeoUrkC0LuMhEVwS9OcU8YKPvvn
 3z7IHgINEGx3LjKEaSPj/8YHLyhYJNY=
X-Google-Smtp-Source: ABdhPJzn+H/mBBCO70XIapmlrbuMlfp0onIXPKTXjW7oHphEAHephfMLDvZ6fTKTaktFGjg4ysF/sQ==
X-Received: by 2002:a17:902:9043:: with SMTP id
 w3mr13413631plz.250.1590144723579; 
 Fri, 22 May 2020 03:52:03 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id s15sm5965038pgv.5.2020.05.22.03.52.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:52:02 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 16:21:27 +0530
Message-Id: <d066aac6e9c2a3a44be4e4a8fa3cf4243d71364e.1590144577.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590144577.git.viresh.kumar@linaro.org>
References: <cover.1590144577.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V4 07/17] syscalls/io_pgetevents: Add support for
 time64 tests
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

This adds support for time64 tests to the existing io_pgetevents()
syscall tests.

While at it, also pass mode to SAFE_OPEN() to avoid any errors when the
tests are run for multiple variants together.

Also get rid of an extra copy of local fd variable, which is incorrect.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/io_pgetevents.h                  | 15 ++++--
 .../syscalls/io_pgetevents/io_pgetevents01.c  | 33 +++++++++++-
 .../syscalls/io_pgetevents/io_pgetevents02.c  | 51 +++++++++++++++----
 3 files changed, 83 insertions(+), 16 deletions(-)

diff --git a/include/lapi/io_pgetevents.h b/include/lapi/io_pgetevents.h
index 3c9d5b2d7618..5bb9a60c352a 100644
--- a/include/lapi/io_pgetevents.h
+++ b/include/lapi/io_pgetevents.h
@@ -16,15 +16,20 @@
 #ifdef HAVE_LIBAIO
 #include <libaio.h>
 
-#ifndef HAVE_IO_PGETEVENTS
-int io_pgetevents(io_context_t ctx, long min_nr, long max_nr,
-		 struct io_event *events, struct timespec *timeout,
-		 sigset_t *sigmask)
+static inline int sys_io_pgetevents(io_context_t ctx, long min_nr, long max_nr,
+		struct io_event *events, void *timeout, sigset_t *sigmask)
 {
 	return tst_syscall(__NR_io_pgetevents, ctx, min_nr, max_nr, events,
 			   timeout, sigmask);
 }
-#endif /* HAVE_IO_PGETEVENTS */
+
+static inline int sys_io_pgetevents_time64(io_context_t ctx, long min_nr, long max_nr,
+		struct io_event *events, void *timeout, sigset_t *sigmask)
+{
+	return tst_syscall(__NR_io_pgetevents_time64, ctx, min_nr, max_nr,
+			   events, timeout, sigmask);
+}
+
 #endif /* HAVE_LIBAIO */
 
 #endif /* IO_PGETEVENTS_H */
diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
index e6077e47984d..fea380e52f4d 100644
--- a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
@@ -6,11 +6,32 @@
  * Basic io_pgetevents() test to receive 1 event successfully.
  */
 #include "tst_test.h"
+#include "tst_timer.h"
 #include "lapi/io_pgetevents.h"
 
 #ifdef HAVE_LIBAIO
 static int fd;
 
+static struct test_variants {
+	int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
+		struct io_event *events, void *timeout, sigset_t *sigmask);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_io_pgetevents != __LTP__NR_INVALID_SYSCALL)
+	{ .io_pgetevents = sys_io_pgetevents, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_io_pgetevents_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .io_pgetevents = sys_io_pgetevents_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
+
+static void setup(void)
+{
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+}
+
 static void cleanup(void)
 {
 	if (fd > 0)
@@ -19,12 +40,18 @@ static void cleanup(void)
 
 static void run(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct io_event events[1];
 	struct iocb cb, *cbs[1];
 	io_context_t ctx = 0;
+	struct tst_ts to;
 	sigset_t sigmask;
 	char data[4096];
-	int ret, fd;
+	int ret;
+
+	to.type = tv->type;
+	tst_ts_set_sec(&to, 0);
+	tst_ts_set_nsec(&to, 10000);
 
 	cbs[0] = &cb;
 	sigemptyset(&sigmask);
@@ -41,7 +68,7 @@ static void run(void)
 		tst_brk(TBROK | TERRNO, "io_submit() failed");
 
 	/* get the reply */
-	ret = io_pgetevents(ctx, 1, 1, events, NULL, &sigmask);
+	ret = tv->io_pgetevents(ctx, 1, 1, events, tst_ts_get(&to), &sigmask);
 
 	if (ret == 1)
 		tst_res(TPASS, "io_pgetevents() works as expected");
@@ -55,8 +82,10 @@ static void run(void)
 static struct tst_test test = {
 	.min_kver = "4.18",
 	.test_all = run,
+	.test_variants = ARRAY_SIZE(variants),
 	.needs_tmpdir = 1,
 	.cleanup = cleanup,
+	.setup = setup,
 };
 
 #else
diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
index 62a8afba3bf1..a15b3d0dda92 100644
--- a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
@@ -6,6 +6,7 @@
  * Basic io_pgetevents() test to check various failures.
  */
 #include "tst_test.h"
+#include "tst_timer.h"
 #include "lapi/io_pgetevents.h"
 
 #ifdef HAVE_LIBAIO
@@ -14,30 +15,55 @@ static struct io_event events[1];
 static io_context_t ctx, invalid_ctx = 0;
 static int fd, ctx_initialized;
 
+static struct tst_ts to;
+static void *bad_addr;
+
 static struct tcase {
 	char *name;
 	io_context_t *ctx;
 	long min_nr;
 	long max_nr;
 	struct io_event *events;
-	struct timespec *timeout;
+	struct tst_ts *timeout;
 	sigset_t *sigmask;
 	int exp_errno;
 } tcases[] = {
-	{"invalid ctx", &invalid_ctx, 1, 1, events, NULL, &sigmask, EINVAL},
-	{"invalid min_nr", &ctx, -1, 1, events, NULL, &sigmask, EINVAL},
-	{"invalid max_nr", &ctx, 1, -1, events, NULL, &sigmask, EINVAL},
-	{"invalid events", &ctx, 1, 1, NULL, NULL, &sigmask, EFAULT},
-	{"invalid timeout", &ctx, 1, 1, events, (void *)(0xDEAD), &sigmask, EFAULT},
-	{"invalid sigmask", &ctx, 1, 1, events, NULL, (void *)(0xDEAD), EFAULT},
+	{"invalid ctx", &invalid_ctx, 1, 1, events, &to, &sigmask, EINVAL},
+	{"invalid min_nr", &ctx, -1, 1, events, &to, &sigmask, EINVAL},
+	{"invalid max_nr", &ctx, 1, -1, events, &to, &sigmask, EINVAL},
+	{"invalid events", &ctx, 1, 1, NULL, &to, &sigmask, EFAULT},
+	{"invalid timeout", &ctx, 1, 1, events, NULL, &sigmask, EFAULT},
+	{"invalid sigmask", &ctx, 1, 1, events, &to, NULL, EFAULT},
+};
+
+static struct test_variants {
+	int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
+		struct io_event *events, void *timeout, sigset_t *sigmask);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_io_pgetevents != __LTP__NR_INVALID_SYSCALL)
+	{ .io_pgetevents = sys_io_pgetevents, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_io_pgetevents_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .io_pgetevents = sys_io_pgetevents_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
 };
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct iocb cb, *cbs[1];
 	char data[4096];
 	int ret;
 
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	bad_addr = tst_get_bad_addr(NULL);
+	to.type = tv->type;
+	tst_ts_set_sec(&to, 0);
+	tst_ts_set_nsec(&to, 10000);
+
 	cbs[0] = &cb;
 
 	sigemptyset(&sigmask);
@@ -69,10 +95,16 @@ static void cleanup(void)
 
 static void run(unsigned int n)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct tcase *tc = &tcases[n];
+	struct timespec *to;
+	sigset_t *sigmask;
+
+	sigmask = tc->sigmask ? tc->sigmask : bad_addr;
+	to = tc->timeout ? tc->timeout : bad_addr;
 
-	TEST(io_pgetevents(*tc->ctx, tc->min_nr, tc->max_nr, tc->events,
-			   tc->timeout, tc->sigmask));
+	TEST(tv->io_pgetevents(*tc->ctx, tc->min_nr, tc->max_nr, tc->events, to,
+			       sigmask));
 
 	if (TST_RET == 1) {
 		tst_res(TFAIL, "%s: io_pgetevents() passed unexpectedly",
@@ -95,6 +127,7 @@ static struct tst_test test = {
 	.needs_tmpdir = 1,
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = run,
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 };
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
