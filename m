Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 057EE1A0C84
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 13:07:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BF873C2D92
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 13:07:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0B56F3C2D85
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 13:07:29 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E78DD600E41
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 13:07:27 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id g32so1558105pgb.6
 for <ltp@lists.linux.it>; Tue, 07 Apr 2020 04:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tnpDV84EI3z5h084s0wBL1nzwsJK2DIl8hTr8K7YoUM=;
 b=qDWDSs9kPRunSROfCE4IkZZmGX0kGyPrH/2YavC3/FMBTXc1RGIaZs8z0G/5J380O1
 l5Zhp0qU3fkov1SbFuKiycQyQZqdXByDFTGRbw/JJ68RqBGW9PNSqEJWpaXzJFiaabzA
 mgnU1ZbdnzInvAofgWTw7nSWIjpw2w8HqahMsypM0sNWzRodYEt+LH9ChXsjIbd2sHzx
 oSTwHpZ/Ji4T1LvnsPMSVBBkkWwRe7ECXfVi5P7JYSm3VjLcEG9adqjY9kPQySABzwZ7
 cQqspS/em9qoTQDoyqfee/sG/7hT96XscN5c2MHWv7jvSRKxk/H0dZv2HAQ1yyANl41r
 PHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tnpDV84EI3z5h084s0wBL1nzwsJK2DIl8hTr8K7YoUM=;
 b=n72ZsOfalbbeUCgyjq5VQttnkcxNbt2XENfG/Y+vhrj2Hx5B+6ylyGRBu+Ds8Xk2IW
 eYFwmg/6Qt60QCr7FOFOeurmVeeb5edSe61oYFQdVHr4C4GjcwkOpf0E5WEoWPpdPOYs
 rLwLPYoLYtae1AZDclORSNMBANOtUAWXoDagxulVN1oxFbhYvHJ5Y942Ojf8W+RFS4JF
 BfrX2cBnMBKokyNTx6qbWr3VspjUIMHh12UwFfV07Sy/BH4g04mLTn4ZAwj7kOprmPAj
 0HUrtB9irlrE1Mdm4ecP5jX7/ebsnf4TGMVVtFDVKFCvI0VxGZvL/8eZ7BEJ+lbJQoEa
 D4Xw==
X-Gm-Message-State: AGi0PuYEdzGUwD4rXhyrldLj+Pp1dOfSwwIFcbl0uMsxqjw47YoKc5eo
 Nbf2vm88pd8BcM+xduZ0WXiuekEsvVA=
X-Google-Smtp-Source: APiQypKhYPUTK68037bLCA6NPFexGRamsun6BFLKSPKqNTjm8U7qIbqJXdNfPHAjLRGpp5vbqMwUDg==
X-Received: by 2002:a05:6a00:8d:: with SMTP id
 c13mr2155469pfj.68.1586257646203; 
 Tue, 07 Apr 2020 04:07:26 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id g9sm13009461pgc.46.2020.04.07.04.07.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 04:07:25 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  7 Apr 2020 16:37:18 +0530
Message-Id: <bff0fc8e8777a744d35bca86c83158efb90b0ff8.1586257574.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [RFC] syscalls/clock_gettime: Support time64 variants
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Guys,

I wanted to get some inputs/confirmations from everyone before going
full fledged on implementing time64 changes and so here is an RFC.

This extends the clock_gettime01.c tests to support time64 variants for
both 32bit and 64bit architectures.

Are there some other tests you guys want me to include ?

@Arnd: I still wasn't able to understand how can I incorporate
D_TIME_BITS thing here and so left it :(

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                           |  31 +++++
 .../syscalls/clock_gettime/clock_gettime01.c  | 115 +++++++++---------
 2 files changed, 89 insertions(+), 57 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index cdb8de7987d9..282514abac08 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -15,6 +15,37 @@
 #include <sys/time.h>
 #include <time.h>
 
+#ifndef __kernel_timespec
+typedef long __kernel_long_t;
+typedef __kernel_long_t	__kernel_old_time_t;
+
+struct __kernel_old_timespec {
+	__kernel_old_time_t	tv_sec;		/* seconds */
+	long			tv_nsec;	/* nanoseconds */
+};
+
+typedef long long __kernel_time64_t;
+
+struct __kernel_timespec {
+	__kernel_time64_t       tv_sec;                 /* seconds */
+	long long               tv_nsec;                /* nanoseconds */
+};
+#endif
+
+static inline int tst_timespec_updated_32(void *data)
+{
+	struct timespec *spec = data;
+
+	return (spec->tv_nsec != 0 || spec->tv_sec != 0) ? 1 : 0;
+}
+
+static inline int tst_timespec_updated_64(void *data)
+{
+	struct __kernel_timespec *spec = data;
+
+	return (spec->tv_nsec != 0 || spec->tv_sec != 0) ? 1 : 0;
+}
+
 static inline long long tst_timespec_to_ns(struct timespec t)
 {
 	return t.tv_sec * 1000000000 + t.tv_nsec;
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
index d365823b2f0f..e220f3648434 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
@@ -21,17 +21,13 @@
 #include "tst_safe_clocks.h"
 #include "tst_test.h"
 #include "lapi/syscalls.h"
+#include "lapi/abisize.h"
 
 struct test_case {
 	clockid_t clktype;
 	int allow_inval;
 };
 
-struct tmpfunc {
-	int (*func)(clockid_t clk_id, struct timespec *tp);
-	char *desc;
-};
-
 struct test_case tc[] = {
 	{
 	 .clktype = CLOCK_REALTIME,
@@ -63,73 +59,76 @@ struct test_case tc[] = {
 	 },
 };
 
-static int sys_clock_gettime(clockid_t clk_id, struct timespec *tp)
+struct __kernel_timespec kspec64;
+
+#ifdef TST_ABI32
+struct timespec spec32;
+struct __kernel_old_timespec kspec32;
+
+static int _clock_gettime(clockid_t clk_id, void *tp)
 {
-	return tst_syscall(__NR_clock_gettime, clk_id, tp);
+	return clock_gettime(clk_id, tp);
 }
 
-static int check_spec(struct timespec *spec)
+static int sys_clock_gettime64(clockid_t clk_id, void *tp)
 {
-	return (spec->tv_nsec != 0 || spec->tv_sec != 0) ? 1 : 0;
+	return tst_syscall(__NR_clock_gettime64, clk_id, tp);
 }
+#endif
 
-static void verify_clock_gettime(unsigned int i)
+static int sys_clock_gettime(clockid_t clk_id, void *tp)
 {
-	size_t sz;
-	struct timespec spec;
-
-	/*
-	 * check clock_gettime() syscall AND libc (or vDSO) functions
-	 */
-	struct tmpfunc tf[] = {
-		{ .func = sys_clock_gettime, .desc = "syscall"      },
-		{ .func = clock_gettime, .desc = "vDSO or syscall"  },
-	};
-
-	for (sz = 0; sz < ARRAY_SIZE(tf); sz++) {
-
-		memset(&spec, 0, sizeof(struct timespec));
-
-		TEST(tf[sz].func(tc[i].clktype, &spec));
-
-		if (TST_RET == -1) {
+	return tst_syscall(__NR_clock_gettime, clk_id, tp);
+}
 
-			/* errors: allow unsupported clock types */
+struct tmpfunc {
+	int (*func)(clockid_t clk_id, void *tp);
+	int (*check)(void *spec);
+	void *spec;
+	int spec_size;
+	char *desc;
+} variants[] = {
+#ifdef TST_ABI32
+	{ .func = _clock_gettime, .check = tst_timespec_updated_32, .spec = &spec32, .spec_size = sizeof(spec32), .desc = "vDSO or syscall (32)"},
+	{ .func = sys_clock_gettime, .check = tst_timespec_updated_32, .spec = &spec32, .spec_size = sizeof(spec32), .desc = "syscall (32) with libc spec"},
+	{ .func = sys_clock_gettime, .check = tst_timespec_updated_32, .spec = &kspec32, .spec_size = sizeof(kspec32), .desc = "syscall (32) with kernel spec"},
+	{ .func = sys_clock_gettime64, .check = tst_timespec_updated_64, .spec = &kspec64, .spec_size = sizeof(kspec64), .desc = "syscall (64) with kernel spec"},
+#else
+	{ .func = sys_clock_gettime, .check = tst_timespec_updated_64, .spec = &kspec64, .spec_size = sizeof(kspec64), .desc = "syscall (64) with kernel spec"},
+#endif
+};
 
-			if (tc[i].allow_inval && TST_ERR == EINVAL) {
+static void setup(void)
+{
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+}
 
-				tst_res(TPASS, "clock_gettime(2): unsupported "
-						"clock %s (%s) failed as "
-						"expected",
-						tst_clock_name(tc[i].clktype),
-						tf[sz].desc);
+static void verify_clock_gettime(unsigned int i)
+{
+	struct tmpfunc *tf = &variants[tst_variant];
 
-			} else {
+	memset(tf->spec, 0, tf->spec_size);
 
-				tst_res(TFAIL | TTERRNO, "clock_gettime(2): "
-						"clock %s (%s) failed "
-						"unexpectedly",
-						tst_clock_name(tc[i].clktype),
-						tf[sz].desc);
-			}
+	TEST(tf->func(tc[i].clktype, tf->spec));
 
+	if (TST_RET == -1) {
+		/* errors: allow unsupported clock types */
+		if (tc[i].allow_inval && TST_ERR == EINVAL) {
+			tst_res(TPASS, "clock_gettime(2): unsupported clock %s failed as expected",
+				tst_clock_name(tc[i].clktype));
 		} else {
+			tst_res(TFAIL | TTERRNO, "clock_gettime(2): clock %s failed unexpectedly",
+				tst_clock_name(tc[i].clktype));
+		}
 
-			/* success: also check if timespec was changed */
-
-			if (check_spec(&spec)) {
-				tst_res(TPASS, "clock_gettime(2): clock %s "
-						"(%s) passed",
-						tst_clock_name(tc[i].clktype),
-						tf[sz].desc);
-			} else {
-
-				tst_res(TFAIL, "clock_gettime(2): clock %s "
-						"(%s) passed, unchanged "
-						"timespec",
-						tst_clock_name(tc[i].clktype),
-						tf[sz].desc);
-			}
+	} else {
+		/* success: also check if timespec was changed */
+		if (tf->check(tf->spec)) {
+			tst_res(TPASS, "clock_gettime(2): clock %s passed",
+				tst_clock_name(tc[i].clktype));
+		} else {
+			tst_res(TFAIL, "clock_gettime(2): clock %s passed, unchanged timespec",
+				tst_clock_name(tc[i].clktype));
 		}
 	}
 }
@@ -137,5 +136,7 @@ static void verify_clock_gettime(unsigned int i)
 static struct tst_test test = {
 	.test = verify_clock_gettime,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
 	.needs_root = 1,
 };
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
