Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA1BBDC41
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 12:38:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17D083C20CB
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 12:38:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 61C963C207B
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 12:38:22 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9810F600BF7
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 12:38:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0478A3082131;
 Wed, 25 Sep 2019 10:38:19 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A84FA6092D;
 Wed, 25 Sep 2019 10:38:17 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 25 Sep 2019 18:38:13 +0800
Message-Id: <20190925103813.16078-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 25 Sep 2019 10:38:19 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [Patch v4] fzsync: revoke thread_b if parent hits accidental
 break
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

We shouldn't rely entirely on the pair->exit flag in tst_fzsync_pair_cleanup()
since there is possible to call tst_brk() at anyplace of thread_a, that will
lead to timeout eventually because of thread_b(tst_fzsync_wait_b) fall into
an infinite(no explicit condition to exit) loop.

Thread_a path trace:
  tst_brk()
    cleanup()
      tst_fzsync_pair_cleanup()
        SAFE_PTHREAD_JOIN(pair->thread_b, NULL)
        #Or pthread_cancel(pair->thread_b)

We fix the problem via a way to kill thread_b with pthread_cancel. With new
wrap_run_b involves enabling thread cancel at the start of the thread B,
then do asynchronous cancellation in tst_fzsync_pair_cleanup if pair->exit
is not being set to 1.

Workaround: [commit 2e74d996: Check recvmmsg exists before entering fuzzy loop]
Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_fuzzy_sync.h | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index f9a1947c7..00c74e951 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -63,6 +63,7 @@
 #include <time.h>
 #include <math.h>
 #include <stdlib.h>
+#include <pthread.h>
 #include "tst_atomic.h"
 #include "tst_timer.h"
 #include "tst_safe_pthread.h"
@@ -218,12 +219,36 @@ static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
 static void tst_fzsync_pair_cleanup(struct tst_fzsync_pair *pair)
 {
 	if (pair->thread_b) {
-		tst_atomic_store(1, &pair->exit);
+		/* Revoke thread B if parent hits accidental break */
+		if (!pair->exit) {
+			tst_atomic_store(1, &pair->exit);
+			usleep(100000);
+			pthread_cancel(pair->thread_b);
+			pair->thread_b = 0;
+			return;
+		}
 		SAFE_PTHREAD_JOIN(pair->thread_b, NULL);
 		pair->thread_b = 0;
 	}
 }
 
+/**
+ * Wrap run_b for tst_fzsync_pair_reset to enable pthread cancel
+ * at the start of the thread B.
+ */
+static void *wrap_run_b(void *run_b)
+{
+       void *(*real_run_b)(void *) = run_b;
+
+       if (real_run_b) {
+	       pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
+	       pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
+	       (*real_run_b)(NULL);
+       }
+
+       return NULL;
+}
+
 /**
  * Zero some stat fields
  *
@@ -272,7 +297,7 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
 	pair->b_cntr = 0;
 	pair->exit = 0;
 	if (run_b)
-		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, run_b, 0);
+		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, wrap_run_b, run_b);
 
 	pair->exec_time_start = (float)tst_timeout_remaining();
 }
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
