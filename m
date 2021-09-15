Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E4840C843
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 17:25:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C579E3C9183
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 17:25:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0DE483C2E5D
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 17:25:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 06124201105
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 17:25:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 34B32201C7;
 Wed, 15 Sep 2021 15:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631719512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=p5In2H4p4HA6xJM/FP9onaFBdXJqNynEMBrNsDnTEzw=;
 b=ph8MryjHvl9JgStRu4+WXaefqKIyqJ/T8jj35r46TgxD1O7c19O8aPYK8QvOEr8fVAcbVP
 qlKMbWgStldSzCmtcjSKu99BCjz4lHm/6IoFYvHk+7JVIjf9YgLlvczCy4NAdYP4R4VUMX
 IMqdRF8IR0/p2PAiZNyjDw0joZFQio4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631719512;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=p5In2H4p4HA6xJM/FP9onaFBdXJqNynEMBrNsDnTEzw=;
 b=CV+OSDGVF9qY8NYDiHiH0BhuPsHg1VfrX9GuXlrRFveodGXRCqJ38Mc6YSpFE9qziupgBk
 A7xwHq//RBDmrmAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0352713C37;
 Wed, 15 Sep 2021 15:25:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mlnLAFgQQmEtIAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 15 Sep 2021 15:25:12 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Sep 2021 17:25:33 +0200
Message-Id: <20210915152533.20902-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/shmctl05: Remove shm segment only when
 created
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

We cannot remove the shm segment unconditionally. On kernels without
SysV IPC support compiled in the test fails with following:

shmctl05.c:50: TCONF: syscall(396) __NR_shmctl not supported
shmctl05.c:96: TWARN: shmget(61455, 4096, 0) failed: ENOENT (2)
shmctl05.c:97: TWARN: shmctl(-1, 0, (nil)) failed: EINVAL (22)

Fixes: 48d382e8daf2 (syscalls/shmctl05.c: Fix leak of shared memory segment)
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/ipc/shmctl/shmctl05.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c
index ea7eef6f1..8569322dc 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c
@@ -92,8 +92,16 @@ static void do_test(void)
 static void cleanup(void)
 {
 	int id;
+
 	tst_fzsync_pair_cleanup(&fzsync_pair);
-	id = SAFE_SHMGET(0xF00F, 4096, 0);
+
+	id = shmget(0xF00F, 4096, 0);
+	if (id == -1) {
+		if (errno != ENOENT)
+			tst_res(TWARN | TERRNO, "shmget()");
+		return;
+	}
+
 	SAFE_SHMCTL(id, IPC_RMID, NULL);
 }
 
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
