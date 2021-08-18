Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA13F0145
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 12:08:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE14E3C55AA
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 12:08:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3FFC63C1B12
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 12:08:39 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 43FA7600BF9
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 12:08:37 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D8031FFAB;
 Wed, 18 Aug 2021 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629281317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sDsI+aU2ZskP4wIYJJZxLt6gUuoYKC8QSd0E6gbmaSk=;
 b=BMDfhPDFQOSjMr/B/xkaCj75C6uR0/gnR3GPaSRURGomKI2ksM0OMImSk3iwFnsAxxFZC8
 gdqaGMJffq9V93nr0TikUpTjC3Y3EIFQNOA7FWp+jJhy5QuOiom+ELCmbeLmmhZZhcknzp
 1Y459SNUR87l6wCfue0sW+K4115g4y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629281317;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sDsI+aU2ZskP4wIYJJZxLt6gUuoYKC8QSd0E6gbmaSk=;
 b=9flcB4oc5XLD1EddEo0PYqkk5W4mayQqHO4zSrtdUJMDJM5FV7WeNvRo5xMPGhCCYs9yG9
 VBzYu0fs4aiMYCDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 453201371C;
 Wed, 18 Aug 2021 10:08:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id /LwFDyXcHGF+JQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 18 Aug 2021 10:08:37 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 18 Aug 2021 12:08:23 +0200
Message-Id: <20210818100823.1836-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] binfmt_misc02.sh: Use "command -v" instead of
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
Changes v1->v2:
* use "command -v" instead of "type" (we need cat path)
* save it into variable

 testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
index 9dbcd68cc..7bf4a0a2b 100755
--- a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
+++ b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
@@ -19,7 +19,7 @@
 
 TST_CNT=6
 TST_TESTFUNC=do_test
-TST_NEEDS_CMDS="which cat head"
+TST_NEEDS_CMDS="cat head"
 
 . binfmt_misc_lib.sh
 
@@ -88,18 +88,20 @@ verify_binfmt_misc()
 
 do_test()
 {
+	local cat="$(command -v cat)"
+
 	case $1 in
-	1) verify_binfmt_misc ":textension:E::extension::$(which cat):" \
+	1) verify_binfmt_misc ":textension:E::extension::$cat:" \
 			      "$TST_DATAROOT/file.extension" "1";;
-	2) verify_binfmt_misc ":tmagic:M:1:This::$(which cat):" \
+	2) verify_binfmt_misc ":tmagic:M:1:This::$cat:" \
 			      "$TST_DATAROOT/file.magic" "1";;
-	3) verify_binfmt_misc ".textension.E..extension..$(which cat)." \
+	3) verify_binfmt_misc ".textension.E..extension..$cat." \
 			      "$TST_DATAROOT/file.extension" "1";;
-	4) verify_binfmt_misc ",tmagic,M,1,This,,$(which cat)," \
+	4) verify_binfmt_misc ",tmagic,M,1,This,,$cat," \
 			      "$TST_DATAROOT/file.magic" "1";;
-	5) verify_binfmt_misc ":textension:E::ltp::$(which cat):" \
+	5) verify_binfmt_misc ":textension:E::ltp::$cat:" \
 			      "$TST_DATAROOT/file.extension" "0";;
-	6) verify_binfmt_misc ":tmagic:M:0:This::$(which cat):" \
+	6) verify_binfmt_misc ":tmagic:M:0:This::$cat:" \
 			      "$TST_DATAROOT/file.magic" "0";;
 	esac
 }
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
