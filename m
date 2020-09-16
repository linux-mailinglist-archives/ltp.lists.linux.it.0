Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C371A26C1CD
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:40:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94AD83C4EA9
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:40:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 01FC33C5E04
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:39:17 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B300B14010CF
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:39:16 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id x18so2966199pll.6
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rj4tLi3ylE5QHlYd1AL0cL2PdwhrZQ3Kft57ts8Ntxg=;
 b=F7iWR7BJG+OcMJFAM7TjzcFhsMgryhort2K+ikaDYfcDwCl6trY5pmgnlr0heZiISi
 bH1HpgXD1/8waXTEPQHIk1qUZa1PWdkVMnrWcuQfEugKgsqiJd+8f3WzSJZkGVJvJcTp
 QlmAQQB6r1mGurrfiWvSJd+74giWpwF1Fs+uSKBKxFZw0138vchHVn5ku5pobZmJRMbB
 hBk3Spx/FPVt7P62Sov4li2I11/hg+lyr5J734MlOoUBRVE8gTNKRjaj5/2PEXh/zqzk
 1WwbPO9wGdtSqiTJ43YsFsYiqUxwtifMZqXSyRGT7R2VM6mEPR91QP4Pwe6efcSyLRX6
 KaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rj4tLi3ylE5QHlYd1AL0cL2PdwhrZQ3Kft57ts8Ntxg=;
 b=iHokCXER+h8+/kcQ1qyq/GR5EH1V6QNY+w2iWvr5Rxb/UJayCBWJwaz8WTQcsaZS0m
 QEfVKqLuN5qXAWuv4mL2QCJ4RBhyp5Iq+EXv/Ye84yoa6ZYDckFZRYn2kMzOgv2D878U
 DKLyMInphekMQZbrL862SGoR+saSbMCu3b47yV7z7dXCB0dpjK8RjorVI0Zy27xMWYBL
 Xssa8aQ0/IfTxyOwFyUpTQJQJif0V7f9E9AUA074FniEzMU72PI9WFmPYKTDgL5T0LPv
 M/E/vQCIA5e8NvFuXj480J+kH1wsPcGzAd0pLhB8LGnoHHN+y5VfJ/CjKA9typmiI2Br
 k7aw==
X-Gm-Message-State: AOAM5314GdKvLRB1J7RtcbbPXsJTNyWZSqRKaUvCee5Po1aMRB3K9Qo9
 FVzBIZAHfJBd/hgUAlRNxpDYhgPJ1PGEfA==
X-Google-Smtp-Source: ABdhPJySPXBS+6iBOEidd//8G+89huiG5JUTIko6jIWRYE5V7K1g5rPsNU+6tCXHWu6k609PInCowA==
X-Received: by 2002:a17:90b:198c:: with SMTP id
 mv12mr3179898pjb.236.1600252755009; 
 Wed, 16 Sep 2020 03:39:15 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id r16sm6219520pfc.217.2020.09.16.03.39.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:39:14 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:59 +0530
Message-Id: <1df896d347798e8137769aeb56eda4296c9323f3.1600252542.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1600252542.git.viresh.kumar@linaro.org>
References: <cover.1600252542.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V2 14/17] syscalls: timer_gettime: Reuse struct
 time64_variants
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Lets reuse the common structure here.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/timer_gettime/timer_gettime01.c  | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
index 02d5b416d1a2..7ac83546224c 100644
--- a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
+++ b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
@@ -12,19 +12,16 @@
 #include <stdio.h>
 #include <errno.h>
 
+#include "time64_variants.h"
 #include "tst_timer.h"
 
-static struct test_variants {
-	int (*func)(kernel_timer_t timer, void *its);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_timer_gettime != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_timer_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .timer_gettime = sys_timer_gettime, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_timer_gettime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_timer_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .timer_gettime = sys_timer_gettime64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
@@ -50,10 +47,10 @@ static void setup(void)
 
 static void verify(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
-	struct tst_its spec = {.type = tv->type, };
+	struct time64_variants *tv = &variants[tst_variant];
+	struct tst_its spec = {.type = tv->ts_type, };
 
-	TEST(tv->func(timer, tst_its_get(&spec)));
+	TEST(tv->timer_gettime(timer, tst_its_get(&spec)));
 	if (TST_RET == 0) {
 		if (tst_its_get_interval_sec(spec) ||
 		    tst_its_get_interval_nsec(spec) ||
@@ -66,13 +63,13 @@ static void verify(void)
 		tst_res(TFAIL | TTERRNO, "timer_gettime() Failed");
 	}
 
-	TEST(tv->func((kernel_timer_t)-1, tst_its_get(&spec)));
+	TEST(tv->timer_gettime((kernel_timer_t)-1, tst_its_get(&spec)));
 	if (TST_RET == -1 && TST_ERR == EINVAL)
 		tst_res(TPASS, "timer_gettime(-1) Failed: EINVAL");
 	else
 		tst_res(TFAIL | TTERRNO, "timer_gettime(-1) = %li", TST_RET);
 
-	TEST(tv->func(timer, NULL));
+	TEST(tv->timer_gettime(timer, NULL));
 	if (TST_RET == -1 && TST_ERR == EFAULT)
 		tst_res(TPASS, "timer_gettime(NULL) Failed: EFAULT");
 	else
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
