Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B76BC3FF12A
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 18:20:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F99C3C9921
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 18:20:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C49B43C299A
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 18:20:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0267B1A0119B
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 18:20:06 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 33DF92263E;
 Thu,  2 Sep 2021 16:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630599606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Vh0zjzR00gg9gewPuaHky8lnYDrDLAfXbCbDuJ25nHQ=;
 b=Jc0pFnfxl3ZF4lH8H8c2Fncv8aMrSi4kcLA7f2xzADv7NsIZyVvXUhTghtg4ho2FLW91Wi
 cThaoFwQpwh4/+CdZNccdIQYC8p9RHPsFDfpjOmSh08pIjtcFX6F3/F/8G1CNAAD3Ysg1a
 +wHEaU3L1UZQCFqUOoKy61/BcmMei9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630599606;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Vh0zjzR00gg9gewPuaHky8lnYDrDLAfXbCbDuJ25nHQ=;
 b=lcCL/keXfCrXMsxJW0SlxmscnlIWaz6j+bVog2iJuJCGYsmfnoe3GWzMPA+jhu/VuMIsNg
 c15toQ/wESIygvAA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id F1B8713ABD;
 Thu,  2 Sep 2021 16:20:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id nE5uOLX5MGEYRQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 16:20:05 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 18:19:57 +0200
Message-Id: <20210902161957.2140-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] controllers/cpuacct: Simplify deleting directories
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

by using rm -rf instead of 2x rmdir and checks for dir presence.

Also move TINFO to print it only when relevant.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/controllers/cpuacct/cpuacct.sh | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/controllers/cpuacct/cpuacct.sh b/testcases/kernel/controllers/cpuacct/cpuacct.sh
index b2347e801..99258c266 100755
--- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
+++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
@@ -119,13 +119,10 @@ setup()
 
 cleanup()
 {
-	tst_res TINFO "removing created directories"
 
 	if [ "$testpath" ]; then
-		if [ -d "$testpath/subgroup_1" ]; then
-			rmdir $testpath/subgroup_*
-		fi
-		rmdir $testpath
+		tst_res TINFO "removing created directories"
+		rm -rf $testpath
 	fi
 
 	if [ "$mounted" -ne 1 ]; then
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
