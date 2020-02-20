Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA275165728
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:48:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4906C3C2239
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:48:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 3D2163C0EAD
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:48:39 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EABCF201481
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:48:38 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id n96so396779pjc.3
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 21:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4CnVxp2M+NRt8Q5SKohjXyLT5gxEavwO83KUtLQmcpY=;
 b=CbwJYvC40VSpDEhrgvhflf0KSScdOHa8Yg3RcvKCXfrlYw6XLm1xdiI8vh67aQ4BbR
 TR8xFpzMGS0om7bZbPrqyOznDZEcNM9xm8vxAj2x9krZnjFWK0tr/zJ+8AI4Lf4D5oK3
 d3k0bksFvIRSb2SeGkeNyvZbSAyrirE+nN90KrYf3GEJyKMbm7DqTinKWJomZZw79R4s
 GlZbPHX1vBEjZzbgY/BDQNL6w49eX7Bl58VeBrXLff/UcF9U4edRKEg6efYFMmX8QqoC
 +soqI/PEpI5F+y5jXpthD4BkE1d5tGEnId4oGHOWeKoCHaXSX/zMgwz53U2c7mCwSMxG
 lZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4CnVxp2M+NRt8Q5SKohjXyLT5gxEavwO83KUtLQmcpY=;
 b=hP3LJ3me51YF9FbNx3YGvpxnTgAtI90v4OKK388AE8fKjkrdLulOTqRBWIiWvxJS+G
 9qLVKXfPXen4H8vJdpzNy2asSeuatNnJ9T0/I77Ts+BiR+3EyShRC0doh7uQULIou8K0
 tgZnWqER7MoHNsoNuMzDlj0TEVvrunNglXWzn9F9mX3Pjx+LIiyyJZew+Io3DJvabrFq
 mzOip1fSn1JpqLrvzuxfFdiISyMSOB1b6qX06Il6k7ZBjqY9rfwVB1Yv/135dPBsfmVZ
 JanAyZwD8dDhJMFUkKO41opRN40PEvQ7fTxI4GibfVY9GLXXrWj0WYKTjWxcTOzbr9QQ
 QcVg==
X-Gm-Message-State: APjAAAX8wKL4vwhfIuucQCiXnziYw/HDZ6GJjm6P6YQ6Lb5wjuZwyoS1
 J6ffHP17/loCfUEVVO0Vlwbo58iZ0Yw=
X-Google-Smtp-Source: APXvYqzrkGFs7WrjMgJUonCgUWV8lELpihl9XYIND5j0tvngeqLr4qv9jiH0Apd4FE2fPndjr8TcuA==
X-Received: by 2002:a17:902:d702:: with SMTP id
 w2mr29094433ply.243.1582177715699; 
 Wed, 19 Feb 2020 21:48:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
 by smtp.gmail.com with ESMTPSA id q12sm1556589pfh.158.2020.02.19.21.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 21:48:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 21:48:44 -0800
Message-Id: <20200220054844.3365462-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls: Check for time64 unsafe syscalls before
 using them
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

musl is using 64bit time_t now on 32bit architectures and these syscalls
no longer exist, therefore its better to check for them being available
before using them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 lib/tst_clocks.c                                        | 9 +++++----
 testcases/kernel/syscalls/gettimeofday/gettimeofday01.c | 6 ++----
 testcases/kernel/syscalls/gettimeofday/gettimeofday02.c | 8 +++-----
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index 5195da38f3..f4f8b2846b 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -10,21 +10,22 @@
 #define _GNU_SOURCE
 #include <unistd.h>
 #include <time.h>
-#include <sys/syscall.h>
 
+#include "test.h"
 #include "tst_clocks.h"
+#include "lapi/syscalls.h"
 
 int tst_clock_getres(clockid_t clk_id, struct timespec *res)
 {
-	return syscall(SYS_clock_getres, clk_id, res);
+	return ltp_syscall(__NR_clock_getres, clk_id, res);
 }
 
 int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
 {
-	return syscall(SYS_clock_gettime, clk_id, ts);
+	return ltp_syscall(__NR_clock_gettime, clk_id, ts);
 }
 
 int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
 {
-	return syscall(SYS_clock_settime, clk_id, ts);
+	return ltp_syscall(__NR_clock_settime, clk_id, ts);
 }
diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
index 583d8f7b9b..08ea1673ad 100644
--- a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
@@ -38,10 +38,8 @@
 #include <sys/time.h>
 #include <errno.h>
 #include "test.h"
-#include <sys/syscall.h>
 #include <unistd.h>
-
-#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
+#include "lapi/syscalls.h"
 
 char *TCID = "gettimeofday01";
 int TST_TOTAL = 1;
@@ -63,7 +61,7 @@ int main(int ac, char **av)
 	for (lc = 0; TEST_LOOPING(lc); lc++) {
 		tst_count = 0;
 
-		TEST(gettimeofday((void *)-1, (void *)-1));
+		TEST(ltp_syscall(__NR_gettimeofday, (void *)-1, (void *)-1));
 
 		/* gettimeofday returns an int, so we need to turn the long
 		 * TEST_RETURN into an int to test with */
diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
index 1d60f448e8..5170ad2f78 100644
--- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
@@ -16,14 +16,12 @@
 #include <stdint.h>
 #include <sys/time.h>
 #include <stdlib.h>
-#include <sys/syscall.h>
 #include <unistd.h>
 #include <time.h>
 #include <errno.h>
 
 #include "tst_test.h"
-
-#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
+#include "lapi/syscalls.h"
 
 static volatile sig_atomic_t done;
 static char *str_rtime;
@@ -48,13 +46,13 @@ static void verify_gettimeofday(void)
 
 	alarm(rtime);
 
-	if (gettimeofday(&tv1, NULL)) {
+	if (tst_syscall(__NR_gettimeofday, &tv1, NULL)) {
 		tst_res(TBROK | TERRNO, "gettimeofday() failed");
 		return;
 	}
 
 	while (!done) {
-		if (gettimeofday(&tv2, NULL)) {
+		if (tst_syscall(__NR_gettimeofday, &tv2, NULL)) {
 			tst_res(TBROK | TERRNO, "gettimeofday() failed");
 			return;
 		}
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
