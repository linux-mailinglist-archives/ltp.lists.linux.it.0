Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E32E15B98C
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 07:25:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E90C63C24AA
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 07:25:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2C4F33C136C
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 07:25:23 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 49993200A0C
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 07:25:22 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id b9so2384417pgk.12
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 22:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9PKDygG7HfdOQqBIEMnx90PExptdhKS360zFlAU8Dig=;
 b=B+lw/14KGfrgKnriQNsjwUrqP6rjwg945qqDsnupMVwZQwRw6v8UiiTxk42sCtEK2V
 eklwHB6p1qa25uhL7ejU83HGZal+YIdep61nRq2s7Cm8+EgrrHE/rWlw5nhT1wiBj9LC
 c1L6OAF6EPLjEJCdbKypkDjGWg9PLcsVUvRAxsFD5zXEMBgOBFif8ZVObJUCGZOtNWen
 v9Y20o5RRav3UZQRpgcjkiaa50XfU+x+qZoyhJ/YguAbWwXABdDyZ/yWZiLxSZWDjeUL
 NLQfGbgFmPYv4BVueexEfY8Kly1lGJjVEBUdDWkdy70+YT5apQOkr+D1QbmAnvxiQxAA
 +NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9PKDygG7HfdOQqBIEMnx90PExptdhKS360zFlAU8Dig=;
 b=PJfWPgjfsevKt4LUISYOomHfH3bILvP5rd2WsDVV/BRYhq5ta/b3Cds5VrqWjbYT0O
 ZDf8miGvB6EcOTP7GKwu6qObk0z+2eDdMpoNBSxUkptbQShUACPoRu7xR+/lPDTYfHXz
 gj+wBeX9oAADWaWLwP7RvkVeiwBTh1mV0/+uF3ajj0GaTINWzv5OLsW/0+bl4xoHjij8
 vkmo5WgLMauM6qoF3sB4+fhY3gVB5aFzqxA1Iaz7oTCxCGrEoElXQxEgNXMB7q3DQsPz
 dBbGyIy9/0Txr+5JX13BR6V6EsYPC90wg5rh9hhKoVW2B/ztPM9TtlBZLKvqgV4Z/7L0
 5lnA==
X-Gm-Message-State: APjAAAU4+h1CzDfKICVkdKiLChkQNlJ9cBn6252EqaHZYRIrOiJ17iAc
 /jitNsxkvoNRegZfyLcakA1UwCBNipM=
X-Google-Smtp-Source: APXvYqwYmPj7HfesaB4yDIMAylzxkimgiF9PtePuvRKjwY3+o+GCTwCJWaODr2CiIF882yfSeRxEhw==
X-Received: by 2002:a65:488f:: with SMTP id n15mr17471128pgs.61.1581575120198; 
 Wed, 12 Feb 2020 22:25:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
 by smtp.gmail.com with ESMTPSA id i11sm1200617pjg.0.2020.02.12.22.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 22:25:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 12 Feb 2020 22:25:24 -0800
Message-Id: <20200213062524.2027846-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls: Check for time64 unsafe syscalls before
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
 lib/tst_clocks.c                                        | 9 +++++++++
 testcases/kernel/syscalls/gettimeofday/gettimeofday01.c | 4 ++++
 testcases/kernel/syscalls/gettimeofday/gettimeofday02.c | 4 ++++
 3 files changed, 17 insertions(+)

diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index 35798a4aaf..6a5b05c4ea 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -28,15 +28,24 @@
 
 int tst_clock_getres(clockid_t clk_id, struct timespec *res)
 {
+#if defined(__NR_clock_getres)
 	return syscall(SYS_clock_getres, clk_id, res);
+#endif
+	return -1;
 }
 
 int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
 {
+#if defined(__NR_clock_gettime)
 	return syscall(SYS_clock_gettime, clk_id, ts);
+#endif
+	return -1;
 }
 
 int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
 {
+#if defined(__NR_clock_settime)
 	return syscall(SYS_clock_settime, clk_id, ts);
+#endif
+	return -1;
 }
diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
index 583d8f7b9b..b498de5b68 100644
--- a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
@@ -41,7 +41,11 @@
 #include <sys/syscall.h>
 #include <unistd.h>
 
+#ifdef __NR_gettimeofday
 #define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
+#else
+#define gettimeofday(a,b) (-1)
+#endif
 
 char *TCID = "gettimeofday01";
 int TST_TOTAL = 1;
diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
index 1d60f448e8..218e017df8 100644
--- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
@@ -23,7 +23,11 @@
 
 #include "tst_test.h"
 
+#ifdef __NR_gettimeofday
 #define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
+#else
+#define gettimeofday(a,b) (-1)
+#endif
 
 static volatile sig_atomic_t done;
 static char *str_rtime;
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
