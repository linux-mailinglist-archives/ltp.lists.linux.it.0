Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A0AA32850
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2025 15:24:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 702D93C9A1A
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2025 15:24:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 311213C92D5
 for <ltp@lists.linux.it>; Wed, 12 Feb 2025 15:24:27 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 83BE462EF59
 for <ltp@lists.linux.it>; Wed, 12 Feb 2025 15:24:26 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 780211FB50;
 Wed, 12 Feb 2025 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1739370266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X9tUvBW6Lr3kgkNJlah800PxoWmTwpAWGfAYtr2id3M=;
 b=FQGeFM7vmxxRAnj6FCVqsc+AyTwnGLwFkl6ieW/ikjynCEmUgrBfH2txYzxcqAxTlt5kOx
 WI6Y81aYJ9hIVvmxXewPXTxkqNCTWmKRCFeEipri1hgmtJ/Qa1rjMO1JGFpeiySyWbEjGe
 Ka17TBGgbLQVyTd1mKAPJ/aNwH0NTrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1739370266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X9tUvBW6Lr3kgkNJlah800PxoWmTwpAWGfAYtr2id3M=;
 b=tjomH9rCnILQGkmn1duLsBwxjMJ+4okIhPHu3VaM1vxeZwGflbpwFdwvReQqj3+hdvz3wX
 UnNlyl1kOxsvq8Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1739370266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X9tUvBW6Lr3kgkNJlah800PxoWmTwpAWGfAYtr2id3M=;
 b=FQGeFM7vmxxRAnj6FCVqsc+AyTwnGLwFkl6ieW/ikjynCEmUgrBfH2txYzxcqAxTlt5kOx
 WI6Y81aYJ9hIVvmxXewPXTxkqNCTWmKRCFeEipri1hgmtJ/Qa1rjMO1JGFpeiySyWbEjGe
 Ka17TBGgbLQVyTd1mKAPJ/aNwH0NTrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1739370266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X9tUvBW6Lr3kgkNJlah800PxoWmTwpAWGfAYtr2id3M=;
 b=tjomH9rCnILQGkmn1duLsBwxjMJ+4okIhPHu3VaM1vxeZwGflbpwFdwvReQqj3+hdvz3wX
 UnNlyl1kOxsvq8Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45AB013874;
 Wed, 12 Feb 2025 14:24:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id O8QbEBqvrGcsMAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 12 Feb 2025 14:24:26 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 12 Feb 2025 15:24:23 +0100
Message-ID: <20250212142424.2070774-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.978];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_THREE(0.00)[4];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/1] doc: Sort items in the test catalog
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

Sorting items with 'sort' in metadata/parse.sh does not help, because
whole path is sorted, not file name only.

NOTE: I would keep the 'sort' in metadata/parse.sh due JSON file build
reproducibility.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/conf.py b/doc/conf.py
index 0bebd0e242..03fcff67e8 100644
--- a/doc/conf.py
+++ b/doc/conf.py
@@ -435,7 +435,7 @@ def generate_test_catalog(_):
 
     timeout_def = metadata['defaults']['timeout']
 
-    for test_name, conf in metadata['tests'].items():
+    for test_name, conf in sorted(metadata['tests'].items()):
         text.extend([
             f'{test_name}',
             len(test_name) * '-'
-- 
2.47.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
