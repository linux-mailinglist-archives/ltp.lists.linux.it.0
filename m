Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88988A2AB7D
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2025 15:35:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A4213C9283
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2025 15:35:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 570BB3C12C2
 for <ltp@lists.linux.it>; Thu,  6 Feb 2025 15:34:47 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 428B2600202
 for <ltp@lists.linux.it>; Thu,  6 Feb 2025 15:34:44 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35D731F44B;
 Thu,  6 Feb 2025 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1738852484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=G228UpwGTYSjE7qnW48Tz54K5s3odHilj7WV1uzZnLg=;
 b=M2BY4Pt2WXYP7s3PdzcpNtxUouv3Harc7w5je/hK9/GrDBtdkNGvslbjlU40Psen6G6H6A
 q2o5NfnbZ1Vla1m+MPye/Pbiz+P4EN46sWpwryEGri8Br7qb4DZATWrGpayf8jxMRQfM/K
 6cUy4AuUCBcOPAZHTBMKG+kfEVnOi/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1738852484;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=G228UpwGTYSjE7qnW48Tz54K5s3odHilj7WV1uzZnLg=;
 b=7Gn/Yb8wMp1NjAVxYW1T0Bzh4lOoyyNJ+v+IfiOmnfbbCznQ/LVKboid0RJjGncHyWGi7n
 FW2g0tCCpwxKDjAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1738852484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=G228UpwGTYSjE7qnW48Tz54K5s3odHilj7WV1uzZnLg=;
 b=M2BY4Pt2WXYP7s3PdzcpNtxUouv3Harc7w5je/hK9/GrDBtdkNGvslbjlU40Psen6G6H6A
 q2o5NfnbZ1Vla1m+MPye/Pbiz+P4EN46sWpwryEGri8Br7qb4DZATWrGpayf8jxMRQfM/K
 6cUy4AuUCBcOPAZHTBMKG+kfEVnOi/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1738852484;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=G228UpwGTYSjE7qnW48Tz54K5s3odHilj7WV1uzZnLg=;
 b=7Gn/Yb8wMp1NjAVxYW1T0Bzh4lOoyyNJ+v+IfiOmnfbbCznQ/LVKboid0RJjGncHyWGi7n
 FW2g0tCCpwxKDjAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5902713694;
 Thu,  6 Feb 2025 14:34:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id N/SYFIPIpGfvJwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 06 Feb 2025 14:34:43 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  6 Feb 2025 15:34:14 +0100
Message-ID: <20250206143421.1571918-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 0/7] configure.ac and make cleanup
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

cleanup of configure.ac and make related to realtime and sphinx
makefile.

Kind regards,
Petr

Petr Vorel (7):
  realtime: Document bash and python3 dependencies
  configure: Ignore --with-{bash,python} knobs
  doc/Makefile: Improve make targets
  doc: documentation.rst: Update build instructions
  .github: ci-sphinx-doc: Use make for building doc
  configure: make: Add SPDX, update copyright
  doc/Makefile: Add dependency on metadata/ltp.json

 .github/workflows/ci-sphinx-doc.yml | 11 ++++-------
 configure.ac                        | 17 +++++-----------
 doc/Makefile                        | 30 +++++++++++++++++++++++++----
 doc/developers/documentation.rst    | 16 +++------------
 include/mk/automake.mk              | 24 ++++-------------------
 include/mk/config-openposix.mk.in   |  2 ++
 include/mk/config.mk.in             | 23 +++-------------------
 include/mk/env_post.mk              | 25 ++++--------------------
 include/mk/env_pre.mk               | 26 ++++---------------------
 include/mk/features.mk.in           | 24 ++---------------------
 include/mk/functions.mk             | 25 ++++--------------------
 include/mk/generic_leaf_target.inc  | 24 ++++-------------------
 include/mk/generic_leaf_target.mk   | 24 ++++-------------------
 include/mk/generic_trunk_target.inc | 24 ++++-------------------
 include/mk/generic_trunk_target.mk  | 24 ++++-------------------
 include/mk/lib.mk                   | 27 ++++----------------------
 include/mk/man.mk                   | 23 +++-------------------
 include/mk/module.mk                | 18 ++---------------
 include/mk/rules.mk                 |  3 +++
 include/mk/sparse.mk                |  2 ++
 include/mk/testcases.mk             | 22 ++-------------------
 testcases/realtime/README           |  4 +++-
 22 files changed, 96 insertions(+), 322 deletions(-)

-- 
2.47.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
