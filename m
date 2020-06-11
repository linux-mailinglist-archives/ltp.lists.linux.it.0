Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B04C51F63A9
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:34:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B4633C2DF3
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:34:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6C8223C01CE
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 10:34:29 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0D8EA2005DF
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 10:34:29 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id m1so2262568pgk.1
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kwqy2fqKK8hpncb/BUfDaGRZ+l2xwFCqqA08AZM45C0=;
 b=KJLngq6zNRz1ZTZ64/IDOVAljT68AahH718ZKhG9rOIChiotr4G2fuWYUIBR4U/9vH
 b7YrcR3jc365qIm2O8avyoFaKY4FSY1+UY2JrrhDWiz2V1aEdyCuMStAhZbA8gEmRLF5
 EUJcRH8KCCJWCB+Z3wKRPYfXA2sUIzU5t1AAM+HygoPQrh8ImKu8b4P5rp4frIUoRJz9
 ZD98gXGQ6vQCyOibhNNb2njNdnJcgZkEriOYlwVYUmVnFQTRJ7IsyOMrep6TDGOvyfe6
 dmYp9dB/FtUShXVG39KkHZNNkcB7CJFbil3dJBdHtCf6kPa4RStT7NtayMbYgFBWXtn+
 OWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kwqy2fqKK8hpncb/BUfDaGRZ+l2xwFCqqA08AZM45C0=;
 b=Yp5wjD22FEbRkxBY3LyI1FfAOFvksqczNsE85r4BEl/ymS5kDN0X7m8UUjjxFBsHOO
 bWvLYBrOji2U/qaHyCJMJAR857487AUrORilJwkBHTR3KP25slHDcrrqyxeHpeFWOefC
 J77KANcu1lGq0iGJfpXkvJyGbwKclJxOp5NHSn7VX4JxijltMZL9I1EBZ/1AK/u/XiX8
 2yd9KFkzo2CM5eDwcA4Wr4ou8e7/D94rD0SPXEWS1UdxBiPaJIXUJI6W24L5oIJA0Ovz
 Fpg4I4UgF5e5h44nSJMvWAMzPj6QFlyAsfBnT93uTLuHxk304PykQ9kBSGvr8BmAaiB8
 lbig==
X-Gm-Message-State: AOAM532pkGA66WwsKeRbYKEbYtgSQIV4Hjjf0SGgczbamn2SN2rbCxbp
 yZJoTwFzYZxtuHeeoRh0+p8UqM0goDc=
X-Google-Smtp-Source: ABdhPJwt3vOHRaYoiIcf3a0QwjPlGaudEVGnBEh8sx+iyiBcyG4KsvaiS9t4T2LT+Mit9xDKsvJDTw==
X-Received: by 2002:aa7:96e7:: with SMTP id i7mr6232235pfq.217.1591864466969; 
 Thu, 11 Jun 2020 01:34:26 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id m18sm2323705pfo.173.2020.06.11.01.34.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jun 2020 01:34:26 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 11 Jun 2020 14:04:20 +0530
Message-Id: <cc75beb4074b62e94b8ac92cba17af41b8f5fbdc.1591864369.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <0f1cc05d6d79238ed94b93417f300e9a026a2063.1591864369.git.viresh.kumar@linaro.org>
References: <0f1cc05d6d79238ed94b93417f300e9a026a2063.1591864369.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 2/2] syscalls/clock_gettime: Add test to check bug
 during successive readings
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

An issue was reported recently where a bug was found during successive
reading of 64 bit time on arm32 platforms. Add a test for that.

https://github.com/richfelker/musl-cross-make/issues/96

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2:
- Test vDSOs as well and overall improved test.

 runtest/syscalls                              |   1 +
 .../kernel/syscalls/clock_gettime/.gitignore  |   1 +
 .../kernel/syscalls/clock_gettime/Makefile    |   5 +-
 .../syscalls/clock_gettime/clock_gettime04.c  | 197 ++++++++++++++++++
 4 files changed, 203 insertions(+), 1 deletion(-)
 create mode 100644 testcases/kernel/syscalls/clock_gettime/clock_gettime04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index f9a6397560fa..d7c3cbed611a 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -96,6 +96,7 @@ clock_nanosleep04 clock_nanosleep04
 clock_gettime01 clock_gettime01
 clock_gettime02 clock_gettime02
 clock_gettime03 clock_gettime03
+clock_gettime04 clock_gettime04
 leapsec01 leapsec01
 
 clock_settime01 clock_settime01
diff --git a/testcases/kernel/syscalls/clock_gettime/.gitignore b/testcases/kernel/syscalls/clock_gettime/.gitignore
index 9d06613b6f41..304eedab68c6 100644
--- a/testcases/kernel/syscalls/clock_gettime/.gitignore
+++ b/testcases/kernel/syscalls/clock_gettime/.gitignore
@@ -1,4 +1,5 @@
 clock_gettime01
 clock_gettime02
 clock_gettime03
+clock_gettime04
 leapsec01
diff --git a/testcases/kernel/syscalls/clock_gettime/Makefile b/testcases/kernel/syscalls/clock_gettime/Makefile
index 79f671f1c597..1c1cbd7a8853 100644
--- a/testcases/kernel/syscalls/clock_gettime/Makefile
+++ b/testcases/kernel/syscalls/clock_gettime/Makefile
@@ -3,8 +3,11 @@
 
 top_srcdir		?= ../../../..
 
+LTPLIBS = ltpvdso
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS+=-lrt
+clock_gettime04: LDLIBS += -lltpvdso
 
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
\ No newline at end of file
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
new file mode 100644
index 000000000000..a70288ce0cb9
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar<viresh.kumar@linaro.org>
+ *
+ * Check time difference between successive readings and report a bug if
+ * difference found to be over 5 ms.
+ */
+
+#include "config.h"
+#include "parse_vdso.h"
+#include "tst_timer.h"
+#include "tst_safe_clocks.h"
+
+#include <sys/auxv.h>
+
+clockid_t clks[] = {
+	CLOCK_REALTIME,
+	CLOCK_REALTIME_COARSE,
+	CLOCK_MONOTONIC,
+	CLOCK_MONOTONIC_COARSE,
+	CLOCK_MONOTONIC_RAW,
+	CLOCK_BOOTTIME,
+};
+
+typedef int (*gettime_t)(clockid_t clk_id, void *ts);
+static gettime_t ptr_vdso_gettime, ptr_vdso_gettime64;
+
+static inline int _vdso_gettime(gettime_t vdso, clockid_t clk_id, void *ts)
+{
+	if (!vdso) {
+		errno = ENOSYS;
+		return -1;
+	}
+
+	return vdso(clk_id, ts);
+}
+
+static inline int vdso_gettime(clockid_t clk_id, void *ts)
+{
+	return _vdso_gettime(ptr_vdso_gettime, clk_id, ts);
+}
+
+static inline int vdso_gettime64(clockid_t clk_id, void *ts)
+{
+	return _vdso_gettime(ptr_vdso_gettime64, clk_id, ts);
+}
+
+static void find_vdso_helpers(void)
+{
+	/*
+	 * Some vDSO exports its clock_gettime() implementation with a different
+	 * name and version from other architectures, so we need to handle it as
+	 * a special case.
+	 */
+#if defined(__powerpc__) || defined(__powerpc64__)
+	const char *version = "LINUX_2.6.15";
+	const char *name = "__kernel_clock_gettime";
+#elif defined(__aarch64__)
+	const char *version = "LINUX_2.6.39";
+	const char *name = "__kernel_clock_gettime";
+#elif defined(__s390__)
+	const char *version = "LINUX_2.6.29";
+	const char *name = "__kernel_clock_gettime";
+#else
+	const char *version = "LINUX_2.6";
+	const char *name = "__vdso_clock_gettime";
+#endif
+
+	const char *version64 = "LINUX_2.6";
+	const char *name64 = "__vdso_clock_gettime64";
+
+	unsigned long sysinfo_ehdr = getauxval(AT_SYSINFO_EHDR);
+
+	if (!sysinfo_ehdr) {
+		tst_res(TINFO, "Couldn't find AT_SYSINFO_EHDR");
+		return;
+	}
+
+	vdso_init_from_sysinfo_ehdr(sysinfo_ehdr);
+
+	ptr_vdso_gettime = vdso_sym(version, name);
+	if (!ptr_vdso_gettime)
+		tst_res(TINFO, "Couldn't find vdso_gettime()");
+
+	ptr_vdso_gettime64 = vdso_sym(version64, name64);
+	if (!ptr_vdso_gettime64)
+		tst_res(TINFO, "Couldn't find vdso_gettime64()");
+}
+
+static inline int my_gettimeofday(clockid_t clk_id, void *ts)
+{
+	struct timeval tval;
+
+	if (clk_id != CLOCK_REALTIME)
+		tst_brk(TBROK, "%s: Invalid clk_id, exiting", tst_clock_name(clk_id));
+
+	if (gettimeofday(&tval, NULL) < 0)
+		tst_brk(TBROK | TERRNO, "gettimeofday() failed");
+
+	/*
+	 * The array defines the type to TST_LIBC_TIMESPEC and so we can cast
+	 * this into struct timespec.
+	 */
+	*((struct timespec *)ts) = tst_timespec_from_us(tst_timeval_to_us(tval));
+	return 0;
+}
+
+static struct test_variants {
+	int (*gettime)(clockid_t clk_id, void *ts);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+	{ .gettime = libc_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+
+#if (__NR_clock_gettime != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .gettime = vdso_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "vDSO with old kernel spec"},
+#endif
+
+#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .gettime = vdso_gettime64, .type = TST_KERN_TIMESPEC, .desc = "vDSO time64 with kernel spec"},
+#endif
+	{ .gettime = my_gettimeofday, .type = TST_LIBC_TIMESPEC, .desc = "gettimeofday"},
+};
+
+static void run(unsigned int i)
+{
+	struct tst_ts ts;
+	long long start, end = 0, diff, slack;
+	struct test_variants *tv;
+	int count = 10000, ret;
+	unsigned int j;
+
+	do {
+		for (j = 0; j < ARRAY_SIZE(variants); j++) {
+			/* Refresh time in start */
+			start = end;
+
+			tv = &variants[j];
+			ts.type = tv->type;
+
+			/* Do gettimeofday() test only for CLOCK_REALTIME */
+			if (tv->gettime == my_gettimeofday && clks[i] != CLOCK_REALTIME)
+				continue;
+
+			ret = tv->gettime(clks[i], tst_ts_get(&ts));
+			if (ret) {
+				if (errno != ENOSYS) {
+					tst_res(TFAIL | TERRNO, "%s: clock_gettime() failed (%d)",
+						tst_clock_name(clks[i]), j);
+				}
+				continue;
+			}
+
+			end = tst_ts_to_ns(ts);
+
+			/* Skip comparison on first traversal */
+			if (count == 10000 && !j)
+				continue;
+
+			/*
+			 * gettimeofday() doesn't capture time less than 1 us,
+			 * add 999 to it.
+			 */
+			if (tv->gettime == my_gettimeofday)
+				slack = 999;
+			else
+				slack = 0;
+
+			diff = end + slack - start;
+			if (diff < 0) {
+				tst_res(TFAIL, "%s: Time travelled backwards (%d): %lld ns",
+					tst_clock_name(clks[i]), j, diff);
+				return;
+			}
+
+			diff /= 1000000;
+
+			if (diff >= 5) {
+				tst_res(TFAIL, "%s: Difference between successive readings greater than 5 ms (%d): %lld",
+					tst_clock_name(clks[i]), j, diff);
+				return;
+			}
+		}
+	} while (--count);
+
+	tst_res(TPASS, "%s: Difference between successive readings is reasonable",
+		tst_clock_name(clks[i]));
+}
+
+static struct tst_test test = {
+	.test = run,
+	.setup = find_vdso_helpers,
+	.tcnt = ARRAY_SIZE(clks),
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
