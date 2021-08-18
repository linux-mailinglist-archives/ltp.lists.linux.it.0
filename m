Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8395B3F0014
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:13:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 735023C5605
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:13:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E2243C248D
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:12:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 827F46008B0
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:12:49 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E56E722037;
 Wed, 18 Aug 2021 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629277968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KfPYiBsDxIfYWEGc1IwYqjO5UrFg2+aAvAIcgxWkdXM=;
 b=d1zu1be43YSrv7MmwDgH+my7jC91HaR1q0c6BGrxApUtvqs5HNSSuYlgHoY5sPd/vdLZiM
 rNzo6nfMiLIalI4vY6GPI6P/8cblIJBds8x9mwXFae2D7i+Cii8ANPU4TS4cuWe+MALDPP
 M65sZWXpyiDaFqZexeYXQwt+5s2cn3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629277968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KfPYiBsDxIfYWEGc1IwYqjO5UrFg2+aAvAIcgxWkdXM=;
 b=isAFmtoOuLmaqeUCD/hU3HYidZehNIzLzpp6f+t5NAa4yERJr9IuVDQsHSJYzs4Wdxce7N
 cl3kBszy+hWfwkCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 987B213690;
 Wed, 18 Aug 2021 09:12:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id OAoJIxDPHGFKFwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 18 Aug 2021 09:12:48 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 18 Aug 2021 11:12:23 +0200
Message-Id: <20210818091224.27578-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210818091224.27578-1-pvorel@suse.cz>
References: <20210818091224.27578-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] binfmt_misc02.sh: Use "command -v" instead of
 "which"
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

"which" has been discontinued after 2.21 release in 2015 due this (git
repository is empty [1]) it provides warning on Debian/Ubuntu [2].

Use "command -v" which is POSIX [3] and supported on all common shells
(bash, zsh, dash, busybox sh, mksh).

[1] https://git.savannah.gnu.org/cgit/which.git
[2] https://salsa.debian.org/debian/debianutils/-/commit/3a8dd10b4502f7bae8fc6973c13ce23fc9da7efb
[3] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
index 9dbcd68cc..cb4e770e3 100755
--- a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
+++ b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
@@ -19,7 +19,7 @@
 
 TST_CNT=6
 TST_TESTFUNC=do_test
-TST_NEEDS_CMDS="which cat head"
+TST_NEEDS_CMDS="cat head"
 
 . binfmt_misc_lib.sh
 
@@ -89,17 +89,17 @@ verify_binfmt_misc()
 do_test()
 {
 	case $1 in
-	1) verify_binfmt_misc ":textension:E::extension::$(which cat):" \
+	1) verify_binfmt_misc ":textension:E::extension::$(type cat):" \
 			      "$TST_DATAROOT/file.extension" "1";;
-	2) verify_binfmt_misc ":tmagic:M:1:This::$(which cat):" \
+	2) verify_binfmt_misc ":tmagic:M:1:This::$(type cat):" \
 			      "$TST_DATAROOT/file.magic" "1";;
-	3) verify_binfmt_misc ".textension.E..extension..$(which cat)." \
+	3) verify_binfmt_misc ".textension.E..extension..$(type cat)." \
 			      "$TST_DATAROOT/file.extension" "1";;
-	4) verify_binfmt_misc ",tmagic,M,1,This,,$(which cat)," \
+	4) verify_binfmt_misc ",tmagic,M,1,This,,$(type cat)," \
 			      "$TST_DATAROOT/file.magic" "1";;
-	5) verify_binfmt_misc ":textension:E::ltp::$(which cat):" \
+	5) verify_binfmt_misc ":textension:E::ltp::$(type cat):" \
 			      "$TST_DATAROOT/file.extension" "0";;
-	6) verify_binfmt_misc ":tmagic:M:0:This::$(which cat):" \
+	6) verify_binfmt_misc ":tmagic:M:0:This::$(type cat):" \
 			      "$TST_DATAROOT/file.magic" "0";;
 	esac
 }
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
