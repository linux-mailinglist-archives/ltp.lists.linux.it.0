Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEB6A858B
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2019 16:20:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94E343C2158
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2019 16:20:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 03CB63C2130
 for <ltp@lists.linux.it>; Wed,  4 Sep 2019 16:20:48 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 72D002011FA
 for <ltp@lists.linux.it>; Wed,  4 Sep 2019 16:20:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BA013C0568FD;
 Wed,  4 Sep 2019 14:20:46 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18A3D5D6D0;
 Wed,  4 Sep 2019 14:20:45 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed,  4 Sep 2019 16:20:31 +0200
Message-Id: <2ded10ab8d989ba7ee0cc1e9f1ac28acdf14c947.1567606698.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 04 Sep 2019 14:20:46 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] fzsync: don't compare spins_avg (float) against 1
 (int)
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
Cc: rpalethorpe@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

tst_fzsync_pair.spins is increased at least by one on every iteration.
If during all calibration loops, both A and B manage to complete at
nearly same time, then spins is increased only by one.

spins_avg starts as 0, and tst_exp_moving_avg() will move it closer
and closer to 1, but it will never be 1:
        float f = 0; int i;
        for (i = 0; i < 4096; i++)
                f = tst_exp_moving_avg(0.25f, 1, f);
        printf("%.15f %d\n", f, f >= 1);
	$ 0.999999880790710 0

which on rare occasion can cause: "Can't calculate random delay".

Compare against float slightly smaller than 1.
Also print stats one more time when we hit the warning.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 include/tst_fuzzy_sync.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index de0402c9bbe9..2c0389c5d63e 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -73,6 +73,8 @@
 /* how much of exec time is sampling allowed to take */
 #define SAMPLING_SLICE 0.5f
 
+#define EPSILON 0.999f
+
 /** Some statistics for a variable */
 struct tst_fzsync_stat {
 	float avg;
@@ -477,7 +479,7 @@ static void tst_fzsync_pair_update(struct tst_fzsync_pair *pair)
 			tst_res(TINFO, "Minimum sampling period ended");
 			tst_fzsync_pair_info(pair);
 		}
-	} else if (fabsf(pair->diff_ab.avg) >= 1 && pair->spins_avg.avg >= 1) {
+	} else if (fabsf(pair->diff_ab.avg) > EPSILON && pair->spins_avg.avg > EPSILON) {
 		per_spin_time = fabsf(pair->diff_ab.avg) / pair->spins_avg.avg;
 		time_delay = drand48() * (pair->diff_sa.avg + pair->diff_sb.avg)
 			- pair->diff_sb.avg;
@@ -495,6 +497,7 @@ static void tst_fzsync_pair_update(struct tst_fzsync_pair *pair)
 		}
 	} else if (!pair->sampling) {
 		tst_res(TWARN, "Can't calculate random delay");
+		tst_fzsync_pair_info(pair);
 		pair->sampling = -1;
 	}
 
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
