Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED1F524D0A
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 14:36:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 190623CA9D0
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 14:36:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8520D3C70BF
 for <ltp@lists.linux.it>; Thu, 12 May 2022 14:36:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 25CFB1000A25
 for <ltp@lists.linux.it>; Thu, 12 May 2022 14:36:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CAA2021C82;
 Thu, 12 May 2022 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652358964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6IutTJYH6iTilwV6wWLM9swwqBMKcgWI7LqPZ4JA1I=;
 b=nMki40LNmG3FbZXBAhIk6DYJjDvoTVdaM+PasBPOHx44jYCIlZBwx6stAgCZO1AL0Dj5o5
 kZeosOvtZ+cUGLXY98JpcmG7mDkm/NZPnXzfo452zoPA1Nd555ruG4teDEenXPl5DoAQ4o
 Kw703wtx5MCEcbbQ3NaFlfW3DFMFOVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652358964;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6IutTJYH6iTilwV6wWLM9swwqBMKcgWI7LqPZ4JA1I=;
 b=jkIqCfYeQ/HTowtJgJZchc2F8oWpNunIwAFI51hu1b1yJptvj93hd/hti6q+E3kF0/itRV
 9JZ6pHnKdSzf1+Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B787413ABE;
 Thu, 12 May 2022 12:36:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xVqfKzT/fGITGgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 12 May 2022 12:36:04 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 May 2022 14:37:51 +0200
Message-Id: <20220512123816.24399-5-chrubis@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512123816.24399-1-chrubis@suse.cz>
References: <20220512123816.24399-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 04/29] mtest01/mtest01: Convert to runtime
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
 testcases/kernel/mem/mtest01/mtest01.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
index 20cb95191..fb991ce8b 100644
--- a/testcases/kernel/mem/mtest01/mtest01.c
+++ b/testcases/kernel/mem/mtest01/mtest01.c
@@ -41,8 +41,6 @@
 #define ALLOC_THRESHOLD		(6*FIVE_HUNDRED_MB)
 #endif
 
-#define STOP_THRESHOLD 15	/* seconds remaining before reaching timeout */
-
 static pid_t *pid_list;
 static sig_atomic_t children_done;
 static int max_pids;
@@ -137,6 +135,7 @@ static void child_loop_alloc(unsigned long long alloc_bytes)
 {
 	unsigned long bytecount = 0;
 	char *mem;
+	int runtime_rem;
 
 	tst_res(TINFO, "... child %d starting", getpid());
 
@@ -153,12 +152,15 @@ static void child_loop_alloc(unsigned long long alloc_bytes)
 		if (bytecount >= alloc_bytes)
 			break;
 	}
+
+	runtime_rem = tst_remaining_runtime();
+
 	if (dowrite)
 		tst_res(TINFO, "... [t=%d] %lu bytes allocated and used in child %d",
-				tst_timeout_remaining(), bytecount, getpid());
+				runtime_rem, bytecount, getpid());
 	else
 		tst_res(TINFO, "... [t=%d] %lu bytes allocated only in child %d",
-				tst_timeout_remaining(), bytecount, getpid());
+				runtime_rem, bytecount, getpid());
 
 	kill(getppid(), SIGRTMIN);
 	raise(SIGSTOP);
@@ -195,10 +197,9 @@ static void mem_test(void)
 
 	/* wait in the loop for all children finish allocating */
 	while (children_done < pid_cntr) {
-		if (tst_timeout_remaining() < STOP_THRESHOLD) {
+		if (!tst_remaining_runtime()) {
 			tst_res(TWARN,
 				"the remaininig time is not enough for testing");
-
 			break;
 		}
 
@@ -234,6 +235,7 @@ static struct tst_test test = {
 		{"v",  &verbose,     	"Verbose"},
 		{}
 	},
+	.max_runtime = 300,
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_all = mem_test,
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
