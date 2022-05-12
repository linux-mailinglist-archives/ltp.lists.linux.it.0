Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB847524D19
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 14:38:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 886D43CA9D7
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 14:38:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC3713CA9DC
 for <ltp@lists.linux.it>; Thu, 12 May 2022 14:36:09 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B1048600C7B
 for <ltp@lists.linux.it>; Thu, 12 May 2022 14:36:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D73C1F460;
 Thu, 12 May 2022 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652358968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dy080Y/o9k/h+82O3f4UvGs3yC4CK6krucZ0AGhV1x4=;
 b=BqKFk4V8bwu3i1ZDITTQ1n/pxMxPjRc7XYKZIRyDS2MhwfINYkZF19kIIOo62nn/SId/PR
 1wtmSdN/r24etk7cAXlDTkeAUcQnvqdQvG38052GvjWeYRIyjzPYV6LOwmDHO0S2uYs2dB
 BbY2IPJDRCFjB/2Vq5ShNu60WTYi1MI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652358968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dy080Y/o9k/h+82O3f4UvGs3yC4CK6krucZ0AGhV1x4=;
 b=tKriqnbL5Kh6ryuGpgBEw6QA1a40zgasY7+8Wl1tNpf5YPJUWbRgct557vVYwLR+5+9SLz
 eeRV497wj9xZz9Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A71F13ABE;
 Thu, 12 May 2022 12:36:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LbL0DDj/fGIvGgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 12 May 2022 12:36:08 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 May 2022 14:37:58 +0200
Message-Id: <20220512123816.24399-12-chrubis@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512123816.24399-1-chrubis@suse.cz>
References: <20220512123816.24399-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 11/29] syscalls/inotify06: Convert to runtime.
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
Cc: automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/inotify/inotify06.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/inotify/inotify06.c b/testcases/kernel/syscalls/inotify/inotify06.c
index 68813769b..86d74b9c8 100644
--- a/testcases/kernel/syscalls/inotify/inotify06.c
+++ b/testcases/kernel/syscalls/inotify/inotify06.c
@@ -87,6 +87,11 @@ static void verify_inotify(void)
 			myinotify_add_watch(inotify_fd, names[i], IN_MODIFY);
 		}
 		SAFE_CLOSE(inotify_fd);
+
+		if (!tst_remaining_runtime()) {
+			tst_res(TINFO, "Test out of runtime, exitting");
+			break;
+		}
 	}
 	/* We survived for given time - test succeeded */
 	tst_res(TPASS, "kernel survived inotify beating");
@@ -108,7 +113,7 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
-	.timeout = 600,
+	.max_runtime = 600,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
 	.forks_child = 1,
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
