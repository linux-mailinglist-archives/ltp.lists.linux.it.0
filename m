Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 531423DDE9E
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:36:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F20483C8B26
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:36:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CE5C33C53C4
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:55 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6A5A11A00985
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:55 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DBDE521F7D;
 Mon,  2 Aug 2021 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627925754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQPux5UNX9C6kP8XubuuzPB9zt8b7OVOW+amvCNB+Xg=;
 b=3ZBuForYhVrrshnv5zZ4pUzLFp3EmJ5pDm6jfBscc6OZMDEUColRWmPXNEtEhAVU3ajYbr
 nOdKn3h0yaOorXQrSTPH8BKxxWaaVoaoJShUlEYJ+HY7Nkk99rnAbhmUrWqBhiuWwoWTP6
 3oKTSmkLHi/Wea3A4dKPdj30XqltrGo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627925754;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQPux5UNX9C6kP8XubuuzPB9zt8b7OVOW+amvCNB+Xg=;
 b=Q0xiEKdkPmLEEKvV/M82jpAXjlNgcHvTFymgM/oFpef2CSBq5jP6G+rVbW2eirksXlKln6
 vvrzyA+WcFmdmSAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id ACCBB13B47;
 Mon,  2 Aug 2021 17:35:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 2BTXJ/osCGHmLAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 02 Aug 2021 17:35:54 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Aug 2021 19:35:31 +0200
Message-Id: <20210802173536.19525-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802173536.19525-1-pvorel@suse.cz>
References: <20210802173536.19525-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v7 2/7] test/test_zero_hugepage.sh: Skip test on
 read-only file system
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

On GitHub Actions /proc/sys/vm/nr_hugepages is not allowed to be
changed:

./test_zero_hugepage.sh: line 9: can't create /proc/sys/vm/nr_hugepages: Read-only file system
tst_hugepage.c:57: TBROK: Failed to open FILE '/proc/sys/vm/nr_hugepages' for writing: EROFS (30)
tst_sys_conf.c:102: TWARN: Failed to open FILE '/proc/sys/vm/nr_hugepages'

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v7.

 lib/newlib_tests/test_zero_hugepage.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/newlib_tests/test_zero_hugepage.sh b/lib/newlib_tests/test_zero_hugepage.sh
index 10113006b..8a462478e 100755
--- a/lib/newlib_tests/test_zero_hugepage.sh
+++ b/lib/newlib_tests/test_zero_hugepage.sh
@@ -1,12 +1,16 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2021 Yang Xu <xuyang2018.jy@fujitsu.com>
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
 
 echo "Testing .request_hugepages = TST_NO_HUGEPAGES"
 
 orig_value=`cat /proc/sys/vm/nr_hugepages`
 
-echo "128" > /proc/sys/vm/nr_hugepages
+if ! echo "128" > /proc/sys/vm/nr_hugepages; then
+	echo "TCONF: failed to open /proc/sys/vm/nr_hugepages"
+	exit 32
+fi
 
 ./test_zero_hugepage
 
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
