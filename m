Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB34F92F6C4
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2024 10:14:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E8FE3D1965
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2024 10:14:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 62EE33C1037
 for <ltp@lists.linux.it>; Fri, 12 Jul 2024 10:14:03 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 69A8D1401191
 for <ltp@lists.linux.it>; Fri, 12 Jul 2024 10:14:03 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C671E211F6;
 Fri, 12 Jul 2024 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1720772042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/HoaZch0ZYL/tiZdhg/6Fq+ASG3Z3vLy3EK5q/GtE+k=;
 b=1ggGGnOYAcr1yDXGXpU5o/G2XzqrpGZY4B+Pq4luJgOco59KLcQt7y7Kg8JftBYaXSl3NL
 2NwmD5CngAUCmJPSXejgiCAtSb/Kk5ednFjco0raM2QZqRgkSP502x0QJsn4B6LtzUu+aL
 gFZEoA5ox25HO1pZONjjG63DZYkjCDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1720772042;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/HoaZch0ZYL/tiZdhg/6Fq+ASG3Z3vLy3EK5q/GtE+k=;
 b=BU5CVXXUsz9DOU1wtoF9HV8MGMn7Lwm7NA0/6NWIyGBzp1aefaofZjCjHuOP2l3v2C+/9U
 5fYUgfIJKkA1l4Cw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=F2JlfH7s;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=P2EjOoUz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1720772041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/HoaZch0ZYL/tiZdhg/6Fq+ASG3Z3vLy3EK5q/GtE+k=;
 b=F2JlfH7sApC8KfLWj1rBS8eIszv9Ench8MzAASi6prjGXGrqZrSjYpw5oRwX5zYdbFXwhr
 PFdBwNDVxkH2jwnIC8De6Ol76F60BOIY+dJddjgj13Uks5rkH0/ghnN7Ja31Ls7quNYR++
 K/ZEPA63fiYDjuJHVD96un4xQTrNZ28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1720772041;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/HoaZch0ZYL/tiZdhg/6Fq+ASG3Z3vLy3EK5q/GtE+k=;
 b=P2EjOoUzWxbSJqyULosaOO6VLPzNyVdZQ8fPSwI9CV9u32opGx3yjDEbENLwECjX5uCIDj
 byMwJVI0kFPPKcDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 776D91373E;
 Fri, 12 Jul 2024 08:14:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id O9vSGsnlkGYOfwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 12 Jul 2024 08:14:01 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 12 Jul 2024 10:13:57 +0200
Message-ID: <20240712081359.116227-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Rspamd-Queue-Id: C671E211F6
X-Spam-Score: 0.99
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.99 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_THREE(0.00)[3]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim]
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 0/2] lib: Create tst_tmpdir.h
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

changes v2->v3:
* Add tst_tmpdir.h also to include/tst_test.h (Avinesh)
* Split doc change into a separate commit

Petr Vorel (2):
  lib: Create tst_tmpdir.h
  doc/C API: Add tst_tmpdir.h

 doc/developers/api_c_tests.rst |  4 ++++
 include/tst_device.h           |  6 +-----
 include/tst_test.h             |  1 +
 include/tst_tmpdir.h           | 19 +++++++++++++++++++
 lib/tst_tmpdir.c               |  1 +
 5 files changed, 26 insertions(+), 5 deletions(-)
 create mode 100644 include/tst_tmpdir.h

-- 
2.45.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
