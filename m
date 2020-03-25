Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB041925C6
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 11:37:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 017653C4BB4
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 11:37:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 563E43C4BAA
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 11:37:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 94C582011F1
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 11:37:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F0344ABD1
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 10:37:34 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>,
	ltp@lists.linux.it
Date: Wed, 25 Mar 2020 11:37:34 +0100
Message-Id: <20200325103734.31295-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] Fix use after stack unwind in fzsync lib
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

tst_fzsync_pair_reset() passes a local variable to thread B which may be
already unwinded by the time the thread wrapper function executes. If new
variables get allocated and initialized on stack between pthread_create()
and thread wrapper execution, thread B will segfault.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/tst_fuzzy_sync.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index c1d0b00f9..32b9859a0 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -242,11 +242,14 @@ struct tst_fzsync_run_thread {
  */
 static void *tst_fzsync_thread_wrapper(void *run_thread)
 {
-       struct tst_fzsync_run_thread t = *(struct tst_fzsync_run_thread *)run_thread;
+       struct tst_fzsync_run_thread *t = run_thread;
+       void *ret;
 
        pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
        pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
-       return t.func(t.arg);
+       ret = t->func(t->arg);
+       free(t);
+       return ret;
 }
 
 /**
@@ -297,8 +300,12 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
 	pair->b_cntr = 0;
 	pair->exit = 0;
 	if (run_b) {
-		struct tst_fzsync_run_thread wrap_run_b = {.func = run_b, .arg = NULL};
-		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, tst_fzsync_thread_wrapper, &wrap_run_b);
+		struct tst_fzsync_run_thread *wrap_run_b;
+
+		wrap_run_b = SAFE_MALLOC(sizeof(struct tst_fzsync_run_thread));
+		wrap_run_b->func = run_b;
+		wrap_run_b->arg = NULL;
+		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, tst_fzsync_thread_wrapper, wrap_run_b);
 	}
 
 	pair->exec_time_start = (float)tst_timeout_remaining();
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
