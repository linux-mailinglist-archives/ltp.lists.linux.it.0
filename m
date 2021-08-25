Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4EC3F70EB
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 10:09:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A2433C9DB1
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 10:09:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A00EC3C2FE8
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:09:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 15D0D6017D3
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:09:42 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B91CD22107;
 Wed, 25 Aug 2021 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629878981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dkLhcoRMiBi1HhdsBJXXTVkFUrOHrDsFpc6XSztwoQ=;
 b=ENBfoq8fC/twGV421RSuuG+GRASMkbJdXFpLUkMh6LMUnuZeMy7OVw75MwUI4Cdbu8j0hN
 epFxrCwASNUIql1icG6AevP5QpDvoKdEc3CkdWUX9+V23RchQInTR3fNpFQUGvtlFvNLpR
 uVcFTf8qlxEOF4+8qgamGM1QJOHbqYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629878981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dkLhcoRMiBi1HhdsBJXXTVkFUrOHrDsFpc6XSztwoQ=;
 b=cKVSTwRPJeHFaOkE0ks3znbk2zYvj25OllNBMCst3mzSMqzhE//gXCtWtVzdsoNWgS+I3t
 NTiR8MIvbZWqpbBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8C0CE13929;
 Wed, 25 Aug 2021 08:09:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id gG8XIcX6JWHwcQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 25 Aug 2021 08:09:41 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 10:09:33 +0200
Message-Id: <20210825080933.12949-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825080933.12949-1-pvorel@suse.cz>
References: <20210825080933.12949-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] shell API: Rename LTP_IPC_PATH -> TST_IPC_PATH
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

To follow the conventions in the new API.

Keep the old name in the legacy API.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index acf62c9ac..b68fae0b8 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -49,8 +49,8 @@ _tst_do_exit()
 		[ "$TST_TMPDIR_RHOST" = 1 ] && tst_cleanup_rhost
 	fi
 
-	if [ -n "$TST_NEEDS_CHECKPOINTS" -a -f "$LTP_IPC_PATH" ]; then
-		rm $LTP_IPC_PATH
+	if [ -n "$TST_NEEDS_CHECKPOINTS" -a -f "$TST_IPC_PATH" ]; then
+		rm $TST_IPC_PATH
 	fi
 
 	_tst_cleanup_timer
@@ -582,14 +582,14 @@ _tst_init_checkpoints()
 {
 	local pagesize
 
-	LTP_IPC_PATH="/dev/shm/ltp_${TST_ID}_$$"
+	TST_IPC_PATH="/dev/shm/ltp_${TST_ID}_$$"
 	pagesize=$(tst_getconf PAGESIZE)
 	if [ $? -ne 0 ]; then
 		tst_brk TBROK "tst_getconf PAGESIZE failed"
 	fi
-	ROD_SILENT dd if=/dev/zero of="$LTP_IPC_PATH" bs="$pagesize" count=1
-	ROD_SILENT chmod 600 "$LTP_IPC_PATH"
-	export LTP_IPC_PATH
+	ROD_SILENT dd if=/dev/zero of="$TST_IPC_PATH" bs="$pagesize" count=1
+	ROD_SILENT chmod 600 "$TST_IPC_PATH"
+	export TST_IPC_PATH
 }
 
 tst_run()
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
