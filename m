Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F631FEAE0
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 07:25:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4863D3C2C82
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 07:25:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4E3043C23CD
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 07:25:35 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 12FD560009E
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 07:24:46 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id k1so1969657pls.2
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 22:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z6U6tDgpICAxQ3WU9hOfWOZiBIGdU1D/fMk4W/9mnY8=;
 b=jDdgzIaeDrXcwCVw91nYnQFLnPyOwKUUjH5Ikn4lu/q97UBi2shtp6fOHFm2lsjO5c
 VjPOEmMj95xRQ0NwyngnD9mEYRmWl7YBGouStDD06SENxvCXWWNyhd0GLqxGLmPV/C9q
 cC4MgKt6Zxetzn9rVuq9NuhASsJq61aaLJbMfi+Ia9sZMZ6F4+YLd54NL/jvExBb8SCm
 ROn/c3b5J3X2goUzZlDXAELzKeStWrnxKHZSCj9u5ooPI1rut5hwdVlVoghQNIhlbwl+
 WJd9KpuamppsM6e227RIYHe16+66Qqr0o0r+1w+2CTjYU/D0D5UwmBYeS5FxJIIDsjau
 WCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z6U6tDgpICAxQ3WU9hOfWOZiBIGdU1D/fMk4W/9mnY8=;
 b=bdC1ffvD8Dovo6UYGuaxcmVpRs0uoMKCFIimnkBKtMqLzJf4E+JkkuKMa1Aw3EokTI
 FDeCELBu+gaDVOz6w9XQpVNRS/sqng+ukhqX5GyjiX+Ak9pLXErExF12SKA4Q8UlwFfO
 ao2zZSsbuvD7MRAq1uMzgFZg9cZWhQ7G58veGjUF8Vuv5ZfW4Lkp0EBUsP/YMMdRE383
 PCx4v4ES4jcyyveVFuk7TvxtOwhKX3QG8iKupTtWvsZb+8KpO+0cEpGVyQvQPly04DPH
 H4ewMKw8K4nooj8OegcE7mV1R5L9edrDcsF/r4sU3PWs97dnHbZwsdGcTLiQ/KBucPJF
 IMmA==
X-Gm-Message-State: AOAM531okSioUbptchyiX6CkNYSa7LyR/KAMenVQpJYEakwshrlxBPNi
 GXvW6oay5tVKTcMVf9VGUj6OTkbnd+s=
X-Google-Smtp-Source: ABdhPJxK3Ow1Ympt7NJawmTMoz/t8UGuXZVDcQdD5FQnd+O5d4WRxmoR7czCnG10JRlifdxtlXhjbA==
X-Received: by 2002:a17:90a:d305:: with SMTP id
 p5mr2417398pju.44.1592457932218; 
 Wed, 17 Jun 2020 22:25:32 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id g9sm1446326pfm.151.2020.06.17.22.25.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 22:25:31 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 18 Jun 2020 10:55:28 +0530
Message-Id: <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
References: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V4 5/6] syscalls: Don't pass struct timespec to
 tst_syscall()
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

There are compatibility issues here as we are calling the direct
syscalls (with tst_syscall()) with the "struct timespec" (which is a
libc definition). Over that, an architecture may not define
__NR_clock_getres (for example) and so we must have the fallback version
in place.

This updates the tst_clock_*() routines in core libraries and adds
support for different syscall variants.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V4: Properly use return value and errno.

 lib/tst_clocks.c | 93 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 3 deletions(-)

diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index 2eaa73b11abe..bc0bef273e52 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -7,23 +7,110 @@
 
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
+#include "tst_timer.h"
 #include "tst_clocks.h"
 #include "lapi/syscalls.h"
 #include "lapi/posix_clocks.h"
 
+typedef int (*mysyscall)(clockid_t clk_id, void *ts);
+
+int syscall_supported_by_kernel(mysyscall func)
+{
+	int ret;
+
+	ret = func(0, NULL);
+	if (ret == -1 && errno == ENOSYS)
+		return 0;
+
+	return 1;
+}
+
 int tst_clock_getres(clockid_t clk_id, struct timespec *res)
 {
-	return tst_syscall(__NR_clock_getres, clk_id, res);
+	static struct tst_ts tts = { 0, };
+	static mysyscall func;
+	int ret;
+
+#if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)
+	if (!func && syscall_supported_by_kernel(sys_clock_getres64)) {
+		func = sys_clock_getres64;
+		tts.type = TST_KERN_TIMESPEC;
+	}
+#endif
+
+	if (!func && syscall_supported_by_kernel(sys_clock_getres)) {
+		func = sys_clock_getres;
+		tts.type = TST_KERN_OLD_TIMESPEC;
+	}
+
+	if (!func) {
+		tst_res(TCONF, "clock_getres() not available");
+		errno = ENOSYS;
+		return -1;
+	}
+
+	ret = func(clk_id, tst_ts_get(&tts));
+	res->tv_sec = tst_ts_get_sec(tts);
+	res->tv_nsec = tst_ts_get_nsec(tts);
+	return ret;
 }
 
 int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
 {
-	return tst_syscall(__NR_clock_gettime, clk_id, ts);
+	struct tst_ts tts = { 0, };
+	static mysyscall func;
+	int ret;
+
+#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	if (!func && syscall_supported_by_kernel(sys_clock_gettime64)) {
+		func = sys_clock_gettime64;
+		tts.type = TST_KERN_TIMESPEC;
+	}
+#endif
+
+	if (!func && syscall_supported_by_kernel(sys_clock_gettime)) {
+		func = sys_clock_gettime;
+		tts.type = TST_KERN_OLD_TIMESPEC;
+	}
+
+	if (!func) {
+		tst_res(TCONF, "clock_gettime() not available");
+		errno = ENOSYS;
+		return -1;
+	}
+
+	ret = func(clk_id, tst_ts_get(&tts));
+	ts->tv_sec = tst_ts_get_sec(tts);
+	ts->tv_nsec = tst_ts_get_nsec(tts);
+	return ret;
 }
 
 int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
 {
-	return tst_syscall(__NR_clock_settime, clk_id, ts);
+	struct tst_ts tts = { 0, };
+	static mysyscall func;
+
+#if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
+	if (!func && syscall_supported_by_kernel(sys_clock_settime64)) {
+		func = sys_clock_settime64;
+		tts.type = TST_KERN_TIMESPEC;
+	}
+#endif
+
+	if (!func && syscall_supported_by_kernel(sys_clock_settime)) {
+		func = sys_clock_settime;
+		tts.type = TST_KERN_OLD_TIMESPEC;
+	}
+
+	if (!func) {
+		tst_res(TCONF, "clock_settime() not available");
+		errno = ENOSYS;
+		return -1;
+	}
+
+	tst_ts_set_sec(&tts, ts->tv_sec);
+	tst_ts_set_nsec(&tts, ts->tv_nsec);
+	return func(clk_id, tst_ts_get(&tts));
 }
 
 const char *tst_clock_name(clockid_t clk_id)
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
