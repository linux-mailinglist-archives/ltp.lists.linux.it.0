Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA2C2992DE
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:49:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 755853C267C
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:49:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7D3FF3C12E6
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4656A60028E
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 777BCAD63
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:48:05 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Oct 2020 17:47:44 +0100
Message-Id: <20201026164756.30556-8-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026164756.30556-1-mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 07/19] Unify error handling in lib/safe_stdio.c
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
- Pedantically check invalid function return values

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 lib/safe_stdio.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/lib/safe_stdio.c b/lib/safe_stdio.c
index 966a039a5..ab23e43bb 100644
--- a/lib/safe_stdio.c
+++ b/lib/safe_stdio.c
@@ -29,9 +29,8 @@ FILE *safe_fopen(const char *file, const int lineno, void (cleanup_fn)(void),
 	FILE *f = fopen(path, mode);
 
 	if (f == NULL) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-			 "%s:%d: fopen(%s,%s) failed",
-			 file, lineno, path, mode);
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"fopen(%s,%s) failed", path, mode);
 	}
 
 	return f;
@@ -44,9 +43,12 @@ int safe_fclose(const char *file, const int lineno, void (cleanup_fn)(void),
 
 	ret = fclose(f);
 
-	if (ret) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-			 "%s:%d: fclose(%p) failed", file, lineno, f);
+	if (ret == EOF) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"fclose(%p) failed", f);
+	} else if (ret) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Invalid fclose(%p) return value %d", f, ret);
 	}
 
 	return ret;
@@ -62,9 +64,12 @@ int safe_asprintf(const char *file, const int lineno, void (cleanup_fn)(void),
 	ret = vasprintf(strp, fmt, va);
 	va_end(va);
 
-	if (ret < 0) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-			 "%s:%d: asprintf(%s,...) failed", file, lineno, fmt);
+	if (ret == -1) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"asprintf(%s,...) failed", fmt);
+	} else if (ret < 0) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Invalid asprintf(%s,...) return value %d", fmt, ret);
 	}
 
 	return ret;
@@ -81,13 +86,12 @@ FILE *safe_popen(const char *file, const int lineno, void (cleanup_fn)(void),
 
 	if (stream == NULL) {
 		if (errno != 0) {
-			tst_brkm(TBROK | TERRNO, cleanup_fn,
-				 "%s:%d: popen(%s,%s) failed",
-				 file, lineno, command, type);
+			tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+				"popen(%s,%s) failed", command, type);
 		} else {
-			tst_brkm(TBROK, cleanup_fn,
-				 "%s:%d: popen(%s,%s) failed: Out of memory",
-				 file, lineno, command, type);
+			tst_brkm_(file, lineno, TBROK, cleanup_fn,
+				"popen(%s,%s) failed: Out of memory",
+				command, type);
 		}
 	}
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
