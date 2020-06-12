Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 520B51F752B
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 10:17:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12EFB3C2DC7
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 10:17:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B03843C22CA
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 10:17:43 +0200 (CEST)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 933942013BF
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 10:17:42 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id t16so3449395plo.7
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 01:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ud8Gw6v+A4aSbgIkRZrGTIdpqib5bz5gYSsNwHnhlpk=;
 b=cNmEinL5C1JhOQkSmC+YXPUoNFVp5zn8w8SSZCuV4qU3EKIbgRnPZoQvjF20Xo/gvR
 07Hw9/TxUa9glOclG+lnJzuhtykvn61GqwGmP1RUA4BcNBFLJ961fCT7py9hNgFVCU5i
 GcES97wH3YbdXhB17xjn8wpkIRgWwWKBsd3JMaUWiXUI++wuKrdPMMtrs/AuXOGcZ5vf
 +dkQbj0nlMU4p/2+S8JXYDE0rIjehX8CWHIFxMeFan7FyCWO3B94j297960f2iEWDDkz
 aVvLZ+GDUi4zEI0z4/gZ1260zSK6Skjj6IgbSU29wyPpeUQGS20e7ug5zzH1Vr3hOsmA
 FI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ud8Gw6v+A4aSbgIkRZrGTIdpqib5bz5gYSsNwHnhlpk=;
 b=L1KSn1MkM5oXFovPBYMpIJSrKXUeoGT4rUEdGHaVoyQBPemXu9vMRTkQLHBFpv08uv
 7Li1rRd5jB43m9RTjXAtLMemwSq2oqSO4+ZoofM4QG2+w2wxT3nj2k8iVvCqN0axELum
 Oa0kVUvoT4LzLzUDos3WxdIIYlqTQEPyyinocmXrV4DwM3BKHBpWLXTNJM+KI4cnaupe
 qWv46Kkk0dS2sgHFyZHOfi8vJ/tOfu/EyxoDI5ZYKjlMAkE1Z4BzN6sb8ckW/ibWCXxm
 3FEZdvD/rGBxnP47IJk+zoRfpjL71Fjtqu09QrvKSpOdx+Ctpn6vVq8lTIdEP0Flp0sZ
 rSzQ==
X-Gm-Message-State: AOAM532OLRDWi941qLrBY6YzC3stcHdg175rFpxNjRcJrqi+Utih5flt
 jU3AFyp27mYlw0r1Iu7kxoW+8w==
X-Google-Smtp-Source: ABdhPJzX5A3qjqOiR6G6x0v8vHHMUj2DdTb/FY0R38Ay+sj0CkRn/zttszyYwEFOYcEH6c1Kq31YHg==
X-Received: by 2002:a17:90b:188c:: with SMTP id
 mn12mr11898048pjb.8.1591949860783; 
 Fri, 12 Jun 2020 01:17:40 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id w190sm5318028pfw.35.2020.06.12.01.17.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 01:17:39 -0700 (PDT)
Date: Fri, 12 Jun 2020 13:47:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200612081738.humjvvgikhzq6lf7@vireshk-i7>
References: <cc75beb4074b62e94b8ac92cba17af41b8f5fbdc.1591864369.git.viresh.kumar@linaro.org>
 <0fb91044431a04c2787bfa121a7e5f969664fc8b.1591948595.git.viresh.kumar@linaro.org>
 <CAK8P3a3EQ2wbM=XKHaUQCK=_bhSc1pxGKCd9+oEf9y02GFs9_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fehlfuwvsx6ajy4s"
Content-Disposition: inline
In-Reply-To: <CAK8P3a3EQ2wbM=XKHaUQCK=_bhSc1pxGKCd9+oEf9y02GFs9_g@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 2/2] syscalls/clock_gettime: Add test to check
 bug during successive readings
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
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--fehlfuwvsx6ajy4s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 12-06-20, 10:07, Arnd Bergmann wrote:
> There was one more thing I had originally suggested as an optional
> thing to test for:
> 
> - ensure that CLOCK_REALTIME_COARSE/CLOCK_MONOTONIC_COARSE
>   is at most clock_getres() nanoseconds behind
>   CLOCK_REALTIME/CLOCK_MONOTONIC, and never ahead of it.
> 
> It's probably too much to put into this test, and I'm not sure we really
> need to test for it. Are you still looking into this, or do you think we should
> stop here?

Sorry, I missed replying to it. When you suggest something, you
suggest too much (which is good) and I get lost implementing all of it
:)

Can you have a look at the attached test? This is already merged in
LTP and does what you are asking to some level (not exactly though)
and so I thought we don't need to do it again.

-- 
viresh

--fehlfuwvsx6ajy4s
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="clock_gettime03.c"

// SPDX-License-Identifier: GPL-2.0-or-later
/*

  Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>

 */
/*

  Basic test for timer namespaces.

  After a call to unshare(CLONE_NEWTIME) a new timer namespace is created, the
  process that has called the unshare() can adjust offsets for CLOCK_MONOTONIC
  and CLOCK_BOOTTIME for its children by writing to the '/proc/self/timens_offsets'.

  The child processes also switch to the initial parent namespace and checks
  that the offset is set to 0.

 */

#define _GNU_SOURCE
#include "tst_safe_clocks.h"
#include "tst_timer.h"
#include "lapi/namespaces_constants.h"

static struct tcase {
	int clk_id;
	int clk_off;
	int off;
} tcases[] = {
	{CLOCK_MONOTONIC, CLOCK_MONOTONIC, 10},
	{CLOCK_BOOTTIME, CLOCK_BOOTTIME, 10},

	{CLOCK_MONOTONIC, CLOCK_MONOTONIC, -10},
	{CLOCK_BOOTTIME, CLOCK_BOOTTIME, -10},

	{CLOCK_MONOTONIC_RAW, CLOCK_MONOTONIC, 100},
	{CLOCK_MONOTONIC_COARSE, CLOCK_MONOTONIC, 100},
};

static struct tst_ts now, then, parent_then;
static int parent_ns;

static struct test_variants {
	int (*func)(clockid_t clk_id, void *ts);
	enum tst_ts_type type;
	char *desc;
} variants[] = {
	{ .func = libc_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},

#if (__NR_clock_gettime != __LTP__NR_INVALID_SYSCALL)
	{ .func = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
#endif

#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
	{ .func = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
#endif
};

static void child(struct test_variants *tv, struct tcase *tc)
{
	long long diff;

	if (tv->func(tc->clk_id, tst_ts_get(&then))) {
		tst_res(TFAIL | TERRNO, "clock_gettime(%s) failed",
			tst_clock_name(tc->clk_id));
		return;
	}

	SAFE_SETNS(parent_ns, CLONE_NEWTIME);

	if (tv->func(tc->clk_id, tst_ts_get(&parent_then))) {
		tst_res(TFAIL | TERRNO, "clock_gettime(%s) failed",
			tst_clock_name(tc->clk_id));
		return;
	}

	diff = tst_ts_diff_ms(then, now);

	if (diff - tc->off * 1000 > 10) {
		tst_res(TFAIL, "Wrong offset (%s) read %llims",
		        tst_clock_name(tc->clk_id), diff);
	} else {
		tst_res(TPASS, "Offset (%s) is correct %llims",
		        tst_clock_name(tc->clk_id), diff);
	}

	diff = tst_ts_diff_ms(parent_then, now);

	if (diff > 10) {
		tst_res(TFAIL, "Wrong offset (%s) read %llims",
		        tst_clock_name(tc->clk_id), diff);
	} else {
		tst_res(TPASS, "Offset (%s) is correct %llims",
		        tst_clock_name(tc->clk_id), diff);
	}
}

static void verify_ns_clock(unsigned int n)
{
	struct test_variants *tv = &variants[tst_variant];
	struct tcase *tc = &tcases[n];

	SAFE_UNSHARE(CLONE_NEWTIME);

	SAFE_FILE_PRINTF("/proc/self/timens_offsets", "%d %d 0",
	                 tc->clk_off, tc->off);

	if (tv->func(tc->clk_id, tst_ts_get(&now))) {
		tst_res(TFAIL | TERRNO, "%d clock_gettime(%s) failed",
			__LINE__, tst_clock_name(tc->clk_id));
		return;
	}

	if (!SAFE_FORK())
		child(tv, tc);
}

static void setup(void)
{
	struct test_variants *tv = &variants[tst_variant];

	now.type = then.type = parent_then.type = tv->type;
	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
	parent_ns = SAFE_OPEN("/proc/self/ns/time_for_children", O_RDONLY);
}

static void cleanup(void)
{
	SAFE_CLOSE(parent_ns);
}

static struct tst_test test = {
	.setup = setup,
	.cleanup = cleanup,
	.tcnt = ARRAY_SIZE(tcases),
	.test = verify_ns_clock,
	.test_variants = ARRAY_SIZE(variants),
	.needs_root = 1,
	.forks_child = 1,
	.needs_kconfigs = (const char *[]) {
		"CONFIG_TIME_NS=y",
		NULL
	}
};

--fehlfuwvsx6ajy4s
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--fehlfuwvsx6ajy4s--
