Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F0447945BD0
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2024 12:08:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8EDAB3D1D69
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2024 12:08:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E4353D1D10
 for <ltp@lists.linux.it>; Fri,  2 Aug 2024 12:08:19 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AFF5A1001271
 for <ltp@lists.linux.it>; Fri,  2 Aug 2024 12:08:18 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A54C121B0E;
 Fri,  2 Aug 2024 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722593297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0/a8ZUEgVmErnzv+wNSbLj7mODLWZT8cRzDS9S+DFxQ=;
 b=njkeXQrMG1kPO6Qg4O51F5fCII648AENGdmyoU3zU00wQaX4CYP9RvfMPPxE8lMVFoInDf
 Qx8h1dlryOnwn81W2UL1JJJwrwmikIy2GvUx6NuzGhBmYK6lprhqEYYNUUj7+vO1jvqLO9
 oTL14U3F6xusiRtp0jP7/hFFzTPzOJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722593297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0/a8ZUEgVmErnzv+wNSbLj7mODLWZT8cRzDS9S+DFxQ=;
 b=uwNnqGqJ/OkMmlz+lRCF5vCq8m7IVXhj6PgQIaDuedMLUqTyfhMF4fMU3AaCSAOvC0IeJK
 9wF+4/DuU2YF7ADg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=LhiUBl+H;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=C+9TmAkq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722593296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0/a8ZUEgVmErnzv+wNSbLj7mODLWZT8cRzDS9S+DFxQ=;
 b=LhiUBl+HM9/TEHYii3Sib9gR/oNoBW1smXGE4Rzck1uFFuRIlxzbdnQdExPFd/dsKyvKcE
 ++//8a/g6nGhvPzQfc0QjtT6OIyCP0CT3ddHSh2XhBZQwwwHQdMsRd7Jk579LNljqvVRL2
 7yZ90JydO8O7KvVgLwHlL5fAKDqyCOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722593296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0/a8ZUEgVmErnzv+wNSbLj7mODLWZT8cRzDS9S+DFxQ=;
 b=C+9TmAkqptKs60xuKEIe6TE14NZ8mMtaNJ1l8BDdL81LJQPp6bXbTx5NGqsBy3H8X8oT0J
 ECSObfTSFH6iUGBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73E8D1388E;
 Fri,  2 Aug 2024 10:08:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4N5+GhCwrGZfNAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 02 Aug 2024 10:08:16 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  2 Aug 2024 12:08:16 +0200
Message-ID: <20240802100816.1617563-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A54C121B0E
X-Spam-Score: -2.81
X-Spam-Level: 
X-Spamd-Result: default: False [-2.81 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_FIVE(0.00)[5]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/1] doc: Document "No new API functions for old API"
 rule
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/developers/ltp_library.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/doc/developers/ltp_library.rst b/doc/developers/ltp_library.rst
index c103665164..f76cbb75e6 100644
--- a/doc/developers/ltp_library.rst
+++ b/doc/developers/ltp_library.rst
@@ -12,6 +12,8 @@ for :doc:`writing tests <../developers/writing_tests>`
 
 #. LTP library tests must go inside :master:`lib/newlib_tests` directory
 #. LTP documentation has to be updated according to API changes
+#. Do not add new API functions to the old API. Add new functions to
+   ``tst_.[ch]`` files.
 
 Shell API
 ---------
-- 
2.45.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
