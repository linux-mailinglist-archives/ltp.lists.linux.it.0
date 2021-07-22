Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 357413D1F17
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 09:35:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD5EC3C8189
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 09:35:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 25C133C5613
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 09:35:29 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BDEFA1401128
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 09:35:28 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B38B2037D;
 Thu, 22 Jul 2021 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626939328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pwvCx1vcpKzr4hKyR9vM3Tv5LbSyqqtwEDOoJdHnycU=;
 b=il4YZ22vB+l+3FUqDxvxwsjr/hJV59p+ZIwPK+1Eo1dNPpcd/zA7aFSgWJdqmawIybdf6W
 m3l8YTq3w4qfmYGR1oGg5KmDvY6RUO1nhOxHHopiZFbLI2aWsETda7guGriLoRQoGsIPFT
 ZJBtVkvMrEFcd6dMo2CBfYgP4kqhOh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626939328;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pwvCx1vcpKzr4hKyR9vM3Tv5LbSyqqtwEDOoJdHnycU=;
 b=IH7I6h+OLLHDEM1s+57xRumM62z6X3yfYp6EOthu5d+f+clVeSglh50ooWVKBh4M6Zsrf1
 WV/JJcDT3x0lZxAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DA785137DE;
 Thu, 22 Jul 2021 07:35:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id bGJhM78f+WARBwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 22 Jul 2021 07:35:27 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 22 Jul 2021 09:35:23 +0200
Message-Id: <20210722073523.5099-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] shmget03: Consider already mapped segments
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

This fixes running test on systems with already mapped segments.

Test expected that no segment was already mapped, thus reached the
maximum earlier:

$ ipcs -m

------ Shared Memory Segments --------
key        shmid      owner      perms      bytes      nattch     status
0x62001fae 0          root       660        4124096    1

./shmget03
tst_test.c:1344: TINFO: Timeout per run is 0h 05m 00s
shmget03.c:46: TBROK: shmget failed unexpectedly: ENOSPC (28)

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

I suppose we don't want to factor out the code counting lines and put it
into safe_file_ops.c.

Kind regards,
Petr

 testcases/kernel/syscalls/ipc/shmget/shmget03.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget03.c b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
index efbc465e1..57130e993 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
@@ -14,15 +14,19 @@
 #include <errno.h>
 #include <sys/types.h>
 #include <sys/ipc.h>
+#include <stdio.h>
 #include <stdlib.h>
 #include <pwd.h>
 #include <sys/shm.h>
 #include "tst_test.h"
 #include "tst_safe_sysv_ipc.h"
+#include "tst_safe_stdio.h"
 #include "libnewipc.h"
 
 static int *queues;
 static int maxshms, queue_cnt;
+static int mapped_shms = -1;
+static FILE *f = NULL;
 static key_t shmkey;
 
 static void verify_shmget(void)
@@ -34,10 +38,19 @@ static void verify_shmget(void)
 static void setup(void)
 {
 	int res, num;
+	char c;
 
 	shmkey = GETIPCKEY();
 
+	f = SAFE_FOPEN("/proc/sysvipc/shm", "r");
+	while ((c = fgetc(f)) != EOF) {
+		if (c == '\n')
+			mapped_shms++;
+	}
+	tst_res(TINFO, "Already mapped shared memory segments: %d", mapped_shms);
+
 	SAFE_FILE_SCANF("/proc/sys/kernel/shmmni", "%i", &maxshms);
+	maxshms -= mapped_shms;
 
 	queues = SAFE_MALLOC(maxshms * sizeof(int));
 	for (num = 0; num < maxshms; num++) {
@@ -62,6 +75,9 @@ static void cleanup(void)
 		SAFE_SHMCTL(queues[num], IPC_RMID, NULL);
 
 	free(queues);
+
+	if (f)
+		SAFE_FCLOSE(f);
 }
 
 static struct tst_test test = {
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
