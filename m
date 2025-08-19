Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A72B2C8B9
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Aug 2025 17:50:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBF8A3CC997
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Aug 2025 17:50:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3F4353C052E
 for <ltp@lists.linux.it>; Tue, 19 Aug 2025 17:50:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8C3561400B8F
 for <ltp@lists.linux.it>; Tue, 19 Aug 2025 17:50:01 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08F6321243
 for <ltp@lists.linux.it>; Tue, 19 Aug 2025 15:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1755618600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DgJY67cpt4YwH8j0fkub1cKQfHnYu29E5Sp4zQca3Rc=;
 b=iY2rXCr/Y/K73fvVDdbRlkAjy+n0RctxqAMZZSAH3aqPugjZtUKHZ570cZ84XwRhEcmtWw
 I5DMv+KURqyh+RW4O1UKgo3HI3SejaV/fGlgOqomXFNWGs3Yo6ehMdCvF3ta9DycSQsc5v
 VHmEobhEX+j9gf1+zDlZAGIDbJsUgRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1755618600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DgJY67cpt4YwH8j0fkub1cKQfHnYu29E5Sp4zQca3Rc=;
 b=AJ9YbyH+CA5r7u7zXsDAUqybrnYfO67RRJYPcFsX+SkxgoC1HoHBS8SUrd/WWZYjprqJaj
 ReGDJaEBhBCxfzAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="iY2rXCr/";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=AJ9YbyH+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1755618600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DgJY67cpt4YwH8j0fkub1cKQfHnYu29E5Sp4zQca3Rc=;
 b=iY2rXCr/Y/K73fvVDdbRlkAjy+n0RctxqAMZZSAH3aqPugjZtUKHZ570cZ84XwRhEcmtWw
 I5DMv+KURqyh+RW4O1UKgo3HI3SejaV/fGlgOqomXFNWGs3Yo6ehMdCvF3ta9DycSQsc5v
 VHmEobhEX+j9gf1+zDlZAGIDbJsUgRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1755618600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DgJY67cpt4YwH8j0fkub1cKQfHnYu29E5Sp4zQca3Rc=;
 b=AJ9YbyH+CA5r7u7zXsDAUqybrnYfO67RRJYPcFsX+SkxgoC1HoHBS8SUrd/WWZYjprqJaj
 ReGDJaEBhBCxfzAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0289C13686
 for <ltp@lists.linux.it>; Tue, 19 Aug 2025 15:50:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oaxxACidpGiaYQAAD6G6ig
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 19 Aug 2025 15:50:00 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 19 Aug 2025 17:49:52 +0200
Message-ID: <20250819154957.79325-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_ONE(0.00)[1]; ARC_NA(0.00)[]; TO_DN_NONE(0.00)[];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:mid,suse.cz:dkim,suse.cz:email];
 FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.cz:+];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Rspamd-Queue-Id: 08F6321243
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] Makefile: Fix module dirs search
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

Module dirs search runs relative to current working directory instead
of the source directory. In an out-of-tree build, the search for makefiles
will come up empty and grep will try to read from standard input, blocking
indefinitely. Search for makefiles relative to the source directory to fix
the issue.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 77270bc7c..7f0ba5e86 100644
--- a/Makefile
+++ b/Makefile
@@ -213,7 +213,7 @@ test-metadata: metadata-all
 	$(MAKE) -C $(abs_srcdir)/metadata test
 
 MODULE_DIRS :=  $(shell \
-	dirname $$(grep -l 'include.*module\.mk' $$(find testcases/ -type f -name 'Makefile')))
+	dirname $$(grep -l 'include.*module\.mk' $$(find $(abs_srcdir)/testcases/ -type f -name 'Makefile')))
 
 
 .PHONY: modules modules-clean modules-install
-- 
2.50.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
