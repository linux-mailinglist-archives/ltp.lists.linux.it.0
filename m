Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 714131DE4E5
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:54:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36E393C242E
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:54:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 905D13C4B5F
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:52:22 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D9036600B53
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:51:55 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id 23so5041020pfy.8
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UE4iMqTs4i9KzbJPU0Gcr5oWBJazrzy9VeoHPqXEgak=;
 b=EtPU5Ei5Gafh/clY7T8pMDovnJ0KIjwdhbzc8p+z57u2xeXCB6DKEM5v8W2ghFmkRk
 xamlmp4zFl2G7H/NEQ7RLyXS+rnmB7cqdsAyCpjTPhUdEGCuOFuZG78kNzUewU1HG6Za
 B0J1YF5P844N/vLbAVJivWPDWldfHKuhLFGfqxwGVXu7t673NTAHgDJfdnoczNZtW/fW
 0n/CGY4jrf8yS3VB25N04+Q0YKHgxYVP54zRDBniXjfgEpGoM3GcCq5jbMwP0bTqog3K
 HP9PO372TAQU6L+OCTePfb9VSZYjtGXkV+2A4olOtyKi1Y8G2cgtZ4qLUiVWIaItYrp1
 u4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UE4iMqTs4i9KzbJPU0Gcr5oWBJazrzy9VeoHPqXEgak=;
 b=LEnSdexytmi8dqtiZmJmkxHEpaWsM/+yg9iK8DHple+PtkGpSQMD/Z3ZbQP/gLBDgI
 c6Yftal4Szgzw61miMTbXzp47r7GIsgiSdLoVgxXCGHgGC7vY4XSV6iU8TZf2GuGLHt4
 bALGqdqwO8jQXClpHUtH6IGgkbitVE3kwfD5nMMXrn3NRKXO+YJuGK73STafoRCPILs6
 19QE7yh43JqP4Tl2vv2sFj9gTd2qj/ObgIto50wpMYtwZS2Z7lyCPDb8AeoDwkI7+Dxp
 MuecmWrlJVH38WiF0OvdcQ6r8QVjJidWT0mYPm6pwHWrzu9fAiqk/o2rjCovZvukziYd
 ykbg==
X-Gm-Message-State: AOAM530z7xyPJpaXB8E0qTOE9vHul3CuOFFrsAcAKxdTbmyIOqsSYj3i
 VAvv14VpeeqUOzlPh92c5dEwS54RpHw=
X-Google-Smtp-Source: ABdhPJyQ9/UQY5kBMSFHX44WJazJPJf9D+jRToH+yvlOPKaI4PG2fNCU9fI/QHRl98V91nCzGKhfcg==
X-Received: by 2002:a63:d742:: with SMTP id w2mr12890143pgi.180.1590144740178; 
 Fri, 22 May 2020 03:52:20 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id d20sm6269491pjs.12.2020.05.22.03.52.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:52:19 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 16:21:33 +0530
Message-Id: <e92928462bb2f931af55240af0e2fdd4362b302b.1590144577.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590144577.git.viresh.kumar@linaro.org>
References: <cover.1590144577.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V4 13/17] syscalls/select6: Add support for time64
 tests
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

This adds support for time64 tests to the existing select6() syscall
tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/select/select_var.h | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/select/select_var.h b/testcases/kernel/syscalls/select/select_var.h
index b19a1d1bf085..2c7604807cf6 100644
--- a/testcases/kernel/syscalls/select/select_var.h
+++ b/testcases/kernel/syscalls/select/select_var.h
@@ -6,6 +6,7 @@
 #define SELECT_VAR__
 
 #include "lapi/syscalls.h"
+#include "tst_timer.h"
 
 struct compat_sel_arg_struct {
 	long _n;
@@ -38,7 +39,7 @@ static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
 	}
 	case 2: {
 		int ret;
-		struct timespec ts = {
+		struct __kernel_old_timespec ts = {
 			.tv_sec = timeout->tv_sec,
 			.tv_nsec = timeout->tv_usec * 1000,
 		};
@@ -47,7 +48,22 @@ static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
 		timeout->tv_usec = ts.tv_nsec / 1000;
 		return ret;
 	}
-	case 3:
+	case 3: {
+		int ret = 0;
+#if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
+		struct __kernel_timespec ts = {
+			.tv_sec = timeout->tv_sec,
+			.tv_nsec = timeout->tv_usec * 1000,
+		};
+		ret = tst_syscall(__NR_pselect6_time64, nfds, readfds, writefds, exceptfds, &ts, NULL);
+		timeout->tv_sec = ts.tv_sec;
+		timeout->tv_usec = ts.tv_nsec / 1000;
+#else
+		tst_brk(TCONF, "__NR_pselect6 time64 variant not supported");
+#endif
+		return ret;
+	}
+	case 4:
 #ifdef __NR__newselect
 		return tst_syscall(__NR__newselect, nfds, readfds, writefds, exceptfds, timeout);
 #else
@@ -72,11 +88,14 @@ static void select_info(void)
 		tst_res(TINFO, "Testing SYS_pselect6 syscall");
 	break;
 	case 3:
+		tst_res(TINFO, "Testing SYS_pselect6 time64 syscall");
+	break;
+	case 4:
 		tst_res(TINFO, "Testing SYS__newselect syscall");
 	break;
 	}
 }
 
-#define TEST_VARIANTS 4
+#define TEST_VARIANTS 5
 
 #endif /* SELECT_VAR__ */
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
