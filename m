Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5535E1F74EB
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 09:58:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2033E3C2DC7
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 09:58:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3DE973C22D8
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 09:58:48 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DBA26600486
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 09:58:03 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id ne5so3331789pjb.5
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H0545Z+RYN4U4f6G4XO80e+h9YeY77/qeE7f0ep0s9o=;
 b=vun5hvI+iGr2cXvY1mHURKBBRZNgy7P1AIH1qe9kuWHmI3Mxj1n8BONbtUaoPwzx44
 mf59sHUook71YwNRV73RW2XJXpqihM3zwo3lO6lhbrKDkrcplAPPYYWZS3N6aAbQ79ng
 SPbkdatyH4axdLJWh5uKG3WHbpIw4uhcLWof90Q9JiMhUrMBX/tvE93xaUHZVoPkprhL
 YI4nFNV+buQ6/o+WcG1fa/bMPKZgMc8RbOPZAbt9MotqQgYUYNY663jYG6ZnMhLECxfk
 VIbIhZkSa/PYdXVm3DqXs8/PiKwkl9uz3Y7eFR9DVJIYaowGivay33hlYDR6KtCG3RPO
 lVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H0545Z+RYN4U4f6G4XO80e+h9YeY77/qeE7f0ep0s9o=;
 b=e1piM3kJ/2uLoequgud/75aEVcO4EaUw/GOvH9I0+mkXYxRE6BCdIcxFO+i7vVuPQW
 LlcTnTtOWz1e0y4mxAp2DUaQXNyMkgsk1+JP+Q9lws9fyZ2zk0BSrZb1d/K1Ow0IQcVV
 wBPlLJvaCkwWkbN4tuBXjDP/zsyb2ZRPNBJbMknY9D1LY5zCUV2KfEtCbf5OX3sEQwnb
 di2gQglacP91FM86TD1KfB8qd07OOk0smIWJRDGbi1s7+jhKfiaT5KRfwqodlhhiJ5Pg
 rmAIGza1xoNkoUNmdi5WtESTuLWhwOOXhUx8cFBmlNMwMvHpB+DLKfA2O6VVUfEPttwh
 iQGw==
X-Gm-Message-State: AOAM530dd5z8ESf8Z+EVYrQ+Ghd3x+jmUPlCebO2IqAgDwpWj7rQh79Y
 KgTvnfCGyVN7XMb+Aju2JV0zPea/cc0=
X-Google-Smtp-Source: ABdhPJwlmYJeiPVX/xr/Cpw4FE3Wxu+r2u5Lxp+qobgLAihCaqDL8X3V+/6ISzaTAsbbrVgW3h8mUg==
X-Received: by 2002:a17:90a:326d:: with SMTP id
 k100mr12431607pjb.191.1591948725286; 
 Fri, 12 Jun 2020 00:58:45 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id c12sm4654195pgt.91.2020.06.12.00.58.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 00:58:44 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 12 Jun 2020 13:28:40 +0530
Message-Id: <0fb91044431a04c2787bfa121a7e5f969664fc8b.1591948595.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cc75beb4074b62e94b8ac92cba17af41b8f5fbdc.1591864369.git.viresh.kumar@linaro.org>
References: <cc75beb4074b62e94b8ac92cba17af41b8f5fbdc.1591864369.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V3 2/2] syscalls/clock_gettime: Add test to check bug
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
V3:
- Add version info for riscv and nds32
- Don't print PASS along with FAIL for failure cases.

 runtest/syscalls                              |   1 +
 .../kernel/syscalls/clock_gettime/.gitignore  |   1 +
 .../kernel/syscalls/clock_gettime/Makefile    |   5 +-
 .../syscalls/clock_gettime/clock_gettime04.c  | 208 ++++++++++++++++++
 4 files changed, 214 insertions(+), 1 deletion(-)
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
index 000000000000..be1d190a956e
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
@@ -0,0 +1,208 @@
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
+#elif defined(__nds32__)
+	const char *version = "LINUX_4";
+	const char *name = "__vdso_clock_gettime";
+#elif defined(__riscv)
+	const char *version = "LINUX_4.15";
+	const char *name = "__vdso_clock_gettime";
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
+				/*
+				 * _vdso_gettime() sets error to ENOSYS if vdso
+				 * isn't available.
+				 */
+				if (errno == ENOSYS)
+					continue;
+
+				tst_res(TFAIL | TERRNO, "%s: clock_gettime() failed (%d)",
+					tst_clock_name(clks[i]), j);
+				return;
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
