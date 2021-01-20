Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BA72FCB3E
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 08:01:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C08073C5DB7
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 08:01:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 444C43C2863
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 08:01:12 +0100 (CET)
Received: from atcsqa06.andestech.com (59-120-53-16.HINET-IP.hinet.net
 [59.120.53.16])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 8BB2A600B89
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 08:01:09 +0100 (CET)
Received: by atcsqa06.andestech.com (Postfix, from userid 5427)
 id 0B87FC2A18; Wed, 20 Jan 2021 15:01:05 +0800 (CST)
From: Leo Yu-Chi Liang <ycliang@andestech.com>
To: ltp@lists.linux.it,
	rpalethorpe@suse.com
Date: Wed, 20 Jan 2021 15:00:53 +0800
Message-Id: <20210120070053.11490-1-ycliang@andestech.com>
X-Mailer: git-send-email 2.17.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=PDS_RDNS_DYNAMIC_FP,
 RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] fzsync: Add sched_yield for single core machine
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

Fuzzy sync library uses spin waiting mechanism
to implement thread barrier behavior, which would
cause this test to be time-consuming on single core machine.

Fix this by adding sched_yield in the spin waiting loop,
so that the thread yields cpu as soon as it enters the waiting loop.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 include/tst_fuzzy_sync.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index 4141f5c64..64d172681 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -59,9 +59,11 @@
  * @sa tst_fzsync_pair
  */
 
+#include <sys/sysinfo.h>
 #include <sys/time.h>
 #include <time.h>
 #include <math.h>
+#include <sched.h>
 #include <stdlib.h>
 #include <pthread.h>
 #include "tst_atomic.h"
@@ -564,6 +566,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
 		       && tst_atomic_load(our_cntr) < INT_MAX) {
 			if (spins)
 				(*spins)++;
+			if(get_nprocs() == 1)
+				sched_yield();
 		}
 
 		tst_atomic_store(0, other_cntr);
@@ -581,6 +585,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
 		while (tst_atomic_load(our_cntr) < tst_atomic_load(other_cntr)) {
 			if (spins)
 				(*spins)++;
+			if(get_nprocs() == 1)
+				sched_yield();
 		}
 	}
 }
-- 
2.17.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
