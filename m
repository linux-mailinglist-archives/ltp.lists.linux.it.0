Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B884B2A28
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 17:24:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D66443C9F2C
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 17:24:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 303FF3C0E63
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 17:24:07 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5C19A201120
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 17:24:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D420212B6;
 Fri, 11 Feb 2022 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644596646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WoKba+KTcCYlk3wJ+OON923Seuu68SUlDu8CLYXUraw=;
 b=j+fn0y/aZAi3L0CFvSGJ8xZBV0n944hvn1zq/2YyGNWm4MjWCCNoblI2LnprrJjYLtQNLm
 s1ZtjJzND49emuZzYhKLsIMRLZ8w0SYRDF0zlNdCL9waXVS61MB3Rk91jI1a0+eH37zVBp
 Fg7fOPpnMIIREQHmicjtxgZXW2+Nyzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644596646;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WoKba+KTcCYlk3wJ+OON923Seuu68SUlDu8CLYXUraw=;
 b=U9JrvEfaImpZiCQIuy12o/yzlu+bV/oXGvEMdico5TlALbegSCUiT4u6bH2XimlRCvg9c2
 54bRzAAs2lh2OzDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 684E013C9A;
 Fri, 11 Feb 2022 16:24:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wZrmFqaNBmLWagAAMHmgww
 (envelope-from <blezhepekov@suse.de>); Fri, 11 Feb 2022 16:24:06 +0000
From: Bogdan Lezhepekov <blezhepekov@suse.de>
To: ltp@lists.linux.it
Date: Fri, 11 Feb 2022 18:24:04 +0200
Message-Id: <20220211162404.12193-1-blezhepekov@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1] lib/safe_file_ops.c: Fix resource leak
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

safe_file_scanf and safe_file_vprintf suffered
from resource leak, as opened file descriptor
was not closed in case of error.

Signed-off-by: Bogdan Lezhepekov <blezhepekov@suse.de>
---
 lib/safe_file_ops.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/lib/safe_file_ops.c b/lib/safe_file_ops.c
index f803691d8..d7231df4d 100644
--- a/lib/safe_file_ops.c
+++ b/lib/safe_file_ops.c
@@ -130,7 +130,7 @@ void safe_file_scanf(const char *file, const int lineno,
 	if (f == NULL) {
 		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
 			"Failed to open FILE '%s' for reading", path);
-		return;
+		goto out;
 	}
 
 	exp_convs = tst_count_scanf_conversions(fmt);
@@ -142,14 +142,14 @@ void safe_file_scanf(const char *file, const int lineno,
 	if (ret == EOF) {
 		tst_brkm_(file, lineno, TBROK, cleanup_fn,
 			"The FILE '%s' ended prematurely", path);
-		return;
+		goto out;
 	}
 
 	if (ret != exp_convs) {
 		tst_brkm_(file, lineno, TBROK, cleanup_fn,
 			"Expected %i conversions got %i FILE '%s'",
 			exp_convs, ret, path);
-		return;
+		goto out;
 	}
 
 	if (fclose(f)) {
@@ -157,6 +157,8 @@ void safe_file_scanf(const char *file, const int lineno,
 			"Failed to close FILE '%s'", path);
 		return;
 	}
+out:
+	fclose(f);
 }
 
 
@@ -261,13 +263,13 @@ static void safe_file_vprintf(const char *file, const int lineno,
 	if (f == NULL) {
 		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
 			"Failed to open FILE '%s' for writing", path);
-		return;
+		goto out;
 	}
 
 	if (vfprintf(f, fmt, va) < 0) {
 		tst_brkm_(file, lineno, TBROK, cleanup_fn,
 			"Failed to print to FILE '%s'", path);
-		return;
+		goto out;
 	}
 
 	if (fclose(f)) {
@@ -275,6 +277,8 @@ static void safe_file_vprintf(const char *file, const int lineno,
 			"Failed to close FILE '%s'", path);
 		return;
 	}
+out:
+	fclose(f);
 }
 
 void safe_file_printf(const char *file, const int lineno,
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
