Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25471260AD5
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:21:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E11A53C53C4
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:21:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1FA463C2C41
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:22 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 87F7460083F
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:22 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id c142so10084601pfb.7
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rj4tLi3ylE5QHlYd1AL0cL2PdwhrZQ3Kft57ts8Ntxg=;
 b=iu2Da5OE53HovMzWVosYNa/0c3xZfpv64YhiQHZ7EZzc3Y6V9apkwQV4g42LNdsie9
 ZR9f3SGak3QMdTScvNrJ8g2HyoAQxQ4wOWywoubcXL6/Q/0cvrCviHM1MkmWMSXTc1Rk
 Bjt3hUMCs77dTuSxDv1JWspmuUTwHjNt8QYVK3QPidYVRQNeQZQnfCFiV7ukeTlbL0xH
 RcOtdaqHdX6bQVIJFU0LsL7iMjQecwMvaPhNjDz2sqCQHd3DkK9cnXyumWSWWT2asfP0
 Exfu17J97/CWW1B96cp0YhcqUg3FycMNqm0HYb/Lax/52NOUVD/lVOl1ar96qvn3zZ3L
 dIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rj4tLi3ylE5QHlYd1AL0cL2PdwhrZQ3Kft57ts8Ntxg=;
 b=dqzAvhfj+nSN49g8oXgHhiuXPTT7n+uGRGlNcPbaQbUaLClfOoyGBXSv5TIg/bS8mc
 gCfBgJlQrEp/5zB+wMW+1jk9RMaUeFv+GPtMODaCDBjFTf2a36DXuPXEklrzCak6soFP
 r5h8nDxv08eupMGbfglrgqGjlRV/MIC60BqDRgUPp73+W0zywhGSrJZj/kYUVm0bg0+J
 ySBSvGqjbp6JSSYvyL0IP9f5L9m3ZBlPfLICB+PVo9xUpt2iAVrXnalarBLeEyVHlQme
 eaxsZYIzel1N8plhg1SeF2ouUW2RU2n0YzSf8IxUmxi6APHhJ/cDiCuskIJp2CeFWaO/
 SpVA==
X-Gm-Message-State: AOAM531Yo02ROqk7GBYXh9lZdxSm23xuwALTncTmcM2vCgnLkkHhw//h
 /YryuGeH0Ge3iVrAD3ELFOMQwLw/Guz//A==
X-Google-Smtp-Source: ABdhPJw4cl0Q5MxWNpq5Q5eyfhel/eMcgNO5MO8RP8oeWq2t5lS8915S5JzsRTCdSyuk2mTOthmFbA==
X-Received: by 2002:a62:e108:: with SMTP id q8mr6039744pfh.214.1599546020774; 
 Mon, 07 Sep 2020 23:20:20 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 190sm17599366pfy.22.2020.09.07.23.20.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:20:20 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:26 +0530
Message-Id: <af2446739a820f76a71b8c0c99f0c4dedb77dcbc.1599545766.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1599545766.git.viresh.kumar@linaro.org>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 13/16] syscalls: timer_gettime: Reuse struct
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
