Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C06754569D
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jun 2022 23:42:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A3193C92E2
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jun 2022 23:42:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5FA83C03B1
 for <ltp@lists.linux.it>; Thu,  9 Jun 2022 23:42:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 88E766007B1
 for <ltp@lists.linux.it>; Thu,  9 Jun 2022 23:42:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 32E5A1FEAC;
 Thu,  9 Jun 2022 21:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1654810952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HrRVZFTBvoOPs9/0Zi/jcFYEykhb5yK/tjBbBcJcPk=;
 b=xcPukXRpHO7MLo8W7PQU30ZvNtcPgk6y5CgRWB5X747ZaeTaTl68F4t9rGoii06N/tHEz2
 2rz7nOlpFIz6yfTFXWqwBjZAzn6MPO7i5rmXd1Bhc/hk4pP1VlNB2WRma9aNBvYXfWBBXi
 bo8P4PT+0GJ9nIYKlT1QMWOXnBwqcjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1654810952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HrRVZFTBvoOPs9/0Zi/jcFYEykhb5yK/tjBbBcJcPk=;
 b=RjREvChVpKmQ1kHl/DLH+n1pGaxTuyaLj+nvPVKikeyWDEkqmzLDt9HdBCTn46o70abbpE
 cBz87A1YJSx+RaAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9405C13A8C;
 Thu,  9 Jun 2022 21:42:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cNU+IUdpomIQDgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 09 Jun 2022 21:42:31 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  9 Jun 2022 23:42:16 +0200
Message-Id: <20220609214223.4608-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609214223.4608-1-pvorel@suse.cz>
References: <20220609214223.4608-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/9] df01.sh: Use TST_MOUNT_DEVICE=1
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
Cc: linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/commands/df/df01.sh | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/testcases/commands/df/df01.sh b/testcases/commands/df/df01.sh
index f74032c96..976e205bf 100755
--- a/testcases/commands/df/df01.sh
+++ b/testcases/commands/df/df01.sh
@@ -1,19 +1,19 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2015 Fujitsu Ltd.
+# Copyright (c) 2018-2022 Petr Vorel <pvorel@suse.cz>
 # Author: Zhang Jin <jy_zhangjin@cn.fujitsu.com>
 #
 # Test df command with some basic options.
 
 TST_CNT=12
 TST_SETUP=setup
-TST_CLEANUP=tst_umount
 TST_TESTFUNC=test
 TST_OPTS="f:"
 TST_USAGE=usage
 TST_PARSE_ARGS=parse_args
 TST_NEEDS_ROOT=1
-TST_FORMAT_DEVICE=1
+TST_MOUNT_DEVICE=1
 
 usage()
 {
@@ -34,7 +34,6 @@ parse_args()
 
 setup()
 {
-	tst_mount
 	DF_FS_TYPE=$(mount | grep "$TST_DEVICE" | awk 'NR==1{print $5}')
 }
 
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
