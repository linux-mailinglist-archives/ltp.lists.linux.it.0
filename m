Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A891C4B1011
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Feb 2022 15:18:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64C803C9E83
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Feb 2022 15:18:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 788243C93D2
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 15:18:11 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 966451A0145A
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 15:18:10 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C728621117;
 Thu, 10 Feb 2022 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644502689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SL775cfIOTHd8Aq93MSSGnmUxzZgY+arE+E2DfWnMFA=;
 b=REqxZ4YLIYYY0LOcS0wMH/TOmIGFfuRvVAlEXz2271sav1+McN5gvw8ydj4kZMHrMcVu/r
 IKaPcFS9ZHqd24Up/YR1lq5XefhuF/SyP0ECq4CNN9g8zuJ9bS2W4FVkshe2zSRHOCcl0W
 CGJfuoCVwyyg5nGctqoGo2Q5SS8zTUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644502689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SL775cfIOTHd8Aq93MSSGnmUxzZgY+arE+E2DfWnMFA=;
 b=En8NEHwTlot7dudACO041LEBPbu88FtszQnmk4ubXNvSwUEpBCDpREKcLreSS41k1qIZir
 ICx7NzqxQxALQ9Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B19EE13BB0;
 Thu, 10 Feb 2022 14:18:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pgAGKqEeBWLubAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 10 Feb 2022 14:18:09 +0000
Date: Thu, 10 Feb 2022 15:18:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <YgUemsGtWLfK7isG@rei>
References: <20220209091756.17245-1-andrea.cervesato@suse.de>
 <20220209091756.17245-2-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209091756.17245-2-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/3] Add futex_waitv testing suite
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
I've fixed a few things in this patch and pushed the whole patchset,
thanks.

Full diff:

diff --git a/testcases/kernel/syscalls/futex/futex_waitv02.c b/testcases/kernel/syscalls/futex/futex_waitv02.c
index 2897f6c78..0a0e2b620 100644
--- a/testcases/kernel/syscalls/futex/futex_waitv02.c
+++ b/testcases/kernel/syscalls/futex/futex_waitv02.c
@@ -37,10 +37,10 @@ static void setup(void)
 	if (tst_parse_int(str_numfutex, &numfutex, 1, FUTEX_WAITV_MAX))
 		tst_brk(TBROK, "Invalid number of futexes '%s'", str_numfutex);
 
-	futexes = SAFE_MALLOC(sizeof(uint32_t) * numfutex);
+	futexes = tst_alloc(sizeof(uint32_t) * numfutex);
 	memset(futexes, FUTEX_INITIALIZER, sizeof(uint32_t) * numfutex);
 
-	waitv = SAFE_MALLOC(sizeof(struct futex_waitv) * numfutex);
+	waitv = tst_alloc(sizeof(struct futex_waitv) * numfutex);
 	memset(waitv, 0, sizeof(struct futex_waitv) * numfutex);
 
 	for (i = 0; i < numfutex; i++) {
@@ -60,8 +60,8 @@ static void *threaded(void *arg)
 	TEST(futex_wake(tv.fntype, (void *)(uintptr_t)waitv[numfutex - 1].uaddr,
 			1, FUTEX_PRIVATE_FLAG));
 	if (TST_RET < 0) {
-		tst_brk(TBROK, "futex_wake private returned: %ld %s", TST_RET,
-			tst_strerrno(TST_ERR));
+		tst_brk(TBROK | TTERRNO,
+			"futex_wake private returned: %ld", TST_RET);
 	}
 
 	return NULL;
@@ -70,7 +70,7 @@ static void *threaded(void *arg)
 static void run(void)
 {
 	struct timespec to;
-	int ret, tid;
+	int tid;
 	pthread_t t;
 
 	tid = tst_syscall(__NR_gettid);
@@ -81,13 +81,13 @@ static void run(void)
 	SAFE_CLOCK_GETTIME(CLOCK_MONOTONIC, &to);
 	to.tv_sec++;
 
-	ret = futex_waitv(waitv, numfutex, 0, &to, CLOCK_MONOTONIC);
-	if (ret < 0)
-		tst_brk(TBROK, "futex_waitv returned: %d %s", ret,
-			tst_strerrno(-ret));
-	else if (ret != numfutex - 1)
-		tst_res(TFAIL, "futex_waitv returned: %d, expecting %d", ret,
-			numfutex - 1);
+	TEST(futex_waitv(waitv, numfutex, 0, &to, CLOCK_MONOTONIC));
+	if (TST_RET < 0) {
+		tst_brk(TBROK | TTERRNO, "futex_waitv returned: %ld", TST_RET);
+	} else if (TST_RET != numfutex - 1) {
+		tst_res(TFAIL, "futex_waitv returned: %ld, expecting %d",
+			TST_RET,  numfutex - 1);
+	}
 
 	SAFE_PTHREAD_JOIN(t, NULL);
 	tst_res(TPASS, "futex_waitv returned correctly");
diff --git a/testcases/kernel/syscalls/futex/futex_waitv03.c b/testcases/kernel/syscalls/futex/futex_waitv03.c
index 773cc5af3..d8e39c76a 100644
--- a/testcases/kernel/syscalls/futex/futex_waitv03.c
+++ b/testcases/kernel/syscalls/futex/futex_waitv03.c
@@ -39,7 +39,7 @@ static void setup(void)
 	if (tst_parse_int(str_numfutex, &numfutex, 1, FUTEX_WAITV_MAX))
 		tst_brk(TBROK, "Invalid number of futexes '%s'", str_numfutex);
 
-	waitv = SAFE_MALLOC(sizeof(struct futex_waitv) * numfutex);
+	waitv = tst_alloc(sizeof(struct futex_waitv) * numfutex);
 	memset(waitv, 0, sizeof(struct futex_waitv) * numfutex);
 
 	for (i = 0; i < numfutex; i++) {
@@ -72,8 +72,8 @@ static void *threaded(void *arg)
 	TEST(futex_wake(tv.fntype, (void *)(uintptr_t)waitv[numfutex - 1].uaddr,
 			1, 0));
 	if (TST_RET < 0) {
-		tst_brk(TBROK, "futex_wake private returned: %ld %s", TST_RET,
-			tst_strerrno(TST_ERR));
+		tst_brk(TBROK | TTERRNO,
+			"futex_wake private returned: %ld", TST_RET);
 	}
 
 	return NULL;
@@ -94,12 +94,12 @@ static void run(void)
 	to.tv_sec++;
 
 	TEST(futex_waitv(waitv, numfutex, 0, &to, CLOCK_MONOTONIC));
-	if (TST_RET < 0)
-		tst_brk(TBROK, "futex_waitv returned: %ld %s", TST_RET,
-			tst_strerrno(TST_ERR));
-	else if (TST_RET != numfutex - 1)
+	if (TST_RET < 0) {
+		tst_brk(TBROK | TTERRNO, "futex_waitv returned: %ld", TST_RET);
+	} else if (TST_RET != numfutex - 1) {
 		tst_res(TFAIL, "futex_waitv returned: %ld, expecting %d",
 			TST_RET, numfutex - 1);
+	}
 
 	SAFE_PTHREAD_JOIN(t, NULL);
 	tst_res(TPASS, "futex_waitv returned correctly");

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
