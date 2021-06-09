Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4043F3A1BF4
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:37:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A09613C9EA5
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:37:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 831CE3C9902
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:08 +0200 (CEST)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E52A7200989
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:07 +0200 (CEST)
Received: by mail-io1-xd33.google.com with SMTP id d9so23654730ioo.2
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 10:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DKZmBnXFnX2Fcgc8/cjZcKcoG75exuIDPHp3quFac/c=;
 b=TfaEMzKirhsj4N5n69hLogcfGnnp3HsIAipX4KI/r3ziBzO7hCW9RmAn+7bLrZ/h9h
 44H3nFeNGvg9LbLtezNuK0jUyNkfYyAiPcNo4SDZrD4oyMOV+G2KslSxHu7uuOuuf7TI
 g4FGbhuScf2SSbeEv+e7gek6ImNdS2ZmfqeKTahDOetISDgBrjzm3+hk3+ZQ36e+3208
 O1yydf3t7P5Xw/Q7NTHy7iTzwP3IFxamh0dS/CFBzCKXXyamapbIrz9My2xeegWTDEIx
 xo/W/MYNcNeefij3yWzKnOsLMVnNqddK6s8Od+KSa/ZOCSJv2CTXwVYgJNR+VId2/NYB
 tjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DKZmBnXFnX2Fcgc8/cjZcKcoG75exuIDPHp3quFac/c=;
 b=TKgwo6mXE2tvbm9WtTaIDGKuKrtM2JT3MumaZT48b61irNwRXvTB2HZXkchjlxb94h
 jrPccf7RiJDGOFezarsJXX0QTaubb3Gm3zuBxqOwgogAGZd19ykpcFRV2JOx/3xCpBTv
 DvukWL/m9t3v6mdxu7ExI5YpmdiS2KWv/MG4iMrugrXfyoIF4vkGLz0isF9uxfzyTMfQ
 revtVlymHRLoovW4UvUrDuPDr3FOjydJEhWTOglkHw2jORbtZZgrAtd8MGybbG1QYO57
 AuZJFXwGu6oW2jlFgjJExlO/R7iY/VwGHMWnxGsYp+K/aHHHfnlIQJcvWK8CLSTJoUyu
 o0aw==
X-Gm-Message-State: AOAM5324h4KN0hqXUZwe79O6Lbf+WG9YTUESEH6X8ZXoVric+49Rrkpm
 +V38lwcEbjwdOSU752Ksxd8=
X-Google-Smtp-Source: ABdhPJyILqxbwI0YXnYBFBCEjtTHpF84O8MEqpcynnErTjvRVEcWbowoNGcqNOSlLlwGcrazwkV3Sg==
X-Received: by 2002:a6b:f60e:: with SMTP id n14mr428052ioh.179.1623260226698; 
 Wed, 09 Jun 2021 10:37:06 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id k12sm327817ilu.77.2021.06.09.10.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:37:06 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Jun 2021 23:05:57 +0530
Message-Id: <20210609173601.29352-6-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609173601.29352-1-vinay.m.engg@gmail.com>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 06/10] setitimer02: Skipped EFAULT tests for libc
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

Tested EFAULT cases only for "__NR_setitimer" syscall.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/setitimer/setitimer02.c   | 41 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/setitimer/setitimer02.c b/testcases/kernel/syscalls/setitimer/setitimer02.c
index 656cf7d6a..77e01b018 100644
--- a/testcases/kernel/syscalls/setitimer/setitimer02.c
+++ b/testcases/kernel/syscalls/setitimer/setitimer02.c
@@ -16,10 +16,34 @@
 #include <sys/time.h>
 #include <stdlib.h>
 #include "tst_test.h"
+#include "lapi/syscalls.h"
+
+static int libc_setitimer(int which, void *new_value, void *old_value)
+{
+	return setitimer(which, new_value, old_value);
+}
+
+static int sys_setitimer(int which, void *new_value, void *old_value)
+{
+	return tst_syscall(__NR_setitimer, which, new_value, old_value);
+}
+
+static struct test_variants
+{
+	int (*setitimer)(int which, void *new_value, void *old_value);
+	char *desc;
+} variants[] = {
+{ .setitimer = libc_setitimer, .desc = "libc setitimer()"},
+
+#if (__NR_setitimer != __LTP__NR_INVALID_SYSCALL)
+{ .setitimer = sys_setitimer,  .desc = "__NR_setitimer syscall"},
+#endif
+};
 
 static void verify_setitimer(void)
 {
 	struct itimerval *value;
+	struct test_variants *tv = &variants[tst_variant];
 
 	/* allocate some space for a timer structure */
 	if ((value = malloc((size_t)sizeof(struct itimerval))) ==
@@ -37,8 +61,13 @@ static void verify_setitimer(void)
 	 * ITIMER_REAL = 0, ITIMER_VIRTUAL = 1 and ITIMER_PROF = 2
 	 */
 
+	if (tv->setitimer == libc_setitimer) {
+		tst_res(TCONF, "EFAULT is skipped for libc variant");
+		return;
+	}
+
 	/* call with a bad address */
-	TEST(setitimer(ITIMER_REAL, value, (struct itimerval *)-1));
+	TEST(tv->setitimer(ITIMER_REAL, value, (struct itimerval *)-1));
 
 	if (TST_RET == 0) {
 		tst_res(TFAIL, "call failed to produce EFAULT error "
@@ -64,8 +93,16 @@ static void verify_setitimer(void)
 	value = NULL;
 }
 
+static void setup(void)
+{
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+}
+
 static struct tst_test test = {
 	.test_all = verify_setitimer,
+	.setup = setup,
+	.test_variants = ARRAY_SIZE(variants),
 	.needs_root = 1,
 };
-
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
