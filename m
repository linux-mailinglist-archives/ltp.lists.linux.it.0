Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 188DF1E3DCB
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 11:44:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0B0D3C324B
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 11:44:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id ADB7D3C3222
 for <ltp@lists.linux.it>; Wed, 27 May 2020 11:43:58 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 48DFF1A01479
 for <ltp@lists.linux.it>; Wed, 27 May 2020 11:43:57 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id p21so11530057pgm.13
 for <ltp@lists.linux.it>; Wed, 27 May 2020 02:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4px91RNKKKVY/5WonIzkkgIR18pyi4m5r3PzUUPWB64=;
 b=kwxY6jI+H1wqJ9rlHP2mJueOXP3+004AiyNsiq4e/6FE/ZYHF3gcpOMsuklVECQPH8
 1Ebadc2H72i0wi87r44Kc0eKXRcamsqAXjuK6XH6OX4yY2KYvTpPu2lvK/8RwAv517M2
 4xl4DGG5eYzjRl29BMFzsh2OEDYvKzPcg0G14slm6K4+avke0bKBA+UdgjoRJxeCWZJ6
 LsdokYqDgBRpWIfhZQ1O+rj9RBRmVbC6nvSnflcNY2FqOaAO/KLnEmjOJR+FWeFOnOg1
 Vk4o2yZyArRoP8sxp9NpFHhUmY+/FLFnD2wFZgPgo0suQ4oEx6YM6GjY+HXX/lCW2oFz
 73rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4px91RNKKKVY/5WonIzkkgIR18pyi4m5r3PzUUPWB64=;
 b=db9meH4zdPjAYM3IVks3U+BLYQ23tVsuxH/+PlsQzmRh/Af4EhITxnHIwiI2TiRE3M
 BfMRpWfQJI5EyVJrL2Xj/x7xZzq0mOnJcEAj7YZ5wFqOxrfp6lfkl7gxEh/ivsI01+6q
 7wLIHkpASMX4PF8egZy+/U/XOTmZCRP3H/00dRw8dP0JHQKAITpzBUAYkFk7aMWzBWsl
 TeQQ76TlDp3Ta1rYiQH6SEpzUqvWs4CrwEEOkatMZcHqz8vYR4N1pqL4+mcIGvDPb3Rb
 KZfR5wdNV94mOmsAnJPbiHDBt23+k/5B/rI0rHlNc7hJhDFRHgy0QtFtFAzkHPjhck3I
 0gIw==
X-Gm-Message-State: AOAM530eoRv/xpMO0AQb0T79JsW3fb6Lg7zMATUuUYWzXxRvWDG94hpk
 4hKfo16pBrer+VVa0nMBY380DAkY7BY=
X-Google-Smtp-Source: ABdhPJynxPB0KC5ivX2ROy6ThZJdg+jKmE6b4o2ZlBc2+SGZCt/mnmpgqNW68+N7kDpvJNvoW8EhbQ==
X-Received: by 2002:a65:49c9:: with SMTP id t9mr3167380pgs.148.1590572635372; 
 Wed, 27 May 2020 02:43:55 -0700 (PDT)
Received: from localhost ([122.172.60.59])
 by smtp.gmail.com with ESMTPSA id w12sm1802083pjn.21.2020.05.27.02.43.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 02:43:54 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 27 May 2020 15:13:47 +0530
Message-Id: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <c5428a9c88d18fac80e364281cfd4e3aefa38d2c.1590130423.git.viresh.kumar@linaro.org>
References: <c5428a9c88d18fac80e364281cfd4e3aefa38d2c.1590130423.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V3 5/6] syscalls: Don't pass struct timespec to
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
V3:
- Run the syscalls at least once to verify they are supported by the
  hardware.

 lib/tst_clocks.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 3 deletions(-)

diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index 2eaa73b11abe..ddf54b903133 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -7,23 +7,107 @@
 
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
+	if (ret == ENOSYS)
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
+		return ENOSYS;
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
+		return ENOSYS;
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
+		return ENOSYS;
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
