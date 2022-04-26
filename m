Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA914510244
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Apr 2022 17:55:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7627D3CA332
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Apr 2022 17:55:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1EB963C9C87
 for <ltp@lists.linux.it>; Tue, 26 Apr 2022 17:54:56 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1C80E1A008A1
 for <ltp@lists.linux.it>; Tue, 26 Apr 2022 17:54:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 42F031F380
 for <ltp@lists.linux.it>; Tue, 26 Apr 2022 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650988495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kSbmtMEx8ZGIaUflq8qGopxYXlf7sorbnkKqVI/vuyQ=;
 b=WufwHCLCPbrfbOpRGEgvFmMNAzNwaBXJIVScz78/EsGageSPMqEsIJtoJC4dD6dRyxppJU
 10rclwMaoUPe/jsx9lMZPj2ACsamCm42JQch6zv564sChPsIYnrUYN8iFr/F4E0Ze66/5E
 nNw+LcGi5ahBOVqnWLsB9HQCafr4idM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650988495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kSbmtMEx8ZGIaUflq8qGopxYXlf7sorbnkKqVI/vuyQ=;
 b=EOYtpIH1au0uciXpxdeBkVy26kePhITmKVuegWk6gjtbdqKP19p3Qi4sNRbY+CdJgiX0QS
 tULe2YSfYmt39gAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1785913AD5
 for <ltp@lists.linux.it>; Tue, 26 Apr 2022 15:54:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gRcNBc8VaGL7cgAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 26 Apr 2022 15:54:55 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 26 Apr 2022 17:57:09 +0200
Message-Id: <20220426155709.4821-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] userns06_capcheck: Fix build on some
 distros
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

The build fails on some distros because they compile with -Werror=return-type

Fixes: f57e28cfb19 ("Rewrite userns06.c using new LTP API")
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/containers/userns/userns06_capcheck.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/containers/userns/userns06_capcheck.c b/testcases/kernel/containers/userns/userns06_capcheck.c
index bae4e4e33..c048ef63f 100644
--- a/testcases/kernel/containers/userns/userns06_capcheck.c
+++ b/testcases/kernel/containers/userns/userns06_capcheck.c
@@ -53,6 +53,8 @@ int main(int argc, char *argv[])
 		tst_res(TFAIL, "unexpected effective/permitted caps at %d", i);
 	else
 		tst_res(TPASS, "expected caps at %d", i);
+
+	return 0;
 }
 
 #else
@@ -61,5 +63,7 @@ int main(void)
 	tst_reinit();
 
 	tst_brk(TCONF, "System is missing libcap");
+
+	return 0;
 }
 #endif
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
