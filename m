Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD74C3DFDF3
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 11:24:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8312F3C8007
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 11:24:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5C24B3C65B1
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 11:24:26 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CF65D1A010F9
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 11:24:25 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 615442011D;
 Wed,  4 Aug 2021 09:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628069065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrtlg+xUggk1ttMMMPRb7kBQM9H+qEIUw045ypQjMOo=;
 b=WmHQI/ZvVF6C8GXvGSsq+6FMkLQoykE8fu71AU5EdIrSNRHvGAwVFvOfOS27qCbbwrAIt8
 rA8EoyNSO0u4yshLaKcIrgP5F8Nr7uUhcai8tO+EVotVt0E9nGMVchGlJifl/WWzDO3f2z
 +VFsX4m5FW46iX+wvmAG9EcsVTDIVGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628069065;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrtlg+xUggk1ttMMMPRb7kBQM9H+qEIUw045ypQjMOo=;
 b=fzNQegstIjZBXvmJWCe1/k24WT+qCna1Y+SrurHRZiMhhX3YlMWgnPoFzLHSbXyWn40ZLv
 J/xQu6YNX70DhbDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 34B0E1338E;
 Wed,  4 Aug 2021 09:24:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id kPNNC8lcCmHhagAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 04 Aug 2021 09:24:25 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Aug 2021 11:24:07 +0200
Message-Id: <20210804092407.16015-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210804092407.16015-1-pvorel@suse.cz>
References: <20210804092407.16015-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v8 2/7] test/test_zero_hugepage.sh: Skip test on
 read-only /proc
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

or /proc/sys. On GitHub Actions /proc/sys/vm/nr_hugepages is not allowed
to be changed:

./test_zero_hugepage.sh: line 9: can't create /proc/sys/vm/nr_hugepages: Read-only file system
tst_hugepage.c:57: TBROK: Failed to open FILE '/proc/sys/vm/nr_hugepages' for writing: EROFS (30)
tst_sys_conf.c:102: TWARN: Failed to open FILE '/proc/sys/vm/nr_hugepages'

There are several /proc subdirectories mounted as read only:
$ grep '^proc /proc.* proc ro' /proc/mounts
proc /proc/bus proc ro,nosuid,nodev,noexec,relatime 0 0
proc /proc/fs proc ro,nosuid,nodev,noexec,relatime 0 0
proc /proc/irq proc ro,nosuid,nodev,noexec,relatime 0 0
proc /proc/sys proc ro,nosuid,nodev,noexec,relatime 0 0
proc /proc/sysrq-trigger proc ro,nosuid,nodev,noexec,relatime 0 0

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v7->v8:
* check for readonly fs instead TCONF on any error during writing to
/proc/sys/vm/nr_hugepages (Cyril)

 lib/newlib_tests/test_zero_hugepage.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/newlib_tests/test_zero_hugepage.sh b/lib/newlib_tests/test_zero_hugepage.sh
index 10113006b..d270e686c 100755
--- a/lib/newlib_tests/test_zero_hugepage.sh
+++ b/lib/newlib_tests/test_zero_hugepage.sh
@@ -1,11 +1,17 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2021 Yang Xu <xuyang2018.jy@fujitsu.com>
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
 
 echo "Testing .request_hugepages = TST_NO_HUGEPAGES"
 
 orig_value=`cat /proc/sys/vm/nr_hugepages`
 
+if grep -q -E '^proc /proc(/sys)? proc ro' /proc/mounts; then
+	echo "TCONF: /proc or /proc/sys mounted as read-only"
+	exit 32
+fi
+
 echo "128" > /proc/sys/vm/nr_hugepages
 
 ./test_zero_hugepage
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
