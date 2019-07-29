Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9E78B3B
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 14:02:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA8823C1D1C
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 14:02:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 470ED3C1822
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 14:02:35 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 84BBD60091E
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 14:02:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D7843B61F
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 12:02:32 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 29 Jul 2019 14:02:22 +0200
Message-Id: <20190729120222.4717-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/clock_gettime: Ported clock_gettime03.c
 to new API
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

From: Christian Amann <camann@suse.com>

NOTE: test is still a mess, even after porting it.
Cleaning it up would probably be its own patch as the best
solution would be to rewrite it from scratch.

Signed-off-by: Christian Amann <camann@suse.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

rebased Christian's the original patch
https://patchwork.ozlabs.org/patch/1135431/
http://lists.linux.it/pipermail/ltp/2019-July/012862.html

Kind regards,
Petr

 .../syscalls/clock_gettime/clock_gettime03.c  | 174 ++++++++----------
 1 file changed, 80 insertions(+), 94 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
index 6f025509f..73078fb69 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
@@ -1,3 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Red Hat, Inc., 2012.
+ * Copyright (c) Linux Test Project, 2019
+ *
+ * Author:	Lingzhu Xiang <lxiang@redhat.com>
+ *
+ * Ported to new library:
+ * 07/2019	Christian Amann <camann@suse.com>
+ */
 /*
  * Regression test for hrtimer early expiration during and after leap seconds
  *
@@ -7,60 +17,36 @@
  *
  * This is a regression test for the bug.
  *
- * Lingzhu Xiang <lxiang@redhat.com> Copyright (c) Red Hat, Inc., 2012.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
+ * Note: running this test simultaneously with a timesync daemon
+ * (e.g. systemd-timesyncd) can cause this test to fail.
  */
 
 #include <sys/types.h>
-#include <sys/time.h>
-#include <sys/timex.h>
 #include <errno.h>
-#include <stdlib.h>
+#include <stdio.h>
 #include <time.h>
-#include "test.h"
+#include "tst_test.h"
+#include "tst_safe_clocks.h"
 #include "lapi/common_timers.h"
 
 #define SECONDS_BEFORE_LEAP 2
 #define SECONDS_AFTER_LEAP 2
 
-char *TCID = "clock_gettime03";
-int TST_TOTAL = 1;
-
-static inline int in_order(struct timespec a, struct timespec b);
-static void adjtimex_status(struct timex *tx, int status);
-static const char *strtime(const struct timespec *now);
-static void test_hrtimer_early_expiration(void);
-static void run_leapsec(void);
-static void setup(void);
-static void cleanup(void);
+static int errors;
 
-int main(int argc, char **argv)
+static const char *strtime(const struct timespec *now)
 {
-	int lc;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
+	static char fmt[256], buf[256];
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		run_leapsec();
+	if (snprintf(fmt, sizeof(fmt), "%%T.%09ld", now->tv_nsec) < 0) {
+		buf[0] = '\0';
+		return buf;
 	}
-
-	cleanup();
-	tst_exit();
+	if (!strftime(buf, sizeof(buf), fmt, localtime(&now->tv_sec))) {
+		buf[0] = '\0';
+		return buf;
+	}
+	return buf;
 }
 
 static inline int in_order(struct timespec a, struct timespec b)
@@ -84,64 +70,53 @@ static void adjtimex_status(struct timex *tx, int status)
 		"leap second has occurred",
 		"clock not synchronized",
 	};
-	int r;
+
+	int ret;
 	struct timespec now;
 
 	tx->modes = ADJ_STATUS;
 	tx->status = status;
-	r = adjtimex(tx);
+	ret = adjtimex(tx);
 	now.tv_sec = tx->time.tv_sec;
 	now.tv_nsec = tx->time.tv_usec * 1000;
 
 	if ((tx->status & status) != status)
-		tst_brkm(TBROK, cleanup, "adjtimex status %d not set", status);
-	else if (r < 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "adjtimex");
-	else if (r < 6)
-		tst_resm(TINFO, "%s adjtimex: %s", strtime(&now), msgs[r]);
+		tst_brk(TBROK, "adjtimex status %d not set", status);
+	else if (ret < 0)
+		tst_brk(TBROK | TERRNO, "adjtimex");
+	else if (ret < 6)
+		tst_res(TINFO, "%s adjtimex: %s", strtime(&now), msgs[ret]);
 	else
-		tst_resm(TINFO, "%s adjtimex: clock state %d",
-			 strtime(&now), r);
-}
-
-static const char *strtime(const struct timespec *now)
-{
-	static char fmt[256], buf[256];
-
-	if (snprintf(fmt, sizeof(fmt), "%%F %%T.%09ld %%z", now->tv_nsec) < 0) {
-		buf[0] = '\0';
-		return buf;
-	}
-	if (!strftime(buf, sizeof(buf), fmt, localtime(&now->tv_sec))) {
-		buf[0] = '\0';
-		return buf;
-	}
-	return buf;
+		tst_res(TINFO, "%s adjtimex: clock state %d",
+			 strtime(&now), ret);
 }
 
 static void test_hrtimer_early_expiration(void)
 {
 	struct timespec now, target;
-	int r, fail;
+	int ret;
 
-	clock_gettime(CLOCK_REALTIME, &now);
-	tst_resm(TINFO, "now is     %s", strtime(&now));
+	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, &now);
+	tst_res(TINFO, "now is     %s", strtime(&now));
 
 	target = now;
 	target.tv_sec++;
-	tst_resm(TINFO, "sleep till %s", strtime(&target));
-	r = clock_nanosleep(CLOCK_REALTIME, TIMER_ABSTIME, &target, NULL);
-	if (r < 0) {
-		tst_resm(TINFO | TERRNO, "clock_nanosleep");
+	tst_res(TINFO, "sleep until %s", strtime(&target));
+	ret = clock_nanosleep(CLOCK_REALTIME, TIMER_ABSTIME, &target, NULL);
+	if (ret < 0) {
+		tst_res(TINFO | TERRNO, "clock_nanosleep");
 		return;
 	}
 
-	clock_gettime(CLOCK_REALTIME, &now);
-	tst_resm(TINFO, "now is     %s", strtime(&now));
+	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, &now);
+	tst_res(TINFO, "now is     %s", strtime(&now));
 
-	fail = !in_order(target, now);
-	tst_resm(fail ? TFAIL : TINFO, "hrtimer early expiration is %s.",
-		 fail ? "detected" : "not detected");
+	if (in_order(target, now)) {
+		tst_res(TINFO, "hrtimer early expiration is not detected.");
+	} else {
+		tst_res(TFAIL, "hrtimer early expiration is detected.");
+		errors++;
+	}
 }
 
 static void run_leapsec(void)
@@ -150,9 +125,9 @@ static void run_leapsec(void)
 	struct timespec now, leap, start;
 	struct timex tx;
 
-	clock_gettime(CLOCK_REALTIME, &now);
+	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, &now);
 	start = now;
-	tst_resm(TINFO, "test start at %s", strtime(&now));
+	tst_res(TINFO, "test start at %s", strtime(&now));
 
 	test_hrtimer_early_expiration();
 
@@ -160,13 +135,13 @@ static void run_leapsec(void)
 	now.tv_sec += 86400 - now.tv_sec % 86400;
 	now.tv_nsec = 0;
 	leap = now;
-	tst_resm(TINFO, "scheduling leap second %s", strtime(&leap));
+	tst_res(TINFO, "scheduling leap second %s", strtime(&leap));
 
 	/* start before the leap second */
 	now.tv_sec -= SECONDS_BEFORE_LEAP;
-	if (clock_settime(CLOCK_REALTIME, &now) < 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "clock_settime");
-	tst_resm(TINFO, "setting time to        %s", strtime(&now));
+	SAFE_CLOCK_SETTIME(CLOCK_REALTIME, &now);
+
+	tst_res(TINFO, "setting time to        %s", strtime(&now));
 
 	/* reset NTP time state */
 	adjtimex_status(&tx, STA_PLL);
@@ -175,7 +150,7 @@ static void run_leapsec(void)
 	/* set the leap second insert flag */
 	adjtimex_status(&tx, STA_INS);
 
-	/* reliably sleep till after the leap second */
+	/* reliably sleep until after the leap second */
 	while (tx.time.tv_sec < leap.tv_sec + SECONDS_AFTER_LEAP) {
 		adjtimex_status(&tx, tx.status);
 		clock_nanosleep(CLOCK_MONOTONIC, 0, &sleeptime, NULL);
@@ -187,31 +162,42 @@ static void run_leapsec(void)
 	adjtimex_status(&tx, 0);
 
 	/* recover from timer expiring state and restore time */
-	clock_gettime(CLOCK_REALTIME, &now);
+	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, &now);
 	start.tv_sec += now.tv_sec - (leap.tv_sec - SECONDS_BEFORE_LEAP);
 	start.tv_nsec += now.tv_nsec;
 	start.tv_sec += start.tv_nsec / NSEC_PER_SEC;
 	start.tv_nsec = start.tv_nsec % NSEC_PER_SEC;
-	tst_resm(TINFO, "restoring time to %s", strtime(&start));
+	tst_res(TINFO, "restoring time to %s", strtime(&start));
 	/* calls clock_was_set() in kernel to revert inconsistency */
-	if (clock_settime(CLOCK_REALTIME, &start) < 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "clock_settime");
+	SAFE_CLOCK_SETTIME(CLOCK_REALTIME, &start);
 
 	test_hrtimer_early_expiration();
+
+	if (!errors)
+		tst_res(TPASS, "No errors were reported during this test!");
+	else
+		tst_res(TFAIL, "Got %d errors during this test!", errors);
+
 }
 
 static void setup(void)
 {
-	tst_require_root();
-	tst_sig(NOFORK, DEF_HANDLER, CLEANUP);
-	TEST_PAUSE;
+	errors = 0;
 }
 
 static void cleanup(void)
 {
 	struct timespec now;
-	clock_gettime(CLOCK_REALTIME, &now);
-	/* Calls clock_was_set() in kernel to revert inconsistency.
-	 * The only possible EPERM doesn't matter here. */
-	clock_settime(CLOCK_REALTIME, &now);
+
+	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, &now);
+	/* Calls clock_was_set() in the kernel to revert inconsistencies.
+	 * The only possible error EPERM doesn't matter here. */
+	SAFE_CLOCK_SETTIME(CLOCK_REALTIME, &now);
 }
+
+static struct tst_test test = {
+	.test_all = run_leapsec,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+};
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
