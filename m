Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F9E3C6E47
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 172EC3C876A
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A28D3C663C
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0C289600846
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC78722272;
 Tue, 13 Jul 2021 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626171226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ibwwJh6WFKNYXvKLbCtmC6na7gm8ArGHDA+DppW9bJw=;
 b=OPIe2YlH62uQzEVZnvVNWfPs69+qH08oxslV2rkvJ4HP2u4GsGmaNUlAnYWluld85b4aXQ
 AhhMfJHiCF2awnV8wIxWVQn0C5ngvugndEzdNzUC8Dk+yMpYvfdA/3cQ9iUiND4OarsPWN
 MFIZm7YS2WGd7W3A5V4w9PqrZ4b+JvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626171226;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ibwwJh6WFKNYXvKLbCtmC6na7gm8ArGHDA+DppW9bJw=;
 b=eSV9KOrlzx3FObckAZnhooQnRmmKd2xvAJ/vSbIr/clTZvtQa5eENQOpuAGZ8BXFFnxE0Q
 nUN35mH2AuH4RRAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69CB413AE3;
 Tue, 13 Jul 2021 10:13:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mBWFGFpn7WCaYAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Jul 2021 10:13:46 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 12:13:38 +0200
Message-Id: <20210713101338.6985-8-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713101338.6985-1-pvorel@suse.cz>
References: <20210713101338.6985-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 7/7] CI: Run also make test
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

on all targets

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v3->v4:
Add $BUILD to not run on cross-compile.

 .github/workflows/ci.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index f67f14927..776dbf646 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -151,6 +151,11 @@ jobs:
     - name: Compile
       run: ./build.sh -r build -o ${TREE:-in}
 
+    - name: Test
+      run: |
+        case "$VARIANT" in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
+        ./build.sh -r test -o ${TREE:-in} -t $BUILD
+
     - name: Install
       run: |
         if [ "$MAKE_INSTALL" = 1 ]; then INSTALL_OPT="-i"; fi
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
