Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 553E820AB81
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 06:52:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 883C33C5841
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 06:52:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 467353C0ECB
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 06:52:16 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 440501A00E7B
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 06:52:15 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id x11so3818871plo.7
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 21:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ne6ZHjIUG+SNllXIZucyyJW17aIPCDic0MrNnB7v6/4=;
 b=NE0obm4azYX/rZuVp2bgjdQr67s7zfA77Yg7Cz7FRwqaKBTOj2cA0luPdJUTsUBV2k
 L8Br8BONdnD93W6kxIu3PmXm6sBOIwsTXb3zJ1q6zUdy7nLJbfEUZ15gWiLKn6xkR5qi
 CH/1/BFEX64W3FAd4x7bAfb20qPbHnNlkavk6srcEeoFEdt4Q3FsIngS9rQTB0aY2PMx
 OXJTn0FO1JxH+Jqz3Db0KRgN79NbBUyC0o//7fLvJy9k0YPlb+zyzKHNAJphlR3tQtFB
 iOcNO15obti+r5AaDH2uZYMRzMLi/UCiSnC+m5vfPNNYW8lE0lb0dz8nEUohx6wPTcyH
 5sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ne6ZHjIUG+SNllXIZucyyJW17aIPCDic0MrNnB7v6/4=;
 b=jrVLqNrvtUtZoeM0HIxv/7XkApmOiLfS/DC2vDx2j4XzzEm7mjaYxm/lbUNup16SRe
 E3nBhQvFUiVIEsxwy8IyYZ/TGWGsKnBTwaYzrG641E1JR5MHo+nda91oa6GgLqRfigE+
 q8E6HCM7VA20ZyGpCy5yu8d5P5LtfAgdZt/ns+BwY5NAa1K/Q33fWVTVnPZSvQ8yzbe7
 XgJReMBLYweQaxxyd9LfBZzSXQ2GmBjZY6N/fAaCFQEyE5qfztrmuKXP5sOqXxGTY++n
 lATTPywRipWCDebJv3NCnzXlO2vVyzWwK7G0sSbs3Uaa+nyJXoVazZvCWM1F+OTr24x3
 +WZw==
X-Gm-Message-State: AOAM533MXVc2A603ZgmDVBkdZ4JFgEc3n0q1QyNJkQXMPjbPT8hDfVin
 9ooeaaMZZIV5+ijouvHuuZFXIg0RUY4=
X-Google-Smtp-Source: ABdhPJx1C+7gPHi21YZUQZfweJo+b5eeplMMOin5RqJFeMumXsVwUTqYjH48isvQf392E4cXExceNA==
X-Received: by 2002:a17:90b:234f:: with SMTP id
 ms15mr1377130pjb.7.1593147133113; 
 Thu, 25 Jun 2020 21:52:13 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id n140sm13180647pfd.172.2020.06.25.21.52.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 21:52:12 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 10:22:08 +0530
Message-Id: <a92d6492218673113f1b4b45733adad48b805bb3.1593147069.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <0fb91044431a04c2787bfa121a7e5f969664fc8b.1591948595.git.viresh.kumar@linaro.org>
References: <0fb91044431a04c2787bfa121a7e5f969664fc8b.1591948595.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V4 2/2] syscalls/clock_gettime: Add test to check bug
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
V4: Moved some code to vdso_helpers.c

 include/parse_vdso.h                          |   6 +
 libs/libltpvdso/vdso_helpers.c                |  69 ++++++++
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/clock_gettime/.gitignore  |   1 +
 .../kernel/syscalls/clock_gettime/Makefile    |   3 +
 .../syscalls/clock_gettime/clock_gettime04.c  | 162 ++++++++++++++++++
 6 files changed, 242 insertions(+)
 create mode 100644 libs/libltpvdso/vdso_helpers.c
 create mode 100644 testcases/kernel/syscalls/clock_gettime/clock_gettime04.c

diff --git a/include/parse_vdso.h b/include/parse_vdso.h
index 87f5ea4fc3e8..5212fc659e34 100644
--- a/include/parse_vdso.h
+++ b/include/parse_vdso.h
@@ -28,8 +28,14 @@
  *
  * These are the prototypes:
  */
+
+#include <time.h>
+
 extern void vdso_init_from_auxv(void *auxv);
 extern void vdso_init_from_sysinfo_ehdr(uintptr_t base);
 extern void *vdso_sym(const char *version, const char *name);
 
+typedef int (*gettime_t)(clockid_t clk_id, void *ts);
+void find_clock_gettime_vdso(gettime_t *ptr_vdso_gettime,
+			     gettime_t *ptr_vdso_gettime64);
 #endif /* PARSE_VDSO_H__ */
diff --git a/libs/libltpvdso/vdso_helpers.c b/libs/libltpvdso/vdso_helpers.c
new file mode 100644
index 000000000000..e958403453e0
--- /dev/null
+++ b/libs/libltpvdso/vdso_helpers.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar<viresh.kumar@linaro.org>
+ */
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+
+#include "parse_vdso.h"
+#include <sys/auxv.h>
+
+static unsigned long sysinfo_ehdr;
+
+static void vdso_init(void)
+{
+	if (sysinfo_ehdr)
+		return;
+
+	sysinfo_ehdr = getauxval(AT_SYSINFO_EHDR);
+	if (!sysinfo_ehdr) {
+		tst_res(TINFO, "Couldn't find AT_SYSINFO_EHDR");
+		return;
+	}
+
+	vdso_init_from_sysinfo_ehdr(sysinfo_ehdr);
+}
+
+void find_clock_gettime_vdso(gettime_t *ptr_vdso_gettime,
+			     gettime_t *ptr_vdso_gettime64)
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
+	vdso_init();
+
+	*ptr_vdso_gettime = vdso_sym(version, name);
+	if (!*ptr_vdso_gettime)
+		tst_res(TINFO, "Couldn't find vdso_gettime()");
+
+	*ptr_vdso_gettime64 = vdso_sym(version64, name64);
+	if (!*ptr_vdso_gettime64)
+		tst_res(TINFO, "Couldn't find vdso_gettime64()");
+}
diff --git a/runtest/syscalls b/runtest/syscalls
index f245529f868d..718ac1148392 100644
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
index e49cb9b357a4..1c1cbd7a8853 100644
--- a/testcases/kernel/syscalls/clock_gettime/Makefile
+++ b/testcases/kernel/syscalls/clock_gettime/Makefile
@@ -3,8 +3,11 @@
 
 top_srcdir		?= ../../../..
 
+LTPLIBS = ltpvdso
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS+=-lrt
+clock_gettime04: LDLIBS += -lltpvdso
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
new file mode 100644
index 000000000000..97b6ea7ddcd3
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
@@ -0,0 +1,162 @@
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
+clockid_t clks[] = {
+	CLOCK_REALTIME,
+	CLOCK_REALTIME_COARSE,
+	CLOCK_MONOTONIC,
+	CLOCK_MONOTONIC_COARSE,
+	CLOCK_MONOTONIC_RAW,
+	CLOCK_BOOTTIME,
+};
+
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
+static void setup(void)
+{
+	find_clock_gettime_vdso(&ptr_vdso_gettime, &ptr_vdso_gettime64);
+}
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
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(clks),
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
