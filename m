Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF961D72AE
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:16:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F11073C4F26
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:16:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7393E3C4F40
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:35 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F0A2E600E3F
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:11 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id n15so4679142pjt.4
 for <ltp@lists.linux.it>; Mon, 18 May 2020 01:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/DWOemhbNvyhZ478luU8i+fSPafF+IViXJO7qpmFwsw=;
 b=BqIB2cG2disRF3VjJRouPxH0uAN3uCHqvzbgAxz7b4OoVewvPgQfBW/5GCzz4hFBhL
 9YOd61Ri4wLVS+Oarw+qe5GpGBun02S6OzKkioe4AQM2d02Z7ySyGyQJVA176azLBlYI
 ml/mOJD8MVpVuxQyAhGlKzY0Vmpmw8NTESJEZZlAyde8fRLC+uqu6BHDwjnswiuuLZXf
 8txmRxYiU3bq0rNNTtIqasJeQ1yZ9IErEZeJa+ITRowBkKOIbMdNjsFPUOPgK7kZA5IA
 8m8p/Dmt83REkEormqTx70vWi0rFZSAnpYAt3CreDYNRIHH9Mor5ASmDxcwzOKNm0WAj
 HlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/DWOemhbNvyhZ478luU8i+fSPafF+IViXJO7qpmFwsw=;
 b=Ct6svj7dNr75zGHj43JC7qMXMYwVYHFmQG8vETI3211P51LNSXtAmOwWLSQpBeI7DQ
 PUdI7M/b0V93dvYXKD2L4YzUsKvam6wdjSzCtIDDds4ludo9/IVSk4Gr2PG8I76ovNi7
 kGzKwNyh8MwAIDrL44JDuhF4H3uCdfQ8jIz4FndANYiOWB49Lh1lWYOvBggwhFezLLOu
 bk4f4bSR1BX8+RtDHc/g6HfotugMmQ+XB4OFwMFqvdEeP8BiEFJPhkGXE4I7h5prG927
 8B5j6Eld9kCNrigkXvc57iVrAz74pJQEynumqTJuLwdVtsvcuddzSjml5MDAv4anseWY
 vkeA==
X-Gm-Message-State: AOAM530eARGfnwFBzsn8xEYk0/1ItfHCbJWJAZxOcjsLDo2t9cV9vXVh
 4KRIKvti+zR5zUlioMx9rBvHvakZyEk=
X-Google-Smtp-Source: ABdhPJxUT3GSg+fJeibHXn4orrK5YIAaBqPGmmPNCj1mZSwXgMkvaTuWN6/Hn0ubyt3B8BwCEnuH1Q==
X-Received: by 2002:a17:90b:4c89:: with SMTP id
 my9mr18386560pjb.216.1589789732795; 
 Mon, 18 May 2020 01:15:32 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id 188sm5010273pfu.165.2020.05.18.01.15.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 01:15:32 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 18 May 2020 13:44:57 +0530
Message-Id: <c3eb1b156f7a706d6dad503678726c3579f59520.1589789487.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1589789487.git.viresh.kumar@linaro.org>
References: <cover.1589789487.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V3 05/17] syscalls/futex: Merge futex_wait_bitset tests
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

We can handle them easily in a single test, lets do it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---
 runtest/syscalls                              |  1 -
 testcases/kernel/syscalls/futex/.gitignore    |  1 -
 testcases/kernel/syscalls/futex/Makefile      |  1 -
 .../kernel/syscalls/futex/futex_wait_bitset.h | 75 -------------------
 .../syscalls/futex/futex_wait_bitset01.c      | 73 +++++++++++++++++-
 .../syscalls/futex/futex_wait_bitset02.c      | 18 -----
 6 files changed, 71 insertions(+), 98 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/futex/futex_wait_bitset.h
 delete mode 100644 testcases/kernel/syscalls/futex/futex_wait_bitset02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index edd3e8de7861..4a19075cd131 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1664,7 +1664,6 @@ futex_wake02 futex_wake02
 futex_wake03 futex_wake03
 futex_wake04 futex_wake04
 futex_wait_bitset01 futex_wait_bitset01
-futex_wait_bitset02 futex_wait_bitset02
 
 memfd_create01 memfd_create01
 memfd_create02 memfd_create02
diff --git a/testcases/kernel/syscalls/futex/.gitignore b/testcases/kernel/syscalls/futex/.gitignore
index 68bc2028e1b2..54cd02b0223f 100644
--- a/testcases/kernel/syscalls/futex/.gitignore
+++ b/testcases/kernel/syscalls/futex/.gitignore
@@ -6,7 +6,6 @@
 /futex_wait04
 /futex_wait05
 /futex_wait_bitset01
-/futex_wait_bitset02
 /futex_wake01
 /futex_wake02
 /futex_wake03
diff --git a/testcases/kernel/syscalls/futex/Makefile b/testcases/kernel/syscalls/futex/Makefile
index 8dd239301e63..c88af7c9643b 100644
--- a/testcases/kernel/syscalls/futex/Makefile
+++ b/testcases/kernel/syscalls/futex/Makefile
@@ -12,7 +12,6 @@ futex_wake02: CFLAGS+=-pthread
 futex_wake04: CFLAGS+=-pthread
 futex_wait05: LDLIBS+=-lrt
 futex_wait_bitset01: LDLIBS+=-lrt
-futex_wait_bitset02: LDLIBS+=-lrt
 
 include $(top_srcdir)/include/mk/testcases.mk
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/futex/futex_wait_bitset.h b/testcases/kernel/syscalls/futex/futex_wait_bitset.h
deleted file mode 100644
index 84712816bfe8..000000000000
--- a/testcases/kernel/syscalls/futex/futex_wait_bitset.h
+++ /dev/null
@@ -1,75 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2015 Cyril Hrubis <chrubis@suse.cz>
- */
-
-#define THRESHOLD_US 100000
-#define DEFAULT_TIMEOUT_US 100010
-
-static void verify_futex_wait_bitset(long long wait_us, clock_t clk_id)
-{
-	struct timespec start, to, end;
-	futex_t futex = FUTEX_INITIALIZER;
-	u_int32_t bitset = 0xffffffff;
-	int flags = clk_id == CLOCK_REALTIME ? FUTEX_CLOCK_REALTIME : 0;
-
-	tst_res(TINFO, "testing futex_wait_bitset() timeout with %s",
-		clk_id == CLOCK_REALTIME ? "CLOCK_REALTIME" : "CLOCK_MONOTONIC");
-
-	clock_gettime(clk_id, &start);
-	to = tst_timespec_add_us(start, wait_us);
-
-	TEST(futex_wait_bitset(&futex, futex, &to, bitset, flags));
-
-	clock_gettime(clk_id, &end);
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "futex_wait_bitset() returned %li, expected -1",
-			TST_RET);
-		return;
-	}
-
-	if (TST_ERR == ENOSYS) {
-		tst_res(TCONF,
-			"In this kernel, futex() does not support FUTEX_WAIT_BITSET operation");
-		return;
-	}
-
-	if (TST_ERR != ETIMEDOUT) {
-		tst_res(TFAIL | TTERRNO, "expected %s",
-			tst_strerrno(ETIMEDOUT));
-		return;
-	}
-
-	if (tst_timespec_lt(end, to)) {
-		tst_res(TFAIL,
-			"futex_wait_bitset() woken up prematurely %llius, expected %llius",
-			tst_timespec_diff_us(end, start), wait_us);
-		return;
-	}
-
-	if (tst_timespec_diff_us(end, to) > THRESHOLD_US) {
-		tst_res(TFAIL,
-			"futex_wait_bitset() waited too long %llius, expected %llius",
-			tst_timespec_diff_us(end, start), wait_us);
-		return;
-	}
-
-	tst_res(TPASS, "futex_wait_bitset() waited %llius, expected %llius",
-		tst_timespec_diff_us(end, start), wait_us);
-}
-
-static void setup(void)
-{
-	tst_timer_check(USE_CLOCK);
-}
-
-static void run(void)
-{
-	verify_futex_wait_bitset(DEFAULT_TIMEOUT_US, USE_CLOCK);
-}
-
-static struct tst_test test = {
-	.setup = setup,
-	.test_all = run,
-};
diff --git a/testcases/kernel/syscalls/futex/futex_wait_bitset01.c b/testcases/kernel/syscalls/futex/futex_wait_bitset01.c
index 1ae3253cfe13..b8546c3e640c 100644
--- a/testcases/kernel/syscalls/futex/futex_wait_bitset01.c
+++ b/testcases/kernel/syscalls/futex/futex_wait_bitset01.c
@@ -13,7 +13,76 @@
 #include "tst_timer.h"
 #include "futextest.h"
 
-#define USE_CLOCK CLOCK_MONOTONIC
+#define THRESHOLD_US 100000
+#define DEFAULT_TIMEOUT_US 100010
 
-#include "futex_wait_bitset.h"
+static struct test_case_t {
+	clockid_t clk_id;
+} tcases[] = {
+	{ CLOCK_MONOTONIC },
+	{ CLOCK_REALTIME }
+};
 
+static void verify_futex_wait_bitset(long long wait_us, clock_t clk_id)
+{
+	struct timespec start, to, end;
+	futex_t futex = FUTEX_INITIALIZER;
+	u_int32_t bitset = 0xffffffff;
+	int flags = clk_id == CLOCK_REALTIME ? FUTEX_CLOCK_REALTIME : 0;
+
+	tst_res(TINFO, "testing futex_wait_bitset() timeout with %s",
+		clk_id == CLOCK_REALTIME ? "CLOCK_REALTIME" : "CLOCK_MONOTONIC");
+
+	clock_gettime(clk_id, &start);
+	to = tst_timespec_add_us(start, wait_us);
+
+	TEST(futex_wait_bitset(&futex, futex, &to, bitset, flags));
+
+	clock_gettime(clk_id, &end);
+
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "futex_wait_bitset() returned %li, expected -1",
+			TST_RET);
+		return;
+	}
+
+	if (TST_ERR == ENOSYS) {
+		tst_res(TCONF,
+			"In this kernel, futex() does not support FUTEX_WAIT_BITSET operation");
+		return;
+	}
+
+	if (TST_ERR != ETIMEDOUT) {
+		tst_res(TFAIL | TTERRNO, "expected %s",
+			tst_strerrno(ETIMEDOUT));
+		return;
+	}
+
+	if (tst_timespec_lt(end, to)) {
+		tst_res(TFAIL,
+			"futex_wait_bitset() woken up prematurely %llius, expected %llius",
+			tst_timespec_diff_us(end, start), wait_us);
+		return;
+	}
+
+	if (tst_timespec_diff_us(end, to) > THRESHOLD_US) {
+		tst_res(TFAIL,
+			"futex_wait_bitset() waited too long %llius, expected %llius",
+			tst_timespec_diff_us(end, start), wait_us);
+		return;
+	}
+
+	tst_res(TPASS, "futex_wait_bitset() waited %llius, expected %llius",
+		tst_timespec_diff_us(end, start), wait_us);
+}
+
+static void run(unsigned int n)
+{
+	tst_timer_check(tcases[n].clk_id);
+	verify_futex_wait_bitset(DEFAULT_TIMEOUT_US, tcases[n].clk_id);
+}
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases),
+};
diff --git a/testcases/kernel/syscalls/futex/futex_wait_bitset02.c b/testcases/kernel/syscalls/futex/futex_wait_bitset02.c
deleted file mode 100644
index 4d532fc07775..000000000000
--- a/testcases/kernel/syscalls/futex/futex_wait_bitset02.c
+++ /dev/null
@@ -1,18 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2015 Cyril Hrubis <chrubis@suse.cz>
- *
- * 1. Block on a bitset futex and wait for timeout, the difference between
- *    normal futex and bitset futex is that that the later have absolute timeout.
- * 2. Check that the futex waited for expected time.
- */
-
-#include <errno.h>
-
-#include "tst_test.h"
-#include "tst_timer.h"
-#include "futextest.h"
-
-#define USE_CLOCK CLOCK_REALTIME
-
-#include "futex_wait_bitset.h"
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
