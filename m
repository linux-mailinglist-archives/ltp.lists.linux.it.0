Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B675084DF
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Apr 2022 11:25:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 597923CA6D3
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Apr 2022 11:25:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 14C3B3CA692
 for <ltp@lists.linux.it>; Wed, 20 Apr 2022 11:25:06 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9EE9F1400042
 for <ltp@lists.linux.it>; Wed, 20 Apr 2022 11:25:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C45EF1F380;
 Wed, 20 Apr 2022 09:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650446704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=g8B5s1F+/g+4/L/K0kh/ugegJeUzxTMMW0O39S9leZc=;
 b=Spo8TatNSGe/N9ksDxZz0e/5jalt8AuwBsy4lPPG/6nt2r7Pjm4/SHvE/OaLfG8gLJTxbO
 /0EL3bdWvn4yYLaKb/cNiWptHhCDWTDkawduMQF6IVRwEJWBHP6Pkp81Y1D4O0PIT95GMT
 MOe/bTwIQApBi+ap6bxOlA7z3h8bcGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650446704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=g8B5s1F+/g+4/L/K0kh/ugegJeUzxTMMW0O39S9leZc=;
 b=i8YQSiJvQtcSfScWcdA1hMLpF8cSXn4MVh7Xn5X0s7xS1u0S5RHJC5+w0yWK4i+++ChcCJ
 99aGWLZaDbq7xyDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C36F13A30;
 Wed, 20 Apr 2022 09:25:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id l8dhG3DRX2JxEAAAMHmgww
 (envelope-from <blezhepekov@suse.de>); Wed, 20 Apr 2022 09:25:04 +0000
From: Bogdan Lezhepekov <blezhepekov@suse.de>
To: ltp@lists.linux.it
Date: Wed, 20 Apr 2022 12:25:02 +0300
Message-Id: <20220420092502.32068-1-blezhepekov@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] kernel/pty07: Skip test when TTY not available
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
index 2887de6fa..c63b71c89 100644
--- a/testcases/kernel/pty/pty07.c
+++ b/testcases/kernel/pty/pty07.c
@@ -81,6 +81,9 @@ static void setup(void)
 	struct vt_stat stat;
 
 	sprintf(tty_path, "/dev/tty%d", test_tty_port);
+	if (access(tty_path, F_OK))
+		tst_brk(TCONF, "TTY (/dev/tty%d) under test not available in system", test_tty_port);
+
 	fd = SAFE_OPEN(tty_path, O_RDWR);
 	SAFE_IOCTL(fd, VT_GETSTATE, &stat);
 	vt_active = stat.v_active;
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
