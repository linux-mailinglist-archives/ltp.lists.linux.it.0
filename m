Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB74D3DDEA2
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:36:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 905BB3C8B0F
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:36:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 723303C8AEB
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 22AD4100023E
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:56 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D3E6F22028;
 Mon,  2 Aug 2021 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627925755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypki9je6vk6b94vHxmrPrNtS7hrMSK2UNkid+rZEbWg=;
 b=lgsnGD5bZvGn+IIaE1HGVl+K9oWDYqg/ePb89YZ4sLubMzfEknxdrkYFrX8VM1Z3eSmGw+
 qPxVH8phivWkX2v23eT7z6+BXt2KLhgjfAIXFkwhWBCpPa1P4JB3b2eqNfyYCsNUwpGvfa
 DlkMowiMrxMY4S+GvEQNy6mDjy3ce1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627925755;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypki9je6vk6b94vHxmrPrNtS7hrMSK2UNkid+rZEbWg=;
 b=UFq6V9Of9PMQLDMPGluOxkTbzRjXRuZVlhFnbuqreIeM/cLnM2b/2GpmXyxk7y7NZVACs6
 gIAhIcudJBAWIjCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AB41713B47;
 Mon,  2 Aug 2021 17:35:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 8OV7JvssCGHmLAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 02 Aug 2021 17:35:55 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Aug 2021 19:35:35 +0200
Message-Id: <20210802173536.19525-7-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802173536.19525-1-pvorel@suse.cz>
References: <20210802173536.19525-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v7 6/7] CI: Run also make test-c, test-shell
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

run C and shell test separately (test-c and test-shell instead of test).
Having them separate helps to easily navigate in CI.

It's run on all jobs, but on cross compile jobs it's obviously skipped.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
The same as in v6.

 .github/workflows/ci.yml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index f67f14927..9d37f49e4 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -151,6 +151,16 @@ jobs:
     - name: Compile
       run: ./build.sh -r build -o ${TREE:-in}
 
+    - name: Test C API
+      run: |
+        case "$VARIANT" in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
+        ./build.sh -r test-c -o ${TREE:-in} -t $BUILD
+
+    - name: Test shell API
+      run: |
+        case "$VARIANT" in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
+        ./build.sh -r test-shell -o ${TREE:-in} -t $BUILD
+
     - name: Install
       run: |
         if [ "$MAKE_INSTALL" = 1 ]; then INSTALL_OPT="-i"; fi
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
