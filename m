Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A181B36E0
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:38:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3239C3C29B3
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:38:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B76D33C6239
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:37:49 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 97E4F1A00CA6
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:37:48 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id y6so410869pjc.4
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 22:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwlOeDvuZsgTX5p2rBM7vIzn2HuHAiJiUEjAFqONVGA=;
 b=seqmJE9kxRbOcm38CKsOZoTfz/a/DkUmpETMNHTQnGCA+Ca8/sznrNi8gneQC0l0jG
 z1SyTbAFQ09tVGqhs9SRjSoL2uJLWyVS4xJp5nqn1bFH7s5hTQdcEVYIdzkFGGcts+/Z
 U0aGkFK+clNgGrbqGcgSvYSCLjMhg9iJnAU1gsV4QLJ0SCMkErBiy992hwwYJZmvP8RU
 3xkEhDh+q9Zd1gdVtGYxdy4V2zJ0NDBm7zxYixAQ1G3BdD4UmPM2+edFNR8K4Wu6BEyq
 JQ+5plmo0S7kb6RdjUIZrqFJRRmMfMGbt6+EmLbpeOmR+oPidW/zdyt/wpFoUDijSYyT
 Np9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwlOeDvuZsgTX5p2rBM7vIzn2HuHAiJiUEjAFqONVGA=;
 b=MHRzIkxwhLsVjda0uvfa+q2Bkn6hGZpUjHsJi4OuO6UtWcwVuZ0HVwIra3xhiT4KZu
 BcSreMljGfeebkF625dXpAOgZI/IiTYfRSq9fGsSv6k7M2IGjXs0cLSNN2227+zeC+AX
 LpFfKKdw4AF1De2Xkd24ddjGG0ABjU1ze8U8qGO8nQ2OQUsk4+XdJEP1BVxngJqvDAkA
 hWgFFse5EvSMU4Bwu3L4HfZjvRMwSIOe3EyoIQfs3mkn0swzRxa++pJWWGIqUGrzb+bL
 AEYIMELKQjxi8Kr3d+MrSYEkx51z5u2V5indKZitCCEbrzIFVjws1RCKd3TYllvt4hfq
 /Img==
X-Gm-Message-State: AGi0PuboiPJsvAgvnKqVUwRg5rU4uYkF2XUAp54DC8DAKyx4YPi08zu5
 RtGKWEUIveKu/9pIvf36VqPe4CNXNGs=
X-Google-Smtp-Source: APiQypL4LvG4Q+/wdQBwNsU1FshF0zgLId8Le9XFwXvqE7ua+Znu3hQftHj7l3SG64ja0Togkq+D6w==
X-Received: by 2002:a17:902:421:: with SMTP id
 30mr24122856ple.271.1587533866518; 
 Tue, 21 Apr 2020 22:37:46 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id e7sm4338855pfh.161.2020.04.21.22.37.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Apr 2020 22:37:45 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 11:07:26 +0530
Message-Id: <a2bfc8d0b1d494b46b7ca259bb211f5c904f7b65.1587533697.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1587533697.git.viresh.kumar@linaro.org>
References: <cover.1587533697.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V4 5/5] syscalls/clock_adjtime: Add support for time64
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

This adds support for time64 tests to the existing clock_adjtime()
syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/clock_adjtime/clock_adjtime.h    | 220 +++++++++++++++---
 .../syscalls/clock_adjtime/clock_adjtime01.c  | 124 ++++++----
 .../syscalls/clock_adjtime/clock_adjtime02.c  |  90 +++++--
 3 files changed, 334 insertions(+), 100 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
index d7f553a3a04b..4f65307be0ab 100644
--- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
+++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
@@ -16,43 +16,195 @@
 #include <sys/types.h>
 #include "lapi/timex.h"
 
-static int sys_clock_adjtime(clockid_t, struct timex *);
-static void timex_show(char *, struct timex);
+#ifndef __kernel_timex
+struct __kernel_timex_timeval {
+	__kernel_time64_t       tv_sec;
+	long long		tv_usec;
+};
 
-/*
- * bad pointer w/ libc causes SIGSEGV signal, call syscall directly
- */
-static int sys_clock_adjtime(clockid_t clk_id, struct timex *txc)
+struct __kernel_timex {
+	unsigned int modes;	/* mode selector */
+	int :32;            /* pad */
+	long long offset;	/* time offset (usec) */
+	long long freq;	/* frequency offset (scaled ppm) */
+	long long maxerror;/* maximum error (usec) */
+	long long esterror;/* estimated error (usec) */
+	int status;		/* clock command/status */
+	int :32;            /* pad */
+	long long constant;/* pll time constant */
+	long long precision;/* clock precision (usec) (read only) */
+	long long tolerance;/* clock frequency tolerance (ppm)
+				   * (read only)
+				   */
+	struct __kernel_timex_timeval time;	/* (read only, except for ADJ_SETOFFSET) */
+	long long tick;	/* (modified) usecs between clock ticks */
+
+	long long ppsfreq;/* pps frequency (scaled ppm) (ro) */
+	long long jitter; /* pps jitter (us) (ro) */
+	int shift;              /* interval duration (s) (shift) (ro) */
+	int :32;            /* pad */
+	long long stabil;            /* pps stability (scaled ppm) (ro) */
+	long long jitcnt; /* jitter limit exceeded (ro) */
+	long long calcnt; /* calibration intervals (ro) */
+	long long errcnt; /* calibration errors (ro) */
+	long long stbcnt; /* stability limit exceeded (ro) */
+
+	int tai;		/* TAI offset (ro) */
+
+	int  :32; int  :32; int  :32; int  :32;
+	int  :32; int  :32; int  :32; int  :32;
+	int  :32; int  :32; int  :32;
+};
+#endif
+
+enum tst_timex_type {
+	TST_LIBC_TIMEX,
+	TST_KERN_TIMEX,
+	/* Used for indicating failure test with bad address */
+	TST_KERN_TIMEX_BAD_ADDR
+};
+
+struct tst_timex {
+	enum tst_timex_type type;
+	union {
+		struct timex libc_timex;
+		struct __kernel_timex kern_timex;
+	};
+};
+
+static inline void *tst_get_timex(struct tst_timex *t)
+{
+	switch (t->type) {
+	case TST_LIBC_TIMEX:
+		return &t->libc_timex;
+	case TST_KERN_TIMEX:
+		return &t->kern_timex;
+	case TST_KERN_TIMEX_BAD_ADDR:
+		return tst_get_bad_addr(NULL);
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t->type);
+		return NULL;
+	}
+}
+
+static inline int sys_clock_adjtime(clockid_t clk_id, struct tst_timex *t)
 {
-	return tst_syscall(__NR_clock_adjtime, clk_id, txc);
+	return tst_syscall(__NR_clock_adjtime, clk_id, tst_get_timex(t));
 }
 
-static void timex_show(char *given, struct timex txc)
+static inline int sys_clock_adjtime64(clockid_t clk_id, struct tst_timex *t)
 {
-	tst_res(TINFO,  "%s\n"
-			"             mode: %d\n"
-			"           offset: %ld\n"
-			"        frequency: %ld\n"
-			"         maxerror: %ld\n"
-			"         esterror: %ld\n"
-			"           status: %d (0x%x)\n"
-			"    time_constant: %ld\n"
-			"        precision: %ld\n"
-			"        tolerance: %ld\n"
-			"             tick: %ld\n"
-			"         raw time: %d(s) %d(us)",
-			given,
-			txc.modes,
-			txc.offset,
-			txc.freq,
-			txc.maxerror,
-			txc.esterror,
-			txc.status,
-			txc.status,
-			txc.constant,
-			txc.precision,
-			txc.tolerance,
-			txc.tick,
-			(int)txc.time.tv_sec,
-			(int)txc.time.tv_usec);
+	return tst_syscall(__NR_clock_adjtime64, clk_id, tst_get_timex(t));
+}
+
+#define _timex_show(_timex, _desc)					\
+	tst_res(TINFO,  "%s\n"						\
+			"             mode: %u\n"			\
+			"           offset: "#_desc"\n"			\
+			"        frequency: "#_desc"\n"			\
+			"         maxerror: "#_desc"\n"			\
+			"         esterror: "#_desc"\n"			\
+			"           status: %d (0x%x)\n"		\
+			"    time_constant: "#_desc"\n"			\
+			"        precision: "#_desc"\n"			\
+			"        tolerance: "#_desc"\n"			\
+			"             tick: "#_desc"\n"			\
+			"         raw time: "#_desc"(s) "#_desc"(us)",	\
+			given,						\
+			_timex.modes,					\
+			_timex.offset,					\
+			_timex.freq,					\
+			_timex.maxerror,				\
+			_timex.esterror,				\
+			_timex.status,					\
+			_timex.status,					\
+			_timex.constant,				\
+			_timex.precision,				\
+			_timex.tolerance,				\
+			_timex.tick,					\
+			_timex.time.tv_sec,				\
+			_timex.time.tv_usec)
+
+static inline void timex_show(char *given, struct tst_timex *timex)
+{
+	switch (timex->type) {
+	case TST_LIBC_TIMEX:
+		_timex_show(timex->libc_timex, %ld);
+		return;
+	case TST_KERN_TIMEX:
+		_timex_show(timex->kern_timex, %lld);
+		return;
+	default:
+		tst_res(TFAIL, "Invalid type: %d", timex->type);
+	}
+}
+
+#define ADJ_MODES	0
+
+#define _select_field(_timex, _field)					\
+{									\
+	if (_field == ADJ_MODES)					\
+		return &_timex.modes;					\
+	if (_field == ADJ_OFFSET)					\
+		return &_timex.offset;					\
+	if (_field == ADJ_FREQUENCY)					\
+		return &_timex.freq;					\
+	if (_field == ADJ_MAXERROR)					\
+		return &_timex.maxerror;				\
+	if (_field == ADJ_ESTERROR)					\
+		return &_timex.esterror;				\
+	if (_field == ADJ_TIMECONST)					\
+		return &_timex.constant;				\
+	if (_field == ADJ_TICK)						\
+		return &_timex.tick;					\
+	if (_field == ADJ_STATUS)					\
+		return &_timex.status;					\
+	tst_res(TFAIL, "Invalid type: %d", timex->type);		\
+	return NULL;							\
+}
+
+static inline void *_get_field(struct tst_timex *timex, unsigned int field)
+{
+	switch (timex->type) {
+	case TST_LIBC_TIMEX:
+		_select_field(timex->libc_timex, field);
+	case TST_KERN_TIMEX:
+		_select_field(timex->kern_timex, field);
+	default:
+		tst_res(TFAIL, "Invalid type: %d", timex->type);
+		return NULL;
+	}
+}
+
+#define timex_get_set_field_type(_type_libc, _type_kern)		\
+static inline _type_kern						\
+timex_get_field_##_type_libc(struct tst_timex *timex, unsigned int field) \
+{									\
+	switch (timex->type) {						\
+	case TST_LIBC_TIMEX:						\
+		return *((_type_libc*)_get_field(timex, field));	\
+	case TST_KERN_TIMEX:						\
+		return *((_type_kern*)_get_field(timex, field));	\
+	default:							\
+		tst_res(TFAIL, "Invalid type: %d", timex->type);	\
+		return 0;						\
+	}								\
+}									\
+									\
+static inline void							\
+timex_set_field_##_type_libc(struct tst_timex *timex, unsigned int field, \
+			    _type_kern value)				\
+{									\
+	switch (timex->type) {						\
+	case TST_LIBC_TIMEX:						\
+		*((_type_libc*)_get_field(timex, field)) = value;	\
+		return;							\
+	case TST_KERN_TIMEX:						\
+		*((_type_kern*)_get_field(timex, field)) = value;	\
+		return;							\
+	default:							\
+		tst_res(TFAIL, "Invalid type: %d", timex->type);	\
+	}								\
 }
+timex_get_set_field_type(uint, uint);
+timex_get_set_field_type(long, long long);
diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
index 1262d34fa0d6..b3e74c776f2b 100644
--- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
+++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
@@ -55,15 +55,15 @@
  */
 
 #include "clock_adjtime.h"
+#include "lapi/abisize.h"
 
 static long hz;
-static struct timex saved, ttxc;
+static struct tst_timex saved, ttxc;
 static int supported;
 
 struct test_case {
 	unsigned int modes;
 	long highlimit;
-	long *ptr;
 	long delta;
 };
 
@@ -80,79 +80,103 @@ struct test_case tc[] = {
 	{
 	 .modes = ADJ_OFFSET,
 	 .highlimit = 500000,
-	 .ptr = &ttxc.offset,
 	 .delta = 10000,
 	},
 	{
 	 .modes = ADJ_FREQUENCY,
-	 .ptr = &ttxc.freq,
 	 .delta = 100,
 	},
 	{
 	 .modes = ADJ_MAXERROR,
-	 .ptr = &ttxc.maxerror,
 	 .delta = 100,
 	},
 	{
 	 .modes = ADJ_ESTERROR,
-	 .ptr = &ttxc.esterror,
 	 .delta = 100,
 	},
 	{
 	 .modes = ADJ_TIMECONST,
-	 .ptr = &ttxc.constant,
 	 .delta = 1,
 	},
 	{
 	 .modes = ADJ_TICK,
 	 .highlimit = 1100000,
-	 .ptr = &ttxc.tick,
 	 .delta = 1000,
 	},
 };
 
+static struct test_variants {
+	int (*func)(clockid_t clk_id, struct tst_timex *timex);
+	enum tst_timex_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = sys_clock_adjtime, .type = TST_LIBC_TIMEX, .desc = "syscall with libc spec"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_clock_adjtime, .type = TST_KERN_TIMEX, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_clock_adjtime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_adjtime64, .type = TST_KERN_TIMEX, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
 static void verify_clock_adjtime(unsigned int i)
 {
-	long ptroff, *ptr = NULL;
-	struct timex verify;
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_timex verify;
+	long long val;
+	int rval;
 
-	memset(&ttxc, 0, sizeof(struct timex));
-	memset(&verify, 0, sizeof(struct timex));
+	memset(&ttxc, 0, sizeof(ttxc));
+	memset(&verify, 0, sizeof(verify));
 
-	SAFE_CLOCK_ADJTIME(CLOCK_REALTIME, &ttxc);
-	timex_show("GET", ttxc);
+	ttxc.type = verify.type = tv->type;
+
+	rval = tv->func(CLOCK_REALTIME, &ttxc);
+	if (rval < 0) {
+		tst_res(TFAIL | TERRNO, "clock_adjtime() failed %i", rval);
+		return;
+	}
 
-	ttxc.modes = tc[i].modes;
+	timex_show("GET", &ttxc);
 
-	if (tc[i].ptr && tc[i].delta) {
+	timex_set_field_uint(&ttxc, ADJ_MODES, tc[i].modes);
 
-		*tc[i].ptr += tc[i].delta;
+	if (tc[i].delta) {
+		val = timex_get_field_long(&ttxc, tc[i].modes);
+		val += tc[i].delta;
 
 		/* fix limits, if existent, so no errors occur */
+		if (tc[i].highlimit && val >= tc[i].highlimit)
+			val = tc[i].highlimit;
 
-		if (tc[i].highlimit) {
-			if (*tc[i].ptr >= tc[i].highlimit)
-				*tc[i].ptr = tc[i].highlimit;
-		}
+		timex_set_field_long(&ttxc, tc[i].modes, val);
 	}
 
-	SAFE_CLOCK_ADJTIME(CLOCK_REALTIME, &ttxc);
-	timex_show("SET", ttxc);
-
-	if (tc[i].ptr) {
+	rval = tv->func(CLOCK_REALTIME, &ttxc);
+	if (rval < 0) {
+		tst_res(TFAIL | TERRNO, "clock_adjtime() failed %i", rval);
+		return;
+	}
 
-		/* adjtimex field being tested so we can verify later */
+	timex_show("SET", &ttxc);
 
-		ptroff = (long) tc[i].ptr - (long) &ttxc;
-		ptr = (void *) &verify + ptroff;
+	rval = tv->func(CLOCK_REALTIME, &verify);
+	if (rval < 0) {
+		tst_res(TFAIL | TERRNO, "clock_adjtime() failed %i", rval);
+		return;
 	}
 
-	TEST(sys_clock_adjtime(CLOCK_REALTIME, &verify));
-	timex_show("VERIFY", verify);
+	timex_show("VERIFY", &verify);
 
-	if (tc[i].ptr && *tc[i].ptr != *ptr) {
+	if (tc[i].delta &&
+	    timex_get_field_long(&ttxc, tc[i].modes) !=
+	    timex_get_field_long(&verify, tc[i].modes)) {
 		tst_res(TFAIL, "clock_adjtime(): could not set value (mode=%x)",
-				tc[i].modes);
+			tc[i].modes);
 	}
 
 	if (TST_RET < 0) {
@@ -165,14 +189,23 @@ static void verify_clock_adjtime(unsigned int i)
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	size_t i;
 	int rval;
 
-	rval = SAFE_CLOCK_ADJTIME(CLOCK_REALTIME, &saved);
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+
+	saved.type = tv->type;
+	rval = tv->func(CLOCK_REALTIME, &saved);
+	if (rval < 0) {
+		tst_res(TFAIL | TERRNO, "clock_adjtime() failed %i", rval);
+		return;
+	}
+
 	supported = 1;
 
 	if (rval != TIME_OK && rval != TIME_ERROR) {
-		timex_show("SAVE_STATUS", saved);
+		timex_show("SAVE_STATUS", &saved);
 		tst_brk(TBROK | TTERRNO, "clock has on-going leap changes, "
 				"returned: %i", rval);
 	}
@@ -188,7 +221,7 @@ static void setup(void)
 
 		/* fix usec as being test default resolution */
 
-		if (saved.modes & ADJ_NANO) {
+		if (timex_get_field_uint(&saved, ADJ_MODES) & ADJ_NANO) {
 			if (tc[i].modes == ADJ_OFFSET) {
 				tc[i].highlimit *= 1000;
 				tc[i].delta *= 1000;
@@ -199,21 +232,29 @@ static void setup(void)
 
 static void cleanup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+	unsigned int modes = ADJ_ALL;
+	int rval;
+
 	if (supported == 0)
 		return;
 
-	saved.modes = ADJ_ALL;
-
 	/* restore clock resolution based on original status flag */
 
-	if (saved.status & STA_NANO)
-		saved.modes |= ADJ_NANO;
+	if (timex_get_field_uint(&saved, ADJ_STATUS) & STA_NANO)
+		modes |= ADJ_NANO;
 	else
-		saved.modes |= ADJ_MICRO;
+		modes |= ADJ_MICRO;
+
+	timex_set_field_uint(&saved, ADJ_MODES, modes);
 
 	/* restore original clock flags */
 
-	SAFE_CLOCK_ADJTIME(CLOCK_REALTIME, &saved);
+	rval = tv->func(CLOCK_REALTIME, &saved);
+	if (rval < 0) {
+		tst_res(TFAIL | TERRNO, "clock_adjtime() failed %i", rval);
+		return;
+	}
 }
 
 static struct tst_test test = {
@@ -221,6 +262,7 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.needs_root = 1,
 	.restore_wallclock = 1,
 };
diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c
index ba8eae54f5ed..858a598eb9bb 100644
--- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c
+++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c
@@ -56,9 +56,10 @@
  */
 
 #include "clock_adjtime.h"
+#include "lapi/abisize.h"
 
 static long hz;
-static struct timex saved, ttxc;
+static struct tst_timex saved, ttxc;
 static int supported;
 
 static void cleanup(void);
@@ -68,7 +69,6 @@ struct test_case {
 	unsigned int modes;
 	long lowlimit;
 	long highlimit;
-	long *ptr;
 	long delta;
 	int exp_err;
 	int droproot;
@@ -92,7 +92,6 @@ struct test_case tc[] = {
 	 .clktype = CLOCK_REALTIME,
 	 .modes = ADJ_TICK,
 	 .lowlimit = 900000,
-	 .ptr = &ttxc.tick,
 	 .delta = 1,
 	 .exp_err = EINVAL,
 	},
@@ -100,7 +99,6 @@ struct test_case tc[] = {
 	 .clktype = CLOCK_REALTIME,
 	 .modes = ADJ_TICK,
 	 .highlimit = 1100000,
-	 .ptr = &ttxc.tick,
 	 .delta = 1,
 	 .exp_err = EINVAL,
 	},
@@ -112,19 +110,43 @@ struct test_case tc[] = {
 	},
 };
 
+static struct test_variants {
+	int (*func)(clockid_t clk_id, struct tst_timex *timex);
+	enum tst_timex_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = sys_clock_adjtime, .type = TST_LIBC_TIMEX, .desc = "syscall with libc spec"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_clock_adjtime, .type = TST_KERN_TIMEX, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_clock_adjtime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_adjtime64, .type = TST_KERN_TIMEX, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
 static void verify_clock_adjtime(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	uid_t whoami = 0;
-	struct timex *txcptr;
+	struct tst_timex *txcptr = &ttxc;
 	struct passwd *nobody;
 	static const char name[] = "nobody";
+	int rval;
 
-	txcptr = &ttxc;
+	memset(txcptr, 0, sizeof(*txcptr));
 
-	memset(txcptr, 0, sizeof(struct timex));
+	txcptr->type = tv->type;
+	rval = tv->func(CLOCK_REALTIME, txcptr);
+	if (rval < 0) {
+		tst_res(TFAIL | TERRNO, "clock_adjtime() failed %i", rval);
+		return;
+	}
 
-	SAFE_CLOCK_ADJTIME(CLOCK_REALTIME, txcptr);
-	timex_show("GET", *txcptr);
+	timex_show("GET", txcptr);
 
 	if (tc[i].droproot) {
 		nobody = SAFE_GETPWNAM(name);
@@ -132,24 +154,24 @@ static void verify_clock_adjtime(unsigned int i)
 		SAFE_SETEUID(whoami);
 	}
 
-	txcptr->modes = tc[i].modes;
-
-	if (tc[i].ptr) {
+	timex_set_field_uint(txcptr, ADJ_MODES, tc[i].modes);
 
+	if (tc[i].delta) {
 		if (tc[i].lowlimit)
-			*tc[i].ptr = tc[i].lowlimit - tc[i].delta;
+			timex_set_field_long(&ttxc, tc[i].modes, tc[i].lowlimit - tc[i].delta);
 
 		if (tc[i].highlimit)
-			*tc[i].ptr = tc[i].highlimit + tc[i].delta;
+			timex_set_field_long(&ttxc, tc[i].modes, tc[i].highlimit + tc[i].delta);
 	}
 
 	/* special case: EFAULT for bad addresses */
 	if (tc[i].exp_err == EFAULT)
-		txcptr = tst_get_bad_addr(cleanup);
+		txcptr->type = TST_KERN_TIMEX_BAD_ADDR;
+
+	TEST(tv->func(tc[i].clktype, txcptr));
 
-	TEST(sys_clock_adjtime(tc[i].clktype, txcptr));
 	if (txcptr && tc[i].exp_err != EFAULT)
-		timex_show("TEST", *txcptr);
+		timex_show("TEST", txcptr);
 
 	if (TST_RET >= 0) {
 		tst_res(TFAIL, "clock_adjtime(): passed unexpectedly (mode=%x, "
@@ -173,14 +195,23 @@ static void verify_clock_adjtime(unsigned int i)
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	size_t i;
 	int rval;
 
-	rval = SAFE_CLOCK_ADJTIME(CLOCK_REALTIME, &saved);
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+
+	saved.type = tv->type;
+	rval = tv->func(CLOCK_REALTIME, &saved);
+	if (rval < 0) {
+		tst_res(TFAIL | TERRNO, "clock_adjtime() failed %i", rval);
+		return;
+	}
+
 	supported = 1;
 
 	if (rval != TIME_OK && rval != TIME_ERROR) {
-		timex_show("SAVE_STATUS", saved);
+		timex_show("SAVE_STATUS", &saved);
 		tst_brk(TBROK | TTERRNO, "clock has on-going leap changes, "
 				"returned: %i", rval);
 	}
@@ -199,21 +230,29 @@ static void setup(void)
 
 static void cleanup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+	unsigned int modes = ADJ_ALL;
+	int rval;
+
 	if (supported == 0)
 		return;
 
-	saved.modes = ADJ_ALL;
-
 	/* restore clock resolution based on original status flag */
 
-	if (saved.status & STA_NANO)
-		saved.modes |= ADJ_NANO;
+	if (timex_get_field_uint(&saved, ADJ_STATUS) & STA_NANO)
+		modes |= ADJ_NANO;
 	else
-		saved.modes |= ADJ_MICRO;
+		modes |= ADJ_MICRO;
+
+	timex_set_field_uint(&saved, ADJ_MODES, modes);
 
 	/* restore original clock flags */
 
-	SAFE_CLOCK_ADJTIME(CLOCK_REALTIME, &saved);
+	rval = tv->func(CLOCK_REALTIME, &saved);
+	if (rval < 0) {
+		tst_res(TFAIL | TERRNO, "clock_adjtime() failed %i", rval);
+		return;
+	}
 }
 
 static struct tst_test test = {
@@ -221,6 +260,7 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.needs_root = 1,
 	.restore_wallclock = 1,
 };
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
