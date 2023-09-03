Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 306CA790A7D
	for <lists+linux-ltp@lfdr.de>; Sun,  3 Sep 2023 03:44:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A58E3CC20C
	for <lists+linux-ltp@lfdr.de>; Sun,  3 Sep 2023 03:44:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC4673CBA01
 for <ltp@lists.linux.it>; Sun,  3 Sep 2023 03:44:32 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B8BA960092B
 for <ltp@lists.linux.it>; Sun,  3 Sep 2023 03:44:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EFF6D21833;
 Sun,  3 Sep 2023 01:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1693705468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8JOW3oaIMta3d/5B6m+fjSRtwBXa5zZXjTYes48FjdA=;
 b=N/MpsqEFctx1UW/Afzho2VkB5rcwx/Syfv9SCuTZDN9Ke1r8RvYRiXYsbggyf3A76BOPgb
 eEhI/QP0AgF+hs0tPhd8kU0deXl6HjN6hZbDy1GDfDuslzU/Te2VdGcADnbomcIKwy4KoN
 nBjuocqiLIp8RHzC9DHqbPWvjTDkY5U=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD8DE13251;
 Sun,  3 Sep 2023 01:44:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8uqjIvvk82QGcAAAMHmgww
 (envelope-from <wegao@suse.com>); Sun, 03 Sep 2023 01:44:27 +0000
To: ltp@lists.linux.it
Date: Sat,  2 Sep 2023 21:44:22 -0400
Message-Id: <20230903014422.9421-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1] c-test-api.txt: fix typo
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Wei Gao <wegao@suse.com>
---
 doc/c-test-api.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index f692909e2..26d473dab 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -712,7 +712,7 @@ int main(void)
 The 'tst_res()' function can be also used from binaries started by 'exec()',
 the parent test process has to set the '.child_needs_reinit' flag so that the
 library prepares for it and has to make sure the 'LTP_IPC_PATH' environment
-variable is passed down, then the very fist thing the program has to call in
+variable is passed down, then the very first thing the program has to call in
 'main()' is 'tst_reinit()' that sets up the IPC.
 
 1.9 Fork() and Parent-child synchronization
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
