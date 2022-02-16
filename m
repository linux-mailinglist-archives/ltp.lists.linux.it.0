Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 608CD4B81E4
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 08:48:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5ED503CA071
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 08:48:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B0C523C1315
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 08:48:04 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 14F91201012
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 08:48:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 18B4A212BD;
 Wed, 16 Feb 2022 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644997683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/2olM91+X/JYjKnjg6zQjkgjSS4wobUR5oQ8yk3/kqE=;
 b=U4xJB4APIfy/ebMMnlKi0OllT0yPPitxQZ0j4iyszQqf4KBTLHapLyR9WgxrzskR/vR9n0
 4Ho/r6R5nX5jdgm7z7vvmlZOg2X8wE9DfBYGcx7eQizTz27ilRpQ9irOPIGxPxEeF3LII1
 KXzKstv8m3H3edI2kf0ZFdosN59t6J4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644997683;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/2olM91+X/JYjKnjg6zQjkgjSS4wobUR5oQ8yk3/kqE=;
 b=vFgCsr6cYVfWad1anQxhQiiq6WutMVb2nJR6Cdxqbc8Ml68WXkHvuH15ui1oXZfRuCj64l
 CPcIGnvW02ot+NAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4CB213A3E;
 Wed, 16 Feb 2022 07:48:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /iuLMDKsDGKFPgAAMHmgww
 (envelope-from <blezhepekov@suse.de>); Wed, 16 Feb 2022 07:48:02 +0000
From: Bogdan Lezhepekov <blezhepekov@suse.de>
To: ltp@lists.linux.it
Date: Wed, 16 Feb 2022 09:48:00 +0200
Message-Id: <20220216074800.22621-1-blezhepekov@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] lib/safe_file_ops.c: Fix resource leak
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
 lib/safe_file_ops.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/safe_file_ops.c b/lib/safe_file_ops.c
index f803691d8..53711fb74 100644
--- a/lib/safe_file_ops.c
+++ b/lib/safe_file_ops.c
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
 
 
@@ -267,7 +269,7 @@ static void safe_file_vprintf(const char *file, const int lineno,
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
