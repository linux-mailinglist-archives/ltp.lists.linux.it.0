Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BA85AB19A
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Sep 2022 15:37:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F6BF3CA88D
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Sep 2022 15:37:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 24AA83C65EB
 for <ltp@lists.linux.it>; Fri,  2 Sep 2022 15:37:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5A32A1A01143
 for <ltp@lists.linux.it>; Fri,  2 Sep 2022 15:37:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E86055BF1C;
 Fri,  2 Sep 2022 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662125835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gd6Nd7GR9v2ypCJSAnHpW9bNMD9pTer+CjhYHNf1Sjk=;
 b=ZcrOpp41+amRq25k1IYClVwXWUfNKMDiUe+C+RQKy4qI0CmkuykqgfwTRkLXex28VoRkJh
 oMzgjMAN3E2TJ3o7x7x8r/n+YB5RvA/hW5IWh6NKzQtW2LlUGcmT2va6z+GSRLsbOxFS6o
 QV7T+egC2vzdZwKkSFwrD4y55VpsRlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662125835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gd6Nd7GR9v2ypCJSAnHpW9bNMD9pTer+CjhYHNf1Sjk=;
 b=7PwsMps1U4OGp4iYM28brurkKAp0IagiBic2o9Dzr66wWTVtdmUYxHC4SnueEUTWzfUzdl
 x0lDmnz5tRnhEQDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B33D21330E;
 Fri,  2 Sep 2022 13:37:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CMN9KgsHEmObBgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 02 Sep 2022 13:37:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  2 Sep 2022 15:37:03 +0200
Message-Id: <20220902133710.1785-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902133710.1785-1-pvorel@suse.cz>
References: <20220902133710.1785-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/9] shell API/tests: Require root for TST_{FORMAT,
 MOUNT}_DEVICE
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Although the warning is quite obvious:
tst_device.c:101: TINFO: Not allowed to open /dev/loop-control. Are you root?: EACCES (13)
tst_device.c:140: TINFO: No free devices found
TBROK: Failed to acquire device

it's safer to expect root to get valid result.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/shell/tst_format_device.sh      | 1 +
 lib/newlib_tests/shell/tst_mount_device.sh       | 1 +
 lib/newlib_tests/shell/tst_mount_device_tmpfs.sh | 1 +
 3 files changed, 3 insertions(+)

diff --git a/lib/newlib_tests/shell/tst_format_device.sh b/lib/newlib_tests/shell/tst_format_device.sh
index 73a919086..dbe4ea9e7 100755
--- a/lib/newlib_tests/shell/tst_format_device.sh
+++ b/lib/newlib_tests/shell/tst_format_device.sh
@@ -3,6 +3,7 @@
 # Copyright (c) 2022 Petr Vorel <pvorel@suse.cz>
 
 TST_FORMAT_DEVICE=1
+TST_NEEDS_ROOT=1
 TST_TESTFUNC=test
 TST_CNT=2
 TST_DEV_FS_OPTS="-b 1024"
diff --git a/lib/newlib_tests/shell/tst_mount_device.sh b/lib/newlib_tests/shell/tst_mount_device.sh
index 561f878d2..70f80f84a 100755
--- a/lib/newlib_tests/shell/tst_mount_device.sh
+++ b/lib/newlib_tests/shell/tst_mount_device.sh
@@ -3,6 +3,7 @@
 # Copyright (c) 2022 Petr Vorel <pvorel@suse.cz>
 
 TST_MOUNT_DEVICE=1
+TST_NEEDS_ROOT=1
 TST_FS_TYPE=ext4
 TST_TESTFUNC=test
 TST_CNT=3
diff --git a/lib/newlib_tests/shell/tst_mount_device_tmpfs.sh b/lib/newlib_tests/shell/tst_mount_device_tmpfs.sh
index 36a78bc85..ed2ba8c50 100755
--- a/lib/newlib_tests/shell/tst_mount_device_tmpfs.sh
+++ b/lib/newlib_tests/shell/tst_mount_device_tmpfs.sh
@@ -3,6 +3,7 @@
 # Copyright (c) 2022 Petr Vorel <pvorel@suse.cz>
 
 TST_MOUNT_DEVICE=1
+TST_NEEDS_ROOT=1
 TST_FS_TYPE=tmpfs
 TST_TESTFUNC=test
 
-- 
2.37.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
