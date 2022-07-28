Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDCD583DE3
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jul 2022 13:43:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E88A33C81B2
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jul 2022 13:43:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EC5353C2A24
 for <ltp@lists.linux.it>; Thu, 28 Jul 2022 13:43:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 06C91200D27
 for <ltp@lists.linux.it>; Thu, 28 Jul 2022 13:42:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 34F5133DFB
 for <ltp@lists.linux.it>; Thu, 28 Jul 2022 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659008579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KBPdA8fBa9jRFmWFRIH/dL3bHZN3XJfwpN3QDGyWivY=;
 b=WnSmd3TpgafG+ENs/vBckqmFZEHdCqsgLyleHAjNoLmTlyzUYaSAmZiUtuMLA6CKfTv3cY
 +aheOxhvb3Gp8T/0ol9FlN3YSH+U10h7wPzaR07Sjgeps4NWPzQPTD3Mba6k22L93NW/15
 Ge9dhnpR0KGYsqapNRCCO+tfsQfnlrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659008579;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KBPdA8fBa9jRFmWFRIH/dL3bHZN3XJfwpN3QDGyWivY=;
 b=Tt5kItQe4kc2TfJraYhyJ3Xsf8en+BQXUag94pTB7ndkCYnJqIrR9cLcN4Wx64b/ugioCl
 NoqkLuVcgj37BYAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2136913AB4
 for <ltp@lists.linux.it>; Thu, 28 Jul 2022 11:42:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MalrBkN24mLTEgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 28 Jul 2022 11:42:59 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 28 Jul 2022 13:42:57 +0200
Message-Id: <20220728114258.30832-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] tst_rod: Use args[0] as the command name
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

Using argv[1] as the command name might fail if the first argument happens
to be I/O redirection. Use args[0] which is always the first argument not
processed by tst_rod.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/lib/tst_rod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/lib/tst_rod.c b/testcases/lib/tst_rod.c
index 2f0ff902c..24c1fb668 100644
--- a/testcases/lib/tst_rod.c
+++ b/testcases/lib/tst_rod.c
@@ -130,7 +130,7 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	execvp(argv[1], args);
+	execvp(args[0], args);
 
 	/* Fall back to shell if command wasn't found */
 	FILE *sin = popen("/bin/sh", "w");
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
