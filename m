Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E07527A88B3
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Sep 2023 17:44:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C3C13CE305
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Sep 2023 17:44:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E003B3CA59A
 for <ltp@lists.linux.it>; Wed, 20 Sep 2023 17:44:04 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E1EAE200C2E
 for <ltp@lists.linux.it>; Wed, 20 Sep 2023 17:44:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 069D020263
 for <ltp@lists.linux.it>; Wed, 20 Sep 2023 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695224643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uxChTzF/N8mwIn0kN/gYSEMyFz3g1xxt89kk4Z+YhC4=;
 b=ZfgWthiL63x9w1avqb6vvaIp1H9btkfnqG+UGJ8manIUtZOhb8xo77Xb/jKQW+10BoKmhi
 wq2fBTGf+RGgoNtjT10tPUGdb9k2wILnWKSFs7q5bQTk6U1xNSCCZvORn4XxBBsdBoNU+l
 Ii2sLH3vO68ZfKjqin2Dn8MzOI+ElwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695224643;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uxChTzF/N8mwIn0kN/gYSEMyFz3g1xxt89kk4Z+YhC4=;
 b=v9V/gGz3kPw6wHiI/odPZ0lI9xeLP96fxdElGUcYOQDgFbNqxEWJ483AUe039+I/UiukSI
 vJBkBo3n8bYxoeCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E56F0132C7
 for <ltp@lists.linux.it>; Wed, 20 Sep 2023 15:44:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1A2eNkITC2WATgAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 20 Sep 2023 15:44:02 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 20 Sep 2023 17:44:47 +0200
Message-ID: <20230920154447.3165-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] lib: lockdown: Report lockdown as disabled on missing
 sysfs
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

We currently report -1 when secure boot sysfs file is not present which
is later interpreted as secure boot enabled. This causes regression in
*_module sycall tests executed on systems when secureboot is not
compiled-in or supported at all.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_lockdown.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_lockdown.c b/lib/tst_lockdown.c
index 38d830886..7613092ec 100644
--- a/lib/tst_lockdown.c
+++ b/lib/tst_lockdown.c
@@ -29,7 +29,7 @@ int tst_secureboot_enabled(void)
 
 	if (access(SECUREBOOT_VAR, F_OK)) {
 		tst_res(TINFO, "SecureBoot sysfs file not available");
-		return -1;
+		return 0;
 	}
 
 	fd = open(SECUREBOOT_VAR, O_RDONLY);
-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
