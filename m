Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E0C260ACD
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:20:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2B4C3C2C41
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:20:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 021953C53E9
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:03 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6F4E71400E16
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:03 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id o16so7739445pjr.2
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=71AENkj/E/iV/t7TV6AvE+8wXh46GuhOdWXHvUtHSSw=;
 b=iuDZu5zN8OKeRBDYjk90aAxWbS5uW4TgAvLtYZr73fyhlwy+P156IpEK1h/BrrjzUm
 1AmFyB8O0y7qza6hSuyV5YKpc9WRNZofEx4wCTmc+/MUDWs/JMRmfn64yiTl9IdDAYrT
 UDX6aSUC3tCUvL9FY5rx4ZR0kCrbH8JPoQrVBrCAdmK5zjUK/lss2HLmk7Q/jUyeZvDy
 HuT1GDOHdesRes4kLg02BZ+nDcIno+OaQBIXNUvon3UKbYHhyUf1Dfg2kqYey10m7tPD
 PMY2r8UhrHzYV+LoRDVllSE4Yz9ect2sVZ7ILCA8S1agA/d5EnEqQI0whgpwPXN9bPIb
 OJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=71AENkj/E/iV/t7TV6AvE+8wXh46GuhOdWXHvUtHSSw=;
 b=moEFyOKpbqI3NQc7qhso36i/D6c5N4HgxjiWtMfrsIBLBmF2XMRrqVMpP9wwDRdhsK
 G8VkP3yASDkwusSe3tFZhoLCCbKI0453mRZl9y4+hhzVX++A8yumNpJvpPyYOGsxOOB1
 PbUllWZj4C4jMhpqs7ZCtbAT/2xD2AKPNI5PiCRT5WnwJubNN89lKZN45LIO6x+lD5BI
 KvCATlP+sy8R+R3cidC7Wy69QFoGE5NeGBDhyItLfSkLX2KTYPfmTLep8cVTCBJdpH+2
 rnQ6RQuyiHs+B1DW46GCQkzsHRH5OVv9v+QisLUSkkF1qkisIxp5ctCArdnzSJBHDDB0
 IdUg==
X-Gm-Message-State: AOAM533xaoQpPXb0426RZQu42yDFj1eRm6+TCeNAHVplEyV8NfVdteo5
 N1hcpUfy9IY8NLnNhJ0K1FPSticOLwvCUw==
X-Google-Smtp-Source: ABdhPJxNW73InNMfCIcbGVBPY3Aq7TxKJSxncr6SzVDzakLE25o0TsVXEepVF1jCD7S9r9pilBDL2w==
X-Received: by 2002:a17:90a:77c7:: with SMTP id
 e7mr2546616pjs.175.1599546001506; 
 Mon, 07 Sep 2020 23:20:01 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id i1sm13699922pgq.41.2020.09.07.23.20.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:20:01 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:19 +0530
Message-Id: <429ca6f4c2496df28f236ad1366505a9519e68c9.1599545766.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1599545766.git.viresh.kumar@linaro.org>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 06/16] syscalls: semop: Reuse struct time64_variants
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
 testcases/kernel/syscalls/ipc/semop/semop.h   | 18 +++++++-----------
 testcases/kernel/syscalls/ipc/semop/semop01.c |  6 +++---
 testcases/kernel/syscalls/ipc/semop/semop02.c |  6 +++---
 testcases/kernel/syscalls/ipc/semop/semop03.c |  6 +++---
 4 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semop/semop.h b/testcases/kernel/syscalls/ipc/semop/semop.h
index 1fac31818108..73ab9fbbc15c 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop.h
+++ b/testcases/kernel/syscalls/ipc/semop/semop.h
@@ -4,6 +4,7 @@
 #define SEMOP_VAR__
 
 #include <sys/sem.h>
+#include "time64_variants.h"
 #include "tst_timer.h"
 
 static inline int sys_semtimedop(int semid, struct sembuf *sops, size_t nsops,
@@ -18,24 +19,19 @@ static inline int sys_semtimedop_time64(int semid, struct sembuf *sops,
 	return tst_syscall(__NR_semtimedop_time64, semid, sops, nsops, timeout);
 }
 
-struct test_variants {
-	int (*semop)(int semid, struct sembuf *sops, size_t nsops);
-	int (*semtimedop)(int semid, struct sembuf *sops, size_t nsops, void *timeout);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: syscall"},
+static struct time64_variants variants[] = {
+	{ .semop = semop, .ts_type = TST_LIBC_TIMESPEC, .desc = "semop: syscall"},
 
 #if (__NR_semtimedop != __LTP__NR_INVALID_SYSCALL)
-	{ .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with old kernel spec"},
+	{ .semtimedop = sys_semtimedop, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with old kernel spec"},
 #endif
 
 #if (__NR_semtimedop_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .semtimedop = sys_semtimedop_time64, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall time64 with kernel spec"},
+	{ .semtimedop = sys_semtimedop_time64, .ts_type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall time64 with kernel spec"},
 #endif
 };
 
-static inline int call_semop(struct test_variants *tv, int semid,
+static inline int call_semop(struct time64_variants *tv, int semid,
 		struct sembuf *sops, size_t nsops, void *timeout)
 {
 	if (tv->semop)
@@ -44,7 +40,7 @@ static inline int call_semop(struct test_variants *tv, int semid,
 	return tv->semtimedop(semid, sops, nsops, timeout);
 }
 
-static inline void semop_supported_by_kernel(struct test_variants *tv)
+static inline void semop_supported_by_kernel(struct time64_variants *tv)
 {
        /* Check if the syscall is implemented on the platform */
        TEST(call_semop(tv, 0, NULL, 0, NULL));
diff --git a/testcases/kernel/syscalls/ipc/semop/semop01.c b/testcases/kernel/syscalls/ipc/semop/semop01.c
index add9d07f3ad4..b20eef45cf59 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop01.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop01.c
@@ -33,7 +33,7 @@ static struct test_case_t {
 
 static void run(unsigned int n)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	union semun arr = { .val = 0 };
 	int fail = 0;
 	int i;
@@ -66,13 +66,13 @@ static void run(unsigned int n)
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	int i;
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	semop_supported_by_kernel(tv);
 
-	timeout.type = tv->type;
+	timeout.type = tv->ts_type;
 	tst_ts_set_sec(&timeout, 0);
 	tst_ts_set_nsec(&timeout, 10000);
 
diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
index 9d799e6437cd..2c3ec2c66686 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
@@ -69,7 +69,7 @@ static struct test_case_t {
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct passwd *ltpuser;
 	key_t semkey;
 	union semun arr;
@@ -79,7 +79,7 @@ static void setup(void)
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	semop_supported_by_kernel(tv);
 
-	timeout.type = tv->type;
+	timeout.type = tv->ts_type;
 	tst_ts_set_sec(&timeout, 0);
 	tst_ts_set_nsec(&timeout, 10000);
 
@@ -110,7 +110,7 @@ static void setup(void)
 
 static void run(unsigned int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	union semun arr = {.val = tc[i].arr_val};
 	struct sembuf buf = {
 		.sem_op = *tc[i].sem_op,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c b/testcases/kernel/syscalls/ipc/semop/semop03.c
index 43d22a8ee1a7..89603f19d651 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop03.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop03.c
@@ -36,7 +36,7 @@ struct test_case_t {
 
 static void do_child(int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct sembuf s_buf = {
 		.sem_op = tc[i].op,
 		.sem_flg = tc[i].flg,
@@ -65,12 +65,12 @@ static void sighandler(int sig)
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	semop_supported_by_kernel(tv);
 
-	timeout.type = tv->type;
+	timeout.type = tv->ts_type;
 	tst_ts_set_sec(&timeout, 0);
 	tst_ts_set_nsec(&timeout, 10000000);
 
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
