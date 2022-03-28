Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AB24E9699
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Mar 2022 14:31:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0CAF3C980A
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Mar 2022 14:31:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C9FA73C07B7
 for <ltp@lists.linux.it>; Mon, 28 Mar 2022 14:31:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8F8B2200778
 for <ltp@lists.linux.it>; Mon, 28 Mar 2022 14:31:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B59D01F37C;
 Mon, 28 Mar 2022 12:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648470677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vWpXa0/9zlfJ9gGOXi8OMkofg5pDueWeJ5pM4ccvFe8=;
 b=KWzEyyMBeulDDug1qdjQQ70TjzGUHYIA3jmS/YL0FUIyZkr5ngAIXTLyUjRaqwNXiBWEOZ
 cQlViYBTFdCDp0K3hGSoq91nkmRidWlgOr/Y63QiTO/XRrHI/YL6ovuvUsy4dVvv4A0Ls3
 RuWTj7WOBmAnPAM9vYz+b8wUvKw9Ets=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648470677;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vWpXa0/9zlfJ9gGOXi8OMkofg5pDueWeJ5pM4ccvFe8=;
 b=IqXChJgIVym3xJTkcETFlJomoxwmuQeGVGxgdR2t4C+EFf1B6pZX0KS/Zm/J+4MUQI1nBG
 AGNJ28XAKT+eg/BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BE8913215;
 Mon, 28 Mar 2022 12:31:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wU/cH5WqQWJvfQAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Mon, 28 Mar 2022 12:31:17 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Mon, 28 Mar 2022 14:31:14 +0200
Message-Id: <20220328123114.31881-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Fix wqueue09 according with 5.17 kernel updates
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

Kernel 5.17 introduced many changes in the watch_queue support. In
particular, commit 3b4c0371928c17af03e8397ac842346624017ce6 changes the
behaviour of IOC_WATCH_QUEUE_SET_SIZE and ioctl control over watch_queue
buffer size: now we need to generate more events than before. In
particular, more than the bitmap size to the number of notes.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
 testcases/kernel/watchqueue/wqueue09.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/watchqueue/wqueue09.c b/testcases/kernel/watchqueue/wqueue09.c
index 55d567249..86feebf4a 100644
--- a/testcases/kernel/watchqueue/wqueue09.c
+++ b/testcases/kernel/watchqueue/wqueue09.c
@@ -29,14 +29,14 @@ static void saw_data_loss(struct watch_notification *n,
 
 static void run(void)
 {
-	int fd;
+	int fd, i;
 	key_serial_t key;
 
-	fd = wqueue_watch(1, &wqueue_filter);
+	fd = wqueue_watch(32, &wqueue_filter);
 
 	key = wqueue_add_key(fd);
-	keyctl(KEYCTL_UPDATE, key, "b", 1);
-	keyctl(KEYCTL_REVOKE, key);
+	for (i = 0; i < 256; i++)
+		keyctl(KEYCTL_UPDATE, key, "b", 1);
 
 	data_lost = 0;
 	while (!data_lost)
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
