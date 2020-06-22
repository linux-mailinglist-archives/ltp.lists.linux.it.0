Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AFF20427B
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 23:15:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DD7C3C2BEE
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 23:15:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DC7103C2237
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 23:15:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 504AC60171E
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 23:15:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58662AEF3;
 Mon, 22 Jun 2020 21:15:47 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Mon, 22 Jun 2020 22:15:34 +0100
Message-Id: <20200622211534.27270-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] fzsync: Add 10% margin of error to delay calculation
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

It appears that the number of spins required to align the start of A with the
end of B (or the opposite) can be underestimated by some small amount on
x86_64. The amount is probably highly dependant on architecture and other
factors. It may be non-linear, but hopefully 10% will cover most cases.

Consider the following race:

Thread B:
	tst_fzsync_start_race_b(&pair);
	nanosleep(&delay, NULL);
	winner = 'B';
	tst_fzsync_end_race_b(&pair);

Thread A:
	winner = 'A';

	tst_fzsync_start_race_a(&pair);
	if (winner == 'A' && winner == 'B')
		winner = 'A';
	tst_fzsync_end_race_a(&pair);

delay is 1ns, but nanosleep() takes about ~30,000-60000ns probably because of
context switching. The race window is only about 1 instruction and A can only
win if A is delayed for the entire time B is in the kernel.

Because the delay is slightly underestimated (approx by 1000ns on my machine)
this will only happen on rare occasions when A receives a small extra delay
for other reasons.

After adding 10% the race is usually won by A within 100K iterations (a few
seconds on my machine).

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_fuzzy_sync.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index 9ff3a78ae..4141f5c64 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -511,7 +511,7 @@ static void tst_fzsync_pair_update(struct tst_fzsync_pair *pair)
 		per_spin_time = fabsf(pair->diff_ab.avg) / MAX(pair->spins_avg.avg, 1.0f);
 		time_delay = drand48() * (pair->diff_sa.avg + pair->diff_sb.avg)
 			- pair->diff_sb.avg;
-		pair->delay += (int)(time_delay / per_spin_time);
+		pair->delay += (int)(1.1 * time_delay / per_spin_time);
 
 		if (!pair->sampling) {
 			tst_res(TINFO,
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
