Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO2wKR0In2neYgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 15:33:01 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EC4198C91
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 15:33:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1AC73C9967
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 15:33:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D52813C536F
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 15:32:49 +0100 (CET)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9BF206008F0
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 15:32:48 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso7534035ad.0
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 06:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772029967; x=1772634767; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=NOvHeN0tYZnuicUtjJQsGfGdMRET47P/ULg6bz1GqyE=;
 b=KKzRJm/u7jasWItZQRnzB0NraosjCvD9FS7dWh86iYVwOt65v2RLgQEbtvJK8hyY+O
 jU1YogAwhVpjWRzAar2JaXUCDtIzM6eLrHj2Kr+F1aHb4Az2L3DUgsdcqrSXYtX82R9a
 asjFWam8XJzgoH+i5FlIFQe5bGgSROemeCMrX50erTfA04asNE2F4qdBR6xA/Swppah7
 v2wr9QY/YZqaA94572HQpfcFkIKtu7XBqBUU+qEZvIvc19Y/omwVGQmpYvmAhXbyfkdk
 9mMMHt2CQPBcpzI/13QbMyjIkjZQlp3yn/kc4qSp5F5ofaxiJBfDrRrgzFsemuVOrDXm
 xBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772029967; x=1772634767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NOvHeN0tYZnuicUtjJQsGfGdMRET47P/ULg6bz1GqyE=;
 b=m3gG6iM+UsNQzsmxviCkfePFsnZbDNXb7ExrAQ2c2Bjz4iOKZTYd1Ha8UtBi9KGa9D
 lVm/83i0GgWP0QZ/B/PeZ4aFRLOXiVnPCVXEz1pr83KBcdXt65IvaKXRcJAIlFC4txZz
 EcSUi14bAjgg30e9eTvWUPmPs7LQBIEgU0senHojMD24zjIMFMuPuvpoqr5FYWXxEHIC
 HCM0mKanRlp7d//kVfnlWtlAK4BpKFreX6tbh/ptwOFgwaZVvfQ6TpeZXCucLoAeLyYR
 7PCNmnWdxNyd7KE4d503A0H3E8Sv8EPD1JtqONM+rLZ9WEF/M+tp1eKQQLv1F6fTF+Fu
 Lagg==
X-Gm-Message-State: AOJu0Yy4miqGpiKJkrPorOJaL3LvvLuTBC/kdz0glpPTG1PcZh5YDooF
 tDk4Td+gHZSRnddZ1NSdQ+G5OtL38RppkgOSPwx63LJzE5syWASQoZ9v9+Fd0nkFGg==
X-Gm-Gg: ATEYQzwZoJn5f/l13mtRvLRRjWHEca6XTPtiLpHcFen8IonppKXbNCTDy1rp4aokFps
 SOD7npZcwhRfHkOH5KjIoHQdwRzurQe4vcgbvvxyTSDE1vCzoeosGvrzWpOQX/d6c6JJPokwj9J
 w6NMEw67An5Euvz5AJElsMUVg08ePfdCaT3YKdB0QFPCqJGFvw20/QficIoGWqR9UdaAzT+/okp
 /UH4Cub6VctKN9k6/ruzzGBlXY6Nz+xvAYR2eJLMcva6WiBrJ5Q8U0+D9u/47xOArg1CktbHjXF
 8QKeTJJtRTXySamBdXZw5mrHwMYqlvLSSZNYj9WP+z++uOTkpiabj3Qch75hoATvcNiNI2beTxn
 fXvegiqpeXG4ydEy+a+ApAYdRBGT3Uvr+CySKwb9tQtkUVrTMC3EXqKQOcmvpKyhH+I70p2ktiU
 GwpIv/tKW9J3lXylnRkJY2/qU53zrwc4aLMRJqxcDeeZuD3z9Nh3QD
X-Received: by 2002:a17:903:f83:b0:2a0:fb1c:144e with SMTP id
 d9443c01a7336-2adbdc3f5d7mr35547005ad.7.1772029966733; 
 Wed, 25 Feb 2026 06:32:46 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e3425dsm134015635ad.16.2026.02.25.06.32.45
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 06:32:46 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 25 Feb 2026 23:32:04 +0900
Message-ID: <20260225143205.36806-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] poll: fix LTP check warnings and improve poll01
 validation
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-ltp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 43EC4198C91
X-Rspamd-Action: no action

Remove extra blank lines, mark helper functions as static, and fix
documentation comments starting with '/*\'.

Add explicit checks for poll() return value and validate that no
unexpected revents bits are set for POLLIN and POLLOUT cases.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 testcases/kernel/syscalls/poll/poll01.c | 24 ++++++++++++++++++------
 testcases/kernel/syscalls/poll/poll02.c |  4 ++--
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/syscalls/poll/poll01.c b/testcases/kernel/syscalls/poll/poll01.c
index b05e809ab..ca68ec9c4 100644
--- a/testcases/kernel/syscalls/poll/poll01.c
+++ b/testcases/kernel/syscalls/poll/poll01.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2015 Cyril Hrubis <chrubis@suse.cz>
  */

-/*
+/*\
  * Check that poll() works for POLLOUT and POLLIN and that revents is set
  * correctly.
  */
@@ -34,11 +34,14 @@ static void verify_pollout(void)
 		return;
 	}

-	if (outfds[0].revents != POLLOUT) {
-		tst_res(TFAIL | TTERRNO, "poll() failed to set POLLOUT");
+	if (TST_RET != 1) {
+		tst_res(TFAIL, "Unexpected poll() return value %ld in POLLOUT", TST_RET);
 		return;
 	}

+	TST_EXP_EXPR(outfds[0].revents & POLLOUT);
+	TST_EXP_EXPR((outfds[0].revents & ~POLLOUT) == 0);
+
 	tst_res(TPASS, "poll() POLLOUT");
 }

@@ -60,11 +63,20 @@ static void verify_pollin(void)
 		goto end;
 	}

-	if (infds[0].revents != POLLIN) {
-		tst_res(TFAIL, "poll() failed to set POLLIN");
+	if (TST_RET != 1) {
+		tst_res(TFAIL, "Unexpected poll() return value %ld in POLLIN", TST_RET);
 		goto end;
 	}

+	if (!(infds[0].revents & POLLIN)) {
+		tst_res(TFAIL, "infds[0].revents & POLLIN");
+		goto end;
+	}
+
+	if (!((infds[0].revents & ~POLLIN) == 0)) {
+		tst_res(TFAIL, "infds[0].revents & ~POLLIN) == 0");
+		goto end;
+	}

 	tst_res(TPASS, "poll() POLLIN");

@@ -72,7 +84,7 @@ end:
 	SAFE_READ(1, fildes[0], read_buf, sizeof(write_buf));
 }

-void verify_poll(unsigned int n)
+static void verify_poll(unsigned int n)
 {
 	switch (n) {
 	case 0:
diff --git a/testcases/kernel/syscalls/poll/poll02.c b/testcases/kernel/syscalls/poll/poll02.c
index c0665927b..47e323451 100644
--- a/testcases/kernel/syscalls/poll/poll02.c
+++ b/testcases/kernel/syscalls/poll/poll02.c
@@ -3,7 +3,7 @@
  * Copyright (C) 2015-2017 Cyril Hrubis <chrubis@suse.cz>
  */

-/*
+/*\
  * Check that poll() timeouts correctly.
  */
 #include <errno.h>
@@ -15,7 +15,7 @@

 static int fds[2];

-int sample_fn(int clk_id, long long usec)
+static int sample_fn(int clk_id, long long usec)
 {
 	unsigned int sleep_ms = usec / 1000;

--
2.43.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
