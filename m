Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB975664135
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Jan 2023 14:07:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C7163CCB3D
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Jan 2023 14:07:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C5B53C538F
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 14:07:16 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C332E10007C2
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 14:07:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4AA8F75F98
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673356034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nuMCZhg6FdRwiKXyf2AS0maLhPv+o2X4gi/5qvzlTo8=;
 b=C4B5HD1L0CulJ7UlFbpQWQc6PIiMdYy941R0yfPAMzW3m0qa8vxDpjnJHP258k88bEqgZZ
 ROFo9u2BM0UPfULCZkabOw66rvJfALxx+EYpgvVhjTbNCdoqz4OOiN7hRypmC8v6CpiRL6
 l52bfkZCMgd9rIZo62r4ojPGz/p8ScI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673356034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nuMCZhg6FdRwiKXyf2AS0maLhPv+o2X4gi/5qvzlTo8=;
 b=M6uJR9yTuEjN3qRUtYZUyTB/RIFCXyqaIOKznw8XG/uEEqbG68sAKuy+LFl+GHbrVUxGLG
 i8kFFtJ65wyZvfBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD76013338
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 13:07:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jbCCHwFjvWMuMQAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 13:07:13 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Tue, 10 Jan 2023 18:37:11 +0530
Message-Id: <20230110130711.29274-1-akumar@suse.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] setreuid01: Use SETREUID() instead of setreuid() to
 check 32bit syscall
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

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/setreuid/setreuid01.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/setreuid/setreuid01.c b/testcases/kernel/syscalls/setreuid/setreuid01.c
index bbf29d360..7c2b6d589 100644
--- a/testcases/kernel/syscalls/setreuid/setreuid01.c
+++ b/testcases/kernel/syscalls/setreuid/setreuid01.c
@@ -26,13 +26,13 @@ static void run(void)
 	euid = geteuid();
 	UID16_CHECK(euid, setreuid);
 
-	TST_EXP_PASS(setreuid(-1, -1));
-	TST_EXP_PASS(setreuid(-1, euid));
-	TST_EXP_PASS(setreuid(ruid, -1));
-	TST_EXP_PASS(setreuid(-1, ruid));
-	TST_EXP_PASS(setreuid(euid, -1));
-	TST_EXP_PASS(setreuid(euid, euid));
-	TST_EXP_PASS(setreuid(ruid, ruid));
+	TST_EXP_PASS(SETREUID(-1, -1));
+	TST_EXP_PASS(SETREUID(-1, euid));
+	TST_EXP_PASS(SETREUID(ruid, -1));
+	TST_EXP_PASS(SETREUID(-1, ruid));
+	TST_EXP_PASS(SETREUID(euid, -1));
+	TST_EXP_PASS(SETREUID(euid, euid));
+	TST_EXP_PASS(SETREUID(ruid, ruid));
 }
 
 static struct tst_test test = {
-- 
2.39.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
