Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 562824CC04A
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Mar 2022 15:48:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61F3B3CA372
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Mar 2022 15:48:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2166F3CA1EC
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 15:48:14 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B110C1A0043E
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 15:48:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05E90210FA
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 14:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646318893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7W372LUUpsgzwy1st0FYdJVRMyZonN2qTmJyI24GLc=;
 b=Iiy7edhC6lsPe7fxbEsOLf5go4I383a/wscyQk5vWijsNfJHwZ4L0ItTiJ1wpxp/XhhTsn
 3yJjduq/lOwmM9+ChvZaEXgOoYDWVVtmkiptQxXZTatXb55VqjIMsqXmDc2aw8b3Kf6PwK
 ukIQ+1rU37xtuIM3jUZyOmtbzfnEavE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646318893;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7W372LUUpsgzwy1st0FYdJVRMyZonN2qTmJyI24GLc=;
 b=vrPvX+FSyP8bq3mxt4A1wo4cO16FUnSRRevvs6XN29sLSy5D3xmHdaDjJNi7Aj/Ziq0xtP
 53aMH5DpbvOfpvDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E47C613AD9
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 14:48:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Z4HrNSzVIGL0AgAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 03 Mar 2022 14:48:12 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Mar 2022 15:50:26 +0100
Message-Id: <20220303145032.21493-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220303145032.21493-1-chrubis@suse.cz>
References: <20220303145032.21493-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/7] ksm06: Move option parsing into the setup()
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/mem/ksm/ksm06.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/mem/ksm/ksm06.c b/testcases/kernel/mem/ksm/ksm06.c
index c5f219c37..379236f1f 100644
--- a/testcases/kernel/mem/ksm/ksm06.c
+++ b/testcases/kernel/mem/ksm/ksm06.c
@@ -42,17 +42,12 @@
 static int run = -1;
 static int sleep_millisecs = -1;
 static int merge_across_nodes = -1;
-static unsigned long nr_pages;
+static unsigned long nr_pages = 100;
 
 static char *n_opt;
 
 static void test_ksm(void)
 {
-	if (n_opt)
-		nr_pages = SAFE_STRTOUL(n_opt, 0, ULONG_MAX);
-	else
-		nr_pages = 100;
-
 	test_ksm_merge_across_nodes(nr_pages);
 }
 
@@ -64,6 +59,9 @@ static void setup(void)
 	if (!is_numa(NULL, NH_MEMS, 2))
 		tst_brk(TCONF, "The case needs a NUMA system.");
 
+	if (n_opt)
+		nr_pages = SAFE_STRTOUL(n_opt, 0, ULONG_MAX);
+
 	/* save the current value */
 	SAFE_FILE_SCANF(PATH_KSM "run", "%d", &run);
 	SAFE_FILE_SCANF(PATH_KSM "merge_across_nodes",
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
