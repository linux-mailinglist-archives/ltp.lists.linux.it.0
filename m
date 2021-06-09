Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD43A1BEF
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:37:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 486763C8F0B
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:37:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 070F33C9074
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:36:55 +0200 (CEST)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A5361600658
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:36:54 +0200 (CEST)
Received: by mail-il1-x132.google.com with SMTP id v13so27319136ilh.13
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zzGlYxvi0cBbYn/Eytj9zE/ImTXyOZy2bIYM14wUJHM=;
 b=nNv8OXHZ9RfeiT5n7TE8PcuelYOGkyUBZ8y17/WI16DItQqlJ0yck45Y14yAi/AFfL
 GN1wLvsn981os0URh4o6u1EElxM+0/MKUer9BmY1xTIkfMnui9k4sThhkjHSlGBtiZxp
 pUKeLo3K1hF/cdCo0RfYdtMU4AEh2ThiBnwAaSddPBbc7gqXvrGygfg0itPIKOGYDb8X
 PyLS2BhXXrdZtkN3mWBku0dfWRQFpMIF+VzDEOLXhWA6HodrkULoKRuWEYLOOc0cbWZP
 xMu5XFv7X7OtDfEq0Mb9EkPlTy85+D03CIhHtOyo6ptCovHLk0bL7bxxtOMItgxNVGOP
 +m8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zzGlYxvi0cBbYn/Eytj9zE/ImTXyOZy2bIYM14wUJHM=;
 b=XRmLRIPke2q9BuTW2OyNq8UwXL29/ZEFSM+kbSskcZR8An7jBxg754s5OCDgF4fJnD
 FWp135tiqqYd7bYkn77T2XfJVJIfJDXjsM46hofHdOE8I65Fn08WY3i+KLvKWk9Egq0T
 5tfpKgu9Oay5b8RpYfNacMki/k7AKhtoYJ5htiO1A0IX/BoUWIdNSWb2HAXePeiODjD2
 4asQw9wRPrmPRRsnJxaNm2mEDjgBpqKwuZJ0NrZryemDIpbQ2OAUNDPAoPZ9P+2X8Gqj
 0mTpLskVNhtqhRPYsSo/FZavQ6YrAyh2AI2GdhjnsZLSfcGRulSbiegxtUCYngAsyU4e
 3rxg==
X-Gm-Message-State: AOAM533JuguJuVQ9bYyBbZu9pppn6s3XfJ1Xqro3ylzn1wGTCARh+BUN
 mdVbaKR4E7gn0mFJ8z+Z6g0=
X-Google-Smtp-Source: ABdhPJxcTV8NJtrU7ysBEZ+M1CN7j+Ke1yB4Te8KDFXiEgIT4PxZXnouI9ToUWEeOfwBxAnu1kArYQ==
X-Received: by 2002:a92:1901:: with SMTP id 1mr608000ilz.237.1623260213368;
 Wed, 09 Jun 2021 10:36:53 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id k12sm327817ilu.77.2021.06.09.10.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:36:52 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Jun 2021 23:05:53 +0530
Message-Id: <20210609173601.29352-2-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609173601.29352-1-vinay.m.engg@gmail.com>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 02/10] getitimer02: Skipped EFAULT tests for libc
 variant.
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
Cc: metan@ucw.cz, umesh.kalappa0@gmail.com, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Tested EFAULT cases only for "__NR_getitimer" syscall.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/getitimer/getitimer02.c   | 81 ++++++++++++++-----
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/testcases/kernel/syscalls/getitimer/getitimer02.c b/testcases/kernel/syscalls/getitimer/getitimer02.c
index c2ca8880b..1e5d90a27 100644
--- a/testcases/kernel/syscalls/getitimer/getitimer02.c
+++ b/testcases/kernel/syscalls/getitimer/getitimer02.c
@@ -14,31 +14,70 @@
 #include <errno.h>
 #include <sys/time.h>
 #include "tst_test.h"
+#include "lapi/syscalls.h"
+
+static int libc_getitimer(int which, void *curr_value)
+{
+	return getitimer(which, curr_value);
+}
+
+static int sys_getitimer(int which, void *curr_value)
+{
+	return tst_syscall(__NR_getitimer, which, curr_value);
+}
+
+static struct test_variants
+{
+	int (*getitimer)(int which, void *curr_value);
+	char *desc;
+} variants[] = {
+{ .getitimer = libc_getitimer, .desc = "libc getitimer()"},
+
+#if (__NR_getitimer != __LTP__NR_INVALID_SYSCALL)
+{ .getitimer = sys_getitimer,  .desc = "__NR_getitimer syscall"},
+#endif
+};
 
 static void verify_getitimer(void)
 {
-		/* call with a bad address */
-		TEST(getitimer(ITIMER_REAL, (struct itimerval *)-1));
-
-		if (TST_RET == 0) {
-			tst_res(TFAIL, "call failed to produce "
-				"expected error - errno = %d - %s",
-				TST_ERR, strerror(TST_ERR));
-		}
-
-		switch (TST_ERR) {
-		case EFAULT:
-			tst_res(TPASS, "expected failure - errno = %d - %s",
-				 TST_ERR, strerror(TST_ERR));
-			break;
-		default:
-			tst_res(TFAIL, "call failed to produce "
-					"expected error - errno = %d - %s",
-					TST_ERR, strerror(TST_ERR));
-		}
+	struct test_variants *tv = &variants[tst_variant];
+
+	if (tv->getitimer == libc_getitimer) {
+		tst_res(TCONF, "EFAULT skipped for libc variant");
+		return;
+	}
+
+	/* call with a bad address */
+	TEST(tv->getitimer(ITIMER_REAL, (struct itimerval *)-1));
+
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "call failed to produce "
+			"expected error - errno = %d - %s",
+			TST_ERR, strerror(TST_ERR));
+	}
+
+	switch (TST_ERR) {
+	case EFAULT:
+		tst_res(TPASS, "expected failure - errno = %d - %s",
+			 TST_ERR, strerror(TST_ERR));
+		break;
+	default:
+		tst_res(TFAIL, "call failed to produce "
+			"expected error - errno = %d - %s",
+			TST_ERR, strerror(TST_ERR));
+	}
+}
+
+static void setup(void)
+{
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
 }
 
 static struct tst_test test = {
-			.test_all = verify_getitimer,
-			.needs_root = 1,
+	.test_all = verify_getitimer,
+	.setup = setup,
+	.test_variants = ARRAY_SIZE(variants),
+	.needs_root = 1,
 };
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
