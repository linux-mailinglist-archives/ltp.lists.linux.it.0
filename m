Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7734EBEFBA
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:35:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3EAFC3C22C6
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:35:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 203E23C2505
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:34:02 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C974714010D0
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 11:39:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C986A20E2;
 Thu, 26 Sep 2019 09:39:26 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76DD019C5B;
 Thu, 26 Sep 2019 09:39:25 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 26 Sep 2019 17:39:21 +0800
Message-Id: <20190926093921.21247-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 26 Sep 2019 09:39:26 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [Patch v4.1] fzsync: revoke thread_b if parent hits
 accidental break
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
thread wrapper involves enabling thread cancel at the start of the thread B,
then do asynchronous cancellation in tst_fzsync_pair_cleanup if pair->exit
is not being set to 1.

Workaround: [commit 2e74d996: Check recvmmsg exists before entering fuzzy loop]
Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Cyril Hrubis <chrubis@suse.cz>
Acked-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_fuzzy_sync.h | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index f9a1947c7..c1d0b00f9 100644
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
+		}
 		SAFE_PTHREAD_JOIN(pair->thread_b, NULL);
 		pair->thread_b = 0;
 	}
 }
 
+/** To store the run_b pointer and pass to tst_fzsync_thread_wrapper */
+struct tst_fzsync_run_thread {
+	void *(*func)(void *);
+	void *arg;
+};
+
+/**
+ * Wrap run_b for tst_fzsync_pair_reset to enable pthread cancel
+ * at the start of the thread B.
+ */
+static void *tst_fzsync_thread_wrapper(void *run_thread)
+{
+       struct tst_fzsync_run_thread t = *(struct tst_fzsync_run_thread *)run_thread;
+
+       pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
+       pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
+       return t.func(t.arg);
+}
+
 /**
  * Zero some stat fields
  *
@@ -271,8 +296,10 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
 	pair->a_cntr = 0;
 	pair->b_cntr = 0;
 	pair->exit = 0;
-	if (run_b)
-		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, run_b, 0);
+	if (run_b) {
+		struct tst_fzsync_run_thread wrap_run_b = {.func = run_b, .arg = NULL};
+		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, tst_fzsync_thread_wrapper, &wrap_run_b);
+	}
 
 	pair->exec_time_start = (float)tst_timeout_remaining();
 }
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
