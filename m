Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB99A518B62
	for <lists+linux-ltp@lfdr.de>; Tue,  3 May 2022 19:47:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 683FC3CAB67
	for <lists+linux-ltp@lfdr.de>; Tue,  3 May 2022 19:47:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E46163CA95D
 for <ltp@lists.linux.it>; Tue,  3 May 2022 19:45:08 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2CC3A20006D
 for <ltp@lists.linux.it>; Tue,  3 May 2022 19:45:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 831D2210DF;
 Tue,  3 May 2022 17:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1651599907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/opg+5m4bhh18NsUdNanNPcaKS2VRzysrPoX9aHMczU=;
 b=tZ8DpS51pQPshrG/JO6klo5QckqrLmTaMXd8j7u/ZlkqJmACQwCYRO1OIAC2T0PhbBG3nk
 EzQ1FF+Lmu1admioL6Jl8zbYhK8BXROiJTvAULLmTy92UM8p3ZaPk68hCMQE0Gxpb1HcGP
 IyJrI/OjX7/ph4md34xTiiHjHsE/7is=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1651599907;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/opg+5m4bhh18NsUdNanNPcaKS2VRzysrPoX9aHMczU=;
 b=dWbizc0s0eX0SH3ZCyBkH7+va968b0qk/u1lBgnagOAFAg74Gzm7Q0+ZblddPB3DTvJcPU
 D3PzfDXHeunGMLAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6381913ABE;
 Tue,  3 May 2022 17:45:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FTjEFSNqcWL+PQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 03 May 2022 17:45:07 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 May 2022 19:46:58 +0200
Message-Id: <20220503174718.21205-11-chrubis@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503174718.21205-1-chrubis@suse.cz>
References: <20220503174718.21205-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 10/30] syscalls/gettimeofday02: Convert to runtime.
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
 .../kernel/syscalls/gettimeofday/gettimeofday02.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
index 948d2d8ec..6f175e79b 100644
--- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
@@ -25,8 +25,6 @@
 #include "lapi/syscalls.h"
 
 static volatile sig_atomic_t done;
-static char *str_rtime;
-static int rtime = 10;
 
 static void breakout(int sig)
 {
@@ -37,6 +35,7 @@ static void verify_gettimeofday(void)
 {
 	struct __kernel_old_timeval tv1, tv2;
 	unsigned long long cnt = 0;
+	int rtime = tst_remaining_runtime();
 
 	done = 0;
 
@@ -68,21 +67,11 @@ static void verify_gettimeofday(void)
 
 static void setup(void)
 {
-	if (str_rtime) {
-		rtime = atoi(str_rtime);
-		if (rtime <= 0)
-			tst_brk(TBROK, "Invalid runtime '%s'", str_rtime);
-		tst_set_timeout(rtime + 60);
-	}
-
 	SAFE_SIGNAL(SIGALRM, breakout);
 }
 
 static struct tst_test test = {
 	.setup = setup,
-	.options = (struct tst_option[]) {
-		{"T:", &str_rtime, "Test iteration runtime in seconds"},
-		{},
-	},
+	.max_iteration_runtime = 10,
 	.test_all = verify_gettimeofday,
 };
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
