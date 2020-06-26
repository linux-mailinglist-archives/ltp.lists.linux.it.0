Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F3020AC4B
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:25:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A2AF3C2B5F
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:25:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 562DC3C5838
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:23:18 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B350E600666
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:23:17 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id j4so3903882plk.3
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 23:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UE4iMqTs4i9KzbJPU0Gcr5oWBJazrzy9VeoHPqXEgak=;
 b=f14P0EiymKCKihRVvNewv4fgmVcCGicIifnh6K5R7493wQMSjbsuRXpSILIhaKfXBj
 C8EiwhAkV6o9HBeWk4FftFko+XoF/AqKLRNU2HSE35j2btCXhCQ3S5a6e/cl05QM2+ep
 e55xV1AYD6NnnE/tjXNwOEI2x6ZQJEZUcdlUqpH9DFK0VPsGTYXftbOB3lP8Hfrrk6iA
 Spp7f3ZkNcp9k7NvMOQXiRuLeODHbcdbwLg/6xAQ98lZ0o2b7uXkwZZ6jnRFV7kf7Y5B
 c/0ZsuU5ermv2oe1EBWzPSG8d/+RVLDtVp1Yhk1bBChKLok0+GtueANafQTqYYNcnVUv
 JiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UE4iMqTs4i9KzbJPU0Gcr5oWBJazrzy9VeoHPqXEgak=;
 b=H7nvoq3ig1P6ZqihY8ZrVq2kzxo06rX2yOuJgM/MXfAp+RPx0PJAn0JHZ1SK6hjPOM
 sHUJmQj/BuiXE5CFTpTgZdVKjh/GhHb14ISQj1n0pVd41qcuIQIflzM4PjFD3aKQVY82
 qK0Ai1tivTyNRK74SOOmWXCOrNA7m9I1ry60bSxXLGUIUnyMjVeaZ4pFYfHvpSWLe+67
 cbwFliyuoe/dag2Gs7vNXwwdbw2VVWHw24jgg+A9PD9VJKhsTHFRikPKWDZACtOrL49+
 uzdkesjDytSGT5TpIWZ+fhXJiQIJEFJ7XUwmYdVoBG5U/3fx62tceTuUBkLalE784xpx
 tTNA==
X-Gm-Message-State: AOAM5332AdegL53XMMtAfzWAZBKy4zizXcPcZTbuMX+/1N+2u63Zk2Td
 wVnjKMgWnnEc1xYuGMq5PODopd6TkXk=
X-Google-Smtp-Source: ABdhPJyUjSPvFA0Yiu/VznOiFYvAUOnIc06efGhUBdThalfjYNMBiA5Ac7C4YanHF90QwOj/qgtiVg==
X-Received: by 2002:a17:902:6ac1:: with SMTP id
 i1mr1380461plt.147.1593152595915; 
 Thu, 25 Jun 2020 23:23:15 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id p12sm21609653pgk.40.2020.06.25.23.23.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 23:23:14 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 11:52:27 +0530
Message-Id: <883a188e83c201b23074bf0ac974b41d89d818c7.1593152309.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1593152309.git.viresh.kumar@linaro.org>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V7 14/19] syscalls/select6: Add support for time64
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
