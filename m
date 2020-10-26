Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 348E12992DA
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:48:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00A3D3C25B6
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:48:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id BB83A3C20D7
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 48ECE1000A44
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8952FAD66
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:48:05 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Oct 2020 17:47:45 +0100
Message-Id: <20201026164756.30556-9-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026164756.30556-1-mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 08/19] Unify error handling in lib/tst_mkfs.c
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
 lib/tst_mkfs.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/lib/tst_mkfs.c b/lib/tst_mkfs.c
index 38b2e7151..45dd83ad3 100644
--- a/lib/tst_mkfs.c
+++ b/lib/tst_mkfs.c
@@ -33,14 +33,14 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 	char extra_opts_str[1024] = "";
 
 	if (!dev) {
-		tst_brkm(TBROK, cleanup_fn,
-			 "%s:%d: No device specified", file, lineno);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"No device specified");
 		return;
 	}
 
 	if (!fs_type) {
-		tst_brkm(TBROK, cleanup_fn,
-			 "%s:%d: No fs_type specified", file, lineno);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"No fs_type specified");
 		return;
 	}
 
@@ -51,9 +51,8 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 			argv[pos++] = fs_opts[i];
 
 			if (pos + 2 > OPTS_MAX) {
-				tst_brkm(TBROK, cleanup_fn,
-				         "%s:%d: Too much mkfs options",
-					 file, lineno);
+				tst_brkm_(file, lineno, TBROK, cleanup_fn,
+					"Too many mkfs options");
 				return;
 			}
 
@@ -70,8 +69,8 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 			argv[pos++] = extra_opts[i];
 
 			if (pos + 1 > OPTS_MAX) {
-				tst_brkm(TBROK, cleanup_fn,
-				         "%s:%d: Too much mkfs options", file, lineno);
+				tst_brkm_(file, lineno, TBROK, cleanup_fn,
+					"Too many mkfs options");
 				return;
 			}
 
@@ -83,11 +82,14 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 
 	argv[pos] = NULL;
 
-	if (tst_clear_device(dev))
-		tst_brkm(TBROK, cleanup_fn, "tst_clear_device() failed");
+	if (tst_clear_device(dev)) {
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"tst_clear_device() failed");
+	}
 
-	tst_resm(TINFO, "Formatting %s with %s opts='%s' extra opts='%s'",
-	         dev, fs_type, fs_opts_str, extra_opts_str);
+	tst_resm_(file, lineno, TINFO,
+		"Formatting %s with %s opts='%s' extra opts='%s'",
+		dev, fs_type, fs_opts_str, extra_opts_str);
 	ret = tst_cmd(cleanup_fn, argv, "/dev/null", NULL, TST_CMD_PASS_RETVAL |
 				  TST_CMD_TCONF_ON_MISSING);
 
@@ -95,12 +97,12 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 	case 0:
 	break;
 	case 255:
-		tst_brkm(TCONF, cleanup_fn,
-			 "%s:%d: %s not found in $PATH", file, lineno, mkfs);
+		tst_brkm_(file, lineno, TCONF, cleanup_fn,
+			"%s not found in $PATH", mkfs);
 	break;
 	default:
-		tst_brkm(TBROK, cleanup_fn,
-			 "%s:%d: %s failed with %i", file, lineno, mkfs, ret);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"%s failed with exit code %i", mkfs, ret);
 	}
 }
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
