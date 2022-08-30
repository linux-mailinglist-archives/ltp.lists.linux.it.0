Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4195A6634
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Aug 2022 16:24:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E0CE3CA6D4
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Aug 2022 16:24:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C423E3CA5C7
 for <ltp@lists.linux.it>; Tue, 30 Aug 2022 16:24:18 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4803B1400431
 for <ltp@lists.linux.it>; Tue, 30 Aug 2022 16:24:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 51CC321C03
 for <ltp@lists.linux.it>; Tue, 30 Aug 2022 14:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661869457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hBC96HKOAdNZ1ImQJB53j484bVg7OlMgzrRSUErMRpk=;
 b=nvAxDfQ+gqKHw1C7V0oLhh+eBFVZk6KjpMRe7c/x5w7DmpPh8FNqEV+zF2jv9QBcVGgqhS
 c6xe7ZfPPKKJK1HjmFHOEXnWbVdIS3j8hgk9/D3uxOs68eahj1u9Hui7Y1KWNFVmYRYDJf
 Ym2ACHlCRRzWT/zilMY4UDON6uioi60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661869457;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hBC96HKOAdNZ1ImQJB53j484bVg7OlMgzrRSUErMRpk=;
 b=3tSaX0sg+XVSIG+dO8xUjejuXGQdRMc75s9OWPBqBXeZjv1VechdkhN3MePoeAJsUwFlkB
 hq/Af/UuvujkIwCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3573713ACF
 for <ltp@lists.linux.it>; Tue, 30 Aug 2022 14:24:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Nc0BDJEdDmN2GwAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 30 Aug 2022 14:24:17 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 30 Aug 2022 16:24:15 +0200
Message-Id: <20220830142416.3831-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] du01.sh: Fix broken directory change
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

Running `ROD cd dir` doesn't work because the command will be executed
in a subshell. Change the directory correctly.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

After this fix, my older tst_rod patch can be safely merged.

 testcases/commands/du/du01.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/commands/du/du01.sh b/testcases/commands/du/du01.sh
index 274e32a4e..5548d7667 100755
--- a/testcases/commands/du/du01.sh
+++ b/testcases/commands/du/du01.sh
@@ -14,7 +14,7 @@ TST_NEEDS_CMDS="dd du stat"
 setup()
 {
 	ROD_SILENT mkdir basedir
-	ROD_SILENT cd basedir
+	cd basedir || tst_brk TBROK "cd basedir failed"
 
 	ROD_SILENT dd if=/dev/zero of=testfile bs=1M count=10
 
-- 
2.37.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
