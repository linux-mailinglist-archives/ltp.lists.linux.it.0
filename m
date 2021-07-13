Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A103C6E46
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 464C83C8769
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 227E63C6756
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A4F671000D09
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 63FA92226E;
 Tue, 13 Jul 2021 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626171226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04kwH+HCRlkZ7U6tYUSSua8h+sC4ILI1y8xxUgn9c7U=;
 b=QqJaWlZTiseKA6/V4N3C53RrBiPPIMsyf/Jm5R5XttUb6g+0PSg7YPF1nrDk1jEW+FgUGP
 jzS/pXNeWo9hNsg+r7HD7RSsXdBOwyqESCu4r6uKs/C87gToUt53S+aurYYnQcqbS4Seef
 wXY/Sn6iTBcVyIrzEqxrRuWAHBQdxEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626171226;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04kwH+HCRlkZ7U6tYUSSua8h+sC4ILI1y8xxUgn9c7U=;
 b=IJwKJjR9tiuumYcvJMEeJ2iG4EdNksUqXSuR6Uu5mcKgHs9RZulnztP0zYH8fgVuG7zcml
 uUXDlwhvdD4jzAAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2937913AE3;
 Tue, 13 Jul 2021 10:13:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +KBjCFpn7WCaYAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Jul 2021 10:13:46 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 12:13:37 +0200
Message-Id: <20210713101338.6985-7-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713101338.6985-1-pvorel@suse.cz>
References: <20210713101338.6985-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 6/7] build.sh: Add support for make test
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v3->v4:
Don't run on cross-compile.

 build.sh | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/build.sh b/build.sh
index 240ce8e68..9cb26e899 100755
--- a/build.sh
+++ b/build.sh
@@ -119,6 +119,17 @@ build_out_tree()
 	make $MAKE_OPTS_OUT_TREE
 }
 
+test_in_tree()
+{
+	make test
+}
+
+test_out_tree()
+{
+	cd $BUILD_DIR
+	make $MAKE_OPTS_OUT_TREE test
+}
+
 install_in_tree()
 {
 	make $MAKE_OPTS install
@@ -165,6 +176,7 @@ RUN:
 autotools   run only 'make autotools'
 configure   run only 'configure'
 build       run only 'make'
+test        run only 'make test' (not supported for cross-compile build)
 install     run only 'make install'
 
 Default configure options:
@@ -192,7 +204,7 @@ while getopts "c:hio:p:r:t:" opt; do
 		esac;;
 	p) prefix="$OPTARG";;
 	r) case "$OPTARG" in
-		autotools|configure|build|install) run="$OPTARG";;
+		autotools|configure|build|test|install) run="$OPTARG";;
 		*) echo "Wrong run type '$OPTARG'" >&2; usage; exit 1;;
 		esac;;
 	t) case "$OPTARG" in
@@ -218,6 +230,14 @@ if [ -z "$run" -o "$run" = "build" ]; then
 	eval build_${tree}_tree
 fi
 
+if [ -z "$run" -o "$run" = "test" ]; then
+	if [ "$build" = "cross" ]; then
+		echo "cross-compile build, skipping running tests" >&2
+	else
+		eval test_${tree}_tree
+	fi
+fi
+
 if [ -z "$run" -o "$run" = "install" ]; then
 	if [ "$install" = 1 ]; then
 		eval install_${tree}_tree
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
