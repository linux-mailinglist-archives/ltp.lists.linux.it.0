Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D0C4D611E
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Mar 2022 13:02:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 892493C8C79
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Mar 2022 13:02:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1682E3C0CEA
 for <ltp@lists.linux.it>; Fri, 11 Mar 2022 13:01:56 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7702C600F80
 for <ltp@lists.linux.it>; Fri, 11 Mar 2022 13:01:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 83EFA210FD;
 Fri, 11 Mar 2022 12:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1647000115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=S5OpgoTEJ2rhJ0zAX0YgAKpQdoi8jhhz1MPa9fLzxM0=;
 b=X6pma4+UV6JJJIHci1fFg248hPe4xtE1eKyjwt3XYvOeIuP1WKJ+IQjTxlzMDG4iJpqXCB
 V7bWKc6PBdn8cJEJCrW9MWV67R7G9+la7HuPKeYVBwAZkO/e+aAa7ox1PjaYdztzS/0+VB
 iOqVIgIiJmOIbafh5c95kfL6IX6SFgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1647000115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=S5OpgoTEJ2rhJ0zAX0YgAKpQdoi8jhhz1MPa9fLzxM0=;
 b=ctikwvHOuExRvwhPl8EeNK02bFBwUUFvtNuXYx6l6Lx75m/wRCN5tmHYImZgWYqzQUralL
 0oaXWCwIoVH+TiBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D38013A89;
 Fri, 11 Mar 2022 12:01:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mBSSDTM6K2JqJwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 11 Mar 2022 12:01:55 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Mar 2022 13:01:50 +0100
Message-Id: <20220311120151.601-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] madvise06: Fix segfault
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test required update after 687f0cbc00 to use struct tst_path_val.
While at it, move the initialization to struct tst_path_val.

Fixes: 687f0cbc00 ("lib: enhance .save_restore to support set expected value")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Is it ok to define it earlier? i.e. before calling sync() ?

 testcases/kernel/syscalls/madvise/madvise06.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
index 54391db283..b21f2cc7de 100644
--- a/testcases/kernel/syscalls/madvise/madvise06.c
+++ b/testcases/kernel/syscalls/madvise/madvise06.c
@@ -54,6 +54,7 @@
 #define MEMSW_LIMIT (2 * CHUNK_SZ)
 #define PASS_THRESHOLD (CHUNK_SZ / 4)
 #define PASS_THRESHOLD_KB (PASS_THRESHOLD / 1024)
+#define SWAPPINESS "60"
 
 static const char drop_caches_fname[] = "/proc/sys/vm/drop_caches";
 static int pg_sz, stat_refresh_sup;
@@ -123,10 +124,9 @@ static void setup(void)
 		SAFE_CG_PRINTF(tst_cg, "memory.swap.max", "%ld", MEMSW_LIMIT);
 
 	if (SAFE_CG_HAS(tst_cg, "memory.swappiness")) {
-		SAFE_CG_PRINT(tst_cg, "memory.swappiness", "60");
+		SAFE_CG_PRINT(tst_cg, "memory.swappiness", SWAPPINESS);
 	} else {
 		check_path("/proc/sys/vm/swappiness");
-		SAFE_FILE_PRINTF("/proc/sys/vm/swappiness", "%d", 60);
 	}
 
 	SAFE_CG_PRINTF(tst_cg, "cgroup.procs", "%d", getpid());
@@ -229,8 +229,8 @@ static struct tst_test test = {
 	.min_kver = "3.10.0",
 	.needs_tmpdir = 1,
 	.needs_root = 1,
-	.save_restore = (const char * const[]) {
-		"?/proc/sys/vm/swappiness",
+	.save_restore = (const struct tst_path_val const[]) {
+		{"?/proc/sys/vm/swappiness", SWAPPINESS},
 		NULL
 	},
 	.needs_cgroup_ctrls = (const char *const []){ "memory", NULL },
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
