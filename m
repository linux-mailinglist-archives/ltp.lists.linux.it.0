Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BB05FC7B5
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 16:49:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A6BD3CAEB3
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 16:49:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C50463CAEB7
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 16:48:42 +0200 (CEST)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 67FE0600084
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 16:48:42 +0200 (CEST)
Received: by mail-pf1-x449.google.com with SMTP id
 p1-20020aa78601000000b00565a29d32e5so1175190pfn.5
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 07:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+egNQNfNYiMzbS2XN0P/3qrQXeOGn7oU0h3WHOwWeHc=;
 b=HT7WO7L+MZdvOoA+YGdKidFD9LoVImSyxtyICqT6m4Nbw8d0CW3zboGX4gY/9slwe3
 3gw1zH6Pz5UdsxgBhnjgjElTuMZ5wSg7owbfy0KM0E1BLq2FUN3W26fr0uSVfss7TsNt
 oB1CIICSSRf8n8tVLCYaks8GvHqkNM2XTQgpQASFsdD224BHtIveTWYT8FVfZho3mbfB
 hbFP110U2e/Nfs/cFEyOIW1LIvPSRW+qwCej2Es6jvEmr1KSscqG23NaMGaT4CB0Ir4i
 DH/daP7tj4gGG3RIP8H8PpewSkx0fpUSk5siphy9zphriRdGHaqfx+hyrv8ZcxEJkPUv
 0Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+egNQNfNYiMzbS2XN0P/3qrQXeOGn7oU0h3WHOwWeHc=;
 b=DZ9UyaZRr+6uB+jPfiDBmDpSzopkgFga1sYhix5TFslI8ABs/p5hcSwFBwZxyMUa7H
 meQ3hcOvGuahD6ZINLYZrJrK1YisuSGvDup8aOyEw5O3X1O566VgMBwCQUoXaCsM88eG
 jBFKaZWpxOoegQQ6UQYkT9UwlLAwgnZgOqjauHZa5UL8RNEp7rBVPJ0rM8cpk+BxBuPz
 nl2D56W3jB/trj/PZ9k2uPP2uYWHovWzrmbXE+OPPw1s5Niw7FxTJ3y55z2nHtJx5s/u
 GuZqdnUmkPQlPFw69XnpQ/BFwW5fVR5Tw9+0W8bmC9IOOO6xDGKdp+f5ZnbSLQkXZ8zA
 IwgQ==
X-Gm-Message-State: ACrzQf0TQD+nRAjTHMaV/PXaxvW5T+4NGGK/x1VMCAEe842FJw/kGS53
 xItULPLTsGA8UMR8Ma6xLDnV2Yykj0lfK06kFeIuOm5KLoX9Jv1i+VhWSMz53HtxyecwtOy4igG
 A18mLrrk8rhrcfiIKoSyIFlDSBKP7gGdF2ThCALX9ZkmjdbbRomkE4l7q
X-Google-Smtp-Source: AMsMyM7UGHSIWIifrQKmui5GpbWZ/5jBA+q9ITgvVc+BThoLkEMfUCbWQ3REpZEZs+mm3onxPR3x64Jn/Fg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:e548:b0:178:87d2:f29f with SMTP id
 n8-20020a170902e54800b0017887d2f29fmr29103376plf.142.1665586120884; Wed, 12
 Oct 2022 07:48:40 -0700 (PDT)
Date: Wed, 12 Oct 2022 14:48:23 +0000
In-Reply-To: <20221012144823.1595671-1-edliaw@google.com>
Mime-Version: 1.0
References: <20221012144823.1595671-1-edliaw@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221012144823.1595671-6-edliaw@google.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5 5/5] mmapstress01: move sighandler to setup and
 remove sig blocks
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 .../kernel/mem/mmapstress/mmapstress01.c      | 51 +++++--------------
 1 file changed, 12 insertions(+), 39 deletions(-)

diff --git a/testcases/kernel/mem/mmapstress/mmapstress01.c b/testcases/kernel/mem/mmapstress/mmapstress01.c
index de7da5b99..cf8fb3b1f 100644
--- a/testcases/kernel/mem/mmapstress/mmapstress01.c
+++ b/testcases/kernel/mem/mmapstress/mmapstress01.c
@@ -52,6 +52,7 @@
 #define roundup(x, y)	((((x)+((y)-1))/(y))*(y))
 
 static unsigned int initrand(void);
+static void sighandler(int);
 
 static char *debug;
 static char *do_sync;
@@ -88,7 +89,17 @@ static struct tst_option options[] = {
 
 static void setup(void)
 {
-	int pagesize = sysconf(_SC_PAGE_SIZE);
+	struct sigaction sa;
+
+	sa.sa_handler = sighandler;
+	sa.sa_flags = 0;
+	SAFE_SIGEMPTYSET(&sa.sa_mask);
+	SAFE_SIGACTION(SIGINT, &sa, 0);
+	SAFE_SIGACTION(SIGQUIT, &sa, 0);
+	SAFE_SIGACTION(SIGTERM, &sa, 0);
+	SAFE_SIGACTION(SIGALRM, &sa, 0);
+
+	pagesize = sysconf(_SC_PAGE_SIZE);
 
 	if (tst_parse_filesize(opt_filesize, &filesize, 0, FSIZE_MAX))
 		tst_brk(TBROK, "invalid initial filesize '%s'", opt_filesize);
@@ -273,9 +284,7 @@ static void run(void)
 	int wait_stat;
 	off_t bytes_left;
 	pid_t pid;
-	sigset_t set_mask;
 	size_t write_cnt;
-	struct sigaction sa;
 	unsigned char data;
 	unsigned char *buf;
 	unsigned int seed;
@@ -284,19 +293,7 @@ static void run(void)
 	seed = initrand();
 	pattern = seed & 0xff;
 
-	/*
-	 * Plan for death by signal or alarm.
-	 * Also catch and cleanup with SIGINT.
-	 */
 	finished = 0;
-	sa.sa_handler = sighandler;
-	sa.sa_flags = 0;
-	SAFE_SIGEMPTYSET(&sa.sa_mask);
-	SAFE_SIGACTION(SIGINT, &sa, 0);
-	SAFE_SIGACTION(SIGQUIT, &sa, 0);
-	SAFE_SIGACTION(SIGTERM, &sa, 0);
-
-	SAFE_SIGACTION(SIGALRM, &sa, 0);
 	alarm(tst_remaining_runtime());
 
 	fd = SAFE_OPEN(TEST_FILE, O_CREAT | O_TRUNC | O_RDWR, 0664);
@@ -326,23 +323,9 @@ static void run(void)
 	}
 
 	/* Now wait for children and refork them as needed. */
-
-	SAFE_SIGEMPTYSET(&set_mask);
-	SAFE_SIGADDSET(&set_mask, SIGALRM);
-	SAFE_SIGADDSET(&set_mask, SIGINT);
 	while (!finished) {
 		pid = wait(&wait_stat);
-		/*
-		 * Block signals while processing child exit.
-		 */
-
-		SAFE_SIGPROCMASK(SIG_BLOCK, &set_mask, NULL);
-
 		if (pid != -1) {
-			/*
-			 * Check exit status, then refork with the
-			 * appropriate procno.
-			 */
 			if (!WIFEXITED(wait_stat)
 			    || WEXITSTATUS(wait_stat) != 0)
 				tst_brk(TBROK, "child exit with err <x%x>",
@@ -353,21 +336,11 @@ static void run(void)
 				exit(0);
 			}
 		} else {
-			/*
-			 * wait returned an error.  If EINTR, then
-			 * normal finish, else it's an unexpected
-			 * error...
-			 */
 			if (errno != EINTR || !finished)
 				tst_brk(TBROK | TERRNO,
 					"unexpected wait error");
 		}
-		SAFE_SIGPROCMASK(SIG_UNBLOCK, &set_mask, NULL);
 	}
-
-	SAFE_SIGEMPTYSET(&set_mask);
-	SAFE_SIGADDSET(&set_mask, SIGALRM);
-	SAFE_SIGPROCMASK(SIG_BLOCK, &set_mask, NULL);
 	alarm(0);
 
 	/* Finished!  Check the file for sanity. */
-- 
2.38.0.rc1.362.ged0d419d3c-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
