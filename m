Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4883B7A0D
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 23:48:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 766C23C939B
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 23:48:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BD3413C1A4B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 23:48:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5B24C1400059
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 23:48:15 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E453A1FDD7;
 Tue, 29 Jun 2021 21:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625003294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/Lj6bGAP541wzv4+fFNCemFKB6BFOHP5XdkHTfmT6w=;
 b=WMy/qNsW3DfHR0ycPidJkQroApnuMD8w9J538eut/DU85oGLzi3a66W9bm9I1EyfqDkepS
 XfgMnpUoyv2445mYpkQH/eUykj/EyOv4SDGKg7eBaML373fkoR/gmQWYQJ1d+fgicI/zzx
 RKmazx9lTqolPnK3maYkIYCx6YFmrUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625003294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/Lj6bGAP541wzv4+fFNCemFKB6BFOHP5XdkHTfmT6w=;
 b=hqyfyYGIVtGy8Aujwbkf0b2tDD14yyZNfVtzOdEFIyz2FUaqS4hhQP7t8HeoADOP+yMp4t
 GK2Lr1xSBrH8qKAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7705311906;
 Tue, 29 Jun 2021 21:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625003294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/Lj6bGAP541wzv4+fFNCemFKB6BFOHP5XdkHTfmT6w=;
 b=WMy/qNsW3DfHR0ycPidJkQroApnuMD8w9J538eut/DU85oGLzi3a66W9bm9I1EyfqDkepS
 XfgMnpUoyv2445mYpkQH/eUykj/EyOv4SDGKg7eBaML373fkoR/gmQWYQJ1d+fgicI/zzx
 RKmazx9lTqolPnK3maYkIYCx6YFmrUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625003294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/Lj6bGAP541wzv4+fFNCemFKB6BFOHP5XdkHTfmT6w=;
 b=hqyfyYGIVtGy8Aujwbkf0b2tDD14yyZNfVtzOdEFIyz2FUaqS4hhQP7t8HeoADOP+yMp4t
 GK2Lr1xSBrH8qKAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id IK7pFR6V22AcSAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 29 Jun 2021 21:48:14 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 23:48:04 +0200
Message-Id: <20210629214808.18760-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629214808.18760-1-pvorel@suse.cz>
References: <20210629214808.18760-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/5] tst_device: Require root
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

as it's actually required for successful run:
tst_device.c:100: TINFO: Not allowed to open /dev/loop-control. Are you root?: EACCES (13)
tst_device.c:139: TINFO: No free devices found
tst_device.c:335: TBROK: Failed to acquire device

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/tst_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/newlib_tests/tst_device.c b/lib/newlib_tests/tst_device.c
index ad077affd..0bee0a939 100644
--- a/lib/newlib_tests/tst_device.c
+++ b/lib/newlib_tests/tst_device.c
@@ -40,6 +40,7 @@ static void do_test(void)
 }
 
 static struct tst_test test = {
+	.needs_root = 1,
 	.needs_device = 1,
 	.dev_min_size = 300,
 	.test_all = do_test,
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
