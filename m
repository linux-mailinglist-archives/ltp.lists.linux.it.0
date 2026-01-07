Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF22CFE79F
	for <lists+linux-ltp@lfdr.de>; Wed, 07 Jan 2026 16:07:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22D1F3C30CB
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jan 2026 16:07:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B39FD3C2B7D
 for <ltp@lists.linux.it>; Wed,  7 Jan 2026 16:07:20 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 30ED81000751
 for <ltp@lists.linux.it>; Wed,  7 Jan 2026 16:07:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A23065C1C9;
 Wed,  7 Jan 2026 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767798438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ml6JFo1LCGBLo1qf80vw80dLeBZIi68eYKxfmA8+sHk=;
 b=u23wT+twd0Az5WTPO5437RwSMGr89jslA5plCcTUH3zgyeMfaVJkpFQfeHQf1aGOPrminy
 NDz96oFbM9D9eQwCfc77MiLJZOFEHAOfMmPsbNm0UgdVmAcmbuHesPS9ppeuZYkcTg13J0
 ZdFMV5PIXG8vnDF10UdO+6XfewV4qns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767798438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ml6JFo1LCGBLo1qf80vw80dLeBZIi68eYKxfmA8+sHk=;
 b=R6qyM2oJ/mYeq7vblVLjqJ3d7GZpAqW1vY74tKWb/GdKEOzz8gbZgPi9FEycNjp75hJ0zd
 4FvnYH2Hat93C6Dw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=u23wT+tw;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=R6qyM2oJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767798438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ml6JFo1LCGBLo1qf80vw80dLeBZIi68eYKxfmA8+sHk=;
 b=u23wT+twd0Az5WTPO5437RwSMGr89jslA5plCcTUH3zgyeMfaVJkpFQfeHQf1aGOPrminy
 NDz96oFbM9D9eQwCfc77MiLJZOFEHAOfMmPsbNm0UgdVmAcmbuHesPS9ppeuZYkcTg13J0
 ZdFMV5PIXG8vnDF10UdO+6XfewV4qns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767798438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ml6JFo1LCGBLo1qf80vw80dLeBZIi68eYKxfmA8+sHk=;
 b=R6qyM2oJ/mYeq7vblVLjqJ3d7GZpAqW1vY74tKWb/GdKEOzz8gbZgPi9FEycNjp75hJ0zd
 4FvnYH2Hat93C6Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A3043EA63;
 Wed,  7 Jan 2026 15:07:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id acTrHKZ2XmlDagAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 07 Jan 2026 15:07:18 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  7 Jan 2026 16:07:14 +0100
Message-ID: <20260107150714.783460-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: A23065C1C9
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/1] doc: Update linuxdoc to 20240924
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

Update to the latest release.

2 minor fixes:
* a87ed0a ("[fix] export option to kernel-doc directive")
* 942fecd ("[fix]] kernel_include.py: cope with docutils 0.21")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/requirements.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/requirements.txt b/doc/requirements.txt
index 1b9a984547..ed9e31601d 100644
--- a/doc/requirements.txt
+++ b/doc/requirements.txt
@@ -3,5 +3,5 @@
 sphinx==7.2.6
 sphinx-rtd-theme==2.0.0
 
-linuxdoc==20231020
+linuxdoc==20240924
 sphinxcontrib-spelling==7.7.0
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
