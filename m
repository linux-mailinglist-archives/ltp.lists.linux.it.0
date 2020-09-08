Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D46260ACC
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:20:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5F573C2D63
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:20:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AFC513C53D9
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:01 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B72FE1400E16
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:00 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id w186so9304626pgb.8
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTZuO3BsOhQB1O/qcM7fo1qwC99mW9NdwyAfB2oTfKk=;
 b=nFcZlsdIy1fiNnY1f7Ytn7+03wgSsDd3q5Rv1Z6IKHMZShHIFg8Sm9vqKyQwHGBmm6
 YHZ6Q3bPvEvu3RhWP+0jfdypD9gfDdZVBW0vaF5uCDV9lQt7uZPsK/qJIIMVMs+zKKWT
 mjEhF8tWsIEqBPFW4b0H7DzB1MF0WH+88xX6Eb98iBwhQCSr3lZcgJYxIHTO2Ol+mTTC
 TJb72zACkkqgbD6yU2VkQwOHFpNpyH2fgVVpu55maIstougeGDai0W4myToU51kiB4yt
 1HGZOlSSgnjsoy7qefnsMX3OYvlNsl6FLR3qIHKl87rX/8FIha/WdYH6CzbEeR875cg0
 xnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTZuO3BsOhQB1O/qcM7fo1qwC99mW9NdwyAfB2oTfKk=;
 b=R2sodphNT4ZqzcbK4y0CWymK8ZXLAYkr7tCU9LzcAijCwx4bfhmR8rLwzX2LjWKrda
 d0sfvsrXaW3G9J5CxexAzMZ7TpXdVo3K9Pn2cNmnIpiujV6HdycuvGGkO3HolUomjo18
 2IMu1ooowfAb3hIt6n6bT1UXVCarRomncFnL0f+GaOCX1pWEigFCEkJwWXk7FF/n0jfG
 UOJTDa/ona2QjaxDtFtZDMdqmzw8SXf5YjPt6BmDYRqXLGMrAq8zIt3IFjULipSVUSbr
 SZqpQkVPHV9PyppIweBvGnCmApeUI+89FAgCJ/MAMbpQXSBYcL8ts+IfbsAUEA42a8Fa
 5ulA==
X-Gm-Message-State: AOAM533RfIEyrRTAgWuxAzM/jB1r1vTtrhOvGAbQ6T52AEJN+H9tPjVL
 J+Uhyiu1FWq8Xz14RcicjW7GmCPgLuKzbQ==
X-Google-Smtp-Source: ABdhPJyS1aN0ta7wLlaBLsvb53vMhDH8r2QDbjkJ6zdxDJRm7eRgUqI5J0R0HXpMmE+eg1f8T7CYXA==
X-Received: by 2002:a63:4a19:: with SMTP id x25mr18605209pga.56.1599545998971; 
 Mon, 07 Sep 2020 23:19:58 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id z11sm7632927pfc.181.2020.09.07.23.19.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:19:58 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:18 +0530
Message-Id: <938c530af0353358609b847350cd2e184452ecbd.1599545766.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1599545766.git.viresh.kumar@linaro.org>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 05/16] syscalls: io_pgetevents: Reuse struct
 time64_variants
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

Lets reuse the common structure here.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/io_pgetevents/io_pgetevents01.c   | 16 ++++++----------
 .../syscalls/io_pgetevents/io_pgetevents02.c   | 18 +++++++-----------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
index adeca3f3cf79..2a1aad8d9f96 100644
--- a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
@@ -5,6 +5,7 @@
  * Description:
  * Basic io_pgetevents() test to receive 1 event successfully.
  */
+#include "time64_variants.h"
 #include "tst_test.h"
 #include "tst_timer.h"
 #include "lapi/io_pgetevents.h"
@@ -12,18 +13,13 @@
 #ifdef HAVE_LIBAIO
 static int fd;
 
-static struct test_variants {
-	int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
-		struct io_event *events, void *timeout, sigset_t *sigmask);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_io_pgetevents != __LTP__NR_INVALID_SYSCALL)
-	{ .io_pgetevents = sys_io_pgetevents, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .io_pgetevents = sys_io_pgetevents, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_io_pgetevents_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .io_pgetevents = sys_io_pgetevents_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .io_pgetevents = sys_io_pgetevents_time64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
@@ -40,11 +36,11 @@ static void cleanup(void)
 
 static void run(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct io_event events[1];
 	struct iocb cb, *cbs[1];
 	io_context_t ctx = 0;
-	struct tst_ts to = tst_ts_from_ns(tv->type, 10000);
+	struct tst_ts to = tst_ts_from_ns(tv->ts_type, 10000);
 	sigset_t sigmask;
 	char data[4096];
 	int ret;
diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
index 885722fcad09..28afdb4a02d7 100644
--- a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
@@ -5,6 +5,7 @@
  * Description:
  * Basic io_pgetevents() test to check various failures.
  */
+#include "time64_variants.h"
 #include "tst_test.h"
 #include "tst_timer.h"
 #include "lapi/io_pgetevents.h"
@@ -36,31 +37,26 @@ static struct tcase {
 	{"invalid sigmask", &ctx, 1, 1, events, &to, NULL, EFAULT},
 };
 
-static struct test_variants {
-	int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
-		struct io_event *events, void *timeout, sigset_t *sigmask);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_io_pgetevents != __LTP__NR_INVALID_SYSCALL)
-	{ .io_pgetevents = sys_io_pgetevents, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .io_pgetevents = sys_io_pgetevents, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_io_pgetevents_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .io_pgetevents = sys_io_pgetevents_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .io_pgetevents = sys_io_pgetevents_time64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct iocb cb, *cbs[1];
 	char data[4096];
 	int ret;
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	bad_addr = tst_get_bad_addr(NULL);
-	to = tst_ts_from_ns(tv->type, 10000);
+	to = tst_ts_from_ns(tv->ts_type, 10000);
 
 	cbs[0] = &cb;
 
@@ -93,7 +89,7 @@ static void cleanup(void)
 
 static void run(unsigned int n)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct tcase *tc = &tcases[n];
 	struct timespec *to;
 	sigset_t *sigmask;
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
