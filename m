Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 224A826C1C9
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:39:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE6833C4EB0
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:39:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 48D003C2B12
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:39:03 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CDCD71A00250
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:39:02 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id c3so2966592plz.5
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TZiGIclA2EVKeBvx43CgcG/E+bOuNe8Wx2vdmYcHmxA=;
 b=XAt9IbGA2V4jxrYRy6vtxRb7886FL2R7dht+yNmj/Kcxj95wTBIX/veZzsXPmjbmpi
 ZW7rIjey+IlirWM7JeI3rGf5JFc99TocOPJuDs+dtQQg2w15N8c+aNHCzJ0nkqt/DVC1
 EplewFd6HcNPY/B3UX9Q4yX8DXnWholC8w68xEkf6puticAxWFBYahd3g2PYCIG0PdmP
 +URvD4WiylsoyLecsf2KHNAd/sgxttUgOnTGx0rLsUDT6kQmekDXWBfQT0uCpJ9bcjvQ
 ALOAbtIiCNz9FPUFtTK8w4ZnUkD4eT13CFiWg/0nN0YW3lvdnKvDD0Hne34dvfQXVIpX
 AvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TZiGIclA2EVKeBvx43CgcG/E+bOuNe8Wx2vdmYcHmxA=;
 b=ArfsDz6yhp4PJmoMUvEWloSF51/zootPuHvPv2s5Ht4vb8gCInLPWcKBZ9UDOBzynU
 rnu4SCSNtKz4G43EudLAlJrO7zwxK4SOH8UosGRoYGQNvhOlPagYJ7YMV3YJvBPreEvY
 sO44cy578o0obPUaRwTltE+vcBrExD8hKikiwN8/WgErWmCfTqIGveHyZxjvyumKF9T6
 Nt+ssy/AufqlKiho5C6iczU/NQks6ws6HnfnwyZ1cALzbdgF/wpeEvv5qzrIpnBYnMVN
 LeMFBLtyOkRwuDAEYHieh8zEM1a3v6RWf3JFv3SkPpbw+TVM6K2HkjFA51oszlNEPHvV
 AdaA==
X-Gm-Message-State: AOAM532XWMZ6+1Cr5uiQo35jBK8TnabVyCjoVGZQ4vujmUAaQc1MHpdI
 2NEg404zCGh0pjZa5WvDgz7lqJGYXtmo9A==
X-Google-Smtp-Source: ABdhPJzm8xPnywSiolqAUv9rORipOzg6+Dz020IzfFBiRNT2/pBLSWm9jAVYLgsM4gSl31LRQnIaAA==
X-Received: by 2002:a17:902:6b41:b029:d1:e626:d12d with SMTP id
 g1-20020a1709026b41b02900d1e626d12dmr5521029plt.4.1600252740978; 
 Wed, 16 Sep 2020 03:39:00 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id bx18sm2339805pjb.6.2020.09.16.03.38.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:39:00 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:56 +0530
Message-Id: <1c29362c5877c1bccc91dd410b471693397c45c5.1600252542.git.viresh.kumar@linaro.org>
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
Subject: [LTP] [PATCH V2 11/17] syscalls: sched_rr_get_interval: Reuse
 struct time64_variants
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
 .../sched_rr_get_interval01.c                 | 21 ++++++++-----------
 .../sched_rr_get_interval02.c                 | 21 ++++++++-----------
 .../sched_rr_get_interval03.c                 | 21 ++++++++-----------
 3 files changed, 27 insertions(+), 36 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
index 0466be36bec0..9d9ddf32eec1 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -12,6 +12,7 @@
  */
 
 #include <sched.h>
+#include "time64_variants.h"
 #include "tst_timer.h"
 
 #define PROC_SCHED_RR_TIMESLICE_MS	"/proc/sys/kernel/sched_rr_timeslice_ms"
@@ -19,30 +20,26 @@ static int proc_flag;
 
 struct tst_ts tp;
 
-static struct test_variants {
-	int (*func)(pid_t pid, void *ts);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .func = libc_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+static struct time64_variants variants[] = {
+	{ .sched_rr_get_interval = libc_sched_rr_get_interval, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
 #if (__NR_sched_rr_get_interval != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .sched_rr_get_interval = sys_sched_rr_get_interval, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_sched_rr_get_interval_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_sched_rr_get_interval64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .sched_rr_get_interval = sys_sched_rr_get_interval64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct sched_param p = { 1 };
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 
-	tp.type = tv->type;
+	tp.type = tv->ts_type;
 
 	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1)
 		tst_res(TFAIL | TTERRNO, "sched_setscheduler() failed");
@@ -52,9 +49,9 @@ static void setup(void)
 
 static void run(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 
-	TEST(tv->func(0, tst_ts_get(&tp)));
+	TEST(tv->sched_rr_get_interval(0, tst_ts_get(&tp)));
 
 	if (!TST_RET) {
 		tst_res(TPASS, "sched_rr_get_interval() passed");
diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
index 5b38e5bff0d3..0e98fec5608f 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
@@ -9,34 +9,31 @@
  */
 
 #include <sched.h>
+#include "time64_variants.h"
 #include "tst_timer.h"
 
 static struct tst_ts tp;
 
-static struct test_variants {
-	int (*func)(pid_t pid, void *ts);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .func = libc_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+static struct time64_variants variants[] = {
+	{ .sched_rr_get_interval = libc_sched_rr_get_interval, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
 #if (__NR_sched_rr_get_interval != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .sched_rr_get_interval = sys_sched_rr_get_interval, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_sched_rr_get_interval_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_sched_rr_get_interval64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .sched_rr_get_interval = sys_sched_rr_get_interval64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct sched_param p = { 1 };
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 
-	tp.type = tv->type;
+	tp.type = tv->ts_type;
 
 	if ((sched_setscheduler(0, SCHED_FIFO, &p)) == -1)
 		tst_res(TFAIL | TTERRNO, "sched_setscheduler() failed");
@@ -44,12 +41,12 @@ static void setup(void)
 
 static void run(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 
 	tst_ts_set_sec(&tp, 99);
 	tst_ts_set_nsec(&tp, 99);
 
-	TEST(tv->func(0, tst_ts_get(&tp)));
+	TEST(tv->sched_rr_get_interval(0, tst_ts_get(&tp)));
 
 	if (!TST_RET && tst_ts_valid(&tp) == -1) {
 		tst_res(TPASS, "sched_rr_get_interval() passed");
diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
index d7bbe268689c..6a64ca2c6b94 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
@@ -13,6 +13,7 @@
  */
 
 #include <sched.h>
+#include "time64_variants.h"
 #include "tst_timer.h"
 
 static pid_t unused_pid;
@@ -32,31 +33,27 @@ struct test_cases_t {
 	{ &zero_pid, NULL, EFAULT}
 };
 
-static struct test_variants {
-	int (*func)(pid_t pid, void *ts);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .func = libc_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+static struct time64_variants variants[] = {
+	{ .sched_rr_get_interval = libc_sched_rr_get_interval, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
 #if (__NR_sched_rr_get_interval != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .sched_rr_get_interval = sys_sched_rr_get_interval, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_sched_rr_get_interval_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_sched_rr_get_interval64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .sched_rr_get_interval = sys_sched_rr_get_interval64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct sched_param p = { 1 };
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 
 	bad_addr = tst_get_bad_addr(NULL);
-	tp.type = tv->type;
+	tp.type = tv->ts_type;
 
 	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1)
 		tst_res(TFAIL | TTERRNO, "sched_setscheduler() failed");
@@ -66,7 +63,7 @@ static void setup(void)
 
 static void run(unsigned int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct test_cases_t *tc = &test_cases[i];
 	struct timerspec *ts;
 
@@ -75,7 +72,7 @@ static void run(unsigned int i)
 	else
 		ts = tst_ts_get(tc->tp);
 
-	TEST(tv->func(*tc->pid, ts));
+	TEST(tv->sched_rr_get_interval(*tc->pid, ts));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL, "sched_rr_get_interval() passed unexcpectedly");
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
