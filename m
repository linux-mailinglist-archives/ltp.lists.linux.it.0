Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E72511809
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Apr 2022 14:51:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B8A93CA68D
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Apr 2022 14:50:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F1E743CA5B3
 for <ltp@lists.linux.it>; Wed, 27 Apr 2022 14:50:08 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DCF611A009B3
 for <ltp@lists.linux.it>; Wed, 27 Apr 2022 14:50:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A85D210F4;
 Wed, 27 Apr 2022 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1651063807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4RtyiCmULb9Qmd/GDkpTwtMA6EUEDOPXvp+hy+5qnEg=;
 b=a6unRLoYFoBBMj+sINwRRJZ7NnwBDBz/eYHw/tnPiGMFHwG4XcKk9Hi/tI3YgiJvAod1tz
 R+7a6fMClwwinRoChNWodU5Yrx5e23rX7mTYE4ALRiieOi5lt66yysoy1d6/IXdgLXQERP
 mNtzTYmt4ZBnkvV9CPOr57Z52jfFYW0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1651063807;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4RtyiCmULb9Qmd/GDkpTwtMA6EUEDOPXvp+hy+5qnEg=;
 b=kmzPF7w+UrwwPCfhesVYyABU5xn3qO3o5T8lviYKV5IkqrBSMw+GXLsHqoRyCZWQxE8Ox8
 XPBsw+1vLZ0ZHdBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02A651323E;
 Wed, 27 Apr 2022 12:50:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ECnrOv47aWK5RgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 27 Apr 2022 12:50:06 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 27 Apr 2022 14:49:59 +0200
Message-Id: <20220427125003.20815-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220427125003.20815-1-pvorel@suse.cz>
References: <20220427125003.20815-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/5] busy_poll_lib.sh: Mention setup/cleanup
 defined in tests
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
Cc: Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v3

 testcases/network/busy_poll/busy_poll_lib.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/network/busy_poll/busy_poll_lib.sh b/testcases/network/busy_poll/busy_poll_lib.sh
index d17504466..69e590031 100755
--- a/testcases/network/busy_poll/busy_poll_lib.sh
+++ b/testcases/network/busy_poll/busy_poll_lib.sh
@@ -1,10 +1,14 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) Linux Test Project, 2016-2022
 # Copyright (c) 2016-2018 Oracle and/or its affiliates. All Rights Reserved.
 
-TST_SETUP="setup"
 TST_TESTFUNC="test"
+
+# setup and cleanup defined in tests using this library
+TST_SETUP="setup"
 TST_CLEANUP="cleanup"
+
 TST_MIN_KVER="3.11"
 TST_NEEDS_TMPDIR=1
 TST_NEEDS_ROOT=1
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
