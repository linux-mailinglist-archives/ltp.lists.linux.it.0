Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 234D31CA242
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:28:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B870C3C23C2
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:28:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9086E3C6E5B
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:58 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D22FB200AD7
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:57 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id b8so273845pgi.11
 for <ltp@lists.linux.it>; Thu, 07 May 2020 21:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8ch6ZQjDXF4s0fZ7ClLUAlMUSf8LUlEYdgChDajHhg=;
 b=sPjXjzkJkeH2gnJjse5vRrq/thObTaybrNXVFfFgOdOHHSWaVFNovGZ1z9GEaarYhJ
 iwIB40jUKYhgF0EzWj0dRl4T0VVga3o6pQVGt43MrylT5VDwhsxMyI4SCLNZBkCyU/zQ
 9UI74wduE9AKlaroBht+pgigNub5LB1eYqbqXnZD/1YFRRuxk53Thevp4bbvhaskqCqs
 /qkan69E6XBVgw4Kb2dgh+qZqqMZTwB/LZIU4UHVqDhsmF6U+UNE/+zRroLm/kWpz2A+
 zEPC4dJdMCKdjmwgIf4Od5ql+SI8EyBirMh2RyS7y6NMcLqXHeh6UpGYtmaUEdTJCiGw
 P0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8ch6ZQjDXF4s0fZ7ClLUAlMUSf8LUlEYdgChDajHhg=;
 b=NFqubsJ9tOinQreMF2m5zclK+xChQbQxkPZfA2+p5tfGjvg4xwRFZo+4j6SrAXW6I0
 DTC6Iz3n5oD5XKHzYcZHetkFQ+WmD6d71GTU8mB+SEmbpEYDbbUT1Z7/vN5meQKO2uws
 QdIFeW0WzAT4CIvahwmyLlZUk4i3+3R/BFmofnWvnXQjhA4iba1rZNyrmQ1VNz70OBm0
 qL3hI7YcT4AWY32GyVG6Y9VYa2qXdHcSiQv9WVoyDFpQGuwS3fxzHDcP0uwhBOFhjgLm
 zvI2Yb7IkHlfo67rJmU/JK68O6fg3n/Q4sQ4DwNU8lLz1x1/LEh51Q4WHJPZ3PL3GNEP
 Mhdw==
X-Gm-Message-State: AGi0Pua8ZS5m4Cga6Nkb80NFfq/4eNW+kQk+2dWg+1VqgSBugoR7ljgh
 sX7PMPptC12F/6nKVhBrG/AugRgUJ44=
X-Google-Smtp-Source: APiQypKwvBAl6LnKIYBntHTTl+0fSlAmAWD5XIpKTrLb0LFyYzNj2wikkvlhNqB+4Z3y/FJv9DGNkw==
X-Received: by 2002:a65:4987:: with SMTP id r7mr549059pgs.250.1588911895964;
 Thu, 07 May 2020 21:24:55 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id 14sm364249pfj.90.2020.05.07.21.24.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:24:55 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri,  8 May 2020 09:54:02 +0530
Message-Id: <02701de2ad65c3980e3d9136d0579af24d09c32e.1588911607.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1588911607.git.viresh.kumar@linaro.org>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 17/17] syscalls/utimensat: Add support for time64
 tests
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

This adds support for time64 tests to the existing utimensat() syscall
tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../kernel/syscalls/utimensat/utimensat01.c   | 80 ++++++++++++++++---
 1 file changed, 70 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index 2a029ecb17e9..f29cfe5009eb 100644
--- a/testcases/kernel/syscalls/utimensat/utimensat01.c
+++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
@@ -15,8 +15,8 @@
 #include <fcntl.h>
 #include <string.h>
 #include <sys/stat.h>
-#include "tst_test.h"
-#include "lapi/syscalls.h"
+#include "tst_timer.h"
+#include "lapi/abisize.h"
 
 #define UTIME_NOW	((1l << 30) - 1l)
 #define UTIME_OMIT	((1l << 30) - 2l)
@@ -98,13 +98,73 @@ struct test_case {
 };
 
 static inline int sys_utimensat(int dirfd, const char *pathname,
-				const struct timespec times[2], int flags)
+				void *times, int flags)
 {
 	return tst_syscall(__NR_utimensat, dirfd, pathname, times, flags);
 }
 
+static inline int sys_utimensat_time64(int dirfd, const char *pathname,
+				       void *times, int flags)
+{
+	return tst_syscall(__NR_utimensat_time64, dirfd, pathname, times, flags);
+}
+
+static struct test_variants {
+	int (*utimensat)(int dirfd, const char *pathname, void *times,
+			 int flags);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .utimensat = sys_utimensat, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .utimensat = sys_utimensat, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .utimensat = sys_utimensat, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_utimensat_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .utimensat = sys_utimensat_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+union tst_multi {
+	struct timespec libc_ts[2];
+	struct __kernel_old_timespec kern_old_ts[2];
+	struct __kernel_timespec kern_ts[2];
+} ts;
+
+static void tst_multi_set_time(enum tst_ts_type type, long access_tv_sec,
+			long access_tv_nsec, long mod_tv_sec, long mod_tv_nsec)
+{
+	switch (type) {
+	case TST_LIBC_TIMESPEC:
+		ts.libc_ts[0].tv_sec = access_tv_sec;
+		ts.libc_ts[0].tv_nsec = access_tv_nsec;
+		ts.libc_ts[1].tv_sec = mod_tv_sec;
+		ts.libc_ts[1].tv_nsec = mod_tv_nsec;
+		break;
+	case TST_KERN_OLD_TIMESPEC:
+		ts.kern_old_ts[0].tv_sec = access_tv_sec;
+		ts.kern_old_ts[0].tv_nsec = access_tv_nsec;
+		ts.kern_old_ts[1].tv_sec = mod_tv_sec;
+		ts.kern_old_ts[1].tv_nsec = mod_tv_nsec;
+		break;
+	case TST_KERN_TIMESPEC:
+		ts.kern_ts[0].tv_sec = access_tv_sec;
+		ts.kern_ts[0].tv_nsec = access_tv_nsec;
+		ts.kern_ts[1].tv_sec = mod_tv_sec;
+		ts.kern_ts[1].tv_nsec = mod_tv_nsec;
+		break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", type);
+	}
+}
+
 static void setup(void)
 {
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 	bad_addr = tst_get_bad_addr(NULL);
 }
 
@@ -134,8 +194,8 @@ static int run_command(char *command, char *option, char *file)
 
 static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct test_case *tc = &tcase[i];
-	struct timespec ts[2];
 	void *tsp = NULL;
 	char *pathname = NULL;
 	int fd = AT_FDCWD;
@@ -151,11 +211,10 @@ static void run(unsigned int i)
 	if (tc->mytime) {
 		struct mytime *mytime = *tc->mytime;
 
-		ts[0].tv_sec = mytime->access_tv_sec;
-		ts[0].tv_nsec = mytime->access_tv_nsec;
-		ts[1].tv_sec = mytime->mod_tv_sec;
-		ts[1].tv_nsec = mytime->mod_tv_nsec;
-		tsp = ts;
+		tst_multi_set_time(tv->type, mytime->access_tv_sec,
+				   mytime->access_tv_nsec, mytime->mod_tv_sec,
+				   mytime->mod_tv_nsec);
+		tsp = &ts.libc_ts;
 	} else if (tc->exp_err == EFAULT) {
 		tsp = bad_addr;
 	}
@@ -169,7 +228,7 @@ static void run(unsigned int i)
 		pathname = bad_addr;
 	}
 
-	TEST(sys_utimensat(fd, pathname, tsp, tc->flags));
+	TEST(tv->utimensat(fd, pathname, tsp, tc->flags));
 	if (TST_RET) {
 		if (!tc->exp_err) {
 			tst_res(TFAIL | TTERRNO, "%2d: utimensat() failed", i);
@@ -199,6 +258,7 @@ static void run(unsigned int i)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tcase),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
