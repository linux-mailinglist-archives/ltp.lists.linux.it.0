Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6AC3F68E5
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 20:14:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BC213C9DF7
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 20:14:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5A9F3C30CC
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 20:13:57 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1393E200058
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 20:13:56 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0594F2009A;
 Tue, 24 Aug 2021 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629828836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gZcp7P+8FX8z/jZA6BdV5dxe2C4epwvzJbOv6J9Ave0=;
 b=z+BA0n9j9zCeTLNYLtQC4XhAoVKsowMQo2U2h163/RGc8Iw+XaSKkkuD4zRul9QgHu8qfn
 OTmFPRwh/t0TXuqSBEFGau4BLdsFwY1DExIpsMGG7oIWnOHmuhpgtBzx5V7v8aW6ATpWA4
 QfHmkDZ9Uwn5BvXmo2HgSHZfLtEW9eE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629828836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gZcp7P+8FX8z/jZA6BdV5dxe2C4epwvzJbOv6J9Ave0=;
 b=36MuAERvgKW3oqHPhu4FfobxKdI0a8abihgjhIy7Wuv+40RH8MBt0+WW6v6HgwZoZlCiqa
 30gkEcuE9mytifDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id CF6C513A69;
 Tue, 24 Aug 2021 18:13:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id aqn2L+M2JWFSbgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 24 Aug 2021 18:13:55 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 24 Aug 2021 20:13:38 +0200
Message-Id: <20210824181338.19034-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] openposix: Support VERBOSE mode
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

i.e. VERBOSE=1 or V=1 to print gcc output.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../scripts/generate-makefiles.sh                     | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/testcases/open_posix_testsuite/scripts/generate-makefiles.sh b/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
index 4b3aaa4a0..e3bd5bfbc 100755
--- a/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
+++ b/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
@@ -156,6 +156,13 @@ EOF
 	cat >> "$makefile.2" <<EOF
 MAKE_TARGETS+=		${targets}
 
+ifeq (\$V,1)
+VERBOSE=1
+endif
+ifndef VERBOSE
+v=@
+endif
+
 EOF
 
 	if [ ! -f "$makefile.3" ]; then
@@ -178,7 +185,7 @@ install: \$(INSTALL_DIR) run.sh
 	@if [ -d speculative ]; then \$(MAKE) -C speculative install; fi
 
 test: run.sh
-	@./run.sh
+	\$(v)./run.sh
 
 \$(INSTALL_DIR):
 	mkdir -p \$@
@@ -231,7 +238,7 @@ EOF
 
 		cat >> "$makefile.3" <<EOF
 $bin_file: \$(srcdir)/$c_file
-	@if $COMPILE_STR > logfile.\$\$\$\$ 2>&1; then \\
+	\$(v)if $COMPILE_STR > logfile.\$\$\$\$ 2>&1; then \\
 		 cat logfile.\$\$\$\$; \\
 		 echo "\$(subdir)/$test_name compile PASSED"; \\
 		 echo "\$(subdir)/$test_name compile PASSED" >> \$(LOGFILE); \\
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
