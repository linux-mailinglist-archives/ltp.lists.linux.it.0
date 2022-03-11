Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC704D61B2
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Mar 2022 13:40:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2ED643C8C98
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Mar 2022 13:40:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 93F973C8C9E
 for <ltp@lists.linux.it>; Fri, 11 Mar 2022 13:40:10 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DF2A71400DEE
 for <ltp@lists.linux.it>; Fri, 11 Mar 2022 13:40:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4A25A21122;
 Fri, 11 Mar 2022 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647002409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Jug4EzxUTMeehYjoxvYcFSHCHLJoe58i1oLWbotLWG8=;
 b=t8Kx7u48aGZhECOJZJCPX4qFploLeF5rNw/fEKFil81zfquM+Is9+TZJrNBTh+fBKEpAM/
 MTR1nRI+01HFWQ/NTSF5AgTI5BMlZ3+FykPEVqpnEKNrgSj8wpsKTw0txHFmU0+914Qbfn
 nMJbeJA0NZLAxNpGFG5U0NwOStmNP1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647002409;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Jug4EzxUTMeehYjoxvYcFSHCHLJoe58i1oLWbotLWG8=;
 b=85zCTP4BTeTKpL5C3rGTLg26E89dlxeWFa5oVcZy4kXU1k8gN5UlGeaypZiDrOzgPJsqZS
 UUsxq6aCR3cXnrBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 005A713A85;
 Fri, 11 Mar 2022 12:40:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HmcvOShDK2L1OgAAMHmgww
 (envelope-from <blezhepekov@suse.de>); Fri, 11 Mar 2022 12:40:08 +0000
From: Bogdan Lezhepekov <blezhepekov@suse.de>
To: ltp@lists.linux.it
Date: Fri, 11 Mar 2022 14:40:07 +0200
Message-Id: <20220311124007.31161-1-blezhepekov@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1] kernel/pty07: Skip test when TTY not available
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

Since TTY under test is hardcoded, it
might not be available in some systems.

Signed-off-by: Bogdan Lezhepekov <blezhepekov@suse.de>
---
 testcases/kernel/pty/pty07.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/pty/pty07.c b/testcases/kernel/pty/pty07.c
index 462569c4a..8bb9417ec 100644
--- a/testcases/kernel/pty/pty07.c
+++ b/testcases/kernel/pty/pty07.c
@@ -77,6 +77,9 @@ static void do_test(void)
 static void setup(void)
 {
 	sprintf(tty_path, "/dev/tty%d", test_tty_port);
+	if (access(tty_path, F_OK) != 0)
+		tst_brk(TCONF, "TTY (/dev/tty%d) under test not available in system", test_tty_port);
+
 	fd = SAFE_OPEN(tty_path, O_RDWR);
 	tst_fzsync_pair_init(&fzp);
 }
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
