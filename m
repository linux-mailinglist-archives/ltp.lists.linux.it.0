Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE36B798726
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Sep 2023 14:36:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68D003CB8F4
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Sep 2023 14:36:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB4293CB54A
 for <ltp@lists.linux.it>; Fri,  8 Sep 2023 14:36:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4EBA0600715
 for <ltp@lists.linux.it>; Fri,  8 Sep 2023 14:36:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C3CCD21BC1
 for <ltp@lists.linux.it>; Fri,  8 Sep 2023 12:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1694176605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kMwffztdxrz9SwqznfGMZ8FS+Ks2nVUey+seGYUxKXA=;
 b=uZDjUz2KGBEE8+mq6Yu4JTS/txVYTlVIT3ZeL7jOM6jXBRt5avC74HpR14nqKUURzmN8dL
 Y6PmZfNWCl4X/O3/9tVWldUjXHWIQ2ZwboLTBX56HhTcIvft38OoD5dBANz7n6yNiIAIKF
 7Ej5d2r55vg6mJGbvQPo4lX7vw3B9IY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1694176605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kMwffztdxrz9SwqznfGMZ8FS+Ks2nVUey+seGYUxKXA=;
 b=sPAB962ldSarhRHKjHcF6o6LIVTsacm6xgE9gsNmXTG7HPAJb7TwF0enZQiGVYV77vyiEd
 qs2Uj1AEpeapSJCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B175C131FD
 for <ltp@lists.linux.it>; Fri,  8 Sep 2023 12:36:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id up75KV0V+2S4PgAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 08 Sep 2023 12:36:45 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  8 Sep 2023 14:37:27 +0200
Message-ID: <20230908123727.7822-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: [LTP] [COMMITED] [PATCH] doc: c-test-tutorial-simple: Fix typo
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

File runtest/statx does not exists it should have been runtest/syscalls.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 doc/c-test-tutorial-simple.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/c-test-tutorial-simple.txt b/doc/c-test-tutorial-simple.txt
index c691c1dd9..07a61f4ec 100644
--- a/doc/c-test-tutorial-simple.txt
+++ b/doc/c-test-tutorial-simple.txt
@@ -222,7 +222,7 @@ $ ./statx01
 This should build the test and then run it. However, even though the test is
 in the +syscalls+ directory it won't be automatically ran as part of the
 _syscalls_ test group (remember +./runltp -f syscalls+ from the +README.md+?). For
-this we need to add it to the +runtest+ file. So open +runtest/statx+ and add
+this we need to add it to the +runtest+ file. So open +runtest/syscalls+ and add
 the lines starting with a +++.
 
 [source,diff]
-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
