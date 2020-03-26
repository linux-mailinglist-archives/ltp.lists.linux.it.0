Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 591CA19432E
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 16:28:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 215A63C4B50
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 16:28:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8A66B3C0137
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 16:28:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E884C201443
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 16:28:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20341AE8A
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 15:28:29 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>,
	ltp@lists.linux.it
Date: Thu, 26 Mar 2020 16:28:28 +0100
Message-Id: <20200326152828.14934-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3] Fix use after stack unwind in fzsync lib
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

Changes since v2:
- Use static local variable instead to prevent memory leaks

 include/tst_fuzzy_sync.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
index c1d0b00f9..9ff3a78ae 100644
--- a/include/tst_fuzzy_sync.h
+++ b/include/tst_fuzzy_sync.h
@@ -297,7 +297,10 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
 	pair->b_cntr = 0;
 	pair->exit = 0;
 	if (run_b) {
-		struct tst_fzsync_run_thread wrap_run_b = {.func = run_b, .arg = NULL};
+		static struct tst_fzsync_run_thread wrap_run_b;
+
+		wrap_run_b.func = run_b;
+		wrap_run_b.arg = NULL;
 		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, tst_fzsync_thread_wrapper, &wrap_run_b);
 	}
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
