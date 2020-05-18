Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE081D7524
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 12:27:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 157273C4F4F
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 12:27:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 14CBB3C042A
 for <ltp@lists.linux.it>; Mon, 18 May 2020 12:27:39 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1A93D200148
 for <ltp@lists.linux.it>; Mon, 18 May 2020 12:27:39 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id z15so6397291pjb.0
 for <ltp@lists.linux.it>; Mon, 18 May 2020 03:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nAHypuFX4+V5RjEkEw7tDqWRweSOwGBpFPIC1RtM6+w=;
 b=QK+QUSIIOq7kOv0aWeSgkSg9g28myLMZ2We1PKlZVljiWhvaVXawhEv0BfzYLoBMCF
 GqoSZLsdFApO5MDrf7qhqevkK2JtFpsTjnwGksZFMuQWEj7oFnQuBEoTDa+Iw2Zt3jTu
 FXg47g70uEMl3xW6fU4Dzt/uxy9RSrvIKtat+iHoCd1lTWUOqML6afoS3Itnq+NyiLHA
 w76FoDEJInkDUH55lzCyDqw2i3Y5Lfcz6SX1nSad7c5daPXFQwkJnjX5fMSrC1rWgQOf
 FLDI43ZN5NRItLjrRFuiCmgkMj3AixXsiJ8XbiJ66kJbJSRnO1d7d/1j9HEzHp34t9SN
 jjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nAHypuFX4+V5RjEkEw7tDqWRweSOwGBpFPIC1RtM6+w=;
 b=F1FJS8T3p/wa+lYp90FdyoaPnqRV/HSgPeCNoC4Ksf8T+3VmEdwNuD3YYmCNAZs5po
 jylkFIntpTJLqdotUzMC3Hqhmz+q3AKCXMSWfdoxK6ntK4mH0mMgyIJTxe8YTI8lWLRL
 nriKp44fI3kTKbyKGQIzh84ciwOHl/5q8z5NarYqctkeQLLRz89V7tPROtj0m4J1xMDR
 3WHrUcVxLnD+btQNvMIuT/WJxQLP2M1V8gOsDLHTs1xQKf/tVSd4CBTuoHXAXSU8/NQI
 l8kDhzTu1uXQp8EFBGjEV1xHJoyVx3l3dLlc9R/qJgYkFBbhfQnTGQYEeBBpvuuWUkff
 bmww==
X-Gm-Message-State: AOAM532dH2k+zxhTScFGWjbSp8Sjl4DGvB5NkPlMWxNBcGhkWFqInGyH
 60J/Q0RwLs4K1ZM9f7FWknFJTkJwgO0=
X-Google-Smtp-Source: ABdhPJxvtnkhVerPcKSC1/QoabU6EzykfMCCwwU+vroBqfLkNj6lurRSk4VDvAMiPiIF0cD0JGCkwg==
X-Received: by 2002:a17:902:8494:: with SMTP id
 c20mr15671446plo.305.1589797657310; 
 Mon, 18 May 2020 03:27:37 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id y4sm3121801pfq.10.2020.05.18.03.27.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 03:27:36 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 18 May 2020 15:57:32 +0530
Message-Id: <96ce7bbd49ae243c02371aeb4c6a672a246e8b53.1589797580.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <f7b891343ded659bd45fa28d88667109887f1d60.1589789487.git.viresh.kumar@linaro.org>
References: <f7b891343ded659bd45fa28d88667109887f1d60.1589789487.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
V4:
- Move the setting of tv_sec/nsec within the ifdef as ts isn't available
  outside of it.

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
