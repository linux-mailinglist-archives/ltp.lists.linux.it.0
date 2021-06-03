Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B9439AA2D
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 20:38:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D4E83C5678
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 20:38:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B8B993C283C
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 20:38:36 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BF9AF1000F3E
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 20:38:35 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D2BE821A11;
 Thu,  3 Jun 2021 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622745514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=on/mSA0yb7PipWByfJy7zAfJlSxlnlv49d5TaSZm+Bg=;
 b=hKGUjfJKAhfXbpLt54Mq1+2iCwkDHddabDqOzbhSQ4466kmR1esQboscOA3ASQ7udq7IJk
 i4PeFGZor6nsg7uvAdxjHLxWQfTteff43P8KkJd7ZGnDNwa98dVpSjSD2ivdd3vltFCeYZ
 E3FqWIGbILZYTFcKU9ZCO7z0FHmV7Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622745514;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=on/mSA0yb7PipWByfJy7zAfJlSxlnlv49d5TaSZm+Bg=;
 b=gG2f4Kp9wAJ/AIsETWCAEU/2ygINeq3E7bGT8Rlyxfad/dUriU6i4UdfAtcmjvzn8CpFnw
 8KziKm0YaCvTgvBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 78CD0118DD;
 Thu,  3 Jun 2021 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622745514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=on/mSA0yb7PipWByfJy7zAfJlSxlnlv49d5TaSZm+Bg=;
 b=hKGUjfJKAhfXbpLt54Mq1+2iCwkDHddabDqOzbhSQ4466kmR1esQboscOA3ASQ7udq7IJk
 i4PeFGZor6nsg7uvAdxjHLxWQfTteff43P8KkJd7ZGnDNwa98dVpSjSD2ivdd3vltFCeYZ
 E3FqWIGbILZYTFcKU9ZCO7z0FHmV7Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622745514;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=on/mSA0yb7PipWByfJy7zAfJlSxlnlv49d5TaSZm+Bg=;
 b=gG2f4Kp9wAJ/AIsETWCAEU/2ygINeq3E7bGT8Rlyxfad/dUriU6i4UdfAtcmjvzn8CpFnw
 8KziKm0YaCvTgvBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id yHTQGqohuWASMQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 03 Jun 2021 18:38:34 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Jun 2021 20:38:26 +0200
Message-Id: <20210603183827.24339-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603183827.24339-1-pvorel@suse.cz>
References: <20210603183827.24339-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 2/3] build.sh: Add support for make check
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
index 240ce8e68..c892fa87b 100755
--- a/build.sh
+++ b/build.sh
@@ -119,6 +119,17 @@ build_out_tree()
 	make $MAKE_OPTS_OUT_TREE
 }
 
+check_in_tree()
+{
+	make check
+}
+
+check_out_tree()
+{
+	cd $BUILD_DIR
+	make $MAKE_OPTS_OUT_TREE check
+}
+
 install_in_tree()
 {
 	make $MAKE_OPTS install
@@ -165,6 +176,7 @@ RUN:
 autotools   run only 'make autotools'
 configure   run only 'configure'
 build       run only 'make'
+check       run only 'make check'
 install     run only 'make install'
 
 Default configure options:
@@ -192,7 +204,7 @@ while getopts "c:hio:p:r:t:" opt; do
 		esac;;
 	p) prefix="$OPTARG";;
 	r) case "$OPTARG" in
-		autotools|configure|build|install) run="$OPTARG";;
+		autotools|configure|build|check|install) run="$OPTARG";;
 		*) echo "Wrong run type '$OPTARG'" >&2; usage; exit 1;;
 		esac;;
 	t) case "$OPTARG" in
@@ -218,6 +230,10 @@ if [ -z "$run" -o "$run" = "build" ]; then
 	eval build_${tree}_tree
 fi
 
+if [ -z "$run" -o "$run" = "check" ]; then
+	eval check_${tree}_tree
+fi
+
 if [ -z "$run" -o "$run" = "install" ]; then
 	if [ "$install" = 1 ]; then
 		eval install_${tree}_tree
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
