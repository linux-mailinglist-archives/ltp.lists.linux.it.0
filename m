Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 388BE2992EE
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:50:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04C793C263E
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:50:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 760913C248B
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BFF621400E04
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3BCD3ACF5
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:48:06 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Oct 2020 17:47:55 +0100
Message-Id: <20201026164756.30556-19-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026164756.30556-1-mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 18/19] Unify error handling in lib/tst_resource.c
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
 lib/tst_resource.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/tst_resource.c b/lib/tst_resource.c
index 0b9b381f1..c35d05a25 100644
--- a/lib/tst_resource.c
+++ b/lib/tst_resource.c
@@ -102,9 +102,8 @@ void tst_resource_copy(const char *file, const int lineno,
 		       const char *filename, const char *dest)
 {
 	if (!tst_tmpdir_created()) {
-		tst_brkm(TBROK, cleanup_fn,
-		         "Temporary directory doesn't exist at %s:%d",
-		         file, lineno);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"Temporary directory doesn't exist");
 		return;
 	}
 
@@ -133,6 +132,6 @@ void tst_resource_copy(const char *file, const int lineno,
 	if (file_copy(file, lineno, cleanup_fn, startwd, filename, dest))
 		return;
 
-	tst_brkm(TBROK, cleanup_fn, "Failed to copy resource '%s' at %s:%d",
-	         filename, file, lineno);
+	tst_brkm_(file, lineno, TBROK, cleanup_fn,
+		"Failed to copy resource '%s'", filename);
 }
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
