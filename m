Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC4CA6E743
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Mar 2025 00:41:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDE613C98BA
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Mar 2025 00:41:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C86E43C9915
 for <ltp@lists.linux.it>; Tue, 25 Mar 2025 00:40:25 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1AF361002050
 for <ltp@lists.linux.it>; Tue, 25 Mar 2025 00:40:24 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB35E1F391;
 Mon, 24 Mar 2025 23:40:19 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1742859619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6qONPcZ3mg6KEoqHJg70FB/G7dWUO3HC1dJoyItvk30=;
 b=VJRU/krUn3NNifQXpgCc+AOMOaVpWVWirRT4JvwIiv/dih3jTe6ARD8sx0xC69wI05ZAmc
 b2taqAeOGqLzOIhmlBRuixN0xHWpVXFVdbiDV4tHlyJpwXBYa6AdZNNoRsZWzYJnGA69e6
 V9lmJQNydAx+lyHp3+Vkw4vmFDGP3Yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1742859619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6qONPcZ3mg6KEoqHJg70FB/G7dWUO3HC1dJoyItvk30=;
 b=5kgSOyu47KTObzi8MfJox7Ebj2EAbl0YZl2PYrjwowM1jIkLNHcuXG7WrGxCQXdu4wUUM7
 rq2/mds6zBeB/4DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B82E13A22;
 Mon, 24 Mar 2025 23:40:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8PryHGPt4WdEbAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 24 Mar 2025 23:40:19 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 Mar 2025 00:40:13 +0100
Message-ID: <20250324234016.367228-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324234016.367228-1-pvorel@suse.cz>
References: <20250324234016.367228-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: AB35E1F391
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 1/4] doc/Makefile: Remove also metadata/ltp.json
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

Because there is no detection whether tests changed it's better to
remove JSON file on metadata cleanup.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v3.

 doc/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/doc/Makefile b/doc/Makefile
index a07df04d5c..3c5682ad00 100644
--- a/doc/Makefile
+++ b/doc/Makefile
@@ -15,4 +15,5 @@ spelling:
 	sphinx-build -b spelling -d build/doctree . build/spelling
 
 clean:
-	rm -rf html/ build/ _static/syscalls.rst _static/tests.rst syscalls.tbl
+	rm -rf html/ build/ _static/syscalls.rst _static/tests.rst syscalls.tbl \
+		${abs_top_builddir}/metadata/ltp.json
-- 
2.47.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
