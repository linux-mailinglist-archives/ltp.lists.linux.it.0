Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C975A12E4
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Aug 2022 16:03:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 629293CA3C1
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Aug 2022 16:03:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5E2BD3C01CF
 for <ltp@lists.linux.it>; Thu, 25 Aug 2022 16:03:13 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BC6161400519
 for <ltp@lists.linux.it>; Thu, 25 Aug 2022 16:03:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CC8DE338B5;
 Thu, 25 Aug 2022 14:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661436190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=i5090jX32OhoUs5NvNcrdqi0RlNp4gzNlrmlvy5Au/4=;
 b=f3eMWnCpwM4Qp+sUUeMkcqfl75tZ/nIjI5HxQdiC/9jAMviq+On8CqaFuE02lABYRUSXrO
 CuwMBi9X6NZZZOmJTal1x/OQ+9Ak190cfVC2ff7+WS/iUbqi+p9LOLQWT817goP03tb5jM
 5nsJzmDr31nrJGgtpQgvgfZiO/ewlGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661436190;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=i5090jX32OhoUs5NvNcrdqi0RlNp4gzNlrmlvy5Au/4=;
 b=Yc7hUCyNxW46TvEFWyuy6XiwIrf4W/XP4xgYsrETcMooBVgBEVjC9D9JhhHCOQc9qYklsu
 iCBgAHS1qwsj2zAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A417E13517;
 Thu, 25 Aug 2022 14:03:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3k0GKB6BB2MRQQAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 25 Aug 2022 14:03:10 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 21FBDA0679; Thu, 25 Aug 2022 16:03:10 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: LTP List <ltp@lists.linux.it>
Date: Thu, 25 Aug 2022 16:03:06 +0200
Message-Id: <20220825140306.7150-1-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/fanotify10: Make evictable marks test more
 reliable
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
Cc: Jan Kara <jack@suse.cz>, Matthew Bobrowski <repnop@google.com>,
 Dominique Leuenberger <dimstar@opensuse.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In some setups evictable marks tests are failing because the inode with
evictable mark does not get evicted. Make sure we sync the filesystem
before we try to drop caches to increase likelyhood the inode will get
evicted.

Reported-by: Jan Stancek <jstancek@redhat.com>
Reported-by: Dominique Leuenberger <dimstar@opensuse.org>
Acked-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 testcases/kernel/syscalls/fanotify/fanotify10.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index 19e43d2c2762..54636ce2ddd4 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -342,6 +342,15 @@ static void show_fanotify_marks(int fd)
 	}
 }
 
+static void drop_caches(char *path)
+{
+	int fd = SAFE_OPEN(path, O_RDONLY);
+	if (syncfs(fd) < 0)
+		tst_brk(TBROK | TERRNO, "Unexpected error when syncing filesystem");
+	SAFE_CLOSE(fd);
+	SAFE_FILE_PRINTF(DROP_CACHES_FILE, "3");
+}
+
 static int create_fanotify_groups(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
@@ -402,7 +411,7 @@ add_mark:
 	 * drop_caches should evict inode from cache and remove evictable marks
 	 */
 	if (evictable_ignored) {
-		SAFE_FILE_PRINTF(DROP_CACHES_FILE, "3");
+		drop_caches(tc->mark_path);
 		for (p = 0; p < num_classes; p++) {
 			for (i = 0; i < GROUPS_PER_PRIO; i++) {
 				if (fd_notify[p][i] > 0)
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
