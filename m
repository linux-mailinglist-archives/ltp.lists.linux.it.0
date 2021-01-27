Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FC0304F7D
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 04:19:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3AE803C04D0
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 04:19:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 780BD3C020C
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 04:19:08 +0100 (CET)
Received: from atcsqa06.andestech.com (59-120-53-16.HINET-IP.hinet.net
 [59.120.53.16])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B3A971400752
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 04:19:05 +0100 (CET)
Received: by atcsqa06.andestech.com (Postfix, from userid 5427)
 id B1598C2A18; Wed, 27 Jan 2021 11:19:03 +0800 (CST)
From: Leo Yu-Chi Liang <ycliang@andestech.com>
To: ltp@lists.linux.it,
	rpalethorpe@suse.de
Date: Wed, 27 Jan 2021 11:18:53 +0800
Message-Id: <20210127031853.3485-1-ycliang@andestech.com>
X-Mailer: git-send-email 2.17.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=PDS_RDNS_DYNAMIC_FP,
 RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] fzsync: Add sched_yield for single core machine
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Fuzzy sync library uses spin waiting mechanism to implement thread
barrier behavior, which would cause this test to be time-consuming
on single core machine.

Fix this by adding sched_yield in the spin waiting loop, so that the
thread yields cpu as soon as it enters the waiting loop.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 include/tst_fuzzy_sync.h | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index 4141f5c64..37f3d06f2 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -59,12 +59,15 @@
  * @sa tst_fzsync_pair
  */
 
-#include <sys/time.h>
-#include <time.h>
 #include <math.h>
-#include <stdlib.h>
 #include <pthread.h>
+#include <sched.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <sys/time.h>
+#include <time.h>
 #include "tst_atomic.h"
+#include "tst_cpu.h"
 #include "tst_timer.h"
 #include "tst_safe_pthread.h"
 
@@ -180,6 +183,15 @@ struct tst_fzsync_pair {
 	int exec_loop;
 	/** Internal; The second thread or 0 */
 	pthread_t thread_b;
+	/** 
+	 * Internal; The flag indicates single core machines or not
+	 * 
+	 * If running on single core machines, it would take considerable
+	 * amount of time to run fuzzy sync library.
+	 * Thus call sched_yield to give up cpu to decrease the test time.
+	 */
+	bool yield_in_wait;
+
 };
 
 #define CHK(param, low, hi, def) do {					      \
@@ -206,6 +218,7 @@ static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
 	CHK(max_dev_ratio, 0, 1, 0.1);
 	CHK(exec_time_p, 0, 1, 0.5);
 	CHK(exec_loops, 20, INT_MAX, 3000000);
+	CHK(yield_in_wait, 0, 1, (tst_ncpus() <= 1));
 }
 #undef CHK
 
@@ -550,7 +563,8 @@ static void tst_fzsync_pair_update(struct tst_fzsync_pair *pair)
  */
 static inline void tst_fzsync_pair_wait(int *our_cntr,
 					int *other_cntr,
-					int *spins)
+					int *spins,
+					bool yield_in_wait)
 {
 	if (tst_atomic_inc(other_cntr) == INT_MAX) {
 		/*
@@ -564,6 +578,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
 		       && tst_atomic_load(our_cntr) < INT_MAX) {
 			if (spins)
 				(*spins)++;
+			if(yield_in_wait)
+				sched_yield();
 		}
 
 		tst_atomic_store(0, other_cntr);
@@ -581,6 +597,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
 		while (tst_atomic_load(our_cntr) < tst_atomic_load(other_cntr)) {
 			if (spins)
 				(*spins)++;
+			if(yield_in_wait)
+				sched_yield();
 		}
 	}
 }
@@ -593,7 +611,7 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
  */
 static inline void tst_fzsync_wait_a(struct tst_fzsync_pair *pair)
 {
-	tst_fzsync_pair_wait(&pair->a_cntr, &pair->b_cntr, NULL);
+	tst_fzsync_pair_wait(&pair->a_cntr, &pair->b_cntr, NULL, pair->yield_in_wait);
 }
 
 /**
@@ -604,7 +622,7 @@ static inline void tst_fzsync_wait_a(struct tst_fzsync_pair *pair)
  */
 static inline void tst_fzsync_wait_b(struct tst_fzsync_pair *pair)
 {
-	tst_fzsync_pair_wait(&pair->b_cntr, &pair->a_cntr, NULL);
+	tst_fzsync_pair_wait(&pair->b_cntr, &pair->a_cntr, NULL, pair->yield_in_wait);
 }
 
 /**
@@ -709,7 +727,7 @@ static inline void tst_fzsync_start_race_a(struct tst_fzsync_pair *pair)
 static inline void tst_fzsync_end_race_a(struct tst_fzsync_pair *pair)
 {
 	tst_fzsync_time(&pair->a_end);
-	tst_fzsync_pair_wait(&pair->a_cntr, &pair->b_cntr, &pair->spins);
+	tst_fzsync_pair_wait(&pair->a_cntr, &pair->b_cntr, &pair->spins, pair->yield_in_wait);
 }
 
 /**
@@ -740,7 +758,7 @@ static inline void tst_fzsync_start_race_b(struct tst_fzsync_pair *pair)
 static inline void tst_fzsync_end_race_b(struct tst_fzsync_pair *pair)
 {
 	tst_fzsync_time(&pair->b_end);
-	tst_fzsync_pair_wait(&pair->b_cntr, &pair->a_cntr, &pair->spins);
+	tst_fzsync_pair_wait(&pair->b_cntr, &pair->a_cntr, &pair->spins, pair->yield_in_wait);
 }
 
 /**
-- 
2.17.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
