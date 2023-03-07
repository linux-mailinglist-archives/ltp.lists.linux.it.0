Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F33FB6AE364
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Mar 2023 15:55:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9CAA3CD9F2
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Mar 2023 15:55:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F05A3CB889
 for <ltp@lists.linux.it>; Tue,  7 Mar 2023 15:55:27 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1E9906002E3
 for <ltp@lists.linux.it>; Tue,  7 Mar 2023 15:55:26 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5236921A05;
 Tue,  7 Mar 2023 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1678200925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zc8I6g3+IbiazhMlJSJjRlsgRUikjDXPBNzKMBblYiE=;
 b=q1tQZNvxeMCUVtnKn4y1nxvPj+eozfGew9Mv9bBia8SWWQW4Hq7OIRJE/jNeLHz/BTAtxI
 Y+40PWN5laqKVfsNP0ob1XcdeW9xM7qLQ/LTlqDNmsB9j0mS0wI+NyhaEAg26+U+w8uwKf
 DPJmybnNTyItMXp5GIJ3xvT367c1wac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1678200925;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zc8I6g3+IbiazhMlJSJjRlsgRUikjDXPBNzKMBblYiE=;
 b=AkNOm+VQh74tsMGtC7dSel515BB8DIZKurEukgcy99TswBdHFhYYrqkRxWs+PY7AZXcxz/
 6wwOM1jFrxBmm7DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0A451341F;
 Tue,  7 Mar 2023 14:55:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 87y+M1xQB2Q0DwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 07 Mar 2023 14:55:24 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  7 Mar 2023 15:55:15 +0100
Message-Id: <20230307145517.1359-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] df01.sh: fix for XFS on kernel >= 5.19
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
Cc: Eric Sandeen <sandeen@sandeen.net>, "Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

I finally find a time to fix this.

Kind regards,
Petr

Petr Vorel (2):
  lib: Add tst_fsfreeze.c
  df01.sh: Use tst_fsfreeze for XFS on kernel >= 5.19

 testcases/commands/df/df01.sh |  7 ++++++-
 testcases/lib/.gitignore      |  3 ++-
 testcases/lib/Makefile        |  2 +-
 testcases/lib/tst_fsfreeze.c  | 38 +++++++++++++++++++++++++++++++++++
 4 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 testcases/lib/tst_fsfreeze.c

-- 
2.39.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
