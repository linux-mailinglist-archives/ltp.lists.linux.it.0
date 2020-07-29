Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8C23217D
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 17:27:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24F4A3C2550
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 17:27:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 46D423C05A1
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 17:27:14 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7A7C2600965
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 17:25:50 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id kr4so98590pjb.2
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 08:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=xmjhP5qkaQ8UZfX55IQArSc9LSkc7JWthAwb6RV0UXo=;
 b=faZ9lzqn6Frg9AHXJ/gql4K4v092Wd2+pUkty0bCIVmTpoxDwDvmYCdjE68m15wBlK
 3hYr4VxqjlGfFTwYDd4wC6Ro8aCKt6D272RglmxH1XishDaqBeYb139nmC7dXVh++rh7
 joHd3FPj0S0TV9LMLRp/hZLOOfaFS12DgdaF18Dd0FWBpLqD/iEr8S7Wt6XYkYTQoPgw
 gpSEaRhAM5iiBm37VXaoVk9Z2bCUYKWnclz1Wxn3OOj05NZBHbobottNi+Pew4zDKz9G
 XB7EctI1sBN6xrePd9mkaFALTyjJfphr9ZFsNY6eAME+wD8XWxjL4VmDZqOhdpfsTjE1
 rJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=xmjhP5qkaQ8UZfX55IQArSc9LSkc7JWthAwb6RV0UXo=;
 b=WHA/yU2PpG+iuu2XVx8jItC19tMbIKv5/J555Ompg4iysPEjBjop9Jar4sUVlIgGSy
 gLzs08VRHzyzur+zDGlgx8sru0XF0q/grh0rdgOoU74Ml/U8YXOXMbUmGD3rW44e4w4W
 wLebqr140M6zUPV4S2rEfpx/hYvT8MQVGjKtQSWikHzcCu2sFMz3SaizrkLBU1G2uCi0
 LpXi1N38fQRYEluoEkv/2FnJzrqcN4+5y3lKCV6N8gNNNCO5EBg/2WeEOQDf8OYV1emX
 wIEQxj94bKDQRAkWiSB4QqyfHoe0VrJy10ge+smEjHO5Bi502fgMVqbs4H99RHI8BTHM
 I9Mw==
X-Gm-Message-State: AOAM5319ckBgpVIXSvyc+CNfY+sQ1J0k9Ve4hbVKUaIvtk3EBkivid+0
 nngTVTcD1O2/TXe+Rd9CzcjJfQd4aHA=
X-Google-Smtp-Source: ABdhPJyii0GdIjw9TEv8rZb8yrS1K/++fGLAhb/hqNc/ncNbS3v7emWci4/uqxhGr5cPE65bji3nBw==
X-Received: by 2002:a17:902:8c86:: with SMTP id
 t6mr29317790plo.41.1596036416302; 
 Wed, 29 Jul 2020 08:26:56 -0700 (PDT)
Received: from localhost ([106.215.77.228])
 by smtp.gmail.com with ESMTPSA id g10sm2789045pfb.82.2020.07.29.08.26.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 08:26:55 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 29 Jul 2020 20:56:48 +0530
Message-Id: <ba2d16cbc6d26fd844523dc471d144738edf98cb.1596036365.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <b78d4e9530a47fd8cb2693e0b27f7e7ffd6177a8.1596036365.git.viresh.kumar@linaro.org>
References: <b78d4e9530a47fd8cb2693e0b27f7e7ffd6177a8.1596036365.git.viresh.kumar@linaro.org>
In-Reply-To: <b78d4e9530a47fd8cb2693e0b27f7e7ffd6177a8.1596036365.git.viresh.kumar@linaro.org>
References: <b78d4e9530a47fd8cb2693e0b27f7e7ffd6177a8.1596036365.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V8 2/2] syscalls/select6: Add support for time64 tests
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds support for time64 tests to the existing select6() syscall
tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/select/select_var.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/select/select_var.h b/testcases/kernel/syscalls/select/select_var.h
index 857e5d164582..86f80eeb0dc1 100644
--- a/testcases/kernel/syscalls/select/select_var.h
+++ b/testcases/kernel/syscalls/select/select_var.h
@@ -6,6 +6,7 @@
 #define SELECT_VAR__
 
 #include "lapi/syscalls.h"
+#include "tst_timer.h"
 
 struct compat_sel_arg_struct {
 	long _n;
@@ -47,7 +48,22 @@ static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
 		timeout->tv_usec = ts.tv_nsec / 1000;
 		return ret;
 	}
-	case 3:
+	case 3: {
+		int ret = 0;
+#if (__NR_pselect6_time64 != __LTP__NR_INVALID_SYSCALL)
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
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
