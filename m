Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD83DB01AA2
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jul 2025 13:36:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7696B3CA4B5
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jul 2025 13:36:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4BF003C6BC7
 for <ltp@lists.linux.it>; Fri, 11 Jul 2025 13:35:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9C4FE200AD6
 for <ltp@lists.linux.it>; Fri, 11 Jul 2025 13:35:58 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 171FE1F78C
 for <ltp@lists.linux.it>; Fri, 11 Jul 2025 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752233757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ePMy26ohEdUmAJm2Zw455qGii1N//hIECbL2Y7ekQTc=;
 b=DVBcrkKl9i23P/7gqTRsMxl69UOl3RKT3x/BjOnVYrbmlf1njULwj7LeayiiY3yXvdtwzg
 oMA8QS306yeifDs+SfZ/ISHpJ5ZEucP90FI9puEnF2BR38GAZ94dQRcM2QuwSRShk8vLzN
 OKkZDssBtuzPIN398xGqwgUf4KGVO70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752233757;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ePMy26ohEdUmAJm2Zw455qGii1N//hIECbL2Y7ekQTc=;
 b=BekYl2inLJNgmo5U9RpzYFGzmZyTBHRmf079I3plvX+aCHSaznZ2glFlnGRQnVtFzYPg13
 qdsrSKALDvNsp0AQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=DVBcrkKl;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=BekYl2in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752233757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ePMy26ohEdUmAJm2Zw455qGii1N//hIECbL2Y7ekQTc=;
 b=DVBcrkKl9i23P/7gqTRsMxl69UOl3RKT3x/BjOnVYrbmlf1njULwj7LeayiiY3yXvdtwzg
 oMA8QS306yeifDs+SfZ/ISHpJ5ZEucP90FI9puEnF2BR38GAZ94dQRcM2QuwSRShk8vLzN
 OKkZDssBtuzPIN398xGqwgUf4KGVO70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752233757;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ePMy26ohEdUmAJm2Zw455qGii1N//hIECbL2Y7ekQTc=;
 b=BekYl2inLJNgmo5U9RpzYFGzmZyTBHRmf079I3plvX+aCHSaznZ2glFlnGRQnVtFzYPg13
 qdsrSKALDvNsp0AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3A911388B
 for <ltp@lists.linux.it>; Fri, 11 Jul 2025 11:35:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +9qXOhz3cGhlFwAAD6G6ig
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 11 Jul 2025 11:35:56 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Jul 2025 13:36:30 +0200
Message-ID: <20250711113632.11391-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Level: 
X-Rspamd-Queue-Id: 171FE1F78C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_ONE(0.00)[1]; ARC_NA(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+]; TO_DN_NONE(0.00)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.cz:dkim];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.cz:dkim, suse.cz:mid]
X-Spam-Score: -3.01
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 0/2] Two more metadata parser fixes
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

This series fixes a metadata parser for the ".filesystems" entry of the
tst_test structure. First patch fixes the data storage to JSON
serialization and second patch changes the parser to convert structure
intialization with only designated initializers into a hash (object)
rather than an arrray.

V2: Fixed corner case in structure parsing as reported by Andrea

Cyril Hrubis (2):
  metadata: data_storage: Fix hash to json object serialization
  metaparse: Map arrays with designated initializers to JSON objects

 metadata/data_storage.h |  28 ++++++--
 metadata/metaparse.c    | 142 +++++++++++++++++++++++++++++++++-------
 2 files changed, 143 insertions(+), 27 deletions(-)

-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
