Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C37971DE033
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:55:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A6883C4C1F
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:55:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 351EB3C4CC5
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:38 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6D4EC201343
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:37 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id u22so4002825plq.12
 for <ltp@lists.linux.it>; Thu, 21 May 2020 23:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wU6wyV4W3qBY0UvNxB52NsprWl1zbZBqn2ARfDbxYd0=;
 b=x47B7G9sxuJg42/VFOcLWKO4VSbPd9b6H6ONU4Dqq4LVWp4AcNiWZKu44j6lJQbWSa
 3SP56yxfm7oUEzPgwc+t5Dw+bDRtjVsxUwyDIDSzIFz0UbQHgGxtUI0+P8ObtTcupCOH
 hQgD8YgS1sDbOn48cdWQDpWXMKXuvhjEI4jCDvN+4v3XeATzVRU9f+yPq541qW+680BW
 ZJDsHNoVJc0wWoCDf/Fkcyv1gaBetwixJdvrn+o2ETKuYzTo6DEg51L+OWoqviBdkecy
 T2nKp08XaX0htRea8wh0kuVVKEwPdyXdSstcSpKhFhJSrBftXXfeobv30gGLJogxSa0r
 SgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wU6wyV4W3qBY0UvNxB52NsprWl1zbZBqn2ARfDbxYd0=;
 b=Qm1iuIp+4hADfzyGQssTySDjxileDsOrrlmYe/NGS76/wRvtfaM9ef0fiEetDD37o/
 YQMqUFcOjgt3EyUTcKyjzAuK9n/ene8S3W6rnhkY1PYuC2LpYFKEzbZM++SvLslqFxRu
 TRs9bu1o7ZPYk2NU36Y6TaVntga7x2LsRvZycezK/CP3IO38DQGyFsRS3uCVfGqXJ9ER
 JfXfeC6zKRcINLdljinACHsWY0h6HUObHuQUfPp9rtBE0A3lSYOhQYsDlf4RGs0LnB3i
 Hs0vNU9IiocQgoOXrVbyK1Um6fgMx59hbHLSPAydW+L0ADWnGIZqhEvCRzC4ffNcfBZe
 8hZQ==
X-Gm-Message-State: AOAM531tc09w2KVwVaaaAgpYkY9kmUGKRobgH31jJ2j3tViSWmgLL9R8
 kJWpZutMebYHIScWctxJ6c9LrRdazWA=
X-Google-Smtp-Source: ABdhPJzMT5S7iqTrSn24lskF3EoNQzTzotldgqR8aRhku8ByuE1p/n0pY4L6QW2pj9gU94wC7UumeA==
X-Received: by 2002:a17:90a:c246:: with SMTP id
 d6mr2798475pjx.60.1590130475691; 
 Thu, 21 May 2020 23:54:35 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id w26sm4844009pfj.20.2020.05.21.23.54.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 23:54:35 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 12:24:12 +0530
Message-Id: <bea4b8f60091c44e43e71539fd8f177dce639b15.1590130423.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590130423.git.viresh.kumar@linaro.org>
References: <cover.1590130423.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 6/6] syscalls: Don't pass struct timeval to
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
syscalls with the "struct timeval" (which is a libc definition). We
must use struct __kernel_old_timeval instead.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                                     | 6 ++++++
 testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h | 5 -----
 testcases/kernel/syscalls/gettimeofday/gettimeofday02.c | 3 ++-
 testcases/kernel/syscalls/stime/stime_var.h             | 3 ++-
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 256e1d71e1bc..62a0833b6cd9 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -12,6 +12,7 @@
 #ifndef TST_TIMER
 #define TST_TIMER
 
+#include <asm/posix_types.h>
 #include <sys/time.h>
 #include <time.h>
 #include "tst_test.h"
@@ -101,6 +102,11 @@ typedef long __kernel_long_t;
 
 typedef __kernel_long_t	__kernel_old_time_t;
 
+struct __kernel_old_timeval {
+	__kernel_old_time_t	tv_sec;		/* seconds */
+	__kernel_suseconds_t	tv_usec;	/* microseconds */
+};
+
 struct __kernel_old_timespec {
 	__kernel_old_time_t	tv_sec;		/* seconds */
 	__kernel_old_time_t	tv_nsec;	/* nanoseconds */
diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
index eb60f707f776..dbe0a561a3ab 100644
--- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
+++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
@@ -18,11 +18,6 @@
 #include "lapi/timex.h"
 
 #ifndef __kernel_timex
-struct __kernel_old_timeval {
-	__kernel_old_time_t	tv_sec;		/* seconds */
-	__kernel_suseconds_t	tv_usec;	/* microseconds */
-};
-
 struct __kernel_old_timex {
 	unsigned int modes;	/* mode selector */
 	__kernel_long_t offset;	/* time offset (usec) */
diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
index b7687468d39d..b73bf129b116 100644
--- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
@@ -21,6 +21,7 @@
 #include <errno.h>
 
 #include "tst_test.h"
+#include "tst_timer.h"
 #include "lapi/syscalls.h"
 
 static volatile sig_atomic_t done;
@@ -39,7 +40,7 @@ static void breakout(int sig)
 
 static void verify_gettimeofday(void)
 {
-	struct timeval tv1, tv2;
+	struct __kernel_old_timeval tv1, tv2;
 	unsigned long long cnt = 0;
 
 	done = 0;
diff --git a/testcases/kernel/syscalls/stime/stime_var.h b/testcases/kernel/syscalls/stime/stime_var.h
index b33c5704e94a..708b80573167 100644
--- a/testcases/kernel/syscalls/stime/stime_var.h
+++ b/testcases/kernel/syscalls/stime/stime_var.h
@@ -9,6 +9,7 @@
 
 #include <sys/time.h>
 #include "config.h"
+#include "tst_timer.h"
 #include "lapi/syscalls.h"
 
 #define TEST_VARIANTS 3
@@ -26,7 +27,7 @@ static int do_stime(time_t *ntime)
 	case 1:
 		return tst_syscall(__NR_stime, ntime);
 	case 2: {
-		struct timeval tv;
+		struct __kernel_old_timeval tv;
 
 		tv.tv_sec = *ntime;
 		tv.tv_usec = 0;
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
