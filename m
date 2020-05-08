Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F04981CA23E
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:28:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA6FA3C56C1
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:28:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D42663C6E57
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:47 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 165D2100158C
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:47 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id w65so274650pfc.12
 for <ltp@lists.linux.it>; Thu, 07 May 2020 21:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o1tBs9nwNI2zko5OsSS6pA5G3cZCaUgsq9KnIBZ6MEc=;
 b=ATt3YzhzbESUhbWX7ZRHug6VqxToiUHG1m6Onnnk6Xnu91BWj31X0DOVm+Nz1ZziQY
 RUIajsj4CEX46/UT/mWQrvTX67ZiO3pdhH3gJvv/6K/4MEeHEdN4B4u2B5HwoMjiyLT7
 huzeifilCGu1oHDzcUBqXK92yEL+BTgOSSmSsR/6pWUyV1Gx1EhJ5B9qciGWk7wjzGyB
 uZh+ja5w2Dpl5kp+5nTvRY66Nqi0cusYq8hcXlw58iO5q0yk2Wd3XlDiL08vis9oVOmi
 2d00OHsNCo1Os1OgptSE4GsWDYpLSxrN0YB+M1Tw0rA/R8B3sFv3CNMF2xx4L+1VRgDN
 wVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o1tBs9nwNI2zko5OsSS6pA5G3cZCaUgsq9KnIBZ6MEc=;
 b=jNuSBxBn6OAA46vpbvuG1gqXbOtwo0A5YrGlS4Eulu1gFwdchAYvLE8Fa7GnTOTPCY
 jfJmZNnME0DX67LnDp9oXNj1w9PdLksV7GcLlbAi4kZWtTVQRVHva1lQKcvcnNokh7tG
 SJ5qhHzfIgs0MuX1JxIIZpw63I+Lc49LoqEc2AGkWLVmiPCy4cRfy3zIAazxN2erDseD
 kp5Q3Bjb8sZNg9CN/J2hLp3Q1Q93xpBFHH0B6INGtp75okzyRfA2t5uTW534QLHmkXfG
 LVbA4q4HPAa+HBi4Mnnod4tb6QUrI0eIVfqvegR/6varGRkLFznP8gJAvzVJnF2OwQQv
 Dwxw==
X-Gm-Message-State: AGi0PuYVYCxRtgRgCwqzyHiROYOxDCLsMok6wYuVgJ4frLnEpQ97dQF/
 aBDBdG5218Kx3nNM2+C8zgcmAdfQvfQ=
X-Google-Smtp-Source: APiQypL9SHtakTfHFAd5abTXjXsIOSwpZ4zKlYl2k2plJJ4H0tgUu1gPawJGZWKxZ9ytfteeyt/vFg==
X-Received: by 2002:a63:dc41:: with SMTP id f1mr575425pgj.348.1588911885255;
 Thu, 07 May 2020 21:24:45 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id g9sm358742pgj.89.2020.05.07.21.24.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:24:44 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri,  8 May 2020 09:53:58 +0530
Message-Id: <614763566d03f6d88fa0d60d15a719bbbc467cd0.1588911607.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1588911607.git.viresh.kumar@linaro.org>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 13/17] syscalls/select6: Add support for time64
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
 testcases/kernel/syscalls/select/select_var.h | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/select/select_var.h b/testcases/kernel/syscalls/select/select_var.h
index b19a1d1bf085..6e8d44088217 100644
--- a/testcases/kernel/syscalls/select/select_var.h
+++ b/testcases/kernel/syscalls/select/select_var.h
@@ -6,6 +6,8 @@
 #define SELECT_VAR__
 
 #include "lapi/syscalls.h"
+#include "tst_timer.h"
+#include "lapi/abisize.h"
 
 struct compat_sel_arg_struct {
 	long _n;
@@ -47,7 +49,24 @@ static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
 		timeout->tv_usec = ts.tv_nsec / 1000;
 		return ret;
 	}
-	case 3:
+	case 3: {
+		int ret = 0;
+		struct __kernel_timespec ts = {
+			.tv_sec = timeout->tv_sec,
+			.tv_nsec = timeout->tv_usec * 1000,
+		};
+#if defined(TST_ABI64)
+		ret = tst_syscall(__NR_pselect6, nfds, readfds, writefds, exceptfds, &ts, NULL);
+#elif (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
+		ret = tst_syscall(__NR_pselect6_time64, nfds, readfds, writefds, exceptfds, &ts, NULL);
+#else
+		tst_brk(TCONF, "__NR_pselect6 time64 variant not supported");
+#endif
+		timeout->tv_sec = ts.tv_sec;
+		timeout->tv_usec = ts.tv_nsec / 1000;
+		return ret;
+	}
+	case 4:
 #ifdef __NR__newselect
 		return tst_syscall(__NR__newselect, nfds, readfds, writefds, exceptfds, timeout);
 #else
@@ -55,7 +74,6 @@ static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
 #endif
 	break;
 	}
-
 	return -1;
 }
 
@@ -72,11 +90,14 @@ static void select_info(void)
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
