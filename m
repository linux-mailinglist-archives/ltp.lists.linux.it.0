Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 229004C16E1
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Feb 2022 16:33:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6AAE3C9A7C
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Feb 2022 16:33:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B7E173C97AD
 for <ltp@lists.linux.it>; Wed, 23 Feb 2022 16:32:58 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1EC186002B0
 for <ltp@lists.linux.it>; Wed, 23 Feb 2022 16:32:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ABADC212B8;
 Wed, 23 Feb 2022 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645630377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNh6pOJ/YXd4KafmoenXHriHZLhT4cXYKKP1tB90b0o=;
 b=0a3gxCTA+iAILvg4pB+iJu1ltZLzLsFr/m7hEdn/Ez4reCkXOZSRiCS1r5AIghvisPaiSq
 2G1UzUw/XcDdSLH4FX/SRkKfF8gqci/vx3L4xIRmIyUfmLMniBd3rWtd3X0z7xPtFZtE2h
 jm97n6PF96KKn5CxqWAzAV9x/dWd+2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645630377;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNh6pOJ/YXd4KafmoenXHriHZLhT4cXYKKP1tB90b0o=;
 b=aWcWbhi8XtUFTL55M5FLCb0u/g9nvgMU55vdLEpcPRlUxeXuJ6My9mVNTIbBM8tJ6jzny0
 q1byVocMJb/t6bCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77BE913D88;
 Wed, 23 Feb 2022 15:32:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gPkqGqlTFmKZawAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 23 Feb 2022 15:32:57 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 23 Feb 2022 16:32:42 +0100
Message-Id: <20220223153243.317-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223153243.317-1-pvorel@suse.cz>
References: <20220223153243.317-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] quotactl08: Use do_mount()
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

to change
quotactl08.c:160: TBROK: mount(/dev/loop0, mntpoint, ext4, 0, (nil)) failed: ESRCH (3)

to TCONF if FS quota is not supported (the same fix as 4aab31e4c7).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/quotactl/quotactl08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl08.c b/testcases/kernel/syscalls/quotactl/quotactl08.c
index 3793867f23..9f54bebcc0 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl08.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl08.c
@@ -157,7 +157,7 @@ static void setup(void)
 	quotactl_info();
 
 	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
-	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, NULL);
+	do_mount(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, NULL);
 	mount_flag = 1;
 
 	fd = SAFE_OPEN(MNTPOINT, O_RDONLY);
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
