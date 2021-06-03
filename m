Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 622AC39AA2F
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 20:39:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFFDB3C8F3A
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 20:38:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 072893C2868
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 20:38:37 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9CE472009AD
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 20:38:36 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8263121A13;
 Thu,  3 Jun 2021 18:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622745515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+vnpoY/lRICmg3KLzGf1NNYpvXCkOqhqHkiRWXyIeE=;
 b=KNRtlMfUSm4+XcJmtGE6jeRH0q9ZIXTi27WiOaJQBIhMV7f0fEhJ5sSibwZVu7+OEgqLHH
 ofnU/gxb8gFfGPDMb0o0Ll7HDnsixSI5svk91DX2RiZcq6QwuqRPoTTgdewg3MxnPYgVxO
 WaJmMydtSS4VgaEMdE+sTSjcbRWOiqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622745515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+vnpoY/lRICmg3KLzGf1NNYpvXCkOqhqHkiRWXyIeE=;
 b=6vQDRp6631TjQ6Hq2ebZQgNc5c8XAdgu+eqLSDMRZVrmW0EMhcT4yFj3GSlBTB4AiGG/h5
 GixatJfsWgmGl3Bg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E4CED118DD;
 Thu,  3 Jun 2021 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622745515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+vnpoY/lRICmg3KLzGf1NNYpvXCkOqhqHkiRWXyIeE=;
 b=KNRtlMfUSm4+XcJmtGE6jeRH0q9ZIXTi27WiOaJQBIhMV7f0fEhJ5sSibwZVu7+OEgqLHH
 ofnU/gxb8gFfGPDMb0o0Ll7HDnsixSI5svk91DX2RiZcq6QwuqRPoTTgdewg3MxnPYgVxO
 WaJmMydtSS4VgaEMdE+sTSjcbRWOiqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622745515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+vnpoY/lRICmg3KLzGf1NNYpvXCkOqhqHkiRWXyIeE=;
 b=6vQDRp6631TjQ6Hq2ebZQgNc5c8XAdgu+eqLSDMRZVrmW0EMhcT4yFj3GSlBTB4AiGG/h5
 GixatJfsWgmGl3Bg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id kPjiNKohuWASMQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 03 Jun 2021 18:38:34 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Jun 2021 20:38:27 +0200
Message-Id: <20210603183827.24339-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603183827.24339-1-pvorel@suse.cz>
References: <20210603183827.24339-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 3/3] CI: Run also make check
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

ona all targets

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .github/workflows/ci.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 185f49e41..01e2578fa 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -151,6 +151,9 @@ jobs:
     - name: Compile
       run: ./build.sh -r build -o ${TREE:-in}
 
+    - name: Test
+      run: ./build.sh -r check -o ${TREE:-in}
+
     - name: Install
       run: |
         if [ "$MAKE_INSTALL" = 1 ]; then INSTALL_OPT="-i"; fi
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
