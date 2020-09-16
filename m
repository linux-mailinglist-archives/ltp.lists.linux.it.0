Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4826C1C8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:39:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DB043C2F32
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:39:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 063913C2B33
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:55 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B1EC41A006A9
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:54 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id 67so3629244pgd.12
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OOC4QtR8jsxOWP4rKAJVigVWFKrsqW7lijt+qmhNhCk=;
 b=sS2GulCEQ36IOVLrw/IVsM7Lv3aH5DU4lxgyuVINie6/txwwJ9vM9o24X4OyzBJg9k
 IGaeGEiWHw9BcdLsC1l3k/Rxkl/z1lwPapsFCGUPvKwEdAQniwEyPXzHel7g8Ifw6Ct1
 hVgJlhd4a9piVklXGIfJE0ucc0Py7Hj/oHWD4h8f4FYXbE5jni0J8NKEcGm0U4ov6uWM
 fphoANm5UywzlpVfMmj0gmlmAX+G6ifbLgPPw54JCZY2IZcrblUKMfec7KaglthiaJvT
 IoZSs11DGeKjuJ58nQrZsXDFNT3JeiLD/HDX4KrTAxcBRvCQYQb8wCocMMvDIqBExk84
 ylPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OOC4QtR8jsxOWP4rKAJVigVWFKrsqW7lijt+qmhNhCk=;
 b=ijQ1AbzVcTbFLbw9XhcdIoQduqmtZsjDWlf7pPiueqrNkd/z44RCGw6TrHsZ/ENzEl
 shWOcmipxKmYPi6HHY0NFJIUKu9IeAeUfZGqzPDXp+UuYKRGxhoLYDMaAUVwTmdM7GMw
 FCKJ+ps+7BjiJaxHRsy1bj/HyiAqDvPgnKvEYwPBtKR0sW6vMSfAQZV0QLH4RRpA9P9F
 O3kQY9ZQ85e4acemJYN8S2q8ASFsYEjMCrw5YiSSTVPW7YdMvCxmjaDkB628Y3jXMMCZ
 AcrUATG51L8dhqVYSd9zsmmPfVYhs6T3g9Z0a/D8aZgwz8cwAyuigtmYLEXPTmDVUPy0
 Slnw==
X-Gm-Message-State: AOAM531FW2b6j8+aKR9p4fNmSzlCDbHoSLmfxc4ok+3un8tJ5Q8tMTqR
 Qv3Zwcn1L1AE1bFs9n42Hfb7fDKssNA84A==
X-Google-Smtp-Source: ABdhPJykSbjAhzVovNLbK/VhH1VZeaHvdJRu8dNkufUgyse+A+isPPQ/62PKhfDhqo81muGkLUhoOg==
X-Received: by 2002:aa7:9ab0:0:b029:13c:1611:66bb with SMTP id
 x16-20020aa79ab00000b029013c161166bbmr21753188pfi.6.1600252732999; 
 Wed, 16 Sep 2020 03:38:52 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id k5sm16100552pfu.77.2020.09.16.03.38.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:38:52 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:55 +0530
Message-Id: <016bd26b87099af073ace4815cf3d625e9b9b3e8.1600252542.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1600252542.git.viresh.kumar@linaro.org>
References: <cover.1600252542.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2 10/17] syscalls: rt_sigtimedwait: Reuse struct
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
