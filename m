Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5361CA2AC92
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2025 16:35:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04D403C92A2
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2025 16:35:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3CB633C923B
 for <ltp@lists.linux.it>; Thu,  6 Feb 2025 16:34:42 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6D6B514223BB
 for <ltp@lists.linux.it>; Thu,  6 Feb 2025 16:34:42 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E3521F381;
 Thu,  6 Feb 2025 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1738856081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vxs4BGGfohenaqbP9tgzAAPH3lQ6uVI6PtuuOIQmSfE=;
 b=QpiexoEnWhGT99QVyrR70MCzccE+j4u4WAIl0tmFZWN4T9HNXAm3zl6whOHJidYD+koryl
 QBzO2OQ3gT23BxRTPRxDEfNODd0zQbmTeJwKtsAhy24v0hoyUqBnHhYznUs4LL+3/F4JAT
 77CUiCBimbR6bCkp5LZQz8hzcn3IvPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1738856081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vxs4BGGfohenaqbP9tgzAAPH3lQ6uVI6PtuuOIQmSfE=;
 b=1KS8a9RscsTTqL6KDATdA46oyB5oeFsYvkGAr1qU6gVdYmD7sxTXrncMVKgCPbW/mTAFF+
 zn3EoEW1H7o+zSDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=QpiexoEn;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=1KS8a9Rs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1738856081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vxs4BGGfohenaqbP9tgzAAPH3lQ6uVI6PtuuOIQmSfE=;
 b=QpiexoEnWhGT99QVyrR70MCzccE+j4u4WAIl0tmFZWN4T9HNXAm3zl6whOHJidYD+koryl
 QBzO2OQ3gT23BxRTPRxDEfNODd0zQbmTeJwKtsAhy24v0hoyUqBnHhYznUs4LL+3/F4JAT
 77CUiCBimbR6bCkp5LZQz8hzcn3IvPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1738856081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vxs4BGGfohenaqbP9tgzAAPH3lQ6uVI6PtuuOIQmSfE=;
 b=1KS8a9RscsTTqL6KDATdA46oyB5oeFsYvkGAr1qU6gVdYmD7sxTXrncMVKgCPbW/mTAFF+
 zn3EoEW1H7o+zSDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1B2913A7F;
 Thu,  6 Feb 2025 15:34:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KBP0OZDWpGcUOwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 06 Feb 2025 15:34:40 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  6 Feb 2025 16:34:31 +0100
Message-ID: <20250206153435.1602181-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206153435.1602181-1-pvorel@suse.cz>
References: <20250206153435.1602181-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 2E3521F381
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:dkim,suse.cz:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_THREE(0.00)[4];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 1/5] doc/Makefile: Add dependency on
 metadata/ltp.json
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

Fixes: 1bf344a3db ("doc: add tests catalog page")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/doc/Makefile b/doc/Makefile
index e536e95db6..c5f60dfa1e 100644
--- a/doc/Makefile
+++ b/doc/Makefile
@@ -1,4 +1,11 @@
-all:
+top_srcdir		?= ..
+
+include $(top_srcdir)/include/mk/env_pre.mk
+
+${abs_top_builddir}/metadata/ltp.json:
+	$(MAKE) -C ${abs_top_builddir}/metadata
+
+all: ${abs_top_builddir}/metadata/ltp.json
 	sphinx-build -b html . html
 
 spelling:
-- 
2.47.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
