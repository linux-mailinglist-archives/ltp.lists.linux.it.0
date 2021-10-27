Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 545E943C657
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 11:20:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 131FF3C68B1
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 11:20:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5C68C3C67EA
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 11:20:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C7C681001727
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 11:20:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3B8E1FD3B;
 Wed, 27 Oct 2021 09:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635326431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=v6V3iBcg7hf9Jn2HoWrNp4zQ4z99mAI+1V7AUXvMbX0=;
 b=lfDOsZwPk7ENRrgJRLEFIaj0r1M83CZrLdY1gGFRF0lDJrfeDqOEOCkqicDwmgBpsqWw5I
 Jm4rWcqoJLhqencHc4oKhDB825dfMPIHNNsxAtCZpfggPLeR6kfVisFDwBsohjLFqHbX4c
 6UHkBYcfrqTbKZC222/UvRZCgonmCm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635326431;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=v6V3iBcg7hf9Jn2HoWrNp4zQ4z99mAI+1V7AUXvMbX0=;
 b=+EXCt/Py9iQ2nshLSqBj3hu1+9QcAP2Mz2fp2+jZ4ldFXRVenUGX/9+arYLqvWhRkvFnbz
 skubjn5vuzu3VqAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C570413B69;
 Wed, 27 Oct 2021 09:20:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DDwcLt4ZeWGIJwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 27 Oct 2021 09:20:30 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 27 Oct 2021 11:20:27 +0200
Message-Id: <20211027092027.7124-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] CI: Reenable Tumbleweed
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

50b3bae29 had to disable Tumbleweed due glibc-2.34 using new syscall
clone3 which is not enabled in Docker seccomp filter [1].

Workaround is to disable Docker seccomp filtering, as we don't need this
protection. This should help to avoid seccomp filtering in the future
for all distros.

[1] https://bugzilla.opensuse.org/show_bug.cgi?id=1190670

Fixes: https://github.com/actions/virtual-environments/issues/4193

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Tested:
https://github.com/pevik/iputils/runs/4020083152?check_suite_focus=true

 .github/workflows/ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 3ffde8c48..55d8f5eb5 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -76,6 +76,11 @@ jobs:
               CC: clang
               METADATA: asciidoc-pdf
 
+          - container: "opensuse/tumbleweed"
+            env:
+              CC: gcc
+              METADATA: asciidoctor
+
           - container: "opensuse/leap"
             env:
               CC: gcc
@@ -110,6 +115,7 @@ jobs:
     container:
       image: ${{ matrix.container }}
       env: ${{ matrix.env }}
+      options: --security-opt seccomp=unconfined
 
     steps:
     - name: Show OS
-- 
2.33.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
