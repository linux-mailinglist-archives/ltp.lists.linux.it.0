Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B42C4EBD3E
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Mar 2022 11:08:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 722743C9FB1
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Mar 2022 11:08:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7D26C3C9AA2
 for <ltp@lists.linux.it>; Wed, 30 Mar 2022 11:08:22 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E1B1F10006CC
 for <ltp@lists.linux.it>; Wed, 30 Mar 2022 11:08:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2274C1F38C;
 Wed, 30 Mar 2022 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648631300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RhRYo7C0uA/1hAbXjir+GOsnSsEi2tCrJNwgnNGvZFI=;
 b=YTP9bvkIDGpCuOlkt6JeA2REiCwAKbgpSEmTg1HMYA5NMStBQNSQh/Tl8w6ABB3RTIKybv
 s8C19SWDhzALdWM3C4V6p9bBo1FGvwzLb9pjQdg6y9NWbUarrtr2bI8JkLj4D/fiHAT2g2
 0+JAYWyU8b2zeZQkHBxHSAOAbBg/pKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648631300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RhRYo7C0uA/1hAbXjir+GOsnSsEi2tCrJNwgnNGvZFI=;
 b=HYj7pmci5o4VZOZU1ScGvfsjkw7d1xnz39Mxb/rM0H568Nt6xh6PuOxq0KSNmVJi5JpJMq
 W6KT3If1x2WZj5Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E91A213A60;
 Wed, 30 Mar 2022 09:08:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4/PyNgMeRGI7UwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Wed, 30 Mar 2022 09:08:19 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Wed, 30 Mar 2022 11:08:17 +0200
Message-Id: <20220330090817.21950-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Fix wqueue09 according with 5.17 kernel updates
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
This patch fixes also the issue of loosing events on big number of iterations
such as -i 1000.

 testcases/kernel/watchqueue/wqueue09.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/watchqueue/wqueue09.c b/testcases/kernel/watchqueue/wqueue09.c
index 55d567249..e632be094 100644
--- a/testcases/kernel/watchqueue/wqueue09.c
+++ b/testcases/kernel/watchqueue/wqueue09.c
@@ -11,10 +11,13 @@
 
 #define _GNU_SOURCE
 
+#include <unistd.h>
 #include "tst_test.h"
 #include "lapi/keyctl.h"
 #include "common.h"
 
+#define WATCH_QUEUE_NOTE_SIZE 128
+
 static int data_lost;
 
 static void saw_data_loss(struct watch_notification *n,
@@ -29,14 +32,15 @@ static void saw_data_loss(struct watch_notification *n,
 
 static void run(void)
 {
-	int fd;
+	int fd, i, iterations;
 	key_serial_t key;
 
 	fd = wqueue_watch(1, &wqueue_filter);
-
 	key = wqueue_add_key(fd);
-	keyctl(KEYCTL_UPDATE, key, "b", 1);
-	keyctl(KEYCTL_REVOKE, key);
+
+	iterations = (getpagesize() / WATCH_QUEUE_NOTE_SIZE) * 2;
+	for (i = 0; i < iterations; i++)
+		keyctl(KEYCTL_UPDATE, key, "b", 1);
 
 	data_lost = 0;
 	while (!data_lost)
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
