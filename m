Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E03E9525601
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 21:46:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA1353CA9CA
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 21:46:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B739F3C8CC3
 for <ltp@lists.linux.it>; Thu, 12 May 2022 21:46:06 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2B0311A00CD8
 for <ltp@lists.linux.it>; Thu, 12 May 2022 21:46:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C816921AE0;
 Thu, 12 May 2022 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652384765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QDzL0roLFuzu6IlMVOS+RGiOMAseo+L9JBr3rME+6x0=;
 b=o17+/Cc8hiIr3wVHdhdcgeVMP6PeP5qv+qL2XpdbSIKb3t+HIc/Nd2CMDcRCAuJ5yTo4BV
 /jLFYT/jjJgvqH61HnwHQNOIYuPkcFyhmXIfatb9fJ06kDmh3d15dvTimHkK7TP8ehyohp
 L5P/RuXwEVY1z1pk2OnrLDKYdM6c8v0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652384765;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QDzL0roLFuzu6IlMVOS+RGiOMAseo+L9JBr3rME+6x0=;
 b=T699AtQroaI0mFs8lmhg9k52nWBoLqG8FLdtEi68iO7vYw3vFKIPlczkqf2xSRSN+eAtFF
 Zt0FCFcgonLzMsCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43A8D13ABE;
 Thu, 12 May 2022 19:46:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YGRpDv1jfWIkVwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 12 May 2022 19:46:05 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 May 2022 21:45:53 +0200
Message-Id: <20220512194557.30911-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512194557.30911-1-pvorel@suse.cz>
References: <20220512194557.30911-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 4/8] shell: Add test for TST_MOUNT_DEVICE=1
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

Unfortunately GitHub Actions don't have loop devices, thus cannot be run
in CI:

tst_format_device 1 TINFO: timeout per run is 0h 5m 0s
/__w/ltp/ltp/lib/tst_device.c:139: TINFO: No free devices found

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/shell/tst_mount_device.sh | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100755 lib/newlib_tests/shell/tst_mount_device.sh

diff --git a/lib/newlib_tests/shell/tst_mount_device.sh b/lib/newlib_tests/shell/tst_mount_device.sh
new file mode 100755
index 000000000..c8f185626
--- /dev/null
+++ b/lib/newlib_tests/shell/tst_mount_device.sh
@@ -0,0 +1,21 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2022 Petr Vorel <pvorel@suse.cz>
+
+TST_MOUNT_DEVICE=1
+TST_FS_TYPE=ext4
+TST_TESTFUNC=test
+TST_CNT=2
+
+test1()
+{
+	EXPECT_PASS "cd $TST_MNTPOINT"
+}
+
+test2()
+{
+	EXPECT_PASS "grep '$TST_MNTPOINT $TST_FS_TYPE' /proc/mounts"
+}
+
+. tst_test.sh
+tst_run
-- 
2.36.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
