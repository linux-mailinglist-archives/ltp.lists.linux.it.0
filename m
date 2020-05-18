Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1571D72BA
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:17:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D0133C4F0E
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:17:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 506F03C4F30
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:57 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6F9E91A014DF
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:56 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id u5so4472579pgn.5
 for <ltp@lists.linux.it>; Mon, 18 May 2020 01:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdqBSnuSQ6X2ghiYuHksblFlkKlEazwX7mOasL6K8aY=;
 b=rA7tyxjHtafzQ5L9P+P8MfqI2Dyezyoat4qSFm6boAMuhdhIV2njJP1icV/xj0Hmdq
 FVDItIF7JjSBhGpCiL+BpZE+AJ0zBcRiOfBjxLIDBZIAq0jESTJXSzjw5px2KnFEBOtX
 GGpJ0QiOQU3KwWFitT0LUltNeCh6gqC7aJULjuhShCN8Cx/x2cvK1WJMgT9rD1IbF+fz
 Ku646qSIZfQ1tTb967DGsHnmN1zwt684DNLrEFjQBRBW1DS1jIgtLy2ZEw5DeKvsYP+r
 YJNh1KoCbPxgt7b9tnx431ym6kjjG+Y8xxgWrb7LTgApZeglGy7ea5CSFtf1z6DFTpxQ
 /W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdqBSnuSQ6X2ghiYuHksblFlkKlEazwX7mOasL6K8aY=;
 b=JajT6zC2Ce3NNV/N6EiJWSum6UchbilYZNKVn1+kON1PwDZ6KfXgBXjRaPcHMNS8kP
 nMS5aWoz7gATEhFifYu1mOvxRjVhrRdyaLq+EUMaeeb2MMa6yKrZ6aly8XmeC/kU881K
 +ZdGqBlFkG4HSyZzmiRsexJK1YzpJ0h4/z6mlW2S88YWdyHbcrSYYaUZi+CUmszVpZKf
 gdiAMWBbNWD/X53D+LaAnNsMNdCg74fPiISIeUGuy5W4q85JE+0v2gRSyMe6t3g+2vvj
 FHJpwDKzEdqJyDTcRk9nMHGwj7cCk5qiGBBSn8Fe23pOtqrRu6tZlrWQJhi5oQXXxfjA
 4lQw==
X-Gm-Message-State: AOAM533OoyNV71OskLs3YWDXSDuBrD3TtKEuEel/8MYOl4fNn5vp4mq2
 SIPRpBjwRninrsOReTJacEHS+UPrjU8=
X-Google-Smtp-Source: ABdhPJzG3WadcaslIRe9Oz7iCZzTDVFF7qgLcsLFqp9pu9nMurDQZwM3wGtyEEl/CQ1GVsvlIM+Z1A==
X-Received: by 2002:a62:5ec7:: with SMTP id
 s190mr15290262pfb.130.1589789754683; 
 Mon, 18 May 2020 01:15:54 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id g9sm7106925pgj.89.2020.05.18.01.15.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 01:15:54 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 18 May 2020 13:45:05 +0530
Message-Id: <422948a2bccb03e2a989379dd971e1c7668cebc9.1589789487.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1589789487.git.viresh.kumar@linaro.org>
References: <cover.1589789487.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V3 13/17] syscalls/select6: Add support for time64
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
index b19a1d1bf085..6465a23d9d6e 100644
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
