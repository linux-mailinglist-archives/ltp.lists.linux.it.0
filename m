Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 510843CF804
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 12:39:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 932D23C821C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 12:39:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7D5B03C2090
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 12:39:43 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1C1301A00A48
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 12:39:42 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 41C061FE02
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626777582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mrMjzM7iHc97HvwdxNR6vk5yfNARHVd65JKSc+tlBJw=;
 b=3XEQA7iQYHuEQ2CGJI1/9hxdxanYBWttJWLdXw4tdaIi2kP1nalX7ILXQK0WEINd9qZpZr
 GpHkoRqWWSu+Gav/36e5RMHUPSLzGgvxG8yGLfymHOHUP7FWJ/tmMoOoif2+yrygd2n0Zu
 A3Cdhc1dDmN6qKh10tA734pXOSWlh2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626777582;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mrMjzM7iHc97HvwdxNR6vk5yfNARHVd65JKSc+tlBJw=;
 b=lo8p6QHnTQk6/1INJ8Tf/kgVJHM7A9ASqWgg/iR7BZjD4eDu6FKRZwZcjO1gPs9vvkVtB2
 zWaTeiAyVdFjHRAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2E9FA13B2F
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:39:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id QMJ0Cu6n9mAuOwAAGKfGzw
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:39:42 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 12:39:39 +0200
Message-Id: <20210720103941.9767-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] Add skip_in_lockdown flag to struct tst_test
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

When the flag is set to 1, the LTP library will call tst_lockdown_enabled()
during initialization and exit with TCONF if kernel lockdown is detected.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/tst_test.h | 1 +
 lib/tst_test.c     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/tst_test.h b/include/tst_test.h
index 6ad355506..c7d77eb09 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -157,6 +157,7 @@ struct tst_test {
 	 * to the test function.
 	 */
 	int all_filesystems:1;
+	int skip_in_lockdown:1;
 
 	/*
 	 * The skip_filesystem is a NULL terminated list of filesystems the
diff --git a/lib/tst_test.c b/lib/tst_test.c
index f4d9f8e3b..c7c77596c 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -957,6 +957,9 @@ static void do_setup(int argc, char *argv[])
 	if (tst_test->min_kver)
 		check_kver();
 
+	if (tst_test->skip_in_lockdown && tst_lockdown_enabled())
+		tst_brk(TCONF, "Kernel is locked down, skipping test");
+
 	if (tst_test->needs_cmds) {
 		const char *cmd;
 		char path[PATH_MAX];
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
