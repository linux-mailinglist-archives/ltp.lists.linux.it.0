Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB940C792
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 16:37:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEF893C920D
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 16:37:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 57EBB3C4D45
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 16:37:04 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1781E6010E8
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 16:37:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A8D8F201BF
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 14:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631716623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWE0UGVDDBi5SHAorjsO7I77/ZYASEfgDojtZJLL4P4=;
 b=O8ZFGc9a4huEk8waDEdYyl0qAfWOt2kLdGvWkaygcXkL1UwH1LpkleR9UkWvNYlg4W8Spx
 XnDotxzW1A+TBMyNCy/a4BTBxj3Bgy+6b90ruqjug/pdWGQHowS6Fwf+5e1j2nUyXk7zLm
 TAOCOJRvlLVCMGH7iE+/G5ESMFmwdk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631716623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWE0UGVDDBi5SHAorjsO7I77/ZYASEfgDojtZJLL4P4=;
 b=hGBbtsw5OGolgz/4DDypMOdrua86UijsP2EQ8OuhT0oHLnAS4nvpwCPVv951PRLKQzoZPT
 lO7QKpIRlspAnnAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 965F113C5A
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 14:37:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uIy7JA8FQmGaBwAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 14:37:03 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Sep 2021 16:37:24 +0200
Message-Id: <20210915143725.13170-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210915143725.13170-1-chrubis@suse.cz>
References: <20210915143725.13170-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib: tst_kconfig: Fix typo Constrain -> Constraint
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
 lib/tst_kconfig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
index c2b85821b..c9de3017b 100644
--- a/lib/tst_kconfig.c
+++ b/lib/tst_kconfig.c
@@ -497,7 +497,7 @@ void tst_kconfig_check(const char *const kconfigs[])
 
 		if (val != 1) {
 			abort_test = 1;
-			tst_res(TINFO, "Constrain '%s' not satisfied!", kconfigs[i]);
+			tst_res(TINFO, "Constraint '%s' not satisfied!", kconfigs[i]);
 			dump_vars(exprs[i]);
 		}
 
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
