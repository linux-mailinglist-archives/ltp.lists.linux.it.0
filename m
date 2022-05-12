Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26247524D16
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 14:38:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5B4C3CA9E3
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 14:38:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 73A933CA9D8
 for <ltp@lists.linux.it>; Thu, 12 May 2022 14:36:08 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1F94B200142
 for <ltp@lists.linux.it>; Thu, 12 May 2022 14:36:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C775721C82;
 Thu, 12 May 2022 12:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652358967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40xHNhZTxUeD9s8xYPBNt/ejxODGjlnYsLLGykWqxq0=;
 b=FOa+5oLMWAJAZ1AkyC1kqlEvUTXJCp4OZQgigEAm92Jc8xNrn5Uz58vmRM2ccqhanquNga
 V1ReYykA/uvPe4cYk65ISloHEnXQpIhMw1odtGCJyoa4+82QPNbilZfHbyXaMo+eVQvL1B
 grmuCg1dc1d2JPk+bX4Byr6aHEi5xys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652358967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40xHNhZTxUeD9s8xYPBNt/ejxODGjlnYsLLGykWqxq0=;
 b=EA/A3WoBQfU9Nqcg6ILyUBa7VtDVuoamsIojDO4vXC28pq2cIDRAQsWjOkFqjo0BYW2rlj
 rp3cMn1MzgAr59AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B223413ABE;
 Thu, 12 May 2022 12:36:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WMIwKjf/fGIrGgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 12 May 2022 12:36:07 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 May 2022 14:37:57 +0200
Message-Id: <20220512123816.24399-11-chrubis@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512123816.24399-1-chrubis@suse.cz>
References: <20220512123816.24399-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 10/29] syscalls/gettimeofday02: Convert to runtime.
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
index 948d2d8ec..7c462cc29 100644
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
+	.max_runtime = 10,
 	.test_all = verify_gettimeofday,
 };
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
