Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 511202992E0
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:49:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F10913C12E6
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:49:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 07A9C3C23B9
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6B5DF60082D
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97612AD68
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:48:05 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Oct 2020 17:47:46 +0100
Message-Id: <20201026164756.30556-10-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026164756.30556-1-mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 09/19] Unify error handling in lib/tst_checkpoint.c
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

- Properly format caller file:line location

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 lib/tst_checkpoint.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/lib/tst_checkpoint.c b/lib/tst_checkpoint.c
index 5e5b11496..9e9dcf9e6 100644
--- a/lib/tst_checkpoint.c
+++ b/lib/tst_checkpoint.c
@@ -43,9 +43,8 @@ void tst_checkpoint_init(const char *file, const int lineno,
 	unsigned int page_size;
 
 	if (tst_futexes) {
-		tst_brkm(TBROK, cleanup_fn,
-		         "%s: %d checkpoints already initialized",
-		         file, lineno);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"checkpoints already initialized");
 		return;
 	}
 
@@ -61,9 +60,9 @@ void tst_checkpoint_init(const char *file, const int lineno,
 	 * the init as a first function with NULL as cleanup function.
 	 */
 	if (cleanup_fn && !tst_tmpdir_created()) {
-		tst_brkm(TBROK, cleanup_fn,
-		         "%s:%d You have to create test temporary directory "
-		         "first (call tst_tmpdir())", file, lineno);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"You have to create test temporary directory "
+			"first (call tst_tmpdir())");
 		return;
 	}
 
@@ -144,9 +143,9 @@ void tst_safe_checkpoint_wait(const char *file, const int lineno,
 	ret = tst_checkpoint_wait(id, msec_timeout);
 
 	if (ret) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-		         "%s:%d: tst_checkpoint_wait(%u, %i)",
-		         file, lineno, id, msec_timeout);
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"tst_checkpoint_wait(%u, %i) failed", id,
+			msec_timeout);
 	}
 }
 
@@ -157,8 +156,8 @@ void tst_safe_checkpoint_wake(const char *file, const int lineno,
 	int ret = tst_checkpoint_wake(id, nr_wake, DEFAULT_MSEC_TIMEOUT);
 
 	if (ret) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-		         "%s:%d: tst_checkpoint_wake(%u, %u, %i)",
-		         file, lineno, id, nr_wake, DEFAULT_MSEC_TIMEOUT);
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"tst_checkpoint_wake(%u, %u, %i) failed", id, nr_wake,
+			DEFAULT_MSEC_TIMEOUT);
 	}
 }
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
