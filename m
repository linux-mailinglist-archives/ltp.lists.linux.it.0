Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 624391D26B4
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 07:38:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB1F23C5460
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 07:38:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7EF4E3C2462
 for <ltp@lists.linux.it>; Thu, 14 May 2020 07:38:30 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3C7A8600EB7
 for <ltp@lists.linux.it>; Thu, 14 May 2020 07:38:29 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id a5so12075170pjh.2
 for <ltp@lists.linux.it>; Wed, 13 May 2020 22:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBlaUDAp/iFYlR79wIKX44xVg+kJWtQHNw+uweuxIlA=;
 b=zG94DK3eYwXjT+dPZcbgbx5IqrTLGgPa/kwfSkx+or0AN2/3LERP6pl/IdYrHmgBV8
 cfCUGqwRRl86iYaN60Lcxr2/c/MRMP62OQGwvY9HN1rsYDAjYK+n3/B1b3rBrLTnTO/5
 ZNS00csmWeV56WIPD8xJdOpwPu9Rj7wpMKcDk1hGniM5VB0VhyAIoF4W0XEr2LcMMwyn
 J7Cr02DEHw9HPjHN7tI8AAqCurHrhCio8jZlgXfp6HuaDZCs4TKrst1oRkSMtPf8ROh+
 dokjIUdKxlNfj9S/zdx04iQz6n8XpbByGMrBbZF865/dCwaFjKnCapMyooF3uhG0lF0z
 SS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBlaUDAp/iFYlR79wIKX44xVg+kJWtQHNw+uweuxIlA=;
 b=Gnh6JLgYFPxixUkmLhsHDQSYdmnwxPYK/v/8+X3W+C5dmO20+Y20PM0z54X3zZlNLb
 DZSGJ/TgYAUqeEgyoNbHj4LrkRUcKOskPZCb9whT7FurtuR8ei4WkgZXKR51wDJss4En
 gmj/6w9u5HhhCJRwrGeTpdmR8Bh7leYYzZbvvm9eHx+fN+aRa3SjD/HLAumUifVwqeMH
 CCw+Xm6BNXDnB0eOj6CWbxKmswQ8zPL8TZaXh7h8AJpu/RGjZJMEMflp48S0aH6XVrE8
 Q33r7fkwhW1YYNHq8jk4w9WHLQ9BEkoAQ+h1mo6XFx7byhgmvLAFq6KexyACplOa1Dlv
 N5wg==
X-Gm-Message-State: AOAM531JWbfI/0xkCIuqtbc8yv7xUqSiCnBjKZSpUKs6XyQU1Y9+FG6k
 OaMYsFbITT39O9ZxSrjwpcptg+a7V80=
X-Google-Smtp-Source: ABdhPJwZ0Vo8bqM1X5KGR/IXNrz6iEXQcAPC6h9PecAe0ACSd6ZPM/c6PGNdQfa0IFCmTslh2ptlgw==
X-Received: by 2002:a17:902:c40b:: with SMTP id
 k11mr2450315plk.50.1589434706650; 
 Wed, 13 May 2020 22:38:26 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id j16sm1144266pfa.179.2020.05.13.22.38.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 22:38:25 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it,
	arnd@arndb.de
Date: Thu, 14 May 2020 11:08:19 +0530
Message-Id: <addb718d24b6a32853bfc9fc6f47833b253fc719.1589434662.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V2] syscalls: Fix issues around calling syscalls with
 old timespec
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

The non _time64 syscalls can only be called with the old timespec and
calling them with the libc timespec or the new kernel timespec is
incorrect.

Similarly, calling the libc interfaces with the old timespec is
incorrect as well and they should be called only with the libc timespec.

This patch updates various testcases that have got this issue.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2:
- Don't declare __kernel_old_time_t and again.

 .../syscalls/clock_adjtime/clock_adjtime.h    | 57 +++++++++++++++----
 .../syscalls/clock_adjtime/clock_adjtime01.c  | 11 +---
 .../syscalls/clock_adjtime/clock_adjtime02.c  | 11 +---
 .../syscalls/clock_getres/clock_getres01.c    | 17 ++----
 .../syscalls/clock_gettime/clock_gettime01.c  | 11 +---
 .../syscalls/clock_gettime/clock_gettime02.c  | 12 +---
 .../syscalls/clock_gettime/clock_gettime03.c  | 11 +---
 .../clock_nanosleep/clock_nanosleep01.c       | 11 +---
 .../clock_nanosleep/clock_nanosleep03.c       | 11 +---
 .../clock_nanosleep/clock_nanosleep04.c       | 11 +---
 .../syscalls/clock_settime/clock_settime01.c  | 11 +---
 .../syscalls/clock_settime/clock_settime02.c  | 12 +---
 12 files changed, 82 insertions(+), 104 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
index e4cf80fa8bcc..9dd6c1f349c1 100644
--- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
+++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
@@ -14,9 +14,46 @@
 #include <pwd.h>
 #include <sys/timex.h>
 #include <sys/types.h>
+#include <asm/posix_types.h>
 #include "lapi/timex.h"
 
 #ifndef __kernel_timex
+struct __kernel_old_timeval {
+	__kernel_old_time_t	tv_sec;		/* seconds */
+	__kernel_suseconds_t	tv_usec;	/* microseconds */
+};
+
+struct __kernel_old_timex {
+	unsigned int modes;	/* mode selector */
+	__kernel_long_t offset;	/* time offset (usec) */
+	__kernel_long_t freq;	/* frequency offset (scaled ppm) */
+	__kernel_long_t maxerror;/* maximum error (usec) */
+	__kernel_long_t esterror;/* estimated error (usec) */
+	int status;		/* clock command/status */
+	__kernel_long_t constant;/* pll time constant */
+	__kernel_long_t precision;/* clock precision (usec) (read only) */
+	__kernel_long_t tolerance;/* clock frequency tolerance (ppm)
+				   * (read only)
+				   */
+	struct timeval time;	/* (read only, except for ADJ_SETOFFSET) */
+	__kernel_long_t tick;	/* (modified) usecs between clock ticks */
+
+	__kernel_long_t ppsfreq;/* pps frequency (scaled ppm) (ro) */
+	__kernel_long_t jitter; /* pps jitter (us) (ro) */
+	int shift;              /* interval duration (s) (shift) (ro) */
+	__kernel_long_t stabil;            /* pps stability (scaled ppm) (ro) */
+	__kernel_long_t jitcnt; /* jitter limit exceeded (ro) */
+	__kernel_long_t calcnt; /* calibration intervals (ro) */
+	__kernel_long_t errcnt; /* calibration errors (ro) */
+	__kernel_long_t stbcnt; /* stability limit exceeded (ro) */
+
+	int tai;		/* TAI offset (ro) */
+
+	int  :32; int  :32; int  :32; int  :32;
+	int  :32; int  :32; int  :32; int  :32;
+	int  :32; int  :32; int  :32;
+};
+
 struct __kernel_timex_timeval {
 	__kernel_time64_t       tv_sec;
 	long long		tv_usec;
@@ -58,14 +95,14 @@ struct __kernel_timex {
 #endif
 
 enum tst_timex_type {
-	TST_LIBC_TIMEX,
+	TST_KERN_OLD_TIMEX,
 	TST_KERN_TIMEX
 };
 
 struct tst_timex {
 	enum tst_timex_type type;
 	union tx{
-		struct timex libc_timex;
+		struct __kernel_old_timex kern_old_timex;
 		struct __kernel_timex kern_timex;
 	} tx;
 };
@@ -73,8 +110,8 @@ struct tst_timex {
 static inline void *tst_timex_get(struct tst_timex *t)
 {
 	switch (t->type) {
-	case TST_LIBC_TIMEX:
-		return &t->tx.libc_timex;
+	case TST_KERN_OLD_TIMEX:
+		return &t->tx.kern_old_timex;
 	case TST_KERN_TIMEX:
 		return &t->tx.kern_timex;
 	default:
@@ -124,8 +161,8 @@ static inline int sys_clock_adjtime64(clockid_t clk_id, void *timex)
 static inline void timex_show(const char *mode, struct tst_timex *timex)
 {
 	switch (timex->type) {
-	case TST_LIBC_TIMEX:
-		TIMEX_SHOW(timex->tx.libc_timex, mode, "%ld");
+	case TST_KERN_OLD_TIMEX:
+		TIMEX_SHOW(timex->tx.kern_old_timex, mode, "%ld");
 		return;
 	case TST_KERN_TIMEX:
 		TIMEX_SHOW(timex->tx.kern_timex, mode, "%lld");
@@ -167,8 +204,8 @@ static inline void timex_show(const char *mode, struct tst_timex *timex)
 static inline void *timex_get_field(struct tst_timex *timex, unsigned int field)
 {
 	switch (timex->type) {
-	case TST_LIBC_TIMEX:
-		SELECT_FIELD(timex->tx.libc_timex, field);
+	case TST_KERN_OLD_TIMEX:
+		SELECT_FIELD(timex->tx.kern_old_timex, field);
 	case TST_KERN_TIMEX:
 		SELECT_FIELD(timex->tx.kern_timex, field);
 	default:
@@ -184,7 +221,7 @@ static inline type_kern							\
 timex_get_field_##type_libc(struct tst_timex *timex, unsigned int field) \
 {									\
 	switch (timex->type) {						\
-	case TST_LIBC_TIMEX:						\
+	case TST_KERN_OLD_TIMEX:						\
 		return *((type_libc*)timex_get_field(timex, field));	\
 	case TST_KERN_TIMEX:						\
 		return *((type_kern*)timex_get_field(timex, field));	\
@@ -199,7 +236,7 @@ timex_set_field_##type_libc(struct tst_timex *timex, unsigned int field, \
 			    type_kern value)				\
 {									\
 	switch (timex->type) {						\
-	case TST_LIBC_TIMEX:						\
+	case TST_KERN_OLD_TIMEX:						\
 		*((type_libc*)timex_get_field(timex, field)) = value;	\
 		return;							\
 	case TST_KERN_TIMEX:						\
diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
index 5cc46e4a670f..061b2bb228b8 100644
--- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
+++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
@@ -55,7 +55,6 @@
  */
 
 #include "clock_adjtime.h"
-#include "lapi/abisize.h"
 
 static long hz;
 static struct tst_timex saved, ttxc;
@@ -110,16 +109,12 @@ static struct test_variants {
 	enum tst_timex_type type;
 	char *desc;
 } variants[] = {
-#if defined(TST_ABI32)
-	{.clock_adjtime = sys_clock_adjtime, .type = TST_LIBC_TIMEX, .desc = "syscall with libc spec"},
-#endif
-
-#if defined(TST_ABI64)
-	{.clock_adjtime = sys_clock_adjtime, .type = TST_KERN_TIMEX, .desc = "syscall with kernel spec64"},
+#if (__NR_clock_adjtime != __LTP__NR_INVALID_SYSCALL)
+	{.clock_adjtime = sys_clock_adjtime, .type = TST_KERN_OLD_TIMEX, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_adjtime64 != __LTP__NR_INVALID_SYSCALL)
-	{.clock_adjtime = sys_clock_adjtime64, .type = TST_KERN_TIMEX, .desc = "syscall time64 with kernel spec64"},
+	{.clock_adjtime = sys_clock_adjtime64, .type = TST_KERN_TIMEX, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c
index e2b8c37f095f..8ef4dadb649e 100644
--- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c
+++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c
@@ -56,7 +56,6 @@
  */
 
 #include "clock_adjtime.h"
-#include "lapi/abisize.h"
 
 static long hz;
 static struct tst_timex saved, ttxc;
@@ -116,16 +115,12 @@ static struct test_variants {
 	enum tst_timex_type type;
 	char *desc;
 } variants[] = {
-#if defined(TST_ABI32)
-	{.clock_adjtime = sys_clock_adjtime, .type = TST_LIBC_TIMEX, .desc = "syscall with libc spec"},
-#endif
-
-#if defined(TST_ABI64)
-	{.clock_adjtime = sys_clock_adjtime, .type = TST_KERN_TIMEX, .desc = "syscall with kernel spec64"},
+#if (__NR_clock_adjtime != __LTP__NR_INVALID_SYSCALL)
+	{.clock_adjtime = sys_clock_adjtime, .type = TST_KERN_OLD_TIMEX, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_adjtime64 != __LTP__NR_INVALID_SYSCALL)
-	{.clock_adjtime = sys_clock_adjtime64, .type = TST_KERN_TIMEX, .desc = "syscall time64 with kernel spec64"},
+	{.clock_adjtime = sys_clock_adjtime64, .type = TST_KERN_TIMEX, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
diff --git a/testcases/kernel/syscalls/clock_getres/clock_getres01.c b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
index 5b83c2460f05..84a0feb34ddd 100644
--- a/testcases/kernel/syscalls/clock_getres/clock_getres01.c
+++ b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
@@ -14,7 +14,6 @@
 
 #include "tst_timer.h"
 #include "lapi/posix_clocks.h"
-#include "lapi/abisize.h"
 
 static struct test_case {
 	char *name;
@@ -43,23 +42,17 @@ static struct test_variants {
 	struct tst_ts **spec;
 	char *desc;
 } variants[] = {
-#if defined(TST_ABI32)
 	{ .func = libc_clock_getres, .type = TST_LIBC_TIMESPEC, .spec = &tspec, .desc = "vDSO or syscall with libc spec"},
 	{ .func = libc_clock_getres, .type = TST_LIBC_TIMESPEC, .spec = &nspec, .desc = "vDSO or syscall with libc spec with NULL res"},
-	{ .func = sys_clock_getres, .type = TST_LIBC_TIMESPEC, .spec = &tspec, .desc = "syscall with libc spec"},
-	{ .func = sys_clock_getres, .type = TST_LIBC_TIMESPEC, .spec = &nspec, .desc = "syscall with libc spec with NULL res"},
-	{ .func = sys_clock_getres, .type = TST_KERN_OLD_TIMESPEC, .spec = &tspec, .desc = "syscall with kernel spec32"},
-	{ .func = sys_clock_getres, .type = TST_KERN_OLD_TIMESPEC, .spec = &nspec, .desc = "syscall with kernel spec32 with NULL res"},
-#endif
 
-#if defined(TST_ABI64)
-	{ .func = sys_clock_getres, .type = TST_KERN_TIMESPEC, .spec = &tspec, .desc = "syscall with kernel spec64"},
-	{ .func = sys_clock_getres, .type = TST_KERN_TIMESPEC, .spec = &nspec, .desc = "syscall with kernel spec64 with NULL res"},
+#if (__NR_clock_getres != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_getres, .type = TST_KERN_OLD_TIMESPEC, .spec = &tspec, .desc = "syscall with old kernel spec"},
+	{ .func = sys_clock_getres, .type = TST_KERN_OLD_TIMESPEC, .spec = &nspec, .desc = "syscall with old kernel spec with NULL res"},
 #endif
 
 #if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_clock_getres64, .type = TST_KERN_TIMESPEC, .spec = &tspec, .desc = "syscall time64 with kernel spec64"},
-	{ .func = sys_clock_getres64, .type = TST_KERN_TIMESPEC, .spec = &nspec, .desc = "syscall time64 with kernel spec64 with NULL res"},
+	{ .func = sys_clock_getres64, .type = TST_KERN_TIMESPEC, .spec = &tspec, .desc = "syscall time64 with kernel spec"},
+	{ .func = sys_clock_getres64, .type = TST_KERN_TIMESPEC, .spec = &nspec, .desc = "syscall time64 with kernel spec with NULL res"},
 #endif
 };
 
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
index 5b8ae427ec0e..769ac32cd038 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
@@ -19,7 +19,6 @@
 #include "config.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
-#include "lapi/abisize.h"
 
 struct test_case {
 	clockid_t clktype;
@@ -64,18 +63,14 @@ static struct test_variants {
 	enum tst_ts_type type;
 	char *desc;
 } variants[] = {
-#if defined(TST_ABI32)
 	{ .func = libc_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
-	{ .func = sys_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
-	{ .func = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
-#endif
 
-#if defined(TST_ABI64)
-	{ .func = sys_clock_gettime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#if (__NR_clock_gettime != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+	{ .func = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
index a254289909bf..f26db7c577e3 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
@@ -21,7 +21,6 @@
 #include "config.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
-#include "lapi/abisize.h"
 
 static void *bad_addr;
 
@@ -92,17 +91,12 @@ static struct test_variants {
 	enum tst_ts_type type;
 	char *desc;
 } variants[] = {
-#if defined(TST_ABI32)
-	{ .func = sys_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
-	{ .func = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
-#endif
-
-#if defined(TST_ABI64)
-	{ .func = sys_clock_gettime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#if (__NR_clock_gettime != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+	{ .func = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
index b57df632b07c..e6b9c9c7857c 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
@@ -21,7 +21,6 @@
 #include "tst_safe_clocks.h"
 #include "tst_timer.h"
 #include "lapi/namespaces_constants.h"
-#include "lapi/abisize.h"
 
 static struct tcase {
 	int clk_id;
@@ -46,18 +45,14 @@ static struct test_variants {
 	enum tst_ts_type type;
 	char *desc;
 } variants[] = {
-#if defined(TST_ABI32)
 	{ .func = libc_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
-	{ .func = sys_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
-	{ .func = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
-#endif
 
-#if defined(TST_ABI64)
-	{ .func = sys_clock_gettime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#if (__NR_clock_gettime != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+	{ .func = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
index 3e7c90f17a30..4542995f2720 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
@@ -12,7 +12,6 @@
 #include "tst_safe_clocks.h"
 #include "tst_sig_proc.h"
 #include "tst_timer.h"
-#include "lapi/abisize.h"
 
 static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
 {
@@ -89,18 +88,14 @@ static struct test_variants {
 	enum tst_ts_type type;
 	char *desc;
 } variants[] = {
-#if defined(TST_ABI32)
 	{ .func = libc_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
-	{ .func = sys_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
-	{ .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
-#endif
 
-#if defined(TST_ABI64)
-	{ .func = sys_clock_nanosleep, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#if (__NR_clock_nanosleep != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_nanosleep_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+	{ .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
index fd9ed20ffa80..0a7ea5586327 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
@@ -19,7 +19,6 @@
 #include "tst_safe_clocks.h"
 #include "tst_timer.h"
 #include "lapi/namespaces_constants.h"
-#include "lapi/abisize.h"
 
 #define OFFSET_S 10
 #define SLEEP_US 100000
@@ -30,18 +29,14 @@ static struct test_variants {
 	enum tst_ts_type type;
 	char *desc;
 } variants[] = {
-#if defined(TST_ABI32)
 	{ .gettime = libc_clock_gettime, .func = libc_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
-	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
-	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
-#endif
 
-#if defined(TST_ABI64)
-	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#if (__NR_clock_nanosleep != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_nanosleep_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime64, .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+	{ .gettime = sys_clock_gettime64, .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c
index e3e1e29de850..1f2d3c4f83ec 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c
@@ -9,7 +9,6 @@
 #include <unistd.h>
 #include "tst_safe_clocks.h"
 #include "tst_timer.h"
-#include "lapi/abisize.h"
 
 static clockid_t tcase[] = {
 	CLOCK_MONOTONIC,
@@ -22,18 +21,14 @@ static struct test_variants {
 	enum tst_ts_type type;
 	char *desc;
 } variants[] = {
-#if defined(TST_ABI32)
 	{ .gettime = libc_clock_gettime, .func = libc_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
-	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
-	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
-#endif
 
-#if defined(TST_ABI64)
-	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#if (__NR_clock_nanosleep != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_nanosleep_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime64, .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+	{ .gettime = sys_clock_gettime64, .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime01.c b/testcases/kernel/syscalls/clock_settime/clock_settime01.c
index 8f659bd2fb2c..ba6045fc5c8f 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime01.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime01.c
@@ -16,7 +16,6 @@
 #include "config.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
-#include "lapi/abisize.h"
 
 #define DELTA_SEC 10
 #define DELTA_US (long long) (DELTA_SEC * 1000000)
@@ -30,18 +29,14 @@ static struct test_variants {
 	enum tst_ts_type type;
 	char *desc;
 } variants[] = {
-#if defined(TST_ABI32)
 	{ .gettime = libc_clock_gettime, .settime = libc_clock_settime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
-	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
-	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
-#endif
 
-#if defined(TST_ABI64)
-	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#if (__NR_clock_settime != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime64, .settime = sys_clock_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+	{ .gettime = sys_clock_gettime64, .settime = sys_clock_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime02.c b/testcases/kernel/syscalls/clock_settime/clock_settime02.c
index 256d4bd8e818..0a8245dd4889 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime02.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime02.c
@@ -11,7 +11,6 @@
 #include "config.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
-#include "lapi/abisize.h"
 
 #define DELTA_SEC 10
 #define NSEC_PER_SEC (1000000000L)
@@ -98,17 +97,12 @@ static struct test_variants {
 	enum tst_ts_type type;
 	char *desc;
 } variants[] = {
-#if defined(TST_ABI32)
-	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
-	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
-#endif
-
-#if defined(TST_ABI64)
-	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#if (__NR_clock_settime != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime64, .settime = sys_clock_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+	{ .gettime = sys_clock_gettime64, .settime = sys_clock_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
