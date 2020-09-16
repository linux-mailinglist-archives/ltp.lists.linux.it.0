Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6496B26C1C4
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:39:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D4C03C4E9D
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:39:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id AA0663C2B12
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:37 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5DAA31A002F0
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:37 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id 67so3628889pgd.12
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTZuO3BsOhQB1O/qcM7fo1qwC99mW9NdwyAfB2oTfKk=;
 b=yoBzBC5rf/fHIp5LKJ+BMzdCL34okWCnavAYnaArVDNZp04FZw6Yp2akposDjVyIF8
 e6rjeeEw9LKGVp3bnq7De9LP5VbuB1R2rVvdF9bsbREUbyVg6A3cTngN/WptC1iP4vdF
 Gf5hEfBlx7UbugF45/O3gbd4/fsZVjySyseM24StIolKdnOCGODez03ux8QwBYCZZ/29
 1rtHRZMkqeZ6xo1Wx+yG8LgGeqgMZImRQc6fxain51sUnHwskI41gFRmVQjSio2o3C2g
 Zv3E+VaUcudGON1E8R2Ahco7JFGBw/Upli2LMbGr4pGU4ANm7s53uSoUf1pNCbQQIxvd
 +8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTZuO3BsOhQB1O/qcM7fo1qwC99mW9NdwyAfB2oTfKk=;
 b=ZJ43zj2NRU3knUETMYRxDnQj1jU2JtqZL6+lyr8YMDv0G83sOWLVJWjiBfZV6OiwTF
 dTwcTkc63ERte/Jaq8Okae/3vK0aKSyJmVVHxygXeEaSdCRUVrCsI/5UKrdpnthYiP7m
 267Vds9G7OiZTRHmveXFM6keu7TUf5bQKgHhdwDsnpNzfeUCroWSfhZz9JoMZfvUTU2Y
 m1iUI7H1lUIrqrUU6zMKcM4/39v0AGQqb1k9BMLaxcttmGu0BkeksRfATiUvx5R+F93s
 tSbup/SaO427vdhmmmDHTAuomok+xGnina1IV+cGi8upWvNO6ptfepNyKFUUiiAYGkYB
 SPKA==
X-Gm-Message-State: AOAM533+3l44TQFnuAjEKBovJYQcccltQIiQNfOkfoKGCEvjY2dqgzv7
 mEhbhi76cZDjg+nvtCpJOuXhPH6NBYn2Wg==
X-Google-Smtp-Source: ABdhPJxeQ1GwboqNfk+5JpsYyQFPtnx/R/OCDcInvtjCGM3Pgw06RUoLQ26ESBfhYReEjNrHqlM+Wg==
X-Received: by 2002:aa7:9a90:0:b029:142:2501:39e7 with SMTP id
 w16-20020aa79a900000b0290142250139e7mr5840200pfi.54.1600252715588; 
 Wed, 16 Sep 2020 03:38:35 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id o23sm14052829pgm.18.2020.09.16.03.38.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:38:35 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:51 +0530
Message-Id: <3eeca673c96889284f5e051864f9fc823d58de87.1600252542.git.viresh.kumar@linaro.org>
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
Subject: [LTP] [PATCH V2 06/17] syscalls: io_pgetevents: Reuse struct
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
 .../syscalls/io_pgetevents/io_pgetevents01.c   | 16 ++++++----------
 .../syscalls/io_pgetevents/io_pgetevents02.c   | 18 +++++++-----------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
index adeca3f3cf79..2a1aad8d9f96 100644
--- a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
@@ -5,6 +5,7 @@
  * Description:
  * Basic io_pgetevents() test to receive 1 event successfully.
  */
+#include "time64_variants.h"
 #include "tst_test.h"
 #include "tst_timer.h"
 #include "lapi/io_pgetevents.h"
@@ -12,18 +13,13 @@
 #ifdef HAVE_LIBAIO
 static int fd;
 
-static struct test_variants {
-	int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
-		struct io_event *events, void *timeout, sigset_t *sigmask);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_io_pgetevents != __LTP__NR_INVALID_SYSCALL)
-	{ .io_pgetevents = sys_io_pgetevents, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .io_pgetevents = sys_io_pgetevents, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_io_pgetevents_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .io_pgetevents = sys_io_pgetevents_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .io_pgetevents = sys_io_pgetevents_time64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
@@ -40,11 +36,11 @@ static void cleanup(void)
 
 static void run(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct io_event events[1];
 	struct iocb cb, *cbs[1];
 	io_context_t ctx = 0;
-	struct tst_ts to = tst_ts_from_ns(tv->type, 10000);
+	struct tst_ts to = tst_ts_from_ns(tv->ts_type, 10000);
 	sigset_t sigmask;
 	char data[4096];
 	int ret;
diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
index 885722fcad09..28afdb4a02d7 100644
--- a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
@@ -5,6 +5,7 @@
  * Description:
  * Basic io_pgetevents() test to check various failures.
  */
+#include "time64_variants.h"
 #include "tst_test.h"
 #include "tst_timer.h"
 #include "lapi/io_pgetevents.h"
@@ -36,31 +37,26 @@ static struct tcase {
 	{"invalid sigmask", &ctx, 1, 1, events, &to, NULL, EFAULT},
 };
 
-static struct test_variants {
-	int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
-		struct io_event *events, void *timeout, sigset_t *sigmask);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_io_pgetevents != __LTP__NR_INVALID_SYSCALL)
-	{ .io_pgetevents = sys_io_pgetevents, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .io_pgetevents = sys_io_pgetevents, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_io_pgetevents_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .io_pgetevents = sys_io_pgetevents_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .io_pgetevents = sys_io_pgetevents_time64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct iocb cb, *cbs[1];
 	char data[4096];
 	int ret;
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	bad_addr = tst_get_bad_addr(NULL);
-	to = tst_ts_from_ns(tv->type, 10000);
+	to = tst_ts_from_ns(tv->ts_type, 10000);
 
 	cbs[0] = &cb;
 
@@ -93,7 +89,7 @@ static void cleanup(void)
 
 static void run(unsigned int n)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct tcase *tc = &tcases[n];
 	struct timespec *to;
 	sigset_t *sigmask;
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
