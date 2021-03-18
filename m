Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E4934067A
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:10:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02B573C79DE
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:10:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 42AA93C2C85
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:10:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D646D1A016C8
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616073004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+L04J8JM7GjxdHEae98d3KRSTcGbIar/kwpSslmp4+k=;
 b=q4Vt1lplqkchGnnbGNjzZIm/QQXiyT/DXq8MsrrobjXAOF5xNt/DtVqJGeUaM2LuptDuN3
 M5sxMagYaqIDsDZc9q6RcI9S5REFOMS8jV614K+yT1iITS5NvalHYxq43tolyZHfsUj3L9
 WVgu1BEfwMQPK/uxugOGaCzDO+ytbYo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7176AAD71;
 Thu, 18 Mar 2021 13:10:04 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 18 Mar 2021 13:09:32 +0000
Message-Id: <20210318130935.28528-5-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318130935.28528-1-rpalethorpe@suse.com>
References: <20210318130935.28528-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/7] fzsync: Add sched_yield for single core machine
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Leo Yu-Chi Liang <ycliang@andestech.com>

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
index 4063e95cb..5474f81e3 100644
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
 
@@ -551,7 +564,8 @@ static void tst_fzsync_pair_update(struct tst_fzsync_pair *pair)
  */
 static inline void tst_fzsync_pair_wait(int *our_cntr,
 					int *other_cntr,
-					int *spins)
+					int *spins,
+					bool yield_in_wait)
 {
 	if (tst_atomic_inc(other_cntr) == INT_MAX) {
 		/*
@@ -565,6 +579,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
 		       && tst_atomic_load(our_cntr) < INT_MAX) {
 			if (spins)
 				(*spins)++;
+			if(yield_in_wait)
+				sched_yield();
 		}
 
 		tst_atomic_store(0, other_cntr);
@@ -582,6 +598,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
 		while (tst_atomic_load(our_cntr) < tst_atomic_load(other_cntr)) {
 			if (spins)
 				(*spins)++;
+			if(yield_in_wait)
+				sched_yield();
 		}
 	}
 }
@@ -594,7 +612,7 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
  */
 static inline void tst_fzsync_wait_a(struct tst_fzsync_pair *pair)
 {
-	tst_fzsync_pair_wait(&pair->a_cntr, &pair->b_cntr, NULL);
+	tst_fzsync_pair_wait(&pair->a_cntr, &pair->b_cntr, NULL, pair->yield_in_wait);
 }
 
 /**
@@ -605,7 +623,7 @@ static inline void tst_fzsync_wait_a(struct tst_fzsync_pair *pair)
  */
 static inline void tst_fzsync_wait_b(struct tst_fzsync_pair *pair)
 {
-	tst_fzsync_pair_wait(&pair->b_cntr, &pair->a_cntr, NULL);
+	tst_fzsync_pair_wait(&pair->b_cntr, &pair->a_cntr, NULL, pair->yield_in_wait);
 }
 
 /**
@@ -710,7 +728,7 @@ static inline void tst_fzsync_start_race_a(struct tst_fzsync_pair *pair)
 static inline void tst_fzsync_end_race_a(struct tst_fzsync_pair *pair)
 {
 	tst_fzsync_time(&pair->a_end);
-	tst_fzsync_pair_wait(&pair->a_cntr, &pair->b_cntr, &pair->spins);
+	tst_fzsync_pair_wait(&pair->a_cntr, &pair->b_cntr, &pair->spins, pair->yield_in_wait);
 }
 
 /**
@@ -741,7 +759,7 @@ static inline void tst_fzsync_start_race_b(struct tst_fzsync_pair *pair)
 static inline void tst_fzsync_end_race_b(struct tst_fzsync_pair *pair)
 {
 	tst_fzsync_time(&pair->b_end);
-	tst_fzsync_pair_wait(&pair->b_cntr, &pair->a_cntr, &pair->spins);
+	tst_fzsync_pair_wait(&pair->b_cntr, &pair->a_cntr, &pair->spins, pair->yield_in_wait);
 }
 
 /**
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
