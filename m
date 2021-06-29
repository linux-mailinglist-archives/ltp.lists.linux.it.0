Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A57C3B7A12
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 23:48:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2EBF3C9398
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 23:48:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5C9EF3C8D90
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 23:48:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 310CB600A5E
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 23:48:16 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6A3120425;
 Tue, 29 Jun 2021 21:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625003295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYwR6W4Pj4zDTsBFkmAvaL9qLRG00Zzxwg740G0K0tM=;
 b=BmDWW7yLu8tUMn+9AazEOMmrAA+3Vd5haNRDfg81PcwpxuZIkbvB9SHssOhJmCH8i14l2S
 NF5CbTaFIiKxq4acAM0EbsuM4URPyRboZK+nEigt5rSsx+lnLfOwMieFvtvFCvLr2L0FKB
 UsLIyZbnjLHtCxM00t02jwAfPeWd4fc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625003295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYwR6W4Pj4zDTsBFkmAvaL9qLRG00Zzxwg740G0K0tM=;
 b=VsCEiPh3JTCUx10wEIpG38waLGptAd5WRy6KhEr/tdlWaDXQhL+jb0xntGA4ARr130BbLz
 Oku0ZvQuXfpIRsCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 9B6FD11906;
 Tue, 29 Jun 2021 21:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625003295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYwR6W4Pj4zDTsBFkmAvaL9qLRG00Zzxwg740G0K0tM=;
 b=BmDWW7yLu8tUMn+9AazEOMmrAA+3Vd5haNRDfg81PcwpxuZIkbvB9SHssOhJmCH8i14l2S
 NF5CbTaFIiKxq4acAM0EbsuM4URPyRboZK+nEigt5rSsx+lnLfOwMieFvtvFCvLr2L0FKB
 UsLIyZbnjLHtCxM00t02jwAfPeWd4fc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625003295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYwR6W4Pj4zDTsBFkmAvaL9qLRG00Zzxwg740G0K0tM=;
 b=VsCEiPh3JTCUx10wEIpG38waLGptAd5WRy6KhEr/tdlWaDXQhL+jb0xntGA4ARr130BbLz
 Oku0ZvQuXfpIRsCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id wIvBJB+V22AcSAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 29 Jun 2021 21:48:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 23:48:07 +0200
Message-Id: <20210629214808.18760-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629214808.18760-1-pvorel@suse.cz>
References: <20210629214808.18760-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/5] build.sh: Add support for make test
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 build.sh | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/build.sh b/build.sh
index 240ce8e68..04459d6f9 100755
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
+test        run only 'make test'
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
@@ -218,6 +230,10 @@ if [ -z "$run" -o "$run" = "build" ]; then
 	eval build_${tree}_tree
 fi
 
+if [ -z "$run" -o "$run" = "test" ]; then
+	eval test_${tree}_tree
+fi
+
 if [ -z "$run" -o "$run" = "install" ]; then
 	if [ "$install" = 1 ]; then
 		eval install_${tree}_tree
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
