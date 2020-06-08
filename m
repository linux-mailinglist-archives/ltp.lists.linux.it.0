Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E51F1773
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 13:20:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCEC13C2E90
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 13:20:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 30C1F3C23B2
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 13:20:05 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 13AEE60083C
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 13:20:05 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id a127so8387844pfa.12
 for <ltp@lists.linux.it>; Mon, 08 Jun 2020 04:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uUC74epc/2TOLsVQOX6A/DUjyf6JUXCblg0MqqtF37Q=;
 b=OS3RxaIndqkgGgbBt9GBdPesOG/4I3snsAuHpa3h23WeoK6w7qb4G5d66Fxn/a2DzT
 vEZ+sRssOOl+IwIj7JQOVnp6G1ThOXJDmLm6FRh7NcBtLLbKFz6l7ZqIVmgen4Ajunaw
 uDE1KeqRaVxmpuconVVYqXM/Nh1D6MtjOS8cHwVE/wS3JzRDvcjkrwQ3xTYlVLncrc0j
 Xi1mE2M2nqGTMygKtnpkzYYRe0oRMbEuqhgn90oUMddb3boaXjdb5lrXBzP4lzs/yd4l
 vCEhD/ZUXNrFLY05qmO3WQTXwiOhwmcBqoc6u9DfVmx/167MXtfffVEwFLiv2McLx7aW
 ztEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uUC74epc/2TOLsVQOX6A/DUjyf6JUXCblg0MqqtF37Q=;
 b=sfK8Rg1c8ZP3TNqcB5xF96/IIfRyQbiGbzyzKEt8+/9zocpDBN0Qoudcnyq+t2cYLQ
 yLWTkqEOvd7WW3XAAuc/zLGarelSfhQHUUUP8x93iCu7CoCiR0mZeSconc3JVCClcBon
 duzbYR6IdWTKLfmzhrzq0wyoxqaaZlpIf6XNMCXX1RLFvLp2/222EYBBkgMvYbNx1Ryv
 Tyrxh2fyurQETNIYrYVLAhevW3Rd728MBj6RNduyF2cWdHGWotW1DbD87K/1+8V2LBfw
 BmnZ5FCfXvLa72uvBzYQlc82ZmddCnPl0N9UVHhoDBVTDodnrpV3EVaeYxCAJcQy5ZxU
 ky3w==
X-Gm-Message-State: AOAM532Ujdtf0pjlRRodmgSFKpH2ZHd72zG3OHrRlT6xf8Zv+AoHpmx6
 9E3qZPv0i8AmjK+2iyrv++Yl5g==
X-Google-Smtp-Source: ABdhPJxQMXpexPvs44NydNytWqrQrp0BKR+Wxcrzvb3Jjq5wJ9CirQtCNHVF32xV4uZ3Mv0fsl6qqw==
X-Received: by 2002:a62:7901:: with SMTP id u1mr20846701pfc.136.1591615203445; 
 Mon, 08 Jun 2020 04:20:03 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id u25sm6993506pfm.115.2020.06.08.04.20.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 04:20:02 -0700 (PDT)
Date: Mon, 8 Jun 2020 16:50:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200608112000.sjrbvmqjciifgyub@vireshk-i7>
References: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
 <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
 <20200608100900.c4fi7pw7euie6tnt@vireshk-i7>
 <CAK8P3a004cavRhyWx+uXYYteBi1LviahAv11+9JyGadN-vo8og@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a004cavRhyWx+uXYYteBi1LviahAv11+9JyGadN-vo8og@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/clock_gettime: Add test to check bug
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 08-06-20, 12:21, Arnd Bergmann wrote:
> So now you only call gettimeofday() once instead of in each loop, right?
> This won't test for spurious failures any more, but I suppose it would catch
> any case where gettimeofday() and clock_gettime() are out of sync by
> a lot. The only case you don't catch is where clock_gettime() sometimes
> returns a value that is slightly earlier than gettimeofday().

Okay, I missed the fact that we need to call gettimeofday() for every iteration
and here is the new diff which has tried to simplify the overall code. But this
has a problem now as it always reports this error:

clock_gettime04.c:88: FAIL: CLOCK_REALTIME: Time travelled backwards (2): -148 ns

I guess the problem is that gettimeofday() gets the value in usec resolution and
clock_gettime() gets it in nsec and so some nsec always get lost with
gettimeofday() and so the errors ? How should we take care of this ? Take diff
in usec instead of nsec ?

+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
@@ -0,0 +1,109 @@
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
+#endif
+
+#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+	{ .gettime = my_gettimeofday, .type = TST_LIBC_TIMESPEC, .desc = "gettimeofday"},
+};
+
+static void run(unsigned int i)
+{
+	struct tst_ts ts;
+	long long start, end = 0, diff;
+	struct test_variants *tv;
+	int count = 10000;
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
+			tv->gettime(clks[i], tst_ts_get(&ts));
+			end = tst_ts_to_ns(ts);
+
+			/* Skip comparison on first traversal */
+			if (count == 10000 && !j)
+				continue;
+
+			diff = end - start;
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
+	.tcnt = ARRAY_SIZE(clks),
+};

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
