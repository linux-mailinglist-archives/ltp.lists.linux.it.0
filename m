Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F14003F0018
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:13:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 173233C56D0
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:13:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 598293C5582
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:12:50 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 45E3E600C21
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:12:49 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95F0522035;
 Wed, 18 Aug 2021 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629277968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpRD4Cnwr4KxFyrN3gDf6RICAsLpVpe6ekyxcpGJxdQ=;
 b=j4JG3BrzKEQ1iq1YF2lvnR21Q75VNe9sviiyyca9v4fpTwbSwR20Q7jndG+Pb8bv5CjcuD
 MIr52BQtlfhl7qAqwPYe4wHCFAa+j8fP6jUULCOoEkQizOrtvn9rHsZwQQRo6a2tQN7b35
 skfoHoVsceob8byi4F5GKOcFtky1BlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629277968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpRD4Cnwr4KxFyrN3gDf6RICAsLpVpe6ekyxcpGJxdQ=;
 b=kd0fqJezxOEblYZriY25TRdAtB4WpgHgatjE6IPY2rfRa5am1F5Wv+mMPtXykePS/pKERL
 DxPPh6UzHPl0xhAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 300E0133D0;
 Wed, 18 Aug 2021 09:12:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 4BSBBxDPHGFKFwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 18 Aug 2021 09:12:48 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 18 Aug 2021 11:12:22 +0200
Message-Id: <20210818091224.27578-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210818091224.27578-1-pvorel@suse.cz>
References: <20210818091224.27578-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] tst_test.sh: Simplify tst_cmd_available()
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, Elliott Hughes <enh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

"command -v" [1] and "type" [2] are POSIX. They're supported in all
common shells (bash, zsh, dash, busybox sh, mksh). Thus we don't have to
fallback on "which", which has been discontinued after 2.21 release in
2015 due this (git repository is empty [3]).

Use "type" instead of "command -v" which is IMHO more known.

Also drop explicit return as the exit code is reliable an all
implementations.

[1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html
[2] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/type.html
[3] https://git.savannah.gnu.org/cgit/which.git

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index c6aa2c487..fa35a64f1 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -346,18 +346,7 @@ tst_virt_hyperv()
 
 tst_cmd_available()
 {
-	if type command > /dev/null 2>&1; then
-		command -v $1 > /dev/null 2>&1 || return 1
-	else
-		which $1 > /dev/null 2>&1
-		if [ $? -eq 0 ]; then
-			return 0
-		elif [ $? -eq 127 ]; then
-			tst_brk TCONF "missing which command"
-		else
-			return 1
-		fi
-	fi
+	type $1 >/dev/null 2>&1
 }
 
 tst_require_cmds()
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
