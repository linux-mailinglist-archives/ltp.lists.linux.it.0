Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 502D91ABE4A
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 12:42:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 532DD3C64C3
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 12:42:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 895D53C64AA
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 12:42:51 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 86FF5200CE9
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 12:42:49 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id z9so1197902pjd.2
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qPceJ5gkNFZL3qdHm2CbS5nGbbIsSxTQs3cGr+EE9u4=;
 b=lyy2ICEf0MZPnauCvz+5M3PHyk0M9mq3RC5ColvOyq0y86oTj7tY1jiDNb7Zsk11ia
 g5eXrDs5CphuAs7r4EkVhoTJtvf1388CyrpQkTNCBJuyfnNzfQbQnvbgWssuFecO93Fk
 bNXuZOciuFrHTJQYxPr2XNvodNgpZwW7zJQ1FvlwcUTEkavKiGlg5WaYmsjQuLP9dNUh
 /OlBnRZlZ6oC7vAa3ctpmBVF1+hs4vOnJqUgGFS1eD2lbivxY9Bi1HdkcobrLUgYNtGo
 fON6QCP0E7ev1WJNs+ruWpAP5mtTn/LgB+L6DRtZxftQpNIEkIttotILhltdzrhad4Wh
 h4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qPceJ5gkNFZL3qdHm2CbS5nGbbIsSxTQs3cGr+EE9u4=;
 b=Oi5Ny93/ou86juvHrzB8W6XuUSy/8KZbCIcPUivgAP271owL8RZhS3e/VpD8/X1hcw
 Bk0+74PVjAeVdTAf/UFbhzuORdASn+sgCntCJpGCnbVn9y1PxlJYzvhgPnz5Xya3v1D2
 MTZYR1mPk7SmENQQhRAmElqrJSgnlimMrUOxLK33WUXSsocRdB+wYYQkzy5P1GKVr6+b
 uss78qDP72qxz9oNmVfCqTARE8HgRQrJxS4gsuUptmBVA+xiPLX1bWUlupooL+nEtnHE
 abE3XAn2IRHhezBErWK2o/kEw4LUSjrE3Ri9tzvx5tnOqc8Zk7JRDaynuNTelNOJ7nBD
 ROeQ==
X-Gm-Message-State: AGi0PuYZ5cPg7bFht+FE4Wvi4yN7tQH1K+Eix5cbZfgFQ5GoasQ6btcw
 B5M7ozf+aV+X/65KhDnqnl17UWTETak=
X-Google-Smtp-Source: APiQypKsZPB7CmpCciDVyRHv7HRqkSvLtrZ0ddPU9PojrQUZzE4fq3qM24oYLfFshyEMvI6lO1aFQw==
X-Received: by 2002:a17:902:c111:: with SMTP id
 17mr9242144pli.334.1587033767191; 
 Thu, 16 Apr 2020 03:42:47 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id l123sm15119880pgl.13.2020.04.16.03.42.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 03:42:46 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 16 Apr 2020 16:12:30 +0530
Message-Id: <08a307591b531593bbaa5b1e8a4c841e80493937.1587033556.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1587033556.git.viresh.kumar@linaro.org>
References: <cover.1587033556.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V3 1/2] tst_timer: Add support for kernel's 64 bit
 timespec
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

The Linux kernel defined a new 64bit timespec some time back and this
patch makes necessary changes to tst_timer.h in order to prepare for
supporting changes in syscalls testcases.

A new enum is introduced to keep a list of all timespec variants we need
to support and all the timespec routines are updated to support the
listed variants.

In order to not do unnecessary changes to other syscall tests, the name
of the earlier routines are kept as is (with help of some macros that
eventually call the new helpers).

The LTP testsuite is build tested with this patch and nothing fails to
compile.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h | 508 ++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 411 insertions(+), 97 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index cdb8de7987d9..0865fce88a2b 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -14,27 +14,45 @@
 
 #include <sys/time.h>
 #include <time.h>
-
-static inline long long tst_timespec_to_ns(struct timespec t)
-{
-	return t.tv_sec * 1000000000 + t.tv_nsec;
-}
-
-/*
- * Converts timespec to microseconds.
- */
-static inline long long tst_timespec_to_us(struct timespec t)
-{
-	return t.tv_sec * 1000000 + (t.tv_nsec + 500) / 1000;
-}
-
-/*
- * Converts timespec to milliseconds.
- */
-static inline long long tst_timespec_to_ms(struct timespec t)
-{
-	return t.tv_sec * 1000 + (t.tv_nsec + 500000) / 1000000;
-}
+#include "tst_test.h"
+
+#ifndef __kernel_timespec
+
+#if defined(__x86_64__) && defined(__ILP32__)
+typedef long long __kernel_long_t;
+#else
+typedef long __kernel_long_t;
+#endif
+
+typedef __kernel_long_t	__kernel_old_time_t;
+
+struct __kernel_old_timespec {
+	__kernel_old_time_t	tv_sec;		/* seconds */
+	__kernel_old_time_t	tv_nsec;	/* nanoseconds */
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
+enum tst_timespec_type {
+	TST_LIBC_TIMESPEC,
+	TST_KERN_OLD_TIMESPEC,
+	TST_KERN_TIMESPEC
+};
+
+struct tst_timespec {
+	enum tst_timespec_type type;
+	union {
+		struct timespec libc_ts;
+		struct __kernel_old_timespec kern_old_ts;
+		struct __kernel_timespec kern_ts;
+	};
+};
 
 /*
  * Converts timeval to microseconds.
@@ -78,134 +96,427 @@ static inline struct timeval tst_us_to_timeval(long long us)
 	return ret;
 }
 
+#define TST_TIMESPEC_SINGLE_TS_TO(_name)				\
+static inline long long _name(struct timespec t)			\
+{									\
+	struct tst_timespec tst_t = {					\
+		.type = TST_LIBC_TIMESPEC,				\
+		.libc_ts = t,						\
+	};								\
+									\
+	return tst_##_name(tst_t);					\
+}
+
+static inline long long tst_tst_timespec_to_ns(struct tst_timespec t)
+{
+	switch (t.type) {
+	case TST_LIBC_TIMESPEC:
+		return t.libc_ts.tv_sec * 1000000000 + t.libc_ts.tv_nsec;
+	case TST_KERN_OLD_TIMESPEC:
+		return t.kern_old_ts.tv_sec * 1000000000 + t.kern_old_ts.tv_nsec;
+	case TST_KERN_TIMESPEC:
+		return t.kern_ts.tv_sec * 1000000000 + t.kern_ts.tv_nsec;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t.type);
+		return -1;
+	}
+}
+TST_TIMESPEC_SINGLE_TS_TO(tst_timespec_to_ns);
+
 /*
- * Converts ms to struct timespec
+ * Converts timespec to microseconds.
  */
-static inline struct timespec tst_ms_to_timespec(long long ms)
+static inline long long tst_tst_timespec_to_us(struct tst_timespec t)
 {
-	struct timespec ret;
-
-	ret.tv_sec = ms / 1000;
-	ret.tv_nsec = (ms % 1000) * 1000000;
-
-	return ret;
+	switch (t.type) {
+	case TST_LIBC_TIMESPEC:
+		return t.libc_ts.tv_sec * 1000000 + (t.libc_ts.tv_nsec + 500) / 1000;
+	case TST_KERN_OLD_TIMESPEC:
+		return t.kern_old_ts.tv_sec * 1000000 + (t.kern_old_ts.tv_nsec + 500) / 1000;
+	case TST_KERN_TIMESPEC:
+		return t.kern_ts.tv_sec * 1000000 + (t.kern_ts.tv_nsec + 500) / 1000;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t.type);
+		return -1;
+	}
 }
+TST_TIMESPEC_SINGLE_TS_TO(tst_timespec_to_us);
 
 /*
- * Converts us to struct timespec
+ * Converts timespec to milliseconds.
  */
-static inline struct timespec tst_us_to_timespec(long long us)
+static inline long long tst_tst_timespec_to_ms(struct tst_timespec t)
 {
-	struct timespec ret;
+	switch (t.type) {
+	case TST_LIBC_TIMESPEC:
+		return t.libc_ts.tv_sec * 1000 + (t.libc_ts.tv_nsec + 500000) / 1000000;
+	case TST_KERN_OLD_TIMESPEC:
+		return t.kern_old_ts.tv_sec * 1000 + (t.kern_old_ts.tv_nsec + 500000) / 1000000;
+	case TST_KERN_TIMESPEC:
+		return t.kern_ts.tv_sec * 1000 + (t.kern_ts.tv_nsec + 500000) / 1000000;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t.type);
+		return -1;
+	}
+}
+TST_TIMESPEC_SINGLE_TS_TO(tst_timespec_to_ms);
+
+#define TST_TIMESPEC_SINGLE_TO_TS(_name)					\
+static inline struct timespec _name##_timespec(long long time)		\
+{									\
+	struct tst_timespec tst_t;					\
+									\
+	tst_t = _name##_tst_timespec(TST_LIBC_TIMESPEC, time);		\
+	return tst_t.libc_ts;						\
+}
 
-	ret.tv_sec = us / 1000000;
-	ret.tv_nsec = (us % 1000000) * 1000;
+/*
+ * Converts ms to struct tst_timespec
+ */
+static inline struct tst_timespec tst_ms_to_tst_timespec(enum tst_timespec_type type, long long ms)
+{
+	struct tst_timespec ret = {.type = type};
+
+	switch (type) {
+	case TST_LIBC_TIMESPEC:
+		ret.libc_ts.tv_sec = ms / 1000;
+		ret.libc_ts.tv_nsec = (ms % 1000) * 1000000;
+		break;
+	case TST_KERN_OLD_TIMESPEC:
+		ret.kern_old_ts.tv_sec = ms / 1000;
+		ret.kern_old_ts.tv_nsec = (ms % 1000) * 1000000;
+		break;
+	case TST_KERN_TIMESPEC:
+		ret.kern_ts.tv_sec = ms / 1000;
+		ret.kern_ts.tv_nsec = (ms % 1000) * 1000000;
+		break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", type);
+	}
 
 	return ret;
 }
+TST_TIMESPEC_SINGLE_TO_TS(tst_ms_to);
 
 /*
- * Comparsions
+ * Converts us to struct tst_timespec
  */
-static inline int tst_timespec_lt(struct timespec t1, struct timespec t2)
+static inline struct tst_timespec
+tst_us_to_tst_timespec(enum tst_timespec_type type, long long us)
 {
-	if (t1.tv_sec == t2.tv_sec)
-		return t1.tv_nsec < t2.tv_nsec;
+	struct tst_timespec ret = {.type = type};
+
+	switch (type) {
+	case TST_LIBC_TIMESPEC:
+		ret.libc_ts.tv_sec = us / 1000000;
+		ret.libc_ts.tv_nsec = (us % 1000000) * 1000;
+		break;
+	case TST_KERN_OLD_TIMESPEC:
+		ret.kern_old_ts.tv_sec = us / 1000000;
+		ret.kern_old_ts.tv_nsec = (us % 1000000) * 1000;
+		break;
+	case TST_KERN_TIMESPEC:
+		ret.kern_ts.tv_sec = us / 1000000;
+		ret.kern_ts.tv_nsec = (us % 1000000) * 1000;
+		break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", type);
+	}
 
-	return t1.tv_sec < t2.tv_sec;
+	return ret;
+}
+TST_TIMESPEC_SINGLE_TO_TS(tst_us_to);
+
+#define TST_TIMESPEC_MULT_TS_TO(_name, _ret_type)			\
+static inline _ret_type _name(struct timespec t1, struct timespec t2)	\
+{									\
+	struct tst_timespec tst_t1 = {					\
+		.type = TST_LIBC_TIMESPEC,				\
+		.libc_ts = t1,						\
+	};								\
+									\
+	struct tst_timespec tst_t2 = {					\
+		.type = TST_LIBC_TIMESPEC,				\
+		.libc_ts = t2,						\
+	};								\
+									\
+	return tst_##_name(tst_t1, tst_t2);				\
 }
 
-static inline struct timespec tst_timespec_normalize(struct timespec t)
+/*
+ * Comparsions
+ */
+static inline int tst_tst_timespec_lt(struct tst_timespec t1, struct tst_timespec t2)
 {
-	if (t.tv_nsec >= 1000000000) {
-		t.tv_sec++;
-		t.tv_nsec -= 1000000000;
+	if (t1.type != t2.type)
+		tst_brk(TBROK, "Incompatible timespec type (%d:%d)", t1.type, t2.type);
+
+	switch (t1.type) {
+	case TST_LIBC_TIMESPEC:
+		if (t1.libc_ts.tv_sec == t2.libc_ts.tv_sec)
+			return t1.libc_ts.tv_nsec < t2.libc_ts.tv_nsec;
+
+		return t1.libc_ts.tv_sec < t2.libc_ts.tv_sec;
+	case TST_KERN_OLD_TIMESPEC:
+		if (t1.kern_old_ts.tv_sec == t2.kern_old_ts.tv_sec)
+			return t1.kern_old_ts.tv_nsec < t2.kern_old_ts.tv_nsec;
+
+		return t1.kern_old_ts.tv_sec < t2.kern_old_ts.tv_sec;
+		break;
+	case TST_KERN_TIMESPEC:
+		if (t1.kern_ts.tv_sec == t2.kern_ts.tv_sec)
+			return t1.kern_ts.tv_nsec < t2.kern_ts.tv_nsec;
+
+		return t1.kern_ts.tv_sec < t2.kern_ts.tv_sec;
+		break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t1.type);
+		return -1;
 	}
+}
+TST_TIMESPEC_MULT_TS_TO(tst_timespec_lt, int);
 
-	if (t.tv_nsec < 0) {
-		t.tv_sec--;
-		t.tv_nsec += 1000000000;
+static inline struct tst_timespec tst_timespec_normalize(struct tst_timespec t)
+{
+	switch (t.type) {
+	case TST_LIBC_TIMESPEC:
+		if (t.libc_ts.tv_nsec >= 1000000000) {
+			t.libc_ts.tv_sec++;
+			t.libc_ts.tv_nsec -= 1000000000;
+		}
+
+		if (t.libc_ts.tv_nsec < 0) {
+			t.libc_ts.tv_sec--;
+			t.libc_ts.tv_nsec += 1000000000;
+		}
+		break;
+	case TST_KERN_OLD_TIMESPEC:
+		if (t.kern_old_ts.tv_nsec >= 1000000000) {
+			t.kern_old_ts.tv_sec++;
+			t.kern_old_ts.tv_nsec -= 1000000000;
+		}
+
+		if (t.kern_old_ts.tv_nsec < 0) {
+			t.kern_old_ts.tv_sec--;
+			t.kern_old_ts.tv_nsec += 1000000000;
+		}
+		break;
+	case TST_KERN_TIMESPEC:
+		if (t.kern_ts.tv_nsec >= 1000000000) {
+			t.kern_ts.tv_sec++;
+			t.kern_ts.tv_nsec -= 1000000000;
+		}
+
+		if (t.kern_ts.tv_nsec < 0) {
+			t.kern_ts.tv_sec--;
+			t.kern_ts.tv_nsec += 1000000000;
+		}
+		break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t.type);
 	}
 
 	return t;
 }
 
+#define TST_TIMESPEC_SINGLE_TS_TO_TS(_name)				\
+static inline struct timespec _name(struct timespec t, long long time)	\
+{									\
+	struct tst_timespec ret, tst_t = {				\
+		.type = TST_LIBC_TIMESPEC,				\
+		.libc_ts = t,						\
+	};								\
+									\
+	ret = tst_##_name(tst_t, time);					\
+	return ret.libc_ts;						\
+}
+
 /*
  * Adds us microseconds to t.
  */
-static inline struct timespec tst_timespec_add_us(struct timespec t,
-                                                  long long us)
+static inline struct tst_timespec tst_tst_timespec_add_us(struct tst_timespec t,
+							  long long us)
 {
-	t.tv_sec += us / 1000000;
-	t.tv_nsec += (us % 1000000) * 1000;
-
+	switch (t.type) {
+	case TST_LIBC_TIMESPEC:
+		t.libc_ts.tv_sec += us / 1000000;
+		t.libc_ts.tv_nsec += (us % 1000000) * 1000;
+		break;
+	case TST_KERN_OLD_TIMESPEC:
+		t.kern_old_ts.tv_sec += us / 1000000;
+		t.kern_old_ts.tv_nsec += (us % 1000000) * 1000;
+		break;
+	case TST_KERN_TIMESPEC:
+		t.kern_ts.tv_sec += us / 1000000;
+		t.kern_ts.tv_nsec += (us % 1000000) * 1000;
+		break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t.type);
+	}
 
 	return tst_timespec_normalize(t);
 }
+TST_TIMESPEC_SINGLE_TS_TO_TS(tst_timespec_add_us);
 
 /*
- * Adds two timespec structures.
+ * Subtracts us microseconds from t.
  */
-static inline struct timespec tst_timespec_add(struct timespec t1,
-                                               struct timespec t2)
+static inline struct tst_timespec tst_tst_timespec_sub_us(struct tst_timespec t,
+							  long long us)
 {
-	struct timespec res;
-
-	res.tv_sec = t1.tv_sec + t2.tv_sec;
-	res.tv_nsec = t1.tv_nsec + t2.tv_nsec;
+	switch (t.type) {
+	case TST_LIBC_TIMESPEC:
+		t.libc_ts.tv_sec -= us / 1000000;
+		t.libc_ts.tv_nsec -= (us % 1000000) * 1000;
+		break;
+	case TST_KERN_OLD_TIMESPEC:
+		t.kern_old_ts.tv_sec -= us / 1000000;
+		t.kern_old_ts.tv_nsec -= (us % 1000000) * 1000;
+		break;
+	case TST_KERN_TIMESPEC:
+		t.kern_ts.tv_sec -= us / 1000000;
+		t.kern_ts.tv_nsec -= (us % 1000000) * 1000;
+		break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t.type);
+	}
 
-	return tst_timespec_normalize(res);
+	return tst_timespec_normalize(t);
+}
+TST_TIMESPEC_SINGLE_TS_TO_TS(tst_timespec_sub_us);
+
+#define TST_TIMESPEC_MULT_TS_TO_TS(_name)					\
+static inline struct timespec _name(struct timespec t1, struct timespec t2)	\
+{									\
+	struct tst_timespec ret, tst_t1 = {				\
+		.type = TST_LIBC_TIMESPEC,				\
+		.libc_ts = t1,						\
+	};								\
+									\
+	struct tst_timespec tst_t2 = {					\
+		.type = TST_LIBC_TIMESPEC,				\
+		.libc_ts = t2,						\
+	};								\
+									\
+	ret = tst_##_name(tst_t1, tst_t2);				\
+	return ret.libc_ts;						\
 }
 
 /*
- * Subtracts us microseconds from t.
+ * Adds two tst_timespec structures.
  */
-static inline struct timespec tst_timespec_sub_us(struct timespec t,
-                                                  long long us)
+static inline struct tst_timespec tst_tst_timespec_add(struct tst_timespec t1,
+						       struct tst_timespec t2)
 {
-	t.tv_sec -= us / 1000000;
-	t.tv_nsec -= (us % 1000000) * 1000;
+	struct tst_timespec res = {.type = t1.type};
+
+	if (t1.type != t2.type)
+		tst_brk(TBROK, "Incompatible timespec type (%d:%d)", t1.type, t2.type);
+
+	switch (t2.type) {
+	case TST_LIBC_TIMESPEC:
+		res.libc_ts.tv_sec = t1.libc_ts.tv_sec + t2.libc_ts.tv_sec;
+		res.libc_ts.tv_nsec = t1.libc_ts.tv_nsec + t2.libc_ts.tv_nsec;
+		break;
+	case TST_KERN_OLD_TIMESPEC:
+		res.kern_old_ts.tv_sec = t1.kern_old_ts.tv_sec + t2.kern_old_ts.tv_sec;
+		res.kern_old_ts.tv_nsec = t1.kern_old_ts.tv_nsec + t2.kern_old_ts.tv_nsec;
+		break;
+	case TST_KERN_TIMESPEC:
+		res.kern_ts.tv_sec = t1.kern_ts.tv_sec + t2.kern_ts.tv_sec;
+		res.kern_ts.tv_nsec = t1.kern_ts.tv_nsec + t2.kern_ts.tv_nsec;
+		break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t1.type);
+	}
 
-	return tst_timespec_normalize(t);
+	return tst_timespec_normalize(res);
 }
+TST_TIMESPEC_MULT_TS_TO_TS(tst_timespec_add);
 
 /*
- * Returns difference between two timespec structures.
+ * Returns difference between two tst_timespec structures.
  */
-static inline struct timespec tst_timespec_diff(struct timespec t1,
-                                                struct timespec t2)
+static inline struct tst_timespec tst_tst_timespec_diff(struct tst_timespec t1,
+							struct tst_timespec t2)
 {
-	struct timespec res;
-
-	res.tv_sec = t1.tv_sec - t2.tv_sec;
-
-	if (t1.tv_nsec < t2.tv_nsec) {
-		res.tv_sec--;
-		res.tv_nsec = 1000000000 - (t2.tv_nsec - t1.tv_nsec);
-	} else {
-		res.tv_nsec = t1.tv_nsec - t2.tv_nsec;
+	struct tst_timespec res = {.type = t1.type};
+
+	if (t1.type != t2.type)
+		tst_brk(TBROK, "Incompatible timespec type (%d:%d)", t1.type, t2.type);
+
+	switch (t1.type) {
+	case TST_LIBC_TIMESPEC:
+		res.libc_ts.tv_sec = t1.libc_ts.tv_sec - t2.libc_ts.tv_sec;
+
+		if (t1.libc_ts.tv_nsec < t2.libc_ts.tv_nsec) {
+			res.libc_ts.tv_sec--;
+			res.libc_ts.tv_nsec = 1000000000 - (t2.libc_ts.tv_nsec - t1.libc_ts.tv_nsec);
+		} else {
+			res.libc_ts.tv_nsec = t1.libc_ts.tv_nsec - t2.libc_ts.tv_nsec;
+		}
+		break;
+	case TST_KERN_OLD_TIMESPEC:
+		res.kern_old_ts.tv_sec = t1.kern_old_ts.tv_sec - t2.kern_old_ts.tv_sec;
+
+		if (t1.kern_old_ts.tv_nsec < t2.kern_old_ts.tv_nsec) {
+			res.kern_old_ts.tv_sec--;
+			res.kern_old_ts.tv_nsec = 1000000000 - (t2.kern_old_ts.tv_nsec - t1.kern_old_ts.tv_nsec);
+		} else {
+			res.kern_old_ts.tv_nsec = t1.kern_old_ts.tv_nsec - t2.kern_old_ts.tv_nsec;
+		}
+		break;
+	case TST_KERN_TIMESPEC:
+		res.kern_ts.tv_sec = t1.kern_ts.tv_sec - t2.kern_ts.tv_sec;
+
+		if (t1.kern_ts.tv_nsec < t2.kern_ts.tv_nsec) {
+			res.kern_ts.tv_sec--;
+			res.kern_ts.tv_nsec = 1000000000 - (t2.kern_ts.tv_nsec - t1.kern_ts.tv_nsec);
+		} else {
+			res.kern_ts.tv_nsec = t1.kern_ts.tv_nsec - t2.kern_ts.tv_nsec;
+		}
+		break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t1.type);
 	}
 
 	return res;
 }
+TST_TIMESPEC_MULT_TS_TO_TS(tst_timespec_diff);
 
-static inline long long tst_timespec_diff_ns(struct timespec t1,
-					     struct timespec t2)
+static inline long long tst_tst_timespec_diff_ns(struct tst_timespec t1,
+					     struct tst_timespec t2)
 {
-	return t1.tv_nsec - t2.tv_nsec + 1000000000LL * (t1.tv_sec - t2.tv_sec);
+	if (t1.type != t2.type)
+		tst_brk(TBROK, "Incompatible timespec type (%d:%d)", t1.type, t2.type);
+
+	switch (t1.type) {
+	case TST_LIBC_TIMESPEC:
+		return t1.libc_ts.tv_nsec - t2.libc_ts.tv_nsec + 1000000000LL * (t1.libc_ts.tv_sec - t2.libc_ts.tv_sec);
+	case TST_KERN_OLD_TIMESPEC:
+		return t1.kern_old_ts.tv_nsec - t2.kern_old_ts.tv_nsec + 1000000000LL * (t1.kern_old_ts.tv_sec - t2.kern_old_ts.tv_sec);
+	case TST_KERN_TIMESPEC:
+		return t1.kern_ts.tv_nsec - t2.kern_ts.tv_nsec + 1000000000LL * (t1.kern_ts.tv_sec - t2.kern_ts.tv_sec);
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t1.type);
+		return -1;
+	}
 }
+TST_TIMESPEC_MULT_TS_TO(tst_timespec_diff_ns, long long);
 
-static inline long long tst_timespec_diff_us(struct timespec t1,
-                                             struct timespec t2)
+static inline long long tst_tst_timespec_diff_us(struct tst_timespec t1,
+                                             struct tst_timespec t2)
 {
-	return tst_timespec_to_us(tst_timespec_diff(t1, t2));
+	return tst_tst_timespec_to_us(tst_tst_timespec_diff(t1, t2));
 }
+TST_TIMESPEC_MULT_TS_TO(tst_timespec_diff_us, long long);
 
-static inline long long tst_timespec_diff_ms(struct timespec t1,
-                                             struct timespec t2)
+static inline long long tst_tst_timespec_diff_ms(struct tst_timespec t1,
+                                             struct tst_timespec t2)
 {
-	return tst_timespec_to_ms(tst_timespec_diff(t1, t2));
+	return tst_tst_timespec_to_ms(tst_tst_timespec_diff(t1, t2));
 }
+TST_TIMESPEC_MULT_TS_TO(tst_timespec_diff_ms, long long);
 
 /*
  * Returns difference between two timeval structures.
@@ -242,26 +553,29 @@ static inline long long tst_timeval_diff_ms(struct timeval t1,
 /*
  * Returns absolute value of difference between two timespec structures.
  */
-static inline struct timespec tst_timespec_abs_diff(struct timespec t1,
-                                                    struct timespec t2)
+static inline struct tst_timespec
+tst_tst_timespec_abs_diff(struct tst_timespec t1, struct tst_timespec t2)
 {
-	if (tst_timespec_lt(t1, t2))
-		return tst_timespec_diff(t2, t1);
+	if (tst_tst_timespec_lt(t1, t2))
+		return tst_tst_timespec_diff(t2, t1);
 	else
-		return tst_timespec_diff(t1, t2);
+		return tst_tst_timespec_diff(t1, t2);
 }
+TST_TIMESPEC_MULT_TS_TO_TS(tst_timespec_abs_diff);
 
-static inline long long tst_timespec_abs_diff_us(struct timespec t1,
-                                                 struct timespec t2)
+static inline long long tst_tst_timespec_abs_diff_us(struct tst_timespec t1,
+						     struct tst_timespec t2)
 {
-       return tst_timespec_to_us(tst_timespec_abs_diff(t1, t2));
+	return tst_tst_timespec_to_us(tst_tst_timespec_abs_diff(t1, t2));
 }
+TST_TIMESPEC_MULT_TS_TO(tst_timespec_abs_diff_us, long long);
 
-static inline long long tst_timespec_abs_diff_ms(struct timespec t1,
-                                                 struct timespec t2)
+static inline long long tst_tst_timespec_abs_diff_ms(struct tst_timespec t1,
+						     struct tst_timespec t2)
 {
-       return tst_timespec_to_ms(tst_timespec_abs_diff(t1, t2));
+	return tst_tst_timespec_to_ms(tst_tst_timespec_abs_diff(t1, t2));
 }
+TST_TIMESPEC_MULT_TS_TO(tst_timespec_abs_diff_ms, long long);
 
 /*
  * Exits the test with TCONF if particular timer is not supported. This is
-- 
2.7.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
