Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8336E179340
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 16:24:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E2953C662C
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 16:24:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 3BFC63C6610
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 16:24:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C0E73201530
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 16:24:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 22C25ABCF
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 15:24:02 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Mar 2020 16:24:00 +0100
Message-Id: <20200304152401.7432-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 01/12] lib: Move tst_clock_name() to tst_clock.c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Move tst_clock_name() from tst_timer.c to tst_clock.c and add a few
missing clocks.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_clocks.h |  5 +++++
 include/tst_timer.h  |  5 -----
 lib/tst_clocks.c     | 31 +++++++++++++++++++++++++++++++
 lib/tst_timer.c      | 24 ------------------------
 4 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/include/tst_clocks.h b/include/tst_clocks.h
index 90784a3fd..f4a2c3301 100644
--- a/include/tst_clocks.h
+++ b/include/tst_clocks.h
@@ -28,4 +28,9 @@ int tst_clock_gettime(clockid_t clk_id, struct timespec *ts);
 
 int tst_clock_settime(clockid_t clk_id, struct timespec *ts);
 
+/*
+ * Converts clock id to a readable name.
+ */
+const char *tst_clock_name(clockid_t clk_id);
+
 #endif /* TST_CLOCKS__ */
diff --git a/include/tst_timer.h b/include/tst_timer.h
index d361aa2ed..de60bc62a 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -332,9 +332,4 @@ static inline long long tst_timer_elapsed_us(void)
 	return tst_timespec_to_us(tst_timer_elapsed());
 }
 
-/*
- * Returns a string containing given clock type name
- */
-const char *tst_clock_name(clockid_t);
-
 #endif /* TST_TIMER */
diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index fa2f1cb84..2eaa73b11 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -9,6 +9,7 @@
 #include "tst_test.h"
 #include "tst_clocks.h"
 #include "lapi/syscalls.h"
+#include "lapi/posix_clocks.h"
 
 int tst_clock_getres(clockid_t clk_id, struct timespec *res)
 {
@@ -24,3 +25,33 @@ int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
 {
 	return tst_syscall(__NR_clock_settime, clk_id, ts);
 }
+
+const char *tst_clock_name(clockid_t clk_id)
+{
+	switch (clk_id) {
+	case CLOCK_REALTIME:
+		return "CLOCK_REALTIME";
+	case CLOCK_MONOTONIC:
+		return "CLOCK_MONOTONIC";
+	case CLOCK_PROCESS_CPUTIME_ID:
+		return "CLOCK_PROCESS_CPUTIME_ID";
+	case CLOCK_THREAD_CPUTIME_ID:
+		return "CLOCK_THREAD_CPUTIME_ID";
+	case CLOCK_MONOTONIC_RAW:
+		return "CLOCK_MONOTONIC_RAW";
+	case CLOCK_REALTIME_COARSE:
+		return "CLOCK_REALTIME_COARSE";
+	case CLOCK_MONOTONIC_COARSE:
+		return "CLOCK_MONOTONIC_COARSE";
+	case CLOCK_BOOTTIME:
+		return "CLOCK_BOOTTIME";
+	case CLOCK_REALTIME_ALARM:
+		return "CLOCK_REALTIME_ALARM";
+	case CLOCK_BOOTTIME_ALARM:
+		return "CLOCK_BOOTTIME_ALARM";
+	case CLOCK_TAI:
+		return "CLOCK_TAI";
+	default:
+		return "INVALID/UNKNOWN CLOCK";
+	}
+}
diff --git a/lib/tst_timer.c b/lib/tst_timer.c
index f7f09f3d2..62d8f9080 100644
--- a/lib/tst_timer.c
+++ b/lib/tst_timer.c
@@ -15,30 +15,6 @@
 static struct timespec start_time, stop_time;
 static clockid_t clock_id;
 
-const char *tst_clock_name(clockid_t clk_id)
-{
-	switch (clk_id) {
-	case CLOCK_REALTIME:
-		return "CLOCK_REALTIME";
-	case CLOCK_REALTIME_COARSE:
-		return "CLOCK_REALTIME_COARSE";
-	case CLOCK_MONOTONIC:
-		return "CLOCK_MONOTONIC";
-	case CLOCK_MONOTONIC_COARSE:
-		return "CLOCK_MONOTONIC_COARSE";
-	case CLOCK_MONOTONIC_RAW:
-		return "CLOCK_MONOTONIC_RAW";
-	case CLOCK_BOOTTIME:
-		return "CLOCK_BOOTTIME";
-	case CLOCK_PROCESS_CPUTIME_ID:
-		return "CLOCK_PROCESS_CPUTIME_ID";
-	case CLOCK_THREAD_CPUTIME_ID:
-		return "CLOCK_THREAD_CPUTIME_ID";
-	default:
-		return "UNKNOWN/INVALID";
-	}
-}
-
 void tst_timer_check(clockid_t clk_id)
 {
 	if (tst_clock_gettime(clk_id, &start_time)) {
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
