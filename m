Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E29961DE032
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:55:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97BB23C4CDD
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:55:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4952B3C4CAD
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:35 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7FCA4601200
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:08 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id t8so2467451pju.3
 for <ltp@lists.linux.it>; Thu, 21 May 2020 23:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2z9UfGLaU8CdxWHWdAmp51I7V+fVi/ZplrvD4u0QA4w=;
 b=iLk1oyUyrVHh4E/k/zkJl9bTFO9a8HiU4/eFNR+MmJB5xilG3lhau4B9QFBDz9cdTb
 4PKXEliLl83tOShqlp+7AkHWijw2R5W14fvbuvCsPZjHEBSTRdowTyQcnCaHte/a3R4w
 CO6+E6FERsdiv+DvAO83bqgX8N0b4XEnHv7DJ81YifjyoN59TIdeJeaZLFQjSS07G7lQ
 I+fGohwl8pMURZOfTc66NM6yoWXo5ghN248E2V10av4s31aFWL3Ra0mVPRccDxXyPJQo
 vAb+84XAP0ruyih5b26oED5CIklVyEnpAYiCHiP3KGz4v3RUzgaMJuNiJsXSS1l58XL3
 rr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2z9UfGLaU8CdxWHWdAmp51I7V+fVi/ZplrvD4u0QA4w=;
 b=Fngs9c/QBAGGloImMIw5JWl9OuTci3SqOMp8nbovnxMZGS5FhvqcuvWj34mRzEyR7B
 3YvE4VfwDaB9eazAPktH4y687mdsSPHqPmziLwYgdZpE1rZxEP0hDFq2ZKabG27N5uN5
 ueEPw6gjHwBskuRdtrFRB9Eu6WynoMnO0IqjnAm38iO/vM3Ojho/Ujz1xkvNM7fjA1VS
 6h+2TbI5EQonDQwiGoWMxTBqdYKUYXcdExzBWS8qxAEF90YeI7wRtLT/IlM7rQ5ub1yb
 Gym3G3PD+IjvMbFssV056a2J+7OB1e9Mkuqf2Mq4Y0E9Up+dQ2oxUPjX9hyGW9EimjM/
 jG6A==
X-Gm-Message-State: AOAM53395WRvHuqeii3MnjpdIK+QUgyEcCbid0cv7+K5Klptgs5CH2lj
 1NCVx+wUOdvM6Q8R56QJ3cxM/GCjqvU=
X-Google-Smtp-Source: ABdhPJxlW/qzxbtsO1Nczr+TiOPp//6ySW7imDGE9Ph4BHNs3abPKMpI0QAXnbOORkqEtGLNf6mSbA==
X-Received: by 2002:a17:902:7c01:: with SMTP id
 x1mr13491225pll.258.1590130472612; 
 Thu, 21 May 2020 23:54:32 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id z18sm6153350pfj.148.2020.05.21.23.54.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 23:54:31 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 12:24:11 +0530
Message-Id: <c5428a9c88d18fac80e364281cfd4e3aefa38d2c.1590130423.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590130423.git.viresh.kumar@linaro.org>
References: <cover.1590130423.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V2 5/6] syscalls: Don't pass struct timespec to
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
 lib/tst_clocks.c | 59 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index 2eaa73b11abe..ed13f0af0c60 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -7,23 +7,76 @@
 
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
+#include "tst_timer.h"
 #include "tst_clocks.h"
 #include "lapi/syscalls.h"
 #include "lapi/posix_clocks.h"
 
 int tst_clock_getres(clockid_t clk_id, struct timespec *res)
 {
-	return tst_syscall(__NR_clock_getres, clk_id, res);
+	int (*func)(clockid_t clk_id, void *ts);
+	struct tst_ts tts = { 0, };
+	int ret;
+
+#if defined(__NR_clock_getres_time64)
+	tts.type = TST_KERN_TIMESPEC;
+	func = sys_clock_getres64;
+#elif defined(__NR_clock_getres)
+	tts.type = TST_KERN_OLD_TIMESPEC;
+	func = sys_clock_getres;
+#else
+	tts.type = TST_LIBC_TIMESPEC;
+	func = libc_clock_getres;
+#endif
+
+	ret = func(clk_id, tst_ts_get(&tts));
+	res->tv_sec = tst_ts_get_sec(tts);
+	res->tv_nsec = tst_ts_get_nsec(tts);
+	return ret;
 }
 
 int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
 {
-	return tst_syscall(__NR_clock_gettime, clk_id, ts);
+	int (*func)(clockid_t clk_id, void *ts);
+	struct tst_ts tts = { 0, };
+	int ret;
+
+#if defined(__NR_clock_gettime64)
+	tts.type = TST_KERN_TIMESPEC;
+	func = sys_clock_gettime64;
+#elif defined(__NR_clock_gettime)
+	tts.type = TST_KERN_OLD_TIMESPEC;
+	func = sys_clock_gettime;
+#else
+	tts.type = TST_LIBC_TIMESPEC;
+	func = libc_clock_gettime;
+#endif
+
+	ret = func(clk_id, tst_ts_get(&tts));
+	ts->tv_sec = tst_ts_get_sec(tts);
+	ts->tv_nsec = tst_ts_get_nsec(tts);
+	return ret;
 }
 
 int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
 {
-	return tst_syscall(__NR_clock_settime, clk_id, ts);
+	int (*func)(clockid_t clk_id, void *ts);
+	struct tst_ts tts = { 0, };
+
+#if defined(__NR_clock_settime64)
+	tts.type = TST_KERN_TIMESPEC;
+	func = sys_clock_settime64;
+#elif defined(__NR_clock_settime)
+	tts.type = TST_KERN_OLD_TIMESPEC;
+	func = sys_clock_settime;
+#else
+	tts.type = TST_LIBC_TIMESPEC;
+	func = libc_clock_settime;
+#endif
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
