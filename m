Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A835D87F
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 09:08:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5D1C3C7207
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 09:08:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C8873C25B1
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 09:08:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B72E41000D30
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 09:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618297687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNzUDenL7PqC0REmi1gsgSUoSZ9tMBPMHExSiRLyQpk=;
 b=cMuxXERKihqVCl4AOaszbgyvBU2y2P2Z1OPNpyFt3wZ+WTUIcG7PoX2RzvxSxlFjKzCaVt
 Br+nGF2/vBP+KsTppr7ETNzFV8CxWNjjW2U2dxeEctjLSdUNrTgQZVzMIa+kr/P31vq/pw
 pMDZxL6OEdy2IEIFAu4FTjnZAUrhKmA=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E75BAFF1;
 Tue, 13 Apr 2021 07:08:07 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 13 Apr 2021 08:07:51 +0100
Message-Id: <20210413070753.1691-6-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413070753.1691-1-rpalethorpe@suse.com>
References: <20210413070753.1691-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 5/7] fzsync: Move yield check out of loop and add
 yield to delay
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

During my testing I found no difference between having the branch
inside the loop and outside. However looking at the generated
assembly, it definitely does perform the branch inside the loop. This
could have an effect on some platform with worse branch prediction. So
I have moved the branch outside of the loop.

Also I have added sched_yield to the delay loop. If we only have one
CPU then it is not delaying anything unless the other process can
progress.

Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Acked-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Li Wang <liwang@redhat.com>
---
 include/tst_fuzzy_sync.h | 72 ++++++++++++++++++++++++++++++----------
 1 file changed, 54 insertions(+), 18 deletions(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index 5474f81e3..36a604e13 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -183,9 +183,9 @@ struct tst_fzsync_pair {
 	int exec_loop;
 	/** Internal; The second thread or 0 */
 	pthread_t thread_b;
-	/** 
-	 * Internal; The flag indicates single core machines or not
-	 * 
+	/**
+	 * The flag indicates single core machines or not
+	 *
 	 * If running on single core machines, it would take considerable
 	 * amount of time to run fuzzy sync library.
 	 * Thus call sched_yield to give up cpu to decrease the test time.
@@ -575,31 +575,53 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
 		 * line above before doing that. If we are in rear position
 		 * then our counter may already have been set to zero.
 		 */
-		while (tst_atomic_load(our_cntr) > 0
-		       && tst_atomic_load(our_cntr) < INT_MAX) {
-			if (spins)
-				(*spins)++;
-			if(yield_in_wait)
+		if (yield_in_wait) {
+			while (tst_atomic_load(our_cntr) > 0
+			       && tst_atomic_load(our_cntr) < INT_MAX) {
+				if (spins)
+					(*spins)++;
+
 				sched_yield();
+			}
+		} else {
+			while (tst_atomic_load(our_cntr) > 0
+			       && tst_atomic_load(our_cntr) < INT_MAX) {
+				if (spins)
+					(*spins)++;
+			}
 		}
 
+
 		tst_atomic_store(0, other_cntr);
 		/*
 		 * Once both counters have been set to zero the invariant
 		 * is restored and we can continue.
 		 */
-		while (tst_atomic_load(our_cntr) > 1)
-			;
+		if (yield_in_wait) {
+			while (tst_atomic_load(our_cntr) > 1)
+				sched_yield();
+		} else {
+			while (tst_atomic_load(our_cntr) > 1)
+				;
+		}
 	} else {
 		/*
 		 * If our counter is less than the other thread's we are ahead
 		 * of it and need to wait.
 		 */
-		while (tst_atomic_load(our_cntr) < tst_atomic_load(other_cntr)) {
-			if (spins)
-				(*spins)++;
-			if(yield_in_wait)
+		if (yield_in_wait) {
+			while (tst_atomic_load(our_cntr) <
+			       tst_atomic_load(other_cntr)) {
+				if (spins)
+					(*spins)++;
 				sched_yield();
+			}
+		} else {
+			while (tst_atomic_load(our_cntr) <
+			       tst_atomic_load(other_cntr)) {
+				if (spins)
+					(*spins)++;
+			}
 		}
 	}
 }
@@ -713,8 +735,15 @@ static inline void tst_fzsync_start_race_a(struct tst_fzsync_pair *pair)
 	tst_fzsync_wait_a(pair);
 
 	delay = pair->delay;
-	while (delay < 0)
-		delay++;
+	if (pair->yield_in_wait) {
+		while (delay < 0) {
+			sched_yield();
+			delay++;
+		}
+	} else {
+		while (delay < 0)
+			delay++;
+	}
 
 	tst_fzsync_time(&pair->a_start);
 }
@@ -744,8 +773,15 @@ static inline void tst_fzsync_start_race_b(struct tst_fzsync_pair *pair)
 	tst_fzsync_wait_b(pair);
 
 	delay = pair->delay;
-	while (delay > 0)
-		delay--;
+	if (pair->yield_in_wait) {
+		while (delay > 0) {
+			sched_yield();
+			delay--;
+		}
+	} else {
+		while (delay > 0)
+			delay--;
+	}
 
 	tst_fzsync_time(&pair->b_start);
 }
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
