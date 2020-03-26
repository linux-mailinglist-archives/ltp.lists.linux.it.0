Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF07193EC1
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 13:23:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 304D23C4B4D
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 13:23:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4774A3C3361
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 13:23:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9E002601482
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 13:23:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F3F38B11A
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 12:23:29 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>,
	ltp@lists.linux.it
Date: Thu, 26 Mar 2020 13:23:29 +0100
Message-Id: <20200326122329.24876-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Fix use after stack unwind in fzsync lib
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

Changes since v1:
- Use tst_alloc() instead of SAFE_MALLOC() to prevent memory leak even if
  SAFE_PTHREAD_CREATE() fails
- Revert changes in tst_fzsync_thread_wrapper() as they're no longer needed

 include/tst_fuzzy_sync.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index c1d0b00f9..8b38cf37d 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -297,8 +297,12 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
 	pair->b_cntr = 0;
 	pair->exit = 0;
 	if (run_b) {
-		struct tst_fzsync_run_thread wrap_run_b = {.func = run_b, .arg = NULL};
-		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, tst_fzsync_thread_wrapper, &wrap_run_b);
+		struct tst_fzsync_run_thread *wrap_run_b;
+
+		wrap_run_b = tst_alloc(sizeof(struct tst_fzsync_run_thread));
+		wrap_run_b->func = run_b;
+		wrap_run_b->arg = NULL;
+		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, tst_fzsync_thread_wrapper, wrap_run_b);
 	}
 
 	pair->exec_time_start = (float)tst_timeout_remaining();
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
