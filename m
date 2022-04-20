Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9405084DE
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Apr 2022 11:24:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCE523CA69D
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Apr 2022 11:24:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA8DF3CA683
 for <ltp@lists.linux.it>; Wed, 20 Apr 2022 11:24:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BB58D6006C6
 for <ltp@lists.linux.it>; Wed, 20 Apr 2022 11:24:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C63791F380;
 Wed, 20 Apr 2022 09:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650446687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bgNhTjKCzOau99B00puisButFkq710+wzbJE5qr8mY8=;
 b=uNq2V+4XqMG0ouzvLF9KQZrP8dI53VxoF5ORIkWP8pYF+16M6U0PWIT9+kXE4FycqLxCb8
 QGyR0oulQBaxadEJijFHKq0Rh5s728FbmdzFOYWZYyAIZJfKcknaOOzypRPVb32FvNaNQt
 JsSQI/DVxP8fDqwOd05urLM6i6NudQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650446687;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bgNhTjKCzOau99B00puisButFkq710+wzbJE5qr8mY8=;
 b=FChT9Qw51FpD8UOAmf5LKsYPniiFJfuhmOC64+kdmr9OH4Ci3IBYXmXmQBsYDe44CWTyv2
 fM+OYZ5u/wGDGsBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 889D113A30;
 Wed, 20 Apr 2022 09:24:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p22fHl/RX2JQEAAAMHmgww
 (envelope-from <blezhepekov@suse.de>); Wed, 20 Apr 2022 09:24:47 +0000
From: Bogdan Lezhepekov <blezhepekov@suse.de>
To: ltp@lists.linux.it
Date: Wed, 20 Apr 2022 12:24:42 +0300
Message-Id: <20220420092442.31832-1-blezhepekov@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] kernel/pty06: Skip test when TTY not available
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

Since TTYs under test are hardcoded, they
might not be available in some systems.

Signed-off-by: Bogdan Lezhepekov <blezhepekov@suse.de>
---
 testcases/kernel/pty/pty06.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/pty/pty06.c b/testcases/kernel/pty/pty06.c
index b621f584f..cc8eb1f85 100644
--- a/testcases/kernel/pty/pty06.c
+++ b/testcases/kernel/pty/pty06.c
@@ -45,8 +45,6 @@ static struct tst_fzsync_pair fzp;
 
 static void *open_close(void *unused)
 {
-	sprintf(tty_path_b, "/dev/tty%d", test_tty_port);
-
 	while (tst_fzsync_run_b(&fzp)) {
 		tst_fzsync_start_race_b(&fzp);
 		int fd = SAFE_OPEN(tty_path_b, O_RDWR);
@@ -60,7 +58,6 @@ static void *open_close(void *unused)
 
 static void do_test(void)
 {
-	sprintf(tty_path_a, "/dev/tty%d", test_tty_port + 1);
 	int fd = SAFE_OPEN(tty_path_a, O_RDWR);
 
 	tst_fzsync_pair_reset(&fzp, open_close);
@@ -80,6 +77,12 @@ static void do_test(void)
 
 static void setup(void)
 {
+	sprintf(tty_path_a, "/dev/tty%d", test_tty_port + 1);
+	sprintf(tty_path_b, "/dev/tty%d", test_tty_port);
+
+	if (access(tty_path_a, F_OK) || access(tty_path_b, F_OK))
+		tst_brk(TCONF, "TTY(s) under test not available in system");
+
 	tst_fzsync_pair_init(&fzp);
 }
 
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
