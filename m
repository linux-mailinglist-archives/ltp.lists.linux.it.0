Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DEFA6E73D
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Mar 2025 00:40:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B22E53C9951
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Mar 2025 00:40:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D86063C91BC
 for <ltp@lists.linux.it>; Tue, 25 Mar 2025 00:40:21 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 930A514044D8
 for <ltp@lists.linux.it>; Tue, 25 Mar 2025 00:40:20 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B32521185;
 Mon, 24 Mar 2025 23:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1742859619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yah0Of8ApbczGd1MRNq2yFDNtt0Ju5SCcVViYk5HWik=;
 b=3DITrX8SDBDx8cef4JfH1MEc7yReUsSrhWiKVH54qnXDH3dPHVb1tIWSJqMYPQxDKk+uZM
 fqF2YHu1Fnq3Wab2ZoY5DoJCPuIsApSVNUvoFOWXcjQg0kqrn5zS3HfeAJGQRAKptVDU6j
 BqpngKF9ZWqPIywaX25uYM1tl5cc+4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1742859619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yah0Of8ApbczGd1MRNq2yFDNtt0Ju5SCcVViYk5HWik=;
 b=A2gm1jhjHsZz+DgfrRgXNWTYSSP9fWuvaI7JL16MP+FWZFKWEZYdTH9RHe6EPYCqqyqChs
 C1qfPeMZdKNIVSCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1742859619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yah0Of8ApbczGd1MRNq2yFDNtt0Ju5SCcVViYk5HWik=;
 b=3DITrX8SDBDx8cef4JfH1MEc7yReUsSrhWiKVH54qnXDH3dPHVb1tIWSJqMYPQxDKk+uZM
 fqF2YHu1Fnq3Wab2ZoY5DoJCPuIsApSVNUvoFOWXcjQg0kqrn5zS3HfeAJGQRAKptVDU6j
 BqpngKF9ZWqPIywaX25uYM1tl5cc+4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1742859619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yah0Of8ApbczGd1MRNq2yFDNtt0Ju5SCcVViYk5HWik=;
 b=A2gm1jhjHsZz+DgfrRgXNWTYSSP9fWuvaI7JL16MP+FWZFKWEZYdTH9RHe6EPYCqqyqChs
 C1qfPeMZdKNIVSCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5755113874;
 Mon, 24 Mar 2025 23:40:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dmJ1EmPt4WdEbAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 24 Mar 2025 23:40:19 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 Mar 2025 00:40:12 +0100
Message-ID: <20250324234016.367228-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:url,suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 0/4] Update doc related Makefile
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

Hi,

we talked about this in the meetup yesterday.

I would also prefer to change 'make help' to add few reasonable targets
(e.g. make doc), but that'll be another effort.

Kind regards,
Petr

Changes since v2:
* Add new commit "doc/Makefile: Remove also metadata/ltp.json"
* Add distclean in "doc/Makefile: Allow to create and use .venv"
* Makefile: doc target: calls also '.venv' target
* Makefile: Add 'doc-clean' target

Link to v2:
https://patchwork.ozlabs.org/project/ltp/list/?series=443894&state=*
https://lore.kernel.org/ltp/20250211233552.1990618-1-pvorel@suse.cz/

Petr Vorel (4):
  doc/Makefile: Remove also metadata/ltp.json
  doc/Makefile: Allow to create and use .venv
  Makefile: Update 'doc' target, add 'doc-clean'
  doc: Note 'make doc' in the building doc

 Makefile                         | 10 ++++++++--
 doc/Makefile                     | 22 +++++++++++++++++++---
 doc/developers/documentation.rst |  2 ++
 3 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.47.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
