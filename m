Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B14671D928B
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:52:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B3D03C4E78
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:52:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C23283C4E8D
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:31 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3093A601658
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:31 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id ci21so1023008pjb.3
 for <ltp@lists.linux.it>; Tue, 19 May 2020 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hjASICbmWLh6z4tP68V4BIdamK7Vg35eiuZ1wntyqK8=;
 b=eV1hmF0ts3QK61xNoX2K9iFarbkjlFAMDIRFIRZTFU4gFRgsFngL9SblyG7wa6ayzF
 YHxbKQTQnlBNn1pJyjd5i49zKRJ32rcMgPRrlX4uiO4RjChfKyf9p2wl5utxxTkBOmys
 hotTIgGQJIh/VtjYnvec+JuNwPrhFJWFl68226IqkiYoafV6R1H/D3UWLSB3KXfNqczM
 Lz+jDeZcuLT0QE0iToGMOKGhn3e3vNDdRCbn3OsiGxbSf5f9PNTwzDHLNIX2ixsopLnS
 J2QmIc6wj7P24L7hyZAkJF60RpdeCCg3ao4o5mTAhpZbkwaBfsFVPtCyKPGask+BwncM
 uxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hjASICbmWLh6z4tP68V4BIdamK7Vg35eiuZ1wntyqK8=;
 b=k+UXvRwXZjpO8eMppam8rNu1+WccnqMKrmC6co/+UXgqoLuwjNedXwGY9LiLJ841nn
 6VxnP7xE4vm+9UDn6Id8PYAsbkE6N2zd8fbRQtBmngvr5GI4ZTn22aMrxnK7UQ5RDM73
 juuCL3L04iJvwu0bInheiGk8I4Iynnw/gFCs2Xx+eFL7aFNo9anWvxvGWSjcWxNr47NZ
 DIjyGQTlFCH5OufcZ7eLlnDAvZPaiPtWS2jB8C8Il5KKReu80DqriBlIbO1TmdCN7/Ke
 yq6FCGfNVy92SUUhAGOswM1eMwHZ8p4m+3nIHBqojEC+t+LUbIzHK+Cs2RGzBR8HWI9z
 CrJQ==
X-Gm-Message-State: AOAM533iihnPaHw6KCzShfcIJ+vP48Il6bEQrsXtVwAN4cKftP97rKO0
 z8OIF2gg3bnur1dMcQ3MRZgblnSfZB8=
X-Google-Smtp-Source: ABdhPJxOyTH079ewlmnwGOpaxx2Kuqj654dBmcYH0cF3NdAjACNOrZmAaH5YC1/yl1xM2FTXcZpmqw==
X-Received: by 2002:a17:90a:2807:: with SMTP id e7mr3881198pjd.6.1589878289422; 
 Tue, 19 May 2020 01:51:29 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id b137sm5260616pfb.110.2020.05.19.01.51.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 01:51:28 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 19 May 2020 14:21:12 +0530
Message-Id: <ac47a49846fe338dd14e55fc05ed0715db60bc85.1589877853.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1589877853.git.viresh.kumar@linaro.org>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] syscalls: Don't pass struct timeval to
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
index 071061f5b280..814b70797643 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -12,6 +12,7 @@
 #ifndef TST_TIMER
 #define TST_TIMER
 
+#include <asm/posix_types.h>
 #include <sched.h>
 #include <sys/time.h>
 #include <mqueue.h>
@@ -104,6 +105,11 @@ typedef long __kernel_long_t;
 
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
