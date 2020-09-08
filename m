Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E4B260AD0
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:21:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FA083C53CF
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:21:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7A0083C180A
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:11 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 19ACB60083F
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:11 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id c196so4618900pfc.0
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OOC4QtR8jsxOWP4rKAJVigVWFKrsqW7lijt+qmhNhCk=;
 b=ZMjYy2bvEI3P1TzmdjAH4YqtvA4Z4xI05H+PMiv+blDqH3Cs5LzGKrwC/L5cnNq/vR
 thkEsWMtLno2wrZ3wr3OsV+/5xCwqlytTmHcgSH6u7X9MjYRYptliM4EhLfM/fUoTbb1
 oY2YIRMAMQbd99tBQdsSX77WwT9QkwQT9NzyxSKjhpccrM+iMTWH+VdR3KYRrhORbbLF
 02EO507LTKGmXSj1WGPLanW031uiQCNQNNtT4t2lDFFR4ASrJA6pG/CAVPMufqrr5/W2
 a+g2QQXG5mKG6ba0CEMuhOvqs/1KEZugwvxX0aoXepDpsu5uDTqScIHC1PJ07YqbF1s9
 a4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OOC4QtR8jsxOWP4rKAJVigVWFKrsqW7lijt+qmhNhCk=;
 b=gVcZy/ZphkqRl3PIVKJznY23hO3r1fKibaIpfTWsPValvAWMi67YQ8TuPT5m1HLFK9
 OSIZO/X+a8JUZ8C2uWSuxmWDbcLTWdxios7eIcAU5fdHe4OeAJcXN2/CgwSCxLDvZRnL
 RVb/P1JWssB18yve0vgISpTglyXuCZcwNrGpLjIiPduoE4oWQasiBEmDekuTSnOXwCd3
 yXvLCWnNsHdvhTQi3uQmrveFlBYT842goob2r2C5kAAx2mW3v98xaW1EACR2IescfjsF
 ToUZNy3QIbZwi1tSpFX02eDVUY9oFypb2WWSplDXVre/rjlm5QQMSuaPtBbhgc+NXD+9
 2w1w==
X-Gm-Message-State: AOAM532lgLVv3GRg7IIFiH+zpmohrVUNB1Ivhy96AoyB5jWd+4pRUhEI
 fLBbWU9RlVTlsA0w6aRS83jfF8k+H7FgMw==
X-Google-Smtp-Source: ABdhPJwzuM0hcSryWoeN2pUO35i0aDTrUEeJWD0Exu0AdqUysiY9mTXjqno/noh+M6tk8Gwhen95LQ==
X-Received: by 2002:a17:902:266:: with SMTP id
 93mr22598372plc.108.1599546009363; 
 Mon, 07 Sep 2020 23:20:09 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id r15sm6757387pgg.17.2020.09.07.23.20.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:20:08 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:22 +0530
Message-Id: <6a0c125f148dba426c1c0483c287da0ca5b5ae93.1599545766.git.viresh.kumar@linaro.org>
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
Subject: [LTP] [PATCH 09/16] syscalls: rt_sigtimedwait: Reuse struct
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
 .../syscalls/rt_sigtimedwait/rt_sigtimedwait01.c  | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c b/testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c
index db4901a40ea1..813f75b9ed82 100644
--- a/testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c
+++ b/testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /* Copyright (c) Jiri Palecek<jpalecek@web.de>, 2009 */
 
+#include "time64_variants.h"
 #include "libsigwait.h"
 
 static int my_rt_sigtimedwait(const sigset_t * set, siginfo_t * info,
@@ -40,26 +41,22 @@ struct sigwait_test_desc tests[] = {
 	{ test_masked_matching_rt, -1},
 };
 
-static struct test_variants {
-	swi_func swi;
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_rt_sigtimedwait != __LTP__NR_INVALID_SYSCALL)
-	{ .swi = my_rt_sigtimedwait, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .sigwait = my_rt_sigtimedwait, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_rt_sigtimedwait_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .swi = my_rt_sigtimedwait_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .sigwait = my_rt_sigtimedwait_time64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static void run(unsigned int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct sigwait_test_desc *tc = &tests[i];
 
-	tc->tf(tv->swi, tc->signo, tv->type);
+	tc->tf(tv->sigwait, tc->signo, tv->ts_type);
 }
 
 static void setup(void)
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
