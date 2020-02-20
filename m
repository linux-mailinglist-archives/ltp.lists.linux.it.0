Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09423165800
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 07:51:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7F423C223A
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 07:51:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A75B13C093E
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 07:51:56 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C0379601230
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 07:51:55 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id j15so1432531pgm.6
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 22:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0RSMVeLno9BZdfKsWwDm/kcWa5raCLH1fElgQ6AyIEU=;
 b=GA80QVzJ5KU4ti6ubWDdNM6mGUmUGp1Xoylg7XTdByn83TPMbDr0Rma1VWkyfNZumX
 6sgCrLzXtf2aaDCYMwLY2DlpklNa49NrUlJLUfvIEhybmRCTj4B3S1cSeFux/a/V7xbr
 3K8bbc/iOkig1+oncpfzwyhOzrFvj2RDJ84i+ldkv9F9uxojLdIav2E+Tgd0bQHUr7CK
 GUpfI7dz+gZXQcbJasHipxqTc7fP38pfHZt/m4olOoVCrSHVMIQZK5Mgrvk2mv3/R24a
 Z/ld1iCfLxk0QhriT7CSiE7TUHxQmosb2MXeHV6Pss3wjVyFgQaleUo46fsp5KNModrS
 wWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0RSMVeLno9BZdfKsWwDm/kcWa5raCLH1fElgQ6AyIEU=;
 b=YbfWNoy0B35dJHiBIKuNX/1zklv61Pli3pwusF1MMNiRM/rJlvY5Mkr7Pwxptllwgu
 OwQhs91yw4uCkY3bckX3c5Am6qXcTSIEnGmgW4UwJOC1UMP2d8OrwJ3mbwb+uLkjPqHX
 +8ZFQdZOBSprgUZLbNQW/U43n+HUXwrRElc1xulUXLhj6MUazVO85WpYZlL3Q6V+ga0m
 NRwkbcwRKDu4WH0CYEWavAQRfmxwTjuP3PtEDhJhjHuGKdhRNwCpAaf7hjM6GErVfxu3
 TVdXEnGRyu7g10rZho8EDPuA6IwWnU5bmE2d4raP2mDjqCURIn47KnafJo4CqrHdq0dB
 0pyQ==
X-Gm-Message-State: APjAAAWaNEZ3zsQIsK1L0S7+MkgGY5wAMhg8n6zpwsZnZ7rR4UYF19Gm
 XHCCSiNSd6727O9gaD5zUqox7q8JR4c=
X-Google-Smtp-Source: APXvYqwQVFZeXNUjV9b+sgkieRh0KWHzG6dBpsEYTALyPUvQlzvhop5ACTHZ4tleO8VZNCwj1j67pA==
X-Received: by 2002:a63:e257:: with SMTP id y23mr31970627pgj.104.1582181513783; 
 Wed, 19 Feb 2020 22:51:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
 by smtp.gmail.com with ESMTPSA id 64sm1904080pfd.48.2020.02.19.22.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 22:51:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 22:52:04 -0800
Message-Id: <20200220065204.485391-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3] syscalls: Check for time64 unsafe syscalls before
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
 lib/tst_clocks.c                                      | 11 ++++++-----
 .../kernel/syscalls/gettimeofday/gettimeofday01.c     |  6 ++----
 .../kernel/syscalls/gettimeofday/gettimeofday02.c     |  8 +++-----
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index 5195da38f3..155551170d 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -10,21 +10,22 @@
 #define _GNU_SOURCE
 #include <unistd.h>
 #include <time.h>
-#include <sys/syscall.h>
-
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
 #include "tst_clocks.h"
+#include "lapi/syscalls.h"
 
 int tst_clock_getres(clockid_t clk_id, struct timespec *res)
 {
-	return syscall(SYS_clock_getres, clk_id, res);
+	return tst_syscall(__NR_clock_getres, clk_id, res);
 }
 
 int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
 {
-	return syscall(SYS_clock_gettime, clk_id, ts);
+	return tst_syscall(__NR_clock_gettime, clk_id, ts);
 }
 
 int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
 {
-	return syscall(SYS_clock_settime, clk_id, ts);
+	return tst_syscall(__NR_clock_settime, clk_id, ts);
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
