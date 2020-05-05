Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC861C5198
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:12:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE7373C27CC
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:12:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 042E73C2671
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:12:15 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E6DC91A01201
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:12:14 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id 18so577164pfx.6
 for <ltp@lists.linux.it>; Tue, 05 May 2020 02:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DZv9qjNPyJAB+XmfsFLfqriRBrQbKVP9dqUipWpIJw8=;
 b=dXBF+CAs+QzF/CbCHFgVOBSDJa7lhHIDArZfXB0RCrfXDs7CBuramLqmo56soWNWtx
 2VTsoGs4HItm8mLEzKs9hcoRs1HoijlHMNoUJmEl0hMEofb9Z8T7YV9985qjA1aw6WkD
 PsGQs5BTLtOFeCUd3XfYtzVjLGAyVaiRWXnRqiyE6PEYKojesyB0/PIqyjrq/XtuGcHo
 tTIVAnAYD/r5WHJiElrzfftAspiaOEvfhsm8dj4ebgmYmyjCbBd7z/dQDPBLRs2wnGpp
 NnxTUylF004dWBy1Xv/W8ljWAIJCB3083O1j3GGf64hgNJVqY6MoKH0J/nw/eetq8RLP
 oqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DZv9qjNPyJAB+XmfsFLfqriRBrQbKVP9dqUipWpIJw8=;
 b=QueXMBAIF8VO+47V0U/1/ZyF1OW4LXVlyjQBPHcBlwC4uW0kbNITyudJ8XyyNQ0Xzo
 NYbvbapJCq2bR9y27h4xs9TwWWyujwYDzruGZXRA2og7UgddE/OOqJpvr/vh9Rfihk4d
 NPdPyxUVb1Gx/GVVXk8t1yN6+kMmQh6mfqIPO5mPF6A5TVNPoB3e6mnhzKR0Op+EDxPW
 8tax3uz4+Ak52gr8Xqv3U5dmSpyCu89+fT8PgEM79YHxV04e53YgUx0mTI9BiGcetN6s
 oWjOq2Vf1bj04YFVjXEM+xClBh+khsecxCA4zGNpaXNHOVqE/UPoAxXXj6EumhOZjLIr
 zvlw==
X-Gm-Message-State: AGi0PuZdOmXIYhVcp7IK0Ot5O4CtQJxosrLCAniM9zCjd/JgEPx9NRNy
 /wmAYqloQt+U/rC/NoTAkxttPlxOozs=
X-Google-Smtp-Source: APiQypJr1RPTtICpSZfLhUTMLSAS67XeVkZ/wRlv2TiM1Rbcu5P0cpBnp8XKIiYgkCjVK4sKiJbtIA==
X-Received: by 2002:a63:d84e:: with SMTP id k14mr947467pgj.91.1588669932940;
 Tue, 05 May 2020 02:12:12 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id d74sm1481168pfd.70.2020.05.05.02.12.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 02:12:12 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  5 May 2020 14:42:01 +0530
Message-Id: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/8] syscalls/futex: Merge futex_wait_bitset tests
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
index cbab5730c12e..d13f69fce829 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1663,7 +1663,6 @@ futex_wake02 futex_wake02
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
