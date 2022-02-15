Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1D04B691C
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Feb 2022 11:20:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DB473CA012
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Feb 2022 11:20:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3805C3CA006
 for <ltp@lists.linux.it>; Tue, 15 Feb 2022 11:20:55 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AA05F1A00918
 for <ltp@lists.linux.it>; Tue, 15 Feb 2022 11:20:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C49AE210EA;
 Tue, 15 Feb 2022 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644920453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ErX2vUOoCsLCHW+9AiKPaooAmpvjsQd6MdNHRbG4g5Q=;
 b=aIPhMu0jL7MamlspfxkCsIfnWjgegAAXqV7QumubI/q4DyhTGcC04CC4Oi46mjGPQ7vFCh
 0LNnq6va90S2xT/ttniITOpvFpsxe8yfAD5UkAaAunTxTggLxvpFWNEgx5G4kHDrtVj95Q
 d3bi3sVCSEZ+hjbVBqyZmy6JZ13ltfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644920453;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ErX2vUOoCsLCHW+9AiKPaooAmpvjsQd6MdNHRbG4g5Q=;
 b=73i+hIvAOTYKQOy+tsPVZ66Ds0IlRN1SIIxVFnmxwdB/m2iDPZLbRCGgVIChiKrTa82+9R
 DUfJ3CMqvnoMf8AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC5A713C16;
 Tue, 15 Feb 2022 10:20:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FAP0KIV+C2K5GwAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Tue, 15 Feb 2022 10:20:53 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: Li Wang <liwang@redhat.com>,
	ltp@lists.linux.it
Date: Tue, 15 Feb 2022 11:20:53 +0100
Message-Id: <20220215102053.1790-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] test_children_cleanup.sh: Fix race condition
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
or change state to zombie before reporting that it was left behind.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: Report success even if the child gets stuck in zombie state

 lib/newlib_tests/test_children_cleanup.sh | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/lib/newlib_tests/test_children_cleanup.sh b/lib/newlib_tests/test_children_cleanup.sh
index 4b4e8b2f0..23408c1bc 100755
--- a/lib/newlib_tests/test_children_cleanup.sh
+++ b/lib/newlib_tests/test_children_cleanup.sh
@@ -10,10 +10,21 @@ rm "$TMPFILE"
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
+	CHILD_STATE=`sed -ne 's/^State:\s*\([A-Z]\).*$/\1/p' "/proc/$CHILD_PID/status" 2>/dev/null`
+
+	if [ ! -e "/proc/$CHILD_PID" ] || [ "x$CHILD_STATE" = "xZ" ]; then
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
