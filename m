Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A00E64B5768
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Feb 2022 17:51:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A4F33C9FDD
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Feb 2022 17:51:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D55BA3C9F8F
 for <ltp@lists.linux.it>; Mon, 14 Feb 2022 17:51:32 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 85CEC200BAB
 for <ltp@lists.linux.it>; Mon, 14 Feb 2022 17:51:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7EFF221102
 for <ltp@lists.linux.it>; Mon, 14 Feb 2022 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644857490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AynKcgm1MD9M2TTS02DSGfA9ksGn4z28Z6/4dsHoOCo=;
 b=INV3c0S/zqCm2JWNJX83Lzh8HCVP+Vjz54YIYNXxNGk81RfjmWoI95h3zsizI5VoloEikJ
 w2ic9P85jGHBditcnJsjWPQISsVEe+un7KTc0kX4x8SHNjhWG+auQqnLxC3HUR8LX+8HAM
 hx7Mu7NXBu5lXcCZkijHNbeZL/cInbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644857490;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AynKcgm1MD9M2TTS02DSGfA9ksGn4z28Z6/4dsHoOCo=;
 b=T4XIkU5CrPcYm08L7kC4U0lLH8VA7ubQVtCJ/BlOvvb/bJd/5dBL5d0EGLnSOor09wU2Jc
 7jimCkkG/TR8seDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E02613B75
 for <ltp@lists.linux.it>; Mon, 14 Feb 2022 16:51:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id szH8GZKICmKQFQAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 14 Feb 2022 16:51:30 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 14 Feb 2022 17:51:29 +0100
Message-Id: <20220214165129.32686-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] test_children_cleanup.sh: Fix race condition
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

Processes can stay alive for a short while even after receiving SIGKILL.
Give the child in subprocess cleanup libtest up to 5 seconds to fully exit
before reporting that it was left behind.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 lib/newlib_tests/test_children_cleanup.sh | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/lib/newlib_tests/test_children_cleanup.sh b/lib/newlib_tests/test_children_cleanup.sh
index 4b4e8b2f0..44505aa51 100755
--- a/lib/newlib_tests/test_children_cleanup.sh
+++ b/lib/newlib_tests/test_children_cleanup.sh
@@ -10,10 +10,19 @@ rm "$TMPFILE"
 if [ "x$CHILD_PID" = "x" ]; then
 	echo "TFAIL: Child process was not created"
 	exit 1
-elif ! kill -s 0 $CHILD_PID &>/dev/null; then
-	echo "TPASS: Child process was cleaned up"
-	exit 0
-else
-	echo "TFAIL: Child process was left behind"
-	exit 1
 fi
+
+# The child process can stay alive for a short while even after receiving
+# SIGKILL, especially if the system is under heavy load. Wait up to 5 seconds
+# for it to fully exit.
+for i in `seq 6`; do
+	if ! [ -e "/proc/$CHILD_PID" ]; then
+		echo "TPASS: Child process was cleaned up"
+		exit 0
+	fi
+
+	sleep 1
+done
+
+echo "TFAIL: Child process was left behind"
+exit 1
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
